import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_map/flutter_map.dart';
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
  /// equipments' sections, then the section will be toggled.
  void handleMapOnTap(TapPosition tapPosition, LatLng point) {
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
  List<Map<int, List<Geographic>?>> build(String uuid) => [];

  /// Updates the travelled path of the [equipment].
  void update(Equipment equipment) => Future(() {
        // Activation/deactivation
        if (!equipment.activeSections.equals(_lastActiveSections) ||
            state.isEmpty) {
          // If we're deactivating sections, update the state positions
          // before we start new paths.
          _addPointsIfDeactivation(equipment);

          final points = equipment.activeSections.mapIndexed(
            (section, active) => active &&
                    (_lastActiveSections.elementAtOrNull(section) ?? false)
                ? [
                    state.last[section]?.last ??
                        equipment.sectionCenter(section),
                  ]
                : active
                    ? [equipment.sectionCenter(section)]
                    : null,
          );

          final sectionLines = Map<int, List<Geographic>?>.fromEntries(
            points.mapIndexed(MapEntry.new),
          );
          state = state..add(sectionLines);
          _lastActiveSections = equipment.activeSections;
        }

        // Continuation
        else {
          final positions = List.generate(
            _lastActiveSections.length,
            (section) => equipment.sectionCenter(section),
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
          (key, value) => value?..add(equipment.sectionCenter(key)),
        );
    }
  }

  /// Whether the [next] point for this [section] is necessary to keep the
  /// path up to date.
  bool shouldAddNext(Geographic next, int section) {
    final prev = state.last[section]?.last;

    if (state.isNotEmpty && prev != null) {
      final distance = prev.spherical.distanceTo(next);

      if (distance > 20) {
        return true;
      } else if (distance > 1 && (state.last[section]?.length ?? 0) >= 2) {
        final secondPrev =
            state.last[section]![state.last[section]!.length - 2];
        final prevBearing = secondPrev.spherical.initialBearingTo(prev);
        final nextBearing = prev.spherical.finalBearingTo(next);

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
    List<Map<int, List<Geographic>?>> previous,
    List<Map<int, List<Geographic>?>> next,
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
@riverpod
FutureOr<void> saveEquipment(
  SaveEquipmentRef ref,
  Equipment equipment,
) async {
  final name = equipment.name ?? equipment.uuid;

  final file = File(
    '''${ref.watch(fileDirectoryProvider).requireValue.path}/equipment/$name.json''',
  );

  await file.create(recursive: true);

  await file
      .writeAsString(const JsonEncoder.withIndent('    ').convert(equipment));
}

/// A provider for reading and holding all the saved vehicles in the
/// user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<Equipment>> savedEquipments(SavedEquipmentsRef ref) async {
  final dir = Directory(
    [ref.watch(fileDirectoryProvider).requireValue.path, '/equipment'].join(),
  );

  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  // Remake the list if there are any file changes in the folder.
  dir.watch(recursive: true).listen((event) {
    ref.invalidateSelf();
  });

  final equipments = <Equipment>[];

  if (dir.existsSync()) {
    final fileEntities = dir.listSync(recursive: true);

    if (fileEntities.isNotEmpty) {
      for (final fileEntity in fileEntities) {
        final file = File.fromUri(fileEntity.uri);

        final json = jsonDecode(await file.readAsString());

        if (json is Map) {
          equipments.add(Equipment.fromJson(Map<String, dynamic>.from(json)));
        }
      }
    }
  }
  return equipments;
}
