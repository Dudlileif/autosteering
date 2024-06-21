// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'equipment_providers.g.dart';

/// A provider for how the [SectionEdgePositions] should be recorded, as the
/// fraction parameter that goes in [Equipment.sectionEdgePositions].
@Riverpod(keepAlive: true)
class EquipmentRecordPositionFraction
    extends _$EquipmentRecordPositionFraction {
  @override
  double? build() => null;

  /// Updates [state] to [value];
  void update(double? value) =>
      Future(() => state = value != null ? clampDouble(value, 0, 1) : value);
}

/// A provider for the currently loaded equipment.
@Riverpod(keepAlive: true)
class LoadedEquipment extends _$LoadedEquipment {
  @override
  Equipment? build() => null;

  /// Updates [state] to [value].
  void update(Equipment? value) => Future(() => state = value);
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
          ref
              .read(activeWorkSessionProvider.notifier)
              .deleteLogRecordsFile(equipment.uuid);
        }
        ref.read(equipmentWorkedAreaProvider.notifier).clear();
        ref.read(activeWorkSessionProvider.notifier).updateStartTime(null);
        ref.read(activeWorkSessionProvider.notifier).updateEndTime(null);
      });
}

/// A provider for keeping the worked area for each equipment.
@Riverpod(keepAlive: true)
class EquipmentWorkedArea extends _$EquipmentWorkedArea {
  @override
  Map<String, double> build() {
    return {};
  }

  /// Increments the value of the [state] with key [uuid] by [increment].
  void increment(String uuid, double increment) => Future(
        () => state = state
          ..update(
            uuid,
            (prev) => prev + increment,
            ifAbsent: () => increment,
          ),
      );

  /// Updates the value of the [state] with key [uuid] to [value].
  void updateValue(String uuid, double value) => Future(
        () =>
            state = state..update(uuid, (prev) => value, ifAbsent: () => value),
      );

  /// Sets the [state] to [value].
  void set(Map<String, double> value) => Future(() => state = value);

  /// Clears the [state].
  void clear() => Future(() => state = {});

  /// Always update as the state is complex and any change to it is usually
  /// different to the previous state.
  @override
  bool updateShouldNotify(
    Map<String, double> previous,
    Map<String, double> next,
  ) =>
      true;
}

/// A provider for tracking the worked paths for the given equipment [uuid].
@Riverpod(keepAlive: true)
class EquipmentPaths extends _$EquipmentPaths {
  Map<int, bool> _prevSectionActivationStatus = {};
  Map<int, SectionEdgePositions?> _lastActivePositions = {};

  double _coveredArea = 0;

  @override
  List<Map<int, List<SectionEdgePositions>?>> build(String uuid) => [];

  /// Updates the travelled path of the [equipment].
  void update(Equipment equipment) => Future(() {
        if (equipment.sections.isNotEmpty &&
            equipment.sections.any((element) => element.workingWidth > 0)) {
          final recordFraction =
              ref.read(equipmentRecordPositionFractionProvider);
          final positions =
              equipment.activeEdgePositions(fraction: recordFraction);

          // Activation/deactivation
          if (!const MapEquality<int, bool>().equals(
                equipment.sectionActivationStatus,
                _prevSectionActivationStatus,
              ) ||
              state.isEmpty) {
            // If we're deactivating sections, update the state positions
            // before we start new paths.
            _addPointsIfDeactivation(equipment);

            final sectionLines = equipment.sectionActivationStatus.map(
              (section, active) => active &&
                      (_prevSectionActivationStatus[section] ?? false)
                  ? MapEntry(
                      section,
                      [
                        state.lastOrNull?[section]?.lastOrNull ??
                            equipment.sectionEdgePositions(
                              section,
                              fraction: recordFraction,
                            )!,
                      ],
                    )
                  : MapEntry(
                      section,
                      positions[section] != null ? [positions[section]!] : null,
                    ),
            )..removeWhere((key, value) => value == null);
            if (sectionLines.isNotEmpty) {
              state = state..add(sectionLines);
              ref
                  .read(equipmentLogRecordsProvider(uuid).notifier)
                  .add(equipment.logRecord);
            }
            _prevSectionActivationStatus = equipment.sectionActivationStatus;
          }

          // Continuation
          else {
            if (positions.isNotEmpty) {
              final addNext = positions
                  .map(
                    (section, position) => MapEntry(
                      section,
                      shouldAddNext(position, section),
                    ),
                  )
                  .values
                  .reduce((value, element) => value || element);

              if (addNext) {
                state = state
                  ..last.updateAll(
                    (section, value) {
                      if (positions[section] != null) {
                        return value?..add(positions[section]!);
                      }
                      return null;
                    },
                  );
                ref
                    .read(equipmentLogRecordsProvider(uuid).notifier)
                    .add(equipment.logRecord);
              }
            }
          }
          // Update covered working area
          if (_lastActivePositions.values.any((element) => element != null)) {
            _lastActivePositions.forEach((section, prevPos) {
              if (prevPos != null && positions[section] != null) {
                _coveredArea += Polygon.from([
                  [
                    prevPos.left,
                    prevPos.right,
                    positions[section]!.right,
                    positions[section]!.left,
                  ]
                ]).area;
              }
            });
            ref
                .read(equipmentWorkedAreaProvider.notifier)
                .updateValue(uuid, _coveredArea);
          }
          _lastActivePositions = positions;
        }
      });

