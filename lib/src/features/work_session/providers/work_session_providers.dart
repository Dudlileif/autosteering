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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'work_session_providers.g.dart';

/// A provider for holding the active [WorkSession].
@Riverpod(keepAlive: true)
class ActiveWorkSession extends _$ActiveWorkSession {
  DateTime? _firstPathUpdate;

  @override
  WorkSession? build() => null;

  /// Updates [state] to [value].
  void update(WorkSession? value) => Future(() {
        _firstPathUpdate = null;
        state = value;
        if (state != null) {
          for (final equipment
              in state!.equipmentSetup!.allAttached.cast<Equipment>()) {
            if (state!.equipmentLogs[equipment.uuid] == null ||
                state!.equipmentLogs[equipment.uuid]!.isEmpty) {
              if (ref.read(
                equipmentLogRecordsProvider(equipment.uuid).select(
                  (value) => value != null && value.isNotEmpty,
                ),
              )) {
                setEquipmentLogRecords(
                  equipment.uuid,
                  ref.read(
                        equipmentLogRecordsProvider(
                          equipment.uuid,
                        ),
                      ) ??
                      [],
                );
              }
            }
          }

          final firstRecords = state!.equipmentLogs.values
              .map((logs) => logs.firstOrNull)
              .nonNulls;
          if (firstRecords.isNotEmpty) {
            _firstPathUpdate =
                firstRecords.sortedBy((record) => record.time).first.time;
            if (state!.start == null) {
              state!.start = _firstPathUpdate;
            }
          }
          if (state!.end == null) {
            final lastRecords = state!.equipmentLogs.values
                .map((logs) => logs.lastOrNull)
                .nonNulls;
            if (lastRecords.isNotEmpty) {
              state!.end =
                  lastRecords.sortedBy((record) => record.time).last.time;
            }
          }

          ref.read(saveWorkSessionProvider(state!));
        }
      });

  /// Updates the [WorkSession.name] of the [state].
  void updateName(String? name) => Future(() {
        state = state?..name = name;
        if (state != null) {
          ref.read(saveWorkSessionProvider(state!));
        }
      });

  /// Updates the [WorkSession.note] of the [state].
  void updateNote(String? note) => Future(() {
        state = state?..note = note;
        if (state != null) {
          ref.read(saveWorkSessionProvider(state!));
        }
      });

  /// Updates the [WorkSession.field] of the [state] to [field].
  void updateField(Field? field) => Future(() {
        state = state?..field = field;
        if (state != null) {
          ref.read(saveWorkSessionProvider(state!));
        }
      });

  /// Removes the [ABTracking] with [uuid] from [WorkSession.abTracking].
  void removeABTracking(String uuid) => Future(
        () {
          state = state
            ?..abTracking = (state?.abTracking
                  ?..removeWhere((element) => element.uuid == uuid)) ??
                [];
          if (state != null) {
            ref.read(saveWorkSessionProvider(state!));
          }
        },
      );

  /// Removes the [PathTracking] with [uuid] from [WorkSession.pathTracking].
  void removePathTracking(String uuid) => Future(
        () {
          final newState = state
            ?..pathTracking.removeWhere((element) => element.uuid == uuid);
          state = newState;
          if (state != null) {
            ref.read(saveWorkSessionProvider(state!));
          }
        },
      );

  /// Updates the [WorkSession.abTracking].
  void updateABTracking(ABTracking tracking) => Future(() {
        final index = state?.abTracking
            .indexWhere((element) => element.uuid == tracking.uuid);
        if (index != null && index >= 0) {
          state = state?..abTracking.replaceRange(index, index + 1, [tracking]);
        } else {
          state = state?..abTracking.add(tracking);
        }
        if (state != null) {
          ref.read(saveWorkSessionProvider(state!));
        }
      });

  /// Updates the [WorkSession.pathTracking].
  void updatePathTracking(PathTracking tracking) => Future(() {
        final index = state?.pathTracking
            .indexWhere((element) => element.uuid == tracking.uuid);
        if (index != null && index >= 0) {
          state = state
            ?..pathTracking.replaceRange(index, index + 1, [tracking]);
        } else {
          return state = state?..pathTracking.add(tracking);
        }
        if (state != null) {
          ref.read(saveWorkSessionProvider(state!));
        }
      });

  /// Updates the [WorkSession.start] time to [time].
  void updateStartTime(DateTime? time) => Future(() {
        state = state?..start = time;
        if (state != null) {
          ref.read(saveWorkSessionProvider(state!));
        }
      });

