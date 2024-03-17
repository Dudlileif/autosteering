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
AsyncValue<WorkSession?> importWorkSession(
  ImportWorkSessionRef ref,
) {
  FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose work session file',
  ).then((pickedFiles) {
    if (Device.isWeb) {
      final data = pickedFiles?.files.first.bytes;
      if (data != null) {
        final json = jsonDecode(String.fromCharCodes(data));
        if (json is Map) {
          final workSession =
              WorkSession.fromJson(Map<String, dynamic>.from(json));
          ref.read(activeWorkSessionProvider.notifier).update(workSession);
          return AsyncData(workSession);
        }
      }
    } else {
      final filePath = pickedFiles?.paths.first;
      if (filePath != null) {
        return ref.watch(loadWorkSessionFromFileProvider(filePath)).whenData(
          (data) {
            if (data != null) {
              ref.read(activeWorkSessionProvider.notifier).update(data);
              return data;
            }
            return null;
          },
        );
      }
    }
    return const AsyncData(null);
  });
  return const AsyncLoading();
}
