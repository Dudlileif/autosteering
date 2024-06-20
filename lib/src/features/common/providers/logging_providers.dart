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
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:logger/logger.dart' as implementation;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'logging_providers.g.dart';

/// A provider for the number of log files to keep in the logs directory.
@Riverpod(keepAlive: true)
class DaysToKeepLogFiles extends _$DaysToKeepLogFiles {
  @override
  int build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
        if (next != previous) {
          ref
              .read(settingsProvider.notifier)
              .update(SettingsKey.logDaysToKeep, next);
        }
      });

    return ref
            .read(settingsProvider.notifier)
            .getInt(SettingsKey.logDaysToKeep) ??
        30;
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
    final now = DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );

    final logsDir = Directory([dirPath, 'logs'].join(Platform.pathSeparator));
    if (logsDir.existsSync()) {
      final files = logsDir
          .listSync()
          .where(
            (element) =>
                FileSystemEntity.typeSync(element.path) ==
                FileSystemEntityType.file,
          )
          .toList();

      final removed = <String>[];
      for (final file in files) {
        final time = DateTime.tryParse(
          file.path.split(Platform.pathSeparator).last.split('.log').first,
        )?.copyWith(
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0,
        );
        if (time != null) {
          if (now.difference(time).inDays >
              ref.read(daysToKeepLogFilesProvider)) {
            await file.delete();
            removed.add(file.path);
          }
        }
      }
      if (removed.isNotEmpty) {
        Logger.instance.i('Deleted old log files: $removed');
      }
    }

    for (final hardware in ['combined', 'imu', 'gnss', 'was']) {
      final hardwareLogsDir =
          Directory(
        [dirPath, 'logs', 'hardware', hardware].join(Platform.pathSeparator),
      );
      if (hardwareLogsDir.existsSync()) {
        final files = hardwareLogsDir
            .listSync()
            .where(
              (element) =>
                  FileSystemEntity.typeSync(element.path) ==
                  FileSystemEntityType.file,
            )
            .toList();
        final removed = <String>[];
        for (final file in files) {
          final time = DateTime.tryParse(
            file.path.split(Platform.pathSeparator).last.split('.log').first,
          )?.copyWith(
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0,
          );
          if (time != null) {
            if (now.difference(time).inDays >
                ref.read(daysToKeepLogFilesProvider)) {
              await file.delete();
              removed.add(file.path);
            }
          }
        }
        if (removed.isNotEmpty) {
          Logger.instance
              .i('Deleted old hardware $hardware log files: $removed');
        }
      }
    }

    final path = [
      dirPath,
      'logs',
      '${Logger.instance.initializeTime.toIso8601String()}.log',
    ].join(Platform.pathSeparator);

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
      filter: ProductionFilter(),
      printer: HybridPrinter(
        SimplePrinter(printTime: true, colors: false),
        error: elevatedPrinter,
        fatal: elevatedPrinter,
      ),
      output: FileOutput(file: file!),
      level: Level.all,
    );
}

/// A provider for exporting all log files.
@riverpod
FutureOr<void> exportLogs(ExportLogsRef ref, {bool zip = true}) async =>
    await ref.watch(exportAllProvider(directory: 'logs').future);
