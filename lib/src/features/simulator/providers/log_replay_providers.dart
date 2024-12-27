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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'log_replay_providers.g.dart';

/// A provider for the active [LogReplay].
@Riverpod(keepAlive: true)
class ActiveLogReplay extends _$ActiveLogReplay {
  @override
  LogReplay? build() {
    listenSelf((previous, next) {
      if (next != null) {
        ref.read(simInputProvider.notifier).send(next);
      }
      ref.invalidate(logReplayIndexProvider);
    });
    return null;
  }

  /// Update [state] to [value].
  void update(LogReplay? value) => Future(() => state = value);
}

/// A provider for the index of the playing log replay.
@Riverpod(keepAlive: true)
class LogReplayIndex extends _$LogReplayIndex {
  @override
  int build() => 0;

  /// Update [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for whether the log replays should loop.
@Riverpod(keepAlive: true)
class LoopLogReplay extends _$LoopLogReplay {
  @override
  bool build() {
    listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((replayLoop: next));
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for loading a [LogReplay] from a file at [path], if it's valid.
@riverpod
FutureOr<LogReplay?> loadLogReplayFromFile(
  Ref ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    try {
      return LogReplay(
        log: await file.readAsString(),
        loop: ref.watch(loopLogReplayProvider),
      );
    } on Exception catch (error, stackTrace) {
      Logger.instance.w(
        'Failed to load log replay from: $path.',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
  return null;
}

/// A provider for importing a [LogReplay] from a file.
@riverpod
FutureOr<LogReplay?> importLogReplay(Ref ref) async {
  ref.keepAlive();
  Timer(
    const Duration(seconds: 5),
    ref.invalidateSelf,
  );
  final pickedFiles = await FilePicker.platform.pickFiles(
    allowedExtensions: ['log'],
    type: FileType.custom,
    dialogTitle: 'Choose log replay file',
  );

  LogReplay? replay;
  if (Device.isWeb) {
    final data = pickedFiles?.files.first.bytes;
    if (data != null) {
      try {
        replay = LogReplay(
          log: String.fromCharCodes(data),
          loop: ref.watch(loopLogReplayProvider),
        );
      } on Exception catch (error, stackTrace) {
        Logger.instance.w(
          'Failed to import log replay.',
          error: error,
          stackTrace: stackTrace,
        );
      }
    } else {
      Logger.instance.w(
        'Failed to import log replay, data is null.',
      );
    }
  } else {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      replay = await ref.watch(loadLogReplayFromFileProvider(filePath).future);
    } else {
      Logger.instance.w('Failed to import log replay: $filePath.');
    }
  }
  if (replay != null) {
    Logger.instance.i(
      '''Imported log replay: ${replay.startTime} of duration ${replay.duration}.''',
    );
    ref.read(activeLogReplayProvider.notifier).update(replay);
  }

  return replay;
}