  /// Add the current positions to the state if we're deactivating a
  /// section, before we start a new set of paths.
  void _addPointsIfDeactivation(Equipment equipment) {
    if (state.isNotEmpty) {
      final prevActive = _prevSectionActivationStatus.values.fold(
        0,
        (previousValue, element) =>
            element == true ? previousValue + 1 : previousValue,
      );
      final nextActive = equipment.sectionActivationStatus.values.fold(
        0,
        (previousValue, element) =>
            element == true ? previousValue + 1 : previousValue,
      );
      final recordFraction = ref.read(equipmentRecordPositionFractionProvider);
      if (nextActive < prevActive) {
        state = state
          ..last.updateAll(
            (key, value) {
              if (value != null) {
                return value
                  ..add(
                    equipment.sectionEdgePositions(
                      key,
                      fraction: recordFraction,
                    )!,
                  );
              }
              return null;
            },
          );
        ref
            .read(equipmentLogRecordsProvider(uuid).notifier)
            .add(equipment.logRecord);
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
  void clear() => Future(() {
        _coveredArea = 0;
        ref
          ..read(equipmentWorkedAreaProvider.notifier).updateValue(uuid, 0)
          ..invalidate(equipmentLogRecordsProvider(uuid));
        return state = [];
      });

  /// Sets the [state] to [value].
  void set(List<Map<int, List<SectionEdgePositions>?>> value) => Future(() {
        _coveredArea = 0;
        for (final activation in value) {
          activation.forEach((section, path) {
            if (path != null && path.length >= 2) {
              SectionEdgePositions? prevPos;
              _coveredArea += path.fold(0, (previousValue, pos) {
                var increment = 0.0;
                if (prevPos != null) {
                  increment = Polygon.from([
                    [
                      prevPos!.left,
                      prevPos!.right,
                      pos.right,
                      pos.left,
                    ]
                  ]).area;
                }
                prevPos = pos;
                return previousValue + increment;
              });
            }
          });
        }

        ref
            .read(equipmentWorkedAreaProvider.notifier)
            .updateValue(uuid, _coveredArea);
        return state = List.from(value);
      });

  /// Add all the elements of [value] to [state].
  void addAll(List<Map<int, List<SectionEdgePositions>?>> value) => Future(() {
        for (final activation in value) {
          activation.forEach((section, path) {
            if (path != null && path.length >= 2) {
              SectionEdgePositions? prevPos;
              _coveredArea += path.fold(0, (previousValue, pos) {
                var increment = 0.0;
                if (prevPos != null) {
                  increment = Polygon.from([
                    [
                      prevPos!.left,
                      prevPos!.right,
                      pos.right,
                      pos.left,
                    ]
                  ]).area;
                }
                prevPos = pos;
                return previousValue + increment;
              });
            }
          });
        }

        ref
            .read(equipmentWorkedAreaProvider.notifier)
            .updateValue(uuid, _coveredArea);
        return state = state..addAll(value);
      });

  /// Updates [state] by creating worked paths from the [records] with the
  /// [equipment].
  void updateFromLogRecords({
    required List<EquipmentLogRecord> records,
    required Equipment equipment,
    Hitch? overrideHitch,
    bool set = true,
  }) {
    final workedPaths = <Map<int, List<SectionEdgePositions>?>>[];

    var prevStatus = <int>[];
    for (final record in records) {
      equipment.updateByLogRecord(record);
      final positions = equipment.activeEdgePositions(
        forceIndices: prevStatus
            .where(
              (section) => !record.activeSections.contains(section),
            )
            .toList(),
        overrideHitch: overrideHitch,
        overrideTime: record.time,
        forceOwnPositionAndBearing: true,
      );

      if (!const ListEquality<int>()
              .equals(prevStatus, record.activeSections) ||
          workedPaths.isEmpty) {
        if (record.activeSections.length < prevStatus.length) {
          /// Add deactivation points
          workedPaths.lastOrNull?.updateAll((section, value) {
            if (positions[section] != null) {
              return value?..add(positions[section]!);
            }
            return null;
          });
        }

        if (record.activeSections.isNotEmpty) {
          /// New lines (activation points)
          final sectionLines = equipment.sectionActivationStatus.map(
            (section, active) => active && (prevStatus.contains(section))
                ? MapEntry(
                    section,
                    [
                      workedPaths.lastOrNull?[section]?.lastOrNull ??
                          equipment.sectionEdgePositions(
                            section,
                            fraction: equipment.recordingPositionFraction,
                            overrideHitch: overrideHitch,
                            overrideTime: record.time,
                            forceOwnPositionAndBearing: true,
                          )!,
                    ],
                  )
                : MapEntry(
                    section,
                    positions[section] != null ? [positions[section]!] : null,
                  ),
          )..removeWhere((key, value) => value == null);
          if (sectionLines.isNotEmpty) {
            workedPaths.add(sectionLines);
          }
        }
      }

      /// Continue lines with same active sections
      else {
        workedPaths.last.updateAll(
          (section, value) {
            if (positions[section] != null) {
              return value?..add(positions[section]!);
            }
            return null;
          },
        );
      }

      prevStatus = record.activeSections;
    }
    if (set) {
      this.set(workedPaths);
    } else {
      addAll(workedPaths);
    }
    equipment.deactivateAll();
    _prevSectionActivationStatus = equipment.sectionActivationStatus;
  }

  /// Always update as the state is complex and any change to it is usually
  /// different to the previous state.
  @override
  bool updateShouldNotify(
    List<Map<int, List<SectionEdgePositions>?>> previous,
    List<Map<int, List<SectionEdgePositions>?>> next,
  ) =>
      true;
}

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given UUID.
@Riverpod(keepAlive: true)
class EquipmentLogRecords extends _$EquipmentLogRecords {
  @override
  List<EquipmentLogRecord>? build(String uuid) => null;
  

  /// Add [record] to [state].
  void add(EquipmentLogRecord record) => Future(() {
        if (state != null) {
          state = state!..add(record);
        } else {
          state = [record];
        }
        ref
            .read(activeWorkSessionProvider.notifier)
            .addEquipmentLogRecord(uuid, record);
      });



  @override
  bool updateShouldNotify(
    List<EquipmentLogRecord>? previous,
    List<EquipmentLogRecord>? next,
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
    try {
      final json = jsonDecode(await file.readAsString());
      return Equipment.fromJson(Map<String, dynamic>.from(json as Map));
    } catch (error, stackTrace) {
      Logger.instance.w(
        'Failed loading equipment from: $path',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
  return null;
}

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
Future<void> saveEquipment(
  SaveEquipmentRef ref,
  Equipment equipment, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    ref.watch(
      saveJsonToFileDirectoryProvider(
        object: equipment,
        fileName: overrideName ?? equipment.name ?? equipment.uuid,
        folder: 'equipment',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for exporting [equipment] to a file.
///
/// Override the file name with [overrideName].
@riverpod
Future<void> exportEquipment(
  ExportEquipmentRef ref,
  Equipment equipment, {
  String? overrideName,
  bool downloadIfWeb = true,
}) async =>
    ref.watch(
      exportJsonToFileDirectoryProvider(
        object: equipment,
        fileName: overrideName ?? equipment.name ?? equipment.uuid,
        folder: 'equipment',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for reading and holding all the saved [Equipment] in the
/// user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<Equipment>> savedEquipments(SavedEquipmentsRef ref) async =>
    await ref
        .watch(
          savedFilesProvider(
            fromJson: Equipment.fromJson,
            folder: 'equipment',
          ).future,
        )
        .then((data) => data.cast());

/// A provider for deleting [equipment] from the user file system.
///
/// Override the file name with [overrideName].
@riverpod
Future<void> deleteEquipment(
  DeleteEquipmentRef ref,
  Equipment equipment, {
  String? overrideName,
}) async =>
    ref.watch(
      deleteJsonFromFileDirectoryProvider(
        fileName: overrideName ?? equipment.name ?? equipment.uuid,
        folder: 'equipment',
      ).future,
    );

/// A provider for importing a equipment configuration from a file and applying
/// it to the [ConfiguredEquipment] provider.
@riverpod
FutureOr<Equipment?> importEquipment(
  ImportEquipmentRef ref,
) async {
  ref.keepAlive();
  Timer(
    const Duration(seconds: 5),
    ref.invalidateSelf,
  );
  final pickedFiles = await FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose equipment file',
  );

  Equipment? equipment;
  if (Device.isWeb) {
    final data = pickedFiles?.files.first.bytes;
    if (data != null) {
      try {
        final json = jsonDecode(String.fromCharCodes(data));
        equipment = Equipment.fromJson(Map<String, dynamic>.from(json as Map));
      } catch (error, stackTrace) {
        Logger.instance.w(
          'Failed to import equipment.',
          error: error,
          stackTrace: stackTrace,
        );
      }
    } else {
      Logger.instance.w(
        'Failed to import equipment, data is null.',
      );
    }
  } else {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      equipment =
          await ref.watch(loadEquipmentFromFileProvider(filePath).future);
    } else {
      Logger.instance.w('Failed to import equipment: $filePath.');
    }
  }
  if (equipment != null) {
    Logger.instance.i(
      'Imported equipment: ${equipment.name ?? equipment.uuid}.',
    );
    equipment.lastUsed = DateTime.now();
    ref.read(loadedEquipmentProvider.notifier).update(equipment);
    await ref.watch(saveEquipmentProvider(equipment).future);
  }

  return equipment;
}

/// A provider for exporting all equipment files.
@riverpod
FutureOr<void> exportEquipments(
  ExportEquipmentsRef ref, {
  bool zip = true,
}) async =>
    await ref.watch(exportAllProvider(directory: 'equipments').future);
