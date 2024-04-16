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
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
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
      final files = logsDir
          .listSync()
          .where(
            (element) =>
                FileSystemEntity.typeSync(element.path) ==
                FileSystemEntityType.file,
          )
          .toList();
      
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

    for (final hardware in ['combined', 'imu', 'gnss', 'was']) {
      final hardwareLogsDir =
          Directory([dirPath, 'logs', 'hardware', hardware].join('/'));
      if (hardwareLogsDir.existsSync()) {
        final files = hardwareLogsDir
            .listSync()
            .where(
              (element) =>
                  FileSystemEntity.typeSync(element.path) ==
                  FileSystemEntityType.file,
            )
            .toList();

        if (files.length > ref.watch(numLogFilesProvider)) {
          files.sortByCompare((file) => file.path, (a, b) => b.compareTo(a));
          final removed = <String>[];
          for (var i = ref.watch(numLogFilesProvider); i < files.length; i++) {
            removed.add(files[i].path);
            await files[i].delete();
          }
          Logger.instance
              .i('Deleted old hardware $hardware log files: $removed');
        }
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

/// A provider for exporting all log files.
@riverpod
FutureOr<void> exportLogs(ExportLogsRef ref) async {
  ref.keepAlive();
  try {
    if (Device.isNative) {
      final exportFolder = await FilePicker.platform
          .getDirectoryPath(dialogTitle: 'Select export folder');
      if (exportFolder != null) {
        final dirPath = ref.watch(fileDirectoryProvider).requireValue.path;

        final logsDir = Directory([dirPath, 'logs'].join('/'));
        if (logsDir.existsSync()) {
          final files = logsDir
              .listSync(recursive: true)
              .where(
                (element) =>
                    FileSystemEntity.typeSync(element.path) ==
                    FileSystemEntityType.file,
              )
              .toList();
          if (files.isNotEmpty) {
            var exportDirPath = '';
            if (exportFolder.endsWith('autosteering_export')) {
              exportDirPath = '$exportFolder/logs';
            } else if (exportFolder.contains('autosteering_export')) {
              exportDirPath =
                  '${exportFolder.substring(0, exportFolder.indexOf('autosteering_export') - 1)}/autosteering_export/logs';
            } else {
              exportDirPath = '$exportFolder/autosteering_export/logs';
            }
            final dir = Directory(exportDirPath);
            if (!dir.existsSync()) {
              dir.createSync(recursive: true);
            }
            for (final file in files) {
              final splits = file.path.split(Platform.pathSeparator);
              final isHardwareLog = ['combined', 'gnss', 'imu', 'was']
                  .contains(splits.elementAt(splits.length - 2));
              if (isHardwareLog) {
                final hardwareLogDir = Directory(
                  [
                    exportDirPath,
                    'hardware',
                    splits.elementAt(splits.length - 2),
                  ].join('/'),
                );
                if (!hardwareLogDir.existsSync()) {
                  hardwareLogDir.createSync(recursive: true);
                }
              }

              await File(file.path).copy(
                [
                  exportDirPath,
                  if (isHardwareLog) ...[
                    'hardware',
                    splits.elementAt(splits.length - 2),
                  ],
                  splits.last,
                ].join('/'),
              );
            }
            Logger.instance
                .i('Exported ${files.length} log files to $exportFolder.');
          }
        } else {
          Logger.instance.i('No log directory found: ${logsDir.path}.');
        }
      }
    }
  } catch (error, stackTrace) {
    Logger.instance
        .e('Failed to export logs.', error: error, stackTrace: stackTrace);
  }
  ref.invalidateSelf();
}
