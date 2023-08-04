import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'equipment_providers.g.dart';

/// Whether or not to show the equipment debugging features.
@Riverpod(keepAlive: true)
class ShowEquipmentDebug extends _$ShowEquipmentDebug {
  @override
  bool build() => true;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for a equipment that can be configured.
@Riverpod(keepAlive: true)
class ConfiguredEquipment extends _$ConfiguredEquipment {
  @override
  Equipment build() {
    ref.listenSelf((previous, next) {
      ref.read(allEquipmentsProvider.notifier).update(next);
    });

    return Equipment(hitchType: HitchType.fixed);
  }

  /// Update the [state] to [equipment].
  void update(Equipment equipment) => Future(() => state = equipment);

  /// Attach the [state] equipment to the front fixed hitch of the main vehicle.
  void attachToVehicleFront() => Future(
        () {
          state = state.copyWith(
            hitchParent: ref.watch(mainVehicleProvider),
            hitchType: HitchType.fixed,
          );
          ref.read(simInputProvider.notifier).send(
            (child: state, position: Hitch.frontFixed),
          );
        },
      );

  /// Attach the [state] equipment to the rear fixed hitch of the main
  /// vehicle.
  void attachToVehicleRear() => Future(
        () {
          state = state.copyWith(
            hitchParent: ref.watch(mainVehicleProvider),
            hitchType: HitchType.fixed,
          );
          ref.read(simInputProvider.notifier).send(
            (child: state, position: Hitch.rearFixed),
          );
        },
      );

  /// Attach the [state] equipment to the rear towbar hitch of the main vehicle.
  void attachToVehicleTowbar() => Future(
        () {
          state = state.copyWith(
            hitchParent: ref.watch(mainVehicleProvider),
            hitchType: HitchType.towbar,
            drawbarLength: 4,
            hitchToChildRearTowbarHitchLength: 6,
          );
          ref.read(simInputProvider.notifier).send(
            (child: state, position: Hitch.rearTowbar),
          );
        },
      );
}

/// A provider that holds all of the equipments.
@Riverpod(keepAlive: true)
class AllEquipments extends _$AllEquipments {
  @override
  Map<String, Equipment> build() {
    ref.listenSelf((previous, next) {
      for (final equipment in next.values) {
        ref
            .read(equipmentPathsProvider(equipment.uuid).notifier)
            .update(equipment);
      }
    });

    return {};
  }

  /// Update the [equipment] in the [state].
  void update(Equipment equipment) => Future(
        () => state = Map.of(state)
          ..update(
            equipment.uuid,
            (value) => equipment,
            ifAbsent: () => equipment,
          ),
      );

  /// Remove all the equipment.
  void clear() => Future(() {
        state = {};
        ref.read(simInputProvider.notifier).send(());
      });

  /// Handles the event of a tap on the map. If [point] is within one of the
  /// equipments' segments, then the segment will be toggled.
  void handleMapOnTap(TapPosition tapPosition, LatLng point) {
    for (final equipment in state.values) {
      equipment.segmentPolygons.forEachIndexed((index, segment) {
        if (segment.contains(point)) {
          ref.read(simInputProvider.notifier).send(
            (
              uuid: equipment.uuid,
              activeSegments: (equipment..toggleSegment(index)).activeSegments
            ),
          );
        }
      });
    }
  }

  /// Handles the event of a pointer hovering on the map. If [point] is within
  /// one of the equipments' segments, the [equipmentHoveredProvider] is
  /// set to true, otherwise false.
  void handleMapOnPointerHover(PointerHoverEvent event, LatLng point) {
    for (final equipment in state.values) {
      for (final segment in equipment.segmentPolygons) {
        if (segment.contains(point)) {
          return ref
              .read(equipmentHoveredProvider.notifier)
              .update(value: true);
        }
      }
    }
    ref.read(equipmentHoveredProvider.notifier).update(value: false);
  }
}

/// Whether or not a cursor is hovering over an equipment segment.
@Riverpod(keepAlive: true)
class EquipmentHovered extends _$EquipmentHovered {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for tracking the worked paths for the given equipment [uuid].
@riverpod
class EquipmentPaths extends _$EquipmentPaths {
  var _lastActiveSegments = <bool>[];

  @override
  List<Map<int, List<LatLng>?>> build(String uuid) => [];

  /// Updates the travelled path of the [equipment].
  void update(Equipment equipment) => Future(() {
        // Activation/deactivation
        if (!equipment.activeSegments.equals(_lastActiveSegments) ||
            state.isEmpty) {
          // If we're deactivating segments, update the state positions
          // before we start new paths.
          _addPointsIfDeactivation(equipment);

          final points = equipment.activeSegments.mapIndexed(
            (segment, active) => active &&
                    (_lastActiveSegments.elementAtOrNull(segment) ?? false)
                ? [
                    state.last[segment]?.last ??
                        equipment.segmentCenter(segment).latLng
                  ]
                : active
                    ? [equipment.segmentCenter(segment).latLng]
                    : null,
          );

          final segmentLines = Map<int, List<LatLng>?>.fromEntries(
            points.mapIndexed(MapEntry.new),
          );
          state = state..add(segmentLines);
          _lastActiveSegments = equipment.activeSegments;
        }

        // Continuation
        else {
          final positions = List.generate(
            _lastActiveSegments.length,
            (segment) => equipment.segmentCenter(segment),
          );
          final addNext = positions
              .mapIndexed(
                (segment, position) => shouldAddNext(position.latLng, segment),
              )
              .reduce((value, element) => value || element);

          if (addNext) {
            state = state
              ..last.updateAll(
                (key, value) => value?..add(positions[key].latLng),
              );
          }
        }
      });

  /// Add the current positions to the state if we're deactivating a
  /// segment, before we start a new set of paths.
  void _addPointsIfDeactivation(Equipment equipment) {
    final prevActive = _lastActiveSegments.fold(
      0,
      (previousValue, element) =>
          element == true ? previousValue + 1 : previousValue,
    );
    final nextActive = equipment.activeSegments.fold(
      0,
      (previousValue, element) =>
          element == true ? previousValue + 1 : previousValue,
    );
    if (nextActive < prevActive) {
      state = state
        ..last.updateAll(
          (key, value) => value?..add(equipment.segmentCenter(key).latLng),
        );
    }
  }

  /// Whether the [next] point for this [segment] is necessary to keep the
  /// path up to date.
  bool shouldAddNext(LatLng next, int segment) {
    final prev = state.last[segment]?.last;

    if (state.isNotEmpty && prev != null) {
      final distance = prev.distanceTo(next);

      if (distance > 20) {
        return true;
      } else if (distance > 1 && (state.last[segment]?.length ?? 0) >= 2) {
        final secondPrev =
            state.last[segment]![state.last[segment]!.length - 2];
        final prevBearing = secondPrev.bearingTo(prev);
        final bearing = prev.bearingTo(next);

        final bearingDiff = (prevBearing - bearing).abs();

        if (bearingDiff > 1) {
          return true;
        }
      } else if ((state.last[segment]?.length ?? 0) < 2 && distance > 1) {
        return true;
      }
    }
    return false;
  }

  /// Always update as the state is complex and any change to it is usually
  /// different to the previous state.
  @override
  bool updateShouldNotify(
    List<Map<int, List<LatLng>?>> previous,
    List<Map<int, List<LatLng>?>> next,
  ) =>
      true;
}
