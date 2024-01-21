import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
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
AsyncValue<void> saveWorkSession(
  SaveWorkSessionRef ref,
  WorkSession workSession, {
  String? overrideName,
  bool downloadIfWeb = false,
}) =>
    ref.watch(
      saveJsonToFileDirectoryProvider(
        object: workSession,
        fileName: overrideName ??
            workSession.title ??
            DateTime.now().toIso8601String(),
        folder: 'work_sessions',
        downloadIfWeb: downloadIfWeb,
      ),
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
