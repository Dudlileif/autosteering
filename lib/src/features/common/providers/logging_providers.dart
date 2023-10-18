import 'dart:async';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:collection/collection.dart';
import 'package:logger/logger.dart' as implementation;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'logging_providers.g.dart';

/// A provider for the number of log files to keep in the logs directory.
@Riverpod(keepAlive: true)
class NumLogFiles extends _$NumLogFiles {
  @override
  int build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.logNumFiles, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getInt(SettingsKey.logNumFiles) ??
        10;
  }

  /// Update the [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for creating a logging file for the session.
@Riverpod(keepAlive: true)
Future<File?> loggingFile(LoggingFileRef ref) async {
  final dirPath = ref.watch(fileDirectoryProvider).when(
        data: (data) => data.path,
        error: (error, stackTrace) {
          Logger.instance.e(
            'Error during loading of file directory.',
            error: error,
            stackTrace: stackTrace,
          );
          return null;
        },
        loading: () => null,
      );

  if (dirPath != null) {
    final logsDir = Directory([dirPath, 'logs'].join('/'));
    if (logsDir.existsSync()) {
      final files = logsDir.listSync();
      if (files.length > ref.watch(numLogFilesProvider)) {
        files.sortByCompare((file) => file.path, (a, b) => b.compareTo(a));
        final removed = <String>[];
        for (var i = ref.watch(numLogFilesProvider); i < files.length; i++) {
          removed.add(files[i].path);
          await files[i].delete();
        }
        Logger.instance.i('Deleted old log files: $removed');
      }
    }

    final path = [
      dirPath,
      'logs',
      '${Logger.instance.initializeTime.toIso8601String()}.log',
    ].join('/');

    final file = await File(path).create(recursive: true);

    Logger.instance.i('Log file created: $path');

    Timer.periodic(const Duration(seconds: 1), (timer) {
      var exists = logsDir.existsSync();
      if (exists) {
        exists = file.existsSync();
      }
      if (!exists) {
        timer.cancel();
        Logger.instance.fileLogger = null;
        Logger.instance.i('Log file deleted or moved: $path');
        Logger.instance.i('Attempting to create a new log file...');
        ref.invalidateSelf();
      }
    });

    return file;
  }
  return null;
}

/// A provider for the [Logger] that prints the logs to console and a file
/// if on native platforms.
@Riverpod(keepAlive: true)
Logger logging(LoggingRef ref) {
  if (Device.isWeb) {
    return Logger.instance;
  }
  var fileReady = false;

  final file = ref.watch(loggingFileProvider).when(
        data: (data) {
          fileReady = true;
          return data;
        },
        error: (error, stackTrace) {
          Logger.instance.e(
            'Error during loading of log file',
            error: error,
            stackTrace: stackTrace,
          );
          return null;
        },
        loading: () => null,
      );
  if (!fileReady) {
    return Logger.instance..fileLogger = null;
  }

  final elevatedPrinter = PrettyPrinter(
    colors: false,
    printTime: true,
  );

  return Logger.instance
    ..fileLogger = implementation.Logger(
      printer: HybridPrinter(
        SimplePrinter(printTime: true, colors: false),
        error: elevatedPrinter,
        fatal: elevatedPrinter,
      ),
      output: FileOutput(file: file!),
    );
}
