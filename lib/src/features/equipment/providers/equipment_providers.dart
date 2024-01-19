import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
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
      for (final equipment in next.values) {
        if (ref.exists(equipmentPathsProvider(equipment.uuid))) {
          ref
              .read(equipmentPathsProvider(equipment.uuid).notifier)
              .update(equipment);
        }
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
        state = {};
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
              activeSections: (equipment..toggleSection(index)).activeSections
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
  var _lastActiveSections = <bool>[];

  @override
  List<Map<int, List<(Geographic, Geographic)>?>> build(String uuid) => [];

  /// Updates the travelled path of the [equipment].
  void update(Equipment equipment) => Future(() {
        // Activation/deactivation
        if (equipment.sections > 0) {
          if (!equipment.activeSections.equals(_lastActiveSections) ||
              state.isEmpty) {
            // If we're deactivating sections, update the state positions
            // before we start new paths.
            _addPointsIfDeactivation(equipment);

            final points = equipment.activeSections.mapIndexed(
              (section, active) {
                final sectionPoints = equipment.sectionPoints(section);

                return active &&
                        (_lastActiveSections.elementAtOrNull(section) ?? false)
                    ? [
                        state.last[section]?.last ??
                            (sectionPoints[1], sectionPoints[2]),
                      ]
                    : active
                        ? [(sectionPoints[1], sectionPoints[2])]
                        : null;
              },
            );

            final sectionLines =
                Map<int, List<(Geographic, Geographic)>?>.fromEntries(
              points.mapIndexed(MapEntry.new),
            );
            state = state..add(sectionLines);

            _lastActiveSections = equipment.activeSections;
          }

          // Continuation
          else {
            final positions = List.generate(
              _lastActiveSections.length,
              (section) {
                final points = equipment.sectionPoints(section);
                return (points[1], points[2]);
              },
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
    final prevActive = _lastActiveSections.fold(
      0,
      (previousValue, element) =>
          element == true ? previousValue + 1 : previousValue,
    );
    final nextActive = equipment.activeSections.fold(
      0,
      (previousValue, element) =>
          element == true ? previousValue + 1 : previousValue,
    );
    if (nextActive < prevActive) {
      state = state
        ..last.updateAll(
          (key, value) {
            final points = equipment.sectionPoints(key);
            return value?..add((points[1], points[2]));
          },
        );
    }
  }

  /// Whether the [next] point for this [section] is necessary to keep the
  /// path up to date.
  bool shouldAddNext((Geographic, Geographic) next, int section) {
    final prev = state.last[section]?.last;

    if (state.isNotEmpty && prev != null) {
      final distance = [
        prev.$1.spherical.distanceTo(next.$1),
        prev.$2.spherical.distanceTo(next.$2),
      ].max;

      if (distance > 20) {
        return true;
      } else if (distance > 1 && (state.last[section]?.length ?? 0) >= 2) {
        final secondPrev =
            state.last[section]![state.last[section]!.length - 2];
        final prevBearing = secondPrev.$1.spherical.initialBearingTo(prev.$1);

        final nextBearing = prev.$1.spherical.finalBearingTo(next.$1);

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

  /// Always update as the state is complex and any change to it is usually
  /// different to the previous state.
  @override
  bool updateShouldNotify(
    List<Map<int, List<(Geographic, Geographic)>?>> previous,
    List<Map<int, List<(Geographic, Geographic)>?>> next,
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
      final vehicle = Equipment.fromJson(Map<String, dynamic>.from(json));

      return vehicle;
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
