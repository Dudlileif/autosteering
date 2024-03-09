import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

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

/// A provider that holds all of the equipments.
@Riverpod(keepAlive: true)
class AllEquipments extends _$AllEquipments {
  @override
  Map<String, Equipment> build() {
    ref.listenSelf((previous, next) {
      final toRemove = <String>[];
      for (final equipment in next.values) {
        if (equipment.hitchParent == null) {
          toRemove.add(equipment.uuid);
        }
        if (ref.exists(equipmentPathsProvider(equipment.uuid))) {
          ref
              .read(equipmentPathsProvider(equipment.uuid).notifier)
              .update(equipment);
        }
      }
      if (toRemove.isNotEmpty) {
        for (final uuid in toRemove) {
          state.remove(uuid);
          ref.invalidate(equipmentPathsProvider(uuid));
        }
        state = Map.of(state);
      }
    });

    return {};
  }

  /// Update the [equipment] in the [state].
  void update(Hitchable equipment) => Future(
        () => state = Map.of(state)
          ..update(
            equipment.uuid,
            (value) => equipment as Equipment,
            ifAbsent: () => equipment as Equipment,
          ),
      );

  /// Remove all the equipment.
  void clear() => Future(() {
        final vehicle = ref.watch(mainVehicleProvider);
        state.removeWhere(
          (key, value) => vehicle.findChildRecursive(key) == null,
        );
      });

  /// Clear all the painted areas for all the equipments.
  void clearPaintedArea() => Future(() {
        for (final equipment in state.values) {
          ref.read(equipmentPathsProvider(equipment.uuid).notifier).clear();
        }
      });

  /// Handles the event of a tap on the map. If [point] is within one of the
  /// equipments' sections, then the section will be toggled.
  void handleMapOnTap(LatLng point) {
    for (final equipment in state.values) {
      equipment.sectionPolygons.forEachIndexed((index, section) {
        if (section.contains(point.gbPosition)) {
          ref.read(simInputProvider.notifier).send(
            (
              uuid: equipment.uuid,
              activeSections:
                  (equipment..toggleSection(index)).sectionActivationStatus
            ),
          );
        }
      });
    }
  }

  /// Handles the event of a pointer hovering on the map. If [point] is within
  /// one of the equipments' sections, the [equipmentHoveredProvider] is
  /// set to true, otherwise false.
  void handleMapOnPointerHover(PointerHoverEvent event, LatLng point) {
    for (final equipment in state.values) {
      for (final section in equipment.sectionPolygons) {
        if (section.contains(point.gbPosition)) {
          return ref
              .read(equipmentHoveredProvider.notifier)
              .update(value: true);
        }
      }
    }
    ref.read(equipmentHoveredProvider.notifier).update(value: false);
  }
}