  /// Updates the [WorkSession.end] time to [time].
  void updateEndTime(DateTime? time) => Future(() {
        state = state?..end = time;
        if (state != null) {
          ref.read(saveWorkSessionProvider(state!));
        }
      });

  /// Add the [record] to the log record file for the equipment with
  /// [Equipment.uuid] equal to [equipmentUuid].
  void addEquipmentLogRecord(String equipmentUuid, EquipmentLogRecord record) =>
      Future(() {
        if (state != null) {
          if (_firstPathUpdate == null) {
            _firstPathUpdate = record.time;
            state = state!..start = record.time;
          } else {
            state!.end = record.time;
          }

          var skipIfLastAlsoHadNoActiveSections = false;
          if (state!.equipmentLogs.containsKey(equipmentUuid)) {
            if (record.activeSections.isEmpty &&
                (state!.equipmentLogs[equipmentUuid]!.lastOrNull?.activeSections
                        .isEmpty ??
                    false)) {
              skipIfLastAlsoHadNoActiveSections = true;
            } else {
              state!.equipmentLogs[equipmentUuid]!.add(record);
            }
          } else {
            state!.equipmentLogs[equipmentUuid] = [record];
          }
          if (Device.isNative && !skipIfLastAlsoHadNoActiveSections) {
            final fileName = [
              ref.read(fileDirectoryProvider).requireValue.path,
              'work_sessions',
              state!.name ?? state!.uuid,
              'equipment_logs',
              '$equipmentUuid.log',
            ].join(Platform.pathSeparator);

            final file = File(fileName);
            if (!file.existsSync()) {
              file.createSync(recursive: true);
            }
            file.writeAsStringSync(
              [
                jsonEncode(record),
                Platform.lineTerminator,
              ].join(),
              mode: FileMode.append,
            );
          }
        }
      });

  /// Sets the [WorkSession.equipmentLogs] for the [equipmentUuid] to [records].
  ///
  /// The corresponding log file will be created.
  Future<void> setEquipmentLogRecords(
    String equipmentUuid,
    List<EquipmentLogRecord> records,
  ) async =>
      Future(() async {
        if (state != null) {
          state = state!
            ..equipmentLogs.update(
              equipmentUuid,
              (_) => records,
              ifAbsent: () => records,
            );
          if (Device.isNative) {
            await ref.read(
              saveWorkSessionEquipmentLogsProvider(
                state!,
                singleUuid: equipmentUuid,
              ).future,
            );
          }
        }
      });

