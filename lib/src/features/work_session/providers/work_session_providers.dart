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
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'work_session_providers.g.dart';

/// A provider for holding the active [WorkSession].
@Riverpod(keepAlive: true)
class ActiveWorkSession extends _$ActiveWorkSession {
  Timer? _autoSaveTimer;
  DateTime? _firstPathUpdate;

  @override
  WorkSession? build() {
    ref
      ..listenSelf((previous, next) {
        if (previous == null && next != null && _autoSaveTimer == null) {
          _autoSaveTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
            if (state != null) {
              ref.read(saveWorkSessionProvider(state!));
            }
          });
        } else if (next == null) {
          _autoSaveTimer?.cancel();
          _autoSaveTimer = null;
        }
      })
      ..onDispose(() {
        _autoSaveTimer?.cancel();
        _firstPathUpdate = null;
        _autoSaveTimer = null;
      });
    return null;
  }

  /// Updates [state] to [value].
  void update(WorkSession? value) => Future(() => state = value);

  /// Updates the [WorkSession.title] of the [state].
  void updateTitle(String? title) =>
      Future(() => state = state?..title = title);

  /// Updates the [WorkSession.note] of the [state].
  void updateNote(String? note) => Future(() => state = state?..note = note);

  /// Removes the [ABTracking] with [uuid] from [WorkSession.abTracking].
  void removeABTracking(String uuid) => Future(
        () => state = state
          ?..abTracking = (state?.abTracking
                ?..removeWhere((element) => element.uuid == uuid)) ??
              [],
      );

  /// Removes the [PathTracking] with [uuid] from [WorkSession.pathTracking].
  void removePathTracking(String uuid) => Future(
        () {
          final newState = state
            ?..pathTracking.removeWhere((element) => element.uuid == uuid);
          return state = newState;
        },
      );

  /// Updates the [WorkSession.abTracking].
  void updateABTracking(ABTracking tracking) => Future(() {
        final index = state?.abTracking
            .indexWhere((element) => element.uuid == tracking.uuid);
        if (index != null && index >= 0) {
          return state = state
            ?..abTracking.replaceRange(index, index + 1, [tracking]);
        }
        return state = state?..abTracking.add(tracking);
      });

  /// Updates the [WorkSession.pathTracking].
  void updatePathTracking(PathTracking tracking) => Future(() {
        final index = state?.pathTracking
            .indexWhere((element) => element.uuid == tracking.uuid);
        if (index != null && index >= 0) {
          return state = state
            ?..pathTracking.replaceRange(index, index + 1, [tracking]);
        }
        return state = state?..pathTracking.add(tracking);
      });

  /// Updates the [WorkSession.workedPaths].
  void updateEquipmentPaths(
    String equipmentUuid,
    List<Map<int, List<SectionEdgePositions>?>> paths,
  ) =>
      Future(() {
        if (state?.workedPaths != null) {
          state = state
            ?..workedPaths?.update(
              equipmentUuid,
              (value) => paths,
              ifAbsent: () => paths,
            );
          if (state?.start == null &&
              paths.any(
                (activation) => activation.entries.any(
                  (section) =>
                      section.value != null && section.value!.isNotEmpty,
                ),
              )) {
            state = state?..start = DateTime.now();
          }
          if (_firstPathUpdate != null) {
            if (DateTime.now().difference(_firstPathUpdate!) >
                    const Duration(seconds: 1) &&
                paths.any(
                  (activation) => activation.entries.any(
                    (section) =>
                        section.value != null && section.value!.isNotEmpty,
                  ),
                )) {
              state = state?..end = DateTime.now();
            }
          } else if (paths.any(
            (activation) => activation.entries.any(
              (section) => section.value != null && section.value!.isNotEmpty,
            ),
          )) {
            _firstPathUpdate = DateTime.now();
          }
        } else {
          state = state?..workedPaths = {equipmentUuid: paths};
        }
      });

  /// Updates the [WorkSession.start] time to [time].
  void updateStartTime(DateTime? time) =>
      Future(() => state = state?..start = time);

  /// Updates the [WorkSession.end] time to [time].
  void updateEndTime(DateTime? time) =>
      Future(() => state = state?..end = time);

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
}) async =>
    await ref.watch(
      saveJsonToFileDirectoryProvider(
        object: workSession,
        fileName: overrideName ??
            workSession.title ??
            DateTime.now().toIso8601String(),
        folder: 'work_sessions',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for exporting [workSession] to a file.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> exportWorkSession(
  ExportWorkSessionRef ref,
  WorkSession workSession, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    await ref.watch(
      exportJsonToFileDirectoryProvider(
        object: workSession,
        fileName: overrideName ??
            workSession.title ??
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
          savedFilesProvider(
            fromJson: WorkSession.fromJson,
            folder: 'work_sessions',
          ).future,
        )
        .then((data) => data.cast());

/// A provider for deleting [workSession] from the user file system.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> deleteWorkSession(
  DeleteWorkSessionRef ref,
  WorkSession workSession, {
  String? overrideName,
}) async =>
    await ref.watch(
      deleteJsonFromFileDirectoryProvider(
        fileName: overrideName ??
            workSession.title ??
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
      'Imported work session: ${workSession.title}.',
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
    if (workSession.workedPaths != null) {
      workSession.workedPaths!.forEach((equipmentUuid, paths) {
        ref.read(equipmentPathsProvider(equipmentUuid).notifier).set(paths);
      });
    }
  }
  return workSession;
}