/// Whether or not a cursor is hovering over an equipment section.
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
  var _prevSectionActivationStatus = <bool>[];

  @override
  List<Map<int, List<SectionEdgePositions>?>> build(String uuid) => [];

  /// Updates the travelled path of the [equipment].
  void update(Equipment equipment) => Future(() {
        // Activation/deactivation
        if (equipment.sections.isNotEmpty) {
          if (!equipment.sectionActivationStatus
                  .equals(_prevSectionActivationStatus) ||
              state.isEmpty) {
            // If we're deactivating sections, update the state positions
            // before we start new paths.
            _addPointsIfDeactivation(equipment);

            final points = equipment.sectionActivationStatus.mapIndexed(
              (section, active) {
                return active &&
                        (_prevSectionActivationStatus
                                .elementAtOrNull(section) ??
                            false)
                    ? [
                        state.lastOrNull?[section]?.lastOrNull ??
                            equipment.sectionEdgePositions(section),
                      ]
                    : active
                        ? [equipment.sectionEdgePositions(section)]
                        : null;
              },
            );

            final sectionLines =
                Map<int, List<SectionEdgePositions>?>.fromEntries(
              points.mapIndexed(MapEntry.new),
            );
            state = state..add(sectionLines);

            _prevSectionActivationStatus = equipment.sectionActivationStatus;
          }

          // Continuation
          else {
            final positions = List.generate(
              _prevSectionActivationStatus.length,
              (section) => equipment.sectionEdgePositions(section),
            );
            final addNext = positions
                .mapIndexed(
                  (section, position) => shouldAddNext(position, section),
                )
                .reduce((value, element) => value || element);

            if (addNext) {
              state = state
                ..last.updateAll(
                  (key, value) => value?..add(positions[key]),
                );
            }
          }
        }
      });

  /// Add the current positions to the state if we're deactivating a
  /// section, before we start a new set of paths.
  void _addPointsIfDeactivation(Equipment equipment) {
    if (state.isNotEmpty) {
      final prevActive = _prevSectionActivationStatus.fold(
        0,
        (previousValue, element) =>
            element == true ? previousValue + 1 : previousValue,
      );
      final nextActive = equipment.sectionActivationStatus.fold(
        0,
        (previousValue, element) =>
            element == true ? previousValue + 1 : previousValue,
      );
      if (nextActive < prevActive) {
        state = state
          ..last.updateAll(
            (key, value) => value?..add(equipment.sectionEdgePositions(key)),
          );
      }
    }
  }

  /// Whether the [next] point for this [section] is necessary to keep the
  /// path up to date.
  bool shouldAddNext(SectionEdgePositions next, int section) {
    if (state.isEmpty) {
      return true;
    }
    final prev = state.last[section]?.last;

    if (state.isNotEmpty && prev != null) {
      final distance = [
        prev.left.rhumb.distanceTo(next.left),
        prev.right.rhumb.distanceTo(next.right),
      ].max;

      if (distance > 20) {
        return true;
      } else if (distance > 1 && (state.last[section]?.length ?? 0) >= 2) {
        final secondPrev =
            state.last[section]![state.last[section]!.length - 2];
        final prevBearing = secondPrev.left.rhumb.initialBearingTo(prev.left);

        final nextBearing = prev.left.rhumb.finalBearingTo(next.left);

        final bearingDiff = bearingDifference(prevBearing, nextBearing);

        if (bearingDiff > 1) {
          return true;
        }
      } else if ((state.last[section]?.length ?? 0) < 2 && distance > 1) {
        return true;
      }
    }
    return false;
  }

  /// Clears all the painted areas for the equipment.
  void clear() => Future(() => state = []);

  /// Always update as the state is complex and any change to it is usually
  /// different to the previous state.
  @override
  bool updateShouldNotify(
    List<Map<int, List<SectionEdgePositions>?>> previous,
    List<Map<int, List<SectionEdgePositions>?>> next,
  ) =>
      true;
}

/// A provider for loading an [Equipment] from a file at [path], if it's valid.
@riverpod
FutureOr<Equipment?> loadEquipmentFromFile(
  LoadEquipmentFromFileRef ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    final json = jsonDecode(await file.readAsString());
    if (json is Map) {
      return Equipment.fromJson(Map<String, dynamic>.from(json));
    }
  }
  return null;
}

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
AsyncValue<void> saveEquipment(
  SaveEquipmentRef ref,
  Equipment equipment, {
  String? overrideName,
  bool downloadIfWeb = false,
}) =>
    ref.watch(
      saveJsonToFileDirectoryProvider(
        object: equipment,
        fileName: overrideName ?? equipment.name ?? equipment.uuid,
        folder: 'equipment',
        downloadIfWeb: downloadIfWeb,
      ),
    );

/// A provider for reading and holding all the saved [Equipment] in the
/// user file directory.
@Riverpod(keepAlive: true)
AsyncValue<List<Equipment>> savedEquipments(SavedEquipmentsRef ref) => ref
    .watch(
      savedFilesProvider(
        fromJson: Equipment.fromJson,
        folder: 'equipment',
      ),
    )
    .whenData(
      (data) => data.cast(),
    );
