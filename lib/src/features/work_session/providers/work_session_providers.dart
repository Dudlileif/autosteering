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
import 'package:autosteering/src/features/database/database.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
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
  Future<void> update(WorkSession? value) async {
    _firstPathUpdate = null;
    state = value;
    if (state != null) {
      for (final equipment
          in state!.equipmentSetup!.allAttached.cast<Equipment>()) {
        if (equipment.id != null) {
          if (state!.equipmentLogs[equipment.id] == null ||
              state!.equipmentLogs[equipment.id]!.isEmpty) {
            if (ref.read(
              equipmentLogRecordsProvider(
                equipment.id!,
              ).select((value) => value != null && value.isNotEmpty),
            )) {
              unawaited(
                setEquipmentLogRecords(
                  equipment.id!,
                  ref.read(equipmentLogRecordsProvider(equipment.id!)) ?? [],
                ),
              );
            }
          }
        }
      }

      final firstRecords = state!.equipmentLogs.values
          .map((logs) => logs.firstOrNull)
          .nonNulls;
      if (firstRecords.isNotEmpty) {
        _firstPathUpdate = firstRecords
            .sortedBy((record) => record.time)
            .first
            .time;
        if (state!.start == null) {
          state!.start = _firstPathUpdate;
        }
      }
      if (state!.end == null) {
        final lastRecords = state!.equipmentLogs.values
            .map((logs) => logs.lastOrNull)
            .nonNulls;
        if (lastRecords.isNotEmpty) {
          state!.end = lastRecords.sortedBy((record) => record.time).last.time;
        }
      }

      ref.read(saveWorkSessionProvider(state!));
      await loadEquipmentLogRecords();
    }
  }

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
  void removeABTracking(String uuid) => Future(() {
    state = state
      ?..abTracking =
          (state?.abTracking
            ?..removeWhere((element) => element.uuid == uuid)) ??
          [];
    if (state != null) {
      ref.read(saveWorkSessionProvider(state!));
    }
  });

  /// Removes the [PathTracking] with [uuid] from [WorkSession.pathTracking].
  void removePathTracking(String uuid) => Future(() {
    final newState = state
      ?..pathTracking.removeWhere((element) => element.uuid == uuid);
    state = newState;
    if (state != null) {
      ref.read(saveWorkSessionProvider(state!));
    }
  });

  /// Updates the [WorkSession.abTracking].
  void updateABTracking(ABTracking tracking) => Future(() {
    if (state != null) {
      final index = state?.abTracking.indexWhere(
        (element) => element.uuid == tracking.uuid,
      );
      var changed = false;
      if (index != null && index >= 0) {
        final existing = state!.abTracking[index];

        if (!const SetEquality<int>().equals(
              existing.finishedOffsets,
              tracking.finishedOffsets,
            ) ||
            existing.name != tracking.name) {
          changed = true;
        }
        state = state!..abTracking.replaceRange(index, index + 1, [tracking]);
      } else {
        state = state?..abTracking.add(tracking);
        changed = true;
      }
      if (changed) {
        ref.read(saveWorkSessionProvider(state!));
      }
    }
  });

  /// Updates the [WorkSession.pathTracking].
  void updatePathTracking(PathTracking tracking) => Future(() {
    if (state != null) {
      final index = state?.pathTracking.indexWhere(
        (element) => element.uuid == tracking.uuid,
      );
      var changed = false;
      if (index != null && index >= 0) {
        final existing = state!.pathTracking[index];
        if (existing.loopMode != tracking.loopMode ||
            existing.name != tracking.name) {
          changed = true;
        }
        state = state!..pathTracking.replaceRange(index, index + 1, [tracking]);
      } else {
        state = state?..pathTracking.add(tracking);
        changed = true;
      }
      if (changed) {
        ref.read(saveWorkSessionProvider(state!));
      }
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
  /// [Equipment.id] equal to [equipmentId].
  void addEquipmentLogRecord(int equipmentId, EquipmentLogRecord record) =>
      Future(() {
        if (state != null) {
          if (!(state!.equipmentSetup?.allAttached.any(
                (e) => e.id == equipmentId,
              ) ??
              false)) {
            state = state!
              ..equipmentSetup = ref.read(
                mainVehicleProvider.select(
                  (value) => value.equipmentSetup('${state!.name} setup'),
                ),
              );
            ref.read(saveWorkSessionProvider(state!));
          }
          if (_firstPathUpdate == null) {
            _firstPathUpdate = record.time;
            state = state!..start = record.time;
          } else {
            state!.end = record.time;
          }

          var skipIfLastAlsoHadNoActiveSections = false;
          if (state!.equipmentLogs.containsKey(equipmentId)) {
            if (record.activeSections.isEmpty &&
                (state!
                        .equipmentLogs[equipmentId]!
                        .lastOrNull
                        ?.activeSections
                        .isEmpty ??
                    false)) {
              skipIfLastAlsoHadNoActiveSections = true;
            } else {
              state!.equipmentLogs[equipmentId]!.add(record);
            }
          } else {
            state!.equipmentLogs[equipmentId] = [record];
          }
          if (Device.isNative &&
              !skipIfLastAlsoHadNoActiveSections &&
              state?.id != null) {
            final fileName = path.join(
              ref.read(fileDirectoryProvider).requireValue.path,
              'tasks',
              '${state!.id!}',
              'implement_logs',
              '$equipmentId.log',
            );

            final file = File(fileName);
            if (!file.existsSync()) {
              file.createSync(recursive: true);
            }
            file.writeAsStringSync(
              [jsonEncode(record), Platform.lineTerminator].join(),
              mode: FileMode.append,
            );
          }
        }
      });

  /// Sets the [WorkSession.equipmentLogs] for the [equipmentId] to [records].
  ///
  /// The corresponding log file will be created.
  Future<void> setEquipmentLogRecords(
    int equipmentId,
    List<EquipmentLogRecord> records,
  ) async => Future(() async {
    if (state != null) {
      state = state!
        ..equipmentLogs.update(
          equipmentId,
          (_) => records,
          ifAbsent: () => records,
        );
      if (Device.isNative) {
        await ref.read(
          saveWorkSessionEquipmentLogsProvider(
            state!,
            singleId: equipmentId,
          ).future,
        );
      }
    }
  });

  /// Loads the equipment logs records from stored files.
  Future<void> loadEquipmentLogRecords() async {
    // TODO(dudlileif): add database version
    final database = ref.watch(databaseProvider);
    final equipmentLinks = await database.managers.links
        .filter((link) => link.tableRef.equals(.implements))
        .get();
    if (state case final workSession? when Device.isNative) {
      for (final equipment
          in workSession.equipmentSetup!.allAttached.cast<Equipment>()) {
        final equipmentId = equipmentLinks
            .firstWhereOrNull(
              (link) => link.linkValue == equipment.uuid,
            )
            ?.refId;
        if (equipmentId != null) {
          // TODO(dudlileif): remove this block once all have been converted
          {
            final fileNameUuid = path.join(
              ref.read(fileDirectoryProvider).requireValue.path,
              'work_sessions',
              workSession.name ?? workSession.uuid,
              'equipment_logs',
              '${equipment.uuid}.log',
            );
            final fileUuid = File(fileNameUuid);

            if (fileUuid.existsSync()) {
              Logger.instance.i(
                'Loading equipment logs from file: $fileNameUuid.',
              );
              final records = const LineSplitter()
                  .convert(await fileUuid.readAsString())
                  .map(
                    (line) => EquipmentLogRecord.fromJson(
                      Map<String, dynamic>.from(jsonDecode(line) as Map),
                    ),
                  )
                  .toList();
              if (records.isNotEmpty) {
                workSession.equipmentLogsUuids.update(
                  equipment.uuid!,
                  (oldRecords) => oldRecords.isEmpty
                      ? [...records]
                      : [
                          ...oldRecords,
                          ...records.where(
                            (record) =>
                                oldRecords.last.time.isBefore(record.time),
                          ),
                        ],
                  ifAbsent: () => records,
                );
                workSession.equipmentLogs.update(
                  equipmentId,
                  (oldRecords) => oldRecords.isEmpty
                      ? [...records]
                      : [
                          ...oldRecords,
                          ...records.where(
                            (record) =>
                                oldRecords.last.time.isBefore(record.time),
                          ),
                        ],
                  ifAbsent: () => records,
                );
              }

              Logger.instance.i(
                '''Loaded ${records.length} log records from: $fileNameUuid.''',
              );

              ref
                  .read(equipmentPathsProvider(equipmentId).notifier)
                  .updateFromLogRecords(
                    records: records,
                    equipment: equipment,
                  );
            }
          }
          final fileName = path.join(
            ref.read(fileDirectoryProvider).requireValue.path,
            'tasks',
            '${workSession.id}',
            'implement_logs',
            '$equipmentId.log',
          );
          final file = File(fileName);

          if (file.existsSync()) {
            Logger.instance.i(
              'Loading equipment logs from file: $fileName.',
            );
            final records = const LineSplitter()
                .convert(await file.readAsString())
                .map(
                  (line) => EquipmentLogRecord.fromJson(
                    Map<String, dynamic>.from(jsonDecode(line) as Map),
                  ),
                )
                .toList();
            if (records.isNotEmpty) {
              workSession.equipmentLogs.update(
                equipment.id!,
                (oldRecords) => oldRecords.isEmpty
                    ? [...records]
                    : [
                        ...oldRecords,
                        ...records.where(
                          (record) =>
                              oldRecords.last.time.isBefore(record.time),
                        ),
                      ],
                ifAbsent: () => records,
              );
            }

            Logger.instance.i(
              '''Loaded ${records.length} log records from: $fileName.''',
            );

            ref
                .read(equipmentPathsProvider(equipment.id!).notifier)
                .updateFromLogRecords(
                  records: records,
                  equipment: equipment,
                );
          } else {
            if (workSession.equipmentLogs.containsKey(equipment.id)) {
              file
                ..createSync(recursive: true)
                ..writeAsStringSync(
                  [
                    workSession.equipmentLogs[equipment.id]!
                        .map((e) => jsonEncode(e.toJson()))
                        .join(Platform.lineTerminator),
                    Platform.lineTerminator,
                  ].join(),
                );
            }
          }
        }
      }
    }
  }

  /// Add an [EquipmentLogRecord] with all sections deactivated to all the
  /// [EquipmentLogRecord]s files.
  void addAllDeactivationEquipmentLogRecords() => Future(() {
    if (state != null) {
      if (state?.equipmentSetup != null) {
        for (final equipmentReference
            in state!.equipmentSetup!.allAttached.cast<Equipment>()) {
          final equipment = ref.read(
            allEquipmentsProvider.select(
              (value) => value[equipmentReference.id],
            ),
          );
          if (equipment != null && state?.id != null) {
            final record = equipment.logRecord.copyWith(activeSections: []);
            if (state!.equipmentLogs.containsKey(equipment.id)) {
              if (state!.equipmentLogs[equipment.id]!.isNotEmpty) {
                if (state!
                    .equipmentLogs[equipment.id]!
                    .last
                    .activeSections
                    .isNotEmpty) {
                  state!.equipmentLogs[equipment.id]!.add(record);

                  if (Device.isNative) {
                    final fileName = path.join(
                      ref.read(fileDirectoryProvider).requireValue.path,
                      'tasks',
                      '${state?.id!}',
                      'implement_logs',
                      '${equipment.id}.log',
                    );

                    final file = File(fileName);
                    if (file.existsSync()) {
                      file.writeAsStringSync(
                        [jsonEncode(record), Platform.lineTerminator].join(),
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
  /// [Equipment.id] equal to [equipmentId].
  void deleteLogRecordsFile(int equipmentId) => Future(() {
    if (state != null) {
      if (state!.equipmentLogs.containsKey(equipmentId)) {
        state!.equipmentLogs.remove(equipmentId);
      }
      if (Device.isNative && state?.id != null) {
        final fileName = path.join(
          ref.read(fileDirectoryProvider).requireValue.path,
          'tasks',
          '${state!.id!}',
          'implement_logs',
          '$equipmentId.log',
        );

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
  bool updateShouldNotify(WorkSession? previous, WorkSession? next) => true;
}

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.
@riverpod
FutureOr<WorkSession?> loadWorkSessionFromFile(Ref ref, String path) async {
  final file = File(path);
  if (file.existsSync()) {
    try {
      final json = jsonDecode(await file.readAsString());
      return WorkSession.fromJson(Map<String, dynamic>.from(json as Map));
    } on Exception catch (error, stackTrace) {
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
@Riverpod(keepAlive: true)
FutureOr<void> saveWorkSession(
  Ref ref,
  WorkSession workSession, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async {
  await ref.watch(
    saveJsonToFileDirectoryProvider(
      object: workSession.toJson(),
      fileName:
          overrideName ??
          workSession.name ??
          workSession.uuid ??
          'work_sesssion_${workSession.id}',
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
/// [singleId] can be used to specify a single equipment's logs that should
/// be saved.
@Riverpod(keepAlive: true)
FutureOr<void> saveWorkSessionEquipmentLogs(
  Ref ref,
  WorkSession workSession, {
  bool overwrite = true,
  int? singleId,
}) async {
  if (Device.isNative && workSession.equipmentLogs.isNotEmpty) {
    for (final equipment
        in workSession.equipmentSetup!.allAttached
            .where(
              (element) => singleId == null || singleId == element.id,
            )
            .cast<Equipment>()) {
      final records = workSession.equipmentLogs[equipment.id];
      if (records != null && workSession.id != null) {
        if (Device.isNative) {
          final fileName = path.join(
            ref.read(fileDirectoryProvider).requireValue.path,
            'tasks',
            '${workSession.id!}',
            'implement_logs',
            '${equipment.id}.log',
          );

          final file = File(fileName);

          if (workSession.equipmentLogs.containsKey(equipment.id)) {
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
                '''Wrote equipment logs for ${equipment.name ?? equipment.id} to: $fileName''',
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
  Ref ref,
  WorkSession workSession, {
  required String dialogTitle,
  String? overrideName,
  bool downloadIfWeb = false,
  bool withEquipmentLogs = true,
}) async => await ref.watch(
  exportJsonToFileDirectoryProvider(
    object: workSession.toJson(withEquipmentLogs: withEquipmentLogs),
    fileName:
        overrideName ?? workSession.name ?? DateTime.now().toIso8601String(),
    folder: 'work_sessions',
    dialogTitle: dialogTitle,
  ).future,
);

/// A provider for reading and holding all the saved [WorkSession]s in the
/// user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<WorkSession>> savedWorkSessions(Ref ref) async => await ref
    .watch(
      savedFilesInSubDirectoriesProvider(
        fromJson: WorkSession.fromJson,
        folder: 'work_sessions',
      ).future,
    )
    .then((data) async {
      final database = ref.watch(databaseProvider);

      final sessions = data.cast<WorkSession>();
      final taskLinks = await database.managers.links
          .filter((link) => link.tableRef.equals(.tasks))
          .get();
      if (sessions.isNotEmpty) {
        if (sessions.any((element) => element.field != null)) {
          final savedFields = await ref.read(
            savedFieldsProvider.selectAsync(
              (data) => data.map((e) => (id: e.id, name: e.name)),
            ),
          );
          final fieldLinks = await database.managers.links
              .filter((link) => link.tableRef.equals(.partfields))
              .get();
          final fieldsToAdd = <Field>[];
          for (final session in sessions.where(
            (element) => element.field != null,
          )) {
            if (fieldLinks.none(
                  (link) => link.linkValue == session.field!.uuid,
                ) &&
                savedFields.none(
                  (field) => field.id == session.field!.id,
                ) &&
                fieldsToAdd.none(
                  (field) => field.id == session.field!.id,
                )) {
              fieldsToAdd.add(session.field!);
            }
            for (final field in savedFields) {
              if (field.id == session.field!.id &&
                  field.name != session.field!.name) {
                session.field = session.field!.copyWith(
                  name: field.name,
                  id: field.id,
                );
              }
            }
          }
          if (fieldsToAdd.isNotEmpty) {
            for (final field in fieldsToAdd) {
              await ref.read(saveFieldProvider(field).future);
            }
          }
          final updatedLinks = await database.managers.links
              .filter((link) => link.tableRef.equals(.partfields))
              .get();
          for (final session in sessions.where(
            (element) => element.field != null,
          )) {
            for (final link in updatedLinks) {
              if (link.linkValue == session.field!.uuid) {
                session.field = session.field!.copyWith(
                  id: link.refId,
                );
                break;
              }
            }
          }
        }
        if (sessions.any((element) => element.equipmentSetup != null)) {
          final equipmentLinks = await database.managers.links
              .filter((link) => link.tableRef.equals(.implements))
              .get();
          final savedSetups = await ref.read(
            savedEquipmentSetupsProvider.selectAsync(
              (data) => data.map((e) => (name: e.name)),
            ),
          );
          final setupsToAdd = <EquipmentSetup>[];
          for (final session in sessions.where(
            (element) => element.equipmentSetup != null,
          )) {
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
          for (final session in sessions.where(
            (element) => element.equipmentSetup != null,
          )) {
            session.equipmentSetup?.allAttached.cast<Equipment>().forEach(
              (equipment) => session.equipmentSetup?.updateChild(
                equipment.copyWith(
                  id: equipmentLinks
                      .firstWhereOrNull(
                        (link) => link.linkValue == equipment.uuid,
                      )
                      ?.refId,
                ),
              ),
            );
          }
        }
        for (final session in sessions) {
          if (!taskLinks.any((link) => link.linkValue == session.uuid)) {
            final fieldId = await database.managers.links
                .filter((link) => link.tableRef.equals(.partfields))
                .filter((link) => link.linkValue.equals(session.field?.uuid))
                .map((link) => link.refId)
                .getSingleOrNull();

            final task = await database.managers.tasks.createReturning(
              (o) => o(
                name: session.name!,
                note: Value.absentIfNull(session.note),
                workStartedAt: Value.absentIfNull(session.start),
                workEndedAt: Value.absentIfNull(session.end),
                partfield: Value.absentIfNull(fieldId),
              ),
            );

            final link = await database.managers.links.createReturning(
              (o) => o(
                tableRef: .tasks,
                refId: task.id,
                linkValue: Value(session.uuid!),
                name: Value.absentIfNull(session.name),
              ),
            );
            taskLinks.add(link);
            if (session.abTracking.isNotEmpty ||
                session.pathTracking.isNotEmpty) {
              final guidanceGroupId = await database.managers.guidanceGroups
                  .create((o) => o());
              await database.managers.guidanceAllocations.create(
                (o) => o(task: task.id, guidanceGroup: guidanceGroupId),
              );
              final existing = await database.managers.links
                  .filter((link) => link.tableRef.equals(.guidancePatterns))
                  .filter(
                    (link) => link.linkValue.isIn([
                      ...session.abTracking.map((t) => t.uuid),
                      ...session.pathTracking.map((t) => t.uuid),
                    ]),
                  )
                  .map((link) => link.refId)
                  .get();
              final abTrackings = await ref.watch(
                importMissingABTrackingsToDatabaseProvider(
                  session.abTracking,
                ).future,
              );
              final pathTrackings = await ref.watch(
                importMissingPathTrackingsToDatabaseProvider(
                  session.pathTracking,
                ).future,
              );
              await database.managers.guidanceGroupPatterns.bulkCreate(
                (o) => [...existing, ...abTrackings, ...pathTrackings].map(
                  (id) => o(
                    guidanceGroup: guidanceGroupId,
                    guidancePattern: id,
                  ),
                ),
              );
            }
            if (session.equipmentSetup != null) {
              final vehicleConnectors = await database
                  .select(database.connectors)
                  .join([
                    innerJoin(
                      database.links,
                      database.links.tableRef.equalsValue(.vehicles) &
                          database.links.linkValue.equals(
                            session.vehicle!.uuid!,
                          ) &
                          database.links.refId.equalsExp(
                            database.connectors.vehicle,
                          ),
                    ),
                  ])
                  .map((row) => row.readTable(database.connectors))
                  .get();
              for (final connection in session.equipmentSetup!.children) {
                final (:angle, :type, :child) = connection;
                final childConnectors = await database
                    .select(database.connectors)
                    .join([
                      innerJoin(
                        database.links,
                        database.links.tableRef.equalsValue(.implements) &
                            database.links.linkValue.equals(
                              child.uuid!,
                            ) &
                            database.links.refId.equalsExp(
                              database.connectors.implement,
                            ),
                      ),
                    ])
                    .map((row) => row.readTable(database.connectors))
                    .get();

                final parentConnector = vehicleConnectors.firstWhere(
                  (c) => c.angle == angle && c.type == type,
                );

                final childConnector = childConnectors.firstWhere(
                  (c) => c.angle != angle && c.type == type,
                );
                await database.managers.connections.create(
                  (o) => o(
                    task: task.id,
                    parentConnector: parentConnector.id!,
                    childConnector: childConnector.id!,
                  ),
                );
              }
            }

            session.id = task.id;

            if (Device.isNative) {
              for (final equipment
                  in session.equipmentSetup!.allAttached.cast<Equipment>()) {
                final equipmentLinks = await database.managers.links
                    .filter((link) => link.tableRef.equals(.implements))
                    .get();
                final equipmentId = equipmentLinks
                    .firstWhereOrNull(
                      (link) => link.linkValue == equipment.uuid,
                    )
                    ?.refId;
                if (equipmentId != null) {
                  // TODO(dudlileif): remove this block once all have been converted
                  {
                    final fileNameUuid = path.join(
                      ref.read(fileDirectoryProvider).requireValue.path,
                      'work_sessions',
                      session.name ?? session.uuid,
                      'equipment_logs',
                      '${equipment.uuid}.log',
                    );
                    final fileUuid = File(fileNameUuid);

                    if (fileUuid.existsSync()) {
                      Logger.instance.i(
                        'Loading equipment logs from file: $fileNameUuid.',
                      );
                      final records = const LineSplitter()
                          .convert(await fileUuid.readAsString())
                          .map(
                            (line) => EquipmentLogRecord.fromJson(
                              Map<String, dynamic>.from(
                                jsonDecode(line) as Map,
                              ),
                            ),
                          )
                          .toList();
                      if (records.isNotEmpty) {
                        session.equipmentLogsUuids.update(
                          equipment.uuid!,
                          (oldRecords) => oldRecords.isEmpty
                              ? [...records]
                              : [
                                  ...oldRecords,
                                  ...records.where(
                                    (record) => oldRecords.last.time.isBefore(
                                      record.time,
                                    ),
                                  ),
                                ],
                          ifAbsent: () => records,
                        );
                        session.equipmentLogs.update(
                          equipmentId,
                          (oldRecords) => oldRecords.isEmpty
                              ? [...records]
                              : [
                                  ...oldRecords,
                                  ...records.where(
                                    (record) => oldRecords.last.time.isBefore(
                                      record.time,
                                    ),
                                  ),
                                ],
                          ifAbsent: () => records,
                        );
                      }

                      Logger.instance.i(
                        '''Loaded ${records.length} log records from: $fileNameUuid.''',
                      );

                      final fileName = path.join(
                        ref.read(fileDirectoryProvider).requireValue.path,
                        'tasks',
                        '${session.id}',
                        'implement_logs',
                        '$equipmentId.log',
                      );
                      final file = File(fileName);

                      if (session.equipmentLogs.containsKey(equipment.id)) {
                        file
                          ..createSync(recursive: true)
                          ..writeAsStringSync(
                            [
                              session.equipmentLogs[equipment.id]!
                                  .map((e) => jsonEncode(e.toJson()))
                                  .join(Platform.lineTerminator),
                              Platform.lineTerminator,
                            ].join(),
                          );
                        Logger.instance.i(
                          '''Wrote ${records.length} log records to: $fileName.''',
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
      return sessions
          .map(
            (session) => session.copyWith(
              id: taskLinks
                  .firstWhereOrNull((link) => link.linkValue == session.uuid)
                  ?.refId,
            ),
          )
          .toList();
    });

/// A provider for deleting [workSession] from the user file system.
///
/// Override the directory name with [overrideName].
@riverpod
FutureOr<void> deleteWorkSession(
  Ref ref,
  WorkSession workSession, {
  String? overrideName,
}) async => await ref.watch(
  deleteDirectoryFromFileDirectoryProvider(
    directoryName:
        overrideName ?? workSession.name ?? DateTime.now().toIso8601String(),
    folder: 'work_sessions',
  ).future,
);

/// A provider for importing a work session from a file and applying it
/// to the [ActiveWorkSession] provider.
@riverpod
FutureOr<WorkSession?> importWorkSession(
  Ref ref, {
  required String dialogTitle,
}) async {
  ref.keepAlive();
  Timer(const Duration(seconds: 5), ref.invalidateSelf);
  final pickedFiles = await FilePicker.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: dialogTitle,
  );

  WorkSession? workSession;
  if (Device.isWeb) {
    final data = await pickedFiles?.files.first.readAsBytes();
    if (data != null) {
      try {
        final json = jsonDecode(String.fromCharCodes(data));
        workSession = WorkSession.fromJson(
          Map<String, dynamic>.from(json as Map),
        );
      } on Exception catch (error, stackTrace) {
        Logger.instance.w(
          'Failed to import work session.',
          error: error,
          stackTrace: stackTrace,
        );
      }
    } else {
      Logger.instance.w('Failed to import work session, data is null.');
    }
  } else {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      workSession = await ref.watch(
        loadWorkSessionFromFileProvider(filePath).future,
      );
    } else {
      Logger.instance.w('Failed to import work session: $filePath.');
    }
  }
  if (workSession != null) {
    Logger.instance.i('Imported work session: ${workSession.name}.');
    await ref.read(activeWorkSessionProvider.notifier).update(workSession);
    ref
      ..read(activeFieldProvider.notifier).update(workSession.field)
      ..read(
        configuredEquipmentSetupProvider.notifier,
      ).update(workSession.equipmentSetup);
    if (workSession.equipmentSetup != null) {
      ref.read(simInputProvider.notifier).send((
        equipmentSetup: workSession.equipmentSetup,
        parentId: ref.watch(
          mainVehicleProvider.select((value) => value.id),
        ),
      ));
    }

    if (workSession.equipmentLogs.isNotEmpty) {
      for (final equipment
          in workSession.equipmentSetup!.allAttached.cast<Equipment>()) {
        final records = workSession.equipmentLogs[equipment.id];
        if (records != null) {
          ref
              .read(equipmentPathsProvider(equipment.id!).notifier)
              .updateFromLogRecords(
                records: records,
                equipment: equipment,
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
  Ref ref, {
  required String dialogTitle,
  bool zip = true,
}) async => await ref.watch(
  exportAllProvider(
    directory: 'work_sessions',
    dialogTitle: dialogTitle,
  ).future,
);
