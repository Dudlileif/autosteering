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
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'work_session_providers.g.dart';

/// A provider for holding the active [WorkSession].
@riverpod
class ActiveWorkSession extends _$ActiveWorkSession {
  @override
  WorkSession? build() {
    return null;
  }

  /// Updates [state] to [value].
  void update(WorkSession value) => Future(() => state = value);
}

/// A provider for loading a [WorkSession] from a file at [path], if it's valid.
@riverpod
FutureOr<WorkSession?> loadWorkSessionFromFile(
  LoadWorkSessionFromFileRef ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    final json = jsonDecode(await file.readAsString());
    if (json is Map) {
      final vehicle = WorkSession.fromJson(Map<String, dynamic>.from(json));

      return vehicle;
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
AsyncValue<List<WorkSession>> savedWorkSessions(SavedWorkSessionsRef ref) => ref
    .watch(
      savedFilesProvider(
        fromJson: WorkSession.fromJson,
        folder: 'work_sessions',
      ),
    )
    .whenData(
      (data) => data.cast(),
    );

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
      final json = jsonDecode(String.fromCharCodes(data));
      if (json is Map) {
        workSession = WorkSession.fromJson(Map<String, dynamic>.from(json));
      }
      Logger.instance.w(
        'Failed to import work session, data is not a valid json map',
      );
    } else {
      Logger.instance.w(
        'Failed to import equipment setup, data is not null',
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
    ref.read(activeWorkSessionProvider.notifier).update(workSession);
  }
  return workSession;
}