  /// Add an [EquipmentLogRecord] with all sections deactivated to all the
  /// [EquipmentLogRecord]s files.
  void addAllDeactivationEquipmentLogRecords() => Future(() {
        if (state != null) {
          if (state?.equipmentSetup != null) {
            for (final equipmentReference
                in state!.equipmentSetup!.allAttached.cast<Equipment>()) {
              final equipment = ref.read(
                allEquipmentsProvider
                    .select((value) => value[equipmentReference.uuid]),
              );
              if (equipment != null) {
                final record = equipment.logRecord.copyWith(activeSections: []);
                if (state!.equipmentLogs.containsKey(equipment.uuid)) {
                  if (state!.equipmentLogs[equipment.uuid]!.isNotEmpty) {
                    if (state!.equipmentLogs[equipment.uuid]!.last
                        .activeSections.isNotEmpty) {
                      state!.equipmentLogs[equipment.uuid]!.add(record);

                      if (Device.isNative) {
                        final fileName = [
                          ref.read(fileDirectoryProvider).requireValue.path,
                          'work_sessions',
                          state!.name ?? state!.uuid,
                          'equipment_logs',
                          '${equipment.uuid}.log',
                        ].join(Platform.pathSeparator);

                        final file = File(fileName);
                        if (file.existsSync()) {
                          file.writeAsStringSync(
                            [
                              jsonEncode(record),
                              Platform.lineTerminator,
                            ].join(),
                            mode: FileMode.append,
                          );
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      });

  /// Delete the [EquipmentLogRecord]s file for the equipment with
  /// [Equipment.uuid] equal to [equipmentUuid].
  void deleteLogRecordsFile(String equipmentUuid) => Future(() {
        if (state != null) {
          if (state!.equipmentLogs.containsKey(equipmentUuid)) {
            state!.equipmentLogs.remove(equipmentUuid);
          }
          if (Device.isNative) {
            final fileName = [
              ref.read(fileDirectoryProvider).requireValue.path,
              'work_sessions',
              state!.name ?? state!.uuid,
              'equipment_logs',
              '$equipmentUuid.log',
            ].join(Platform.pathSeparator);

            final file = File(fileName);
            if (file.existsSync()) {
              file.deleteSync();
            }
          }
        }
      });

  // Always update as the state is complex and any change to it is usually
  /// different to the previous state.
  @override
  bool updateShouldNotify(
    WorkSession? previous,
    WorkSession? next,
  ) =>
      true;
}

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.
@riverpod
FutureOr<WorkSession?> loadWorkSessionFromFile(
  LoadWorkSessionFromFileRef ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    try {
      final json = jsonDecode(await file.readAsString());
      return WorkSession.fromJson(Map<String, dynamic>.from(json as Map));
    } catch (error, stackTrace) {
      Logger.instance.w(
        'Failed loading work session from: $path',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
  return null;
}

/// A provider for saving [workSession] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> saveWorkSession(
  SaveWorkSessionRef ref,
  WorkSession workSession, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async {
  await ref.watch(
    saveJsonToFileDirectoryProvider(
      object: workSession.toJson(),
      fileName: overrideName ?? workSession.name ?? workSession.uuid,
      folder: 'work_sessions',
      subFolder: overrideName ?? workSession.name ?? workSession.uuid,
      downloadIfWeb: downloadIfWeb,
    ).future,
  );
}

/// A provider for saving the [workSession]s [WorkSession.equipmentLogs] to
/// their respective files.
///
/// Set the [overwrite] parameter to false to preserve already existing files.
/// [singleUuid] can be used to specify a single equipment's logs that should
/// be saved.
@riverpod
FutureOr<void> saveWorkSessionEquipmentLogs(
  SaveWorkSessionEquipmentLogsRef ref,
  WorkSession workSession, {
  bool overwrite = true,
  String? singleUuid,
}) async {
  if (Device.isNative && workSession.equipmentLogs.isNotEmpty) {
    for (final equipment in workSession.equipmentSetup!.allAttached
        .where(
          (element) => singleUuid == null || singleUuid == element.uuid,
        )
        .cast<Equipment>()) {
      final records = workSession.equipmentLogs[equipment.uuid];
      if (records != null) {
        if (Device.isNative) {
          final fileName = [
            ref.read(fileDirectoryProvider).requireValue.path,
            'work_sessions',
            workSession.name ?? workSession.uuid,
            'equipment_logs',
            '${equipment.uuid}.log',
          ].join(Platform.pathSeparator);

          final file = File(fileName);

          if (workSession.equipmentLogs.containsKey(equipment.uuid)) {
            if (overwrite || !file.existsSync()) {
              await file.create(recursive: true);
              await file.writeAsString(
                [
                  records
                      .map((e) => jsonEncode(e.toJson()))
                      .join(Platform.lineTerminator),
                  Platform.lineTerminator,
                ].join(),
              );
              Logger.instance.i(
                '''Wrote equipment logs for ${equipment.name ?? equipment.uuid} to: $fileName''',
              );
            }
          }
        }
      }
    }
  }
}

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> exportWorkSession(
  ExportWorkSessionRef ref,
  WorkSession workSession, {
  String? overrideName,
  bool downloadIfWeb = false,
  bool withEquipmentLogs = true,
}) async =>
    await ref.watch(
      exportJsonToFileDirectoryProvider(
        object: workSession.toJson(
          withEquipmentLogs: withEquipmentLogs,
        ),
        fileName: overrideName ??
            workSession.name ??
            DateTime.now().toIso8601String(),
        folder: 'work_sessions',
      ).future,
    );

/// A provider for reading and holding all the saved [WorkSession]s in the
/// user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<WorkSession>> savedWorkSessions(SavedWorkSessionsRef ref) async =>
    await ref
        .watch(
      savedFilesInSubDirectoriesProvider(
        fromJson: WorkSession.fromJson,
        folder: 'work_sessions',
      ).future,
    )
        .then((data) async {
      final sessions = data.cast<WorkSession>();
      if (sessions.isNotEmpty) {
        if (sessions.any((element) => element.field != null)) {
          final savedFields = await ref.read(
            savedFieldsProvider.selectAsync(
              (data) => data.map((e) => (uuid: e.uuid, name: e.name)),
            ),
          );
          final fieldsToAdd = <Field>[];
          for (final session
              in sessions.where((element) => element.field != null)) {
            if (savedFields
                    .none((field) => field.uuid == session.field!.uuid) &&
                fieldsToAdd
                    .none((field) => field.uuid == session.field!.uuid)) {
              fieldsToAdd.add(session.field!);
            }
            for (final field in savedFields) {
              if (field.uuid == session.field!.uuid &&
                  field.name != session.field!.name) {
                session.field = session.field!.copyWith(name: field.name);
              }
            }
          }
          if (fieldsToAdd.isNotEmpty) {
            for (final field in fieldsToAdd) {
              await ref.read(saveFieldProvider(field).future);
            }
          }
        }
        if (sessions.any((element) => element.equipmentSetup != null)) {
          final savedSetups = await ref.read(
            savedEquipmentSetupsProvider.selectAsync(
              (data) => data.map((e) => (name: e.name)),
            ),
          );
          final setupsToAdd = <EquipmentSetup>[];
          for (final session
              in sessions.where((element) => element.equipmentSetup != null)) {
            if (savedSetups.none(
                  (element) => element.name == session.equipmentSetup!.name,
                ) &&
                setupsToAdd.none(
                  (element) => element.name == session.equipmentSetup!.name,
                )) {
              setupsToAdd.add(session.equipmentSetup!);
            }
          }
          if (setupsToAdd.isNotEmpty) {
            for (final setup in setupsToAdd) {
              await ref.read(saveEquipmentSetupProvider(setup).future);
            }
          }
        }
      }
      return sessions;
    });

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].
@riverpod
FutureOr<void> deleteWorkSession(
  DeleteWorkSessionRef ref,
  WorkSession workSession, {
  String? overrideName,
}) async =>
    await ref.watch(
      deleteDirectoryFromFileDirectoryProvider(
        directoryName: overrideName ??
            workSession.name ??
            DateTime.now().toIso8601String(),
        folder: 'work_sessions',
      ).future,
    );

/// A provider for importing a work session from a file and applying it
/// to the [ActiveWorkSession] provider.
@riverpod
FutureOr<WorkSession?> importWorkSession(
  ImportWorkSessionRef ref,
) async {
  ref.keepAlive();
  Timer(const Duration(seconds: 5), ref.invalidateSelf);
  final pickedFiles = await FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose work session file',
  );

  WorkSession? workSession;
  if (Device.isWeb) {
    final data = pickedFiles?.files.first.bytes;
    if (data != null) {
      try {
        final json = jsonDecode(String.fromCharCodes(data));
        workSession =
            WorkSession.fromJson(Map<String, dynamic>.from(json as Map));
      } catch (error, stackTrace) {
        Logger.instance.w(
          'Failed to import work session.',
          error: error,
          stackTrace: stackTrace,
        );
      }
    } else {
      Logger.instance.w(
        'Failed to import work session, data is null.',
      );
    }
  } else {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      workSession =
          await ref.watch(loadWorkSessionFromFileProvider(filePath).future);
    } else {
      Logger.instance.w('Failed to import work session: $filePath.');
    }
  }
  if (workSession != null) {
    Logger.instance.i(
      'Imported work session: ${workSession.name}.',
    );
    ref
      ..read(activeWorkSessionProvider.notifier).update(workSession)
      ..read(activeFieldProvider.notifier).update(workSession.field)
      ..read(configuredEquipmentSetupProvider.notifier)
          .update(workSession.equipmentSetup);
    if (workSession.equipmentSetup != null) {
      ref.read(simInputProvider.notifier).send(
        (
          equipmentSetup: workSession.equipmentSetup,
          parentUuid:
              ref.watch(mainVehicleProvider.select((value) => value.uuid))
        ),
      );
    }

    if (workSession.equipmentLogs.isNotEmpty) {
      for (final equipment
          in workSession.equipmentSetup!.allAttached.cast<Equipment>()) {
        final overrideHitch =
            workSession.equipmentSetup?.findHitchOfChild(equipment);
        final records = workSession.equipmentLogs[equipment.uuid];
        if (records != null) {
          ref
              .read(
                equipmentPathsProvider(equipment.uuid).notifier,
              )
              .updateFromLogRecords(
                records: records,
                equipment: equipment,
                overrideHitch: overrideHitch,
              );
        }
      }
      if (Device.isNative) {
        await ref.watch(
          saveWorkSessionEquipmentLogsProvider(workSession).future,
        );
      }
    }

    await ref.read(saveWorkSessionProvider(workSession).future);
  }
  return workSession;
}

/// A provider for exporting all work session files.
@riverpod
FutureOr<void> exportWorkSessions(
  ExportWorkSessionsRef ref, {
  bool zip = true,
}) async =>
    await ref.watch(exportAllProvider(directory: 'work_sessions').future);
