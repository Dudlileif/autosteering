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
import 'dart:isolate';

import 'package:archive/archive_io.dart';
import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';

part 'file_providers.g.dart';

/// A provider for the main user file directory for the application.
@Riverpod(keepAlive: true)
FutureOr<Directory> fileDirectory(FileDirectoryRef ref) async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final dirPath = path.join(documentsDirectory.path, 'Autosteering');
  final directory = Directory(dirPath);

  if (directory.existsSync()) {
    Logger.instance.i('File directory found: $dirPath');
    return directory;
  }
  Logger.instance.i('Attempting to create file directory: $dirPath');

  await directory.create(recursive: true);

  Logger.instance.i('File directory created: $dirPath');

  return directory;
}

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.
@riverpod
FutureOr<int?> directorySize(DirectorySizeRef ref, String path) async {
  final directory = Directory(path);
  if (directory.existsSync()) {
    return directory.list(recursive: true).fold(
          0,
          (previous, element) => (previous ?? 0) + element.statSync().size,
        );
  }

  return null;
}

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.
@riverpod
FutureOr<bool> directoryDelete(DirectoryDeleteRef ref, String path) async {
  final directory = Directory(path);

  if (directory.existsSync()) {
    final wasDeleted = !(await directory.delete(recursive: true)).existsSync();
    Logger.instance.i('${switch (wasDeleted) {
      true => 'Deleted',
      false => 'Failed to delete'
    }} directory: $path');
    return wasDeleted;
  }
  final deleted = !directory.existsSync();
  Logger.instance.i('${switch (deleted) {
    true => 'Attempted to delete already deleted',
    false => 'Attempted to delete, but failed for'
  }} directory: $path');
  return deleted;
}

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.
@riverpod
FutureOr<void> saveJsonToFileDirectory(
  SaveJsonToFileDirectoryRef ref, {
  required dynamic object,
  required String fileName,
  required String folder,
  String? subFolder,
  bool downloadIfWeb = false,
}) async {
  if (Device.isWeb) {
    if (downloadIfWeb) {
      final dataString = const JsonEncoder.withIndent('    ').convert(object);

      html.AnchorElement()
        ..href = '${Uri.dataFromString(
          dataString,
          mimeType: 'text/plain',
          encoding: utf8,
        )}'
        ..download = '$fileName.json'
        ..style.display = 'none'
        ..click();
    }
  } else {
    try {
      final filePath = path.joinAll([
        ref.watch(fileDirectoryProvider).requireValue.path,
        folder,
        if (subFolder != null) subFolder,
        '$fileName.json',
      ]);
      await Isolate.run<LogEvent>(() async {
        try {
          final dataString =
              const JsonEncoder.withIndent('    ').convert(object);
          final file = File(filePath);
          final exists = file.existsSync();
          if (!exists) {
            await file.create(recursive: true);
          }
          await file.writeAsString(dataString);
          return LogEvent(
            Level.info,
            switch (exists) {
              false => 'Created and wrote data to $filePath',
              true => 'Wrote data to $filePath',
            },
          );
        } catch (error, stackTrace) {
          return LogEvent(
            Level.error,
            'Failed to save json.',
            error: error,
            stackTrace: stackTrace,
          );
        }
      }).then(
        (value) => Logger.instance.log(
          value.level,
          value.message,
          error: value.error,
          stackTrace: value.stackTrace,
        ),
      );
    } catch (error, stackTrace) {
      Logger.instance.e(
        'Failed to run saving isolate.',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.
@riverpod
FutureOr<void> exportJsonToFileDirectory(
  ExportJsonToFileDirectoryRef ref, {
  required dynamic object,
  required String fileName,
  String? folder,
  String? subFolder,
  bool downloadIfWeb = true,
}) async {
  if (Device.isWeb) {
    if (downloadIfWeb) {
      final dataString = const JsonEncoder.withIndent('    ').convert(object);
      html.AnchorElement()
        ..href = '${Uri.dataFromString(
          dataString,
          mimeType: 'text/plain',
          encoding: utf8,
        )}'
        ..download = '$fileName.json'
        ..style.display = 'none'
        ..click();
    }
  } else {
    try {
      final exportFolder = await FilePicker.platform
          .getDirectoryPath(dialogTitle: 'Select export folder');
      if (exportFolder != null) {
        await Isolate.run<LogEvent>(() async {
          try {
            final dataString =
                const JsonEncoder.withIndent('    ').convert(object);
            var filePath = '';
            if (exportFolder.endsWith('autosteering_export')) {
              filePath = folder != null
                  ? path.join(exportFolder, folder, '$fileName.json')
                  : path.join(exportFolder, '$fileName.json');
            } else if (exportFolder.contains('autosteering_export')) {
              filePath = path.joinAll([
                exportFolder.substring(
                  0,
                  exportFolder.indexOf('autosteering_export') - 1,
                ),
                'autosteering_export',
                if (folder != null) folder,
                '$fileName.json',
              ]);
            } else {
              filePath = path.joinAll([
                exportFolder,
                'autosteering_export',
                if (folder != null) folder,
                '$fileName.json',
              ]);
            }
            final file = File(filePath);
            final exists = file.existsSync();
            if (!exists) {
              await file.create(recursive: true);
            }
            await file.writeAsString(dataString);
            return LogEvent(
              Level.info,
              switch (exists) {
                false => 'Created and wrote data to $filePath',
                true => 'Wrote data to $filePath',
              },
            );
          } catch (error, stackTrace) {
            return LogEvent(
              Level.error,
              'Failed to export json.',
              error: error,
              stackTrace: stackTrace,
            );
          }
        }).then(
          (value) => Logger.instance.log(
            value.level,
            value.message,
            error: value.error,
            stackTrace: value.stackTrace,
          ),
        );
      } else {
        Logger.instance.i('No export folder selected.');
      }
    } catch (error, stackTrace) {
      Logger.instance.e(
        'Failed to run export isolate.',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<dynamic>> savedFiles(
  SavedFilesRef ref, {
  required dynamic Function(Map<String, dynamic> json) fromJson,
  required String folder,
  bool rebuildOnFileModification = true,
  bool elementsInSubFolders = false,
}) async {
  if (Device.isWeb) {
    return [];
  }

  final dirPath = path.join(
    ref.watch(fileDirectoryProvider).requireValue.path,
    folder,
  );

  Logger.instance.i('Attempting to read saved files in: $dirPath');
  final dir = Directory(dirPath);
  if (!dir.existsSync()) {
    Logger.instance.i('Directory not found: $dirPath');
    return [];
  }

  // Remake the list if there are any file changes in the folder.
  dir.watch().listen((event) {
    if (rebuildOnFileModification || event.type != FileSystemEvent.modify) {
      ref.invalidateSelf();
    }
  });

  final savedItems = <dynamic>[];

  if (dir.existsSync()) {
    final fileEntities = dir.listSync();
    if (fileEntities.isNotEmpty) {
      for (final fileEntity in fileEntities) {
        if (fileEntity is File) {
          final file = File.fromUri(fileEntity.uri);
          try {
            final decoded = jsonDecode(await file.readAsString());
            final json = Map<String, dynamic>.from(decoded as Map);
            final item = fromJson(json);
            savedItems.add(item);
          } catch (error, stackTrace) {
            Logger.instance.w(
              'Failed to parse: ${file.path}',
              error: error,
              stackTrace: stackTrace,
            );
          }
        }
      }
    }
  }
  Logger.instance
      .i('Directory found with ${savedItems.length} items: $dirPath');
  return savedItems;
}

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<dynamic>> savedFilesInSubDirectories(
  SavedFilesInSubDirectoriesRef ref, {
  required dynamic Function(Map<String, dynamic> json) fromJson,
  required String folder,
  bool rebuildOnFileModification = true,
}) async {
  if (Device.isWeb) {
    return [];
  }

  final dirPath = path.join(
    ref.watch(fileDirectoryProvider).requireValue.path,
    folder,
  );

  Logger.instance
      .i('Attempting to read saved files from directories in: $dirPath');
  final dir = Directory(dirPath);
  if (!dir.existsSync()) {
    Logger.instance.i('Directory not found: $dirPath');
    return [];
  }

  // Remake the list if there are any file changes in the folder.
  dir.watch().listen((event) {
    if (rebuildOnFileModification || event.type != FileSystemEvent.modify) {
      ref.invalidateSelf();
    }
  });

  final savedItems = <dynamic>[];

  if (dir.existsSync()) {
    final fileEntities = dir.listSync();
    if (fileEntities.isNotEmpty) {
      for (final fileEntity in fileEntities) {
        if (fileEntity is Directory) {
          try {
            final dir = Directory.fromUri(fileEntity.uri);
            final files = dir.listSync();
            final file = files.firstWhereOrNull(
              (file) => path.split(file.path).last.startsWith(
                    path.split(fileEntity.path).last,
                  ),
            );
            if (file is File) {
              final decoded = jsonDecode(await file.readAsString());
              final json = Map<String, dynamic>.from(decoded as Map);
              final item = fromJson(json);
              savedItems.add(item);
            }
          } catch (error, stackTrace) {
            Logger.instance.w(
              'Failed to parse items in: ${dir.path}',
              error: error,
              stackTrace: stackTrace,
            );
          }
        }
      }
    }
  }
  Logger.instance
      .i('Directory found with ${savedItems.length} items: $dirPath');
  return savedItems;
}

/// A provider for deleting the [fileName] in [folder] if it exists.
@riverpod
FutureOr<void> deleteJsonFromFileDirectory(
  DeleteJsonFromFileDirectoryRef ref, {
  required String fileName,
  required String folder,
}) async {
  if (Device.isNative) {
    final filePath = path.join(
      ref.watch(fileDirectoryProvider).requireValue.path,
      folder,
      '$fileName.json',
    );
    final file = File(filePath);
    var exists = file.existsSync();
    if (exists) {
      await file.delete(recursive: true);
      exists = file.existsSync();
      Logger.instance.i(
        switch (exists) {
          false => 'Deleted file: $filePath',
          true => 'Failed to delete file: $filePath',
        },
      );
    } else {
      Logger.instance.i('File already deleted/does not exist: $filePath');
    }
  }
}

/// A provider for deleting the [directoryName] in [folder] if it exists.
@riverpod
FutureOr<void> deleteDirectoryFromFileDirectory(
  DeleteDirectoryFromFileDirectoryRef ref, {
  required String directoryName,
  required String folder,
}) async {
  if (Device.isNative) {
    final dirPath = path.join(
      ref.watch(fileDirectoryProvider).requireValue.path,
      folder,
      directoryName,
    );
    final dir = Directory(dirPath);
    var exists = dir.existsSync();
    if (exists) {
      await dir.delete(recursive: true);
      exists = dir.existsSync();
      Logger.instance.i(
        switch (exists) {
          false => 'Deleted directory: $dirPath',
          true => 'Failed to delete dircetory: $dirPath',
        },
      );
    } else {
      Logger.instance.i('Directory already deleted/does not exist: $dirPath');
    }
  }
}

/// A provider for exporting the whole file directory to a ZIP file.
@riverpod
FutureOr<void> exportWholeFileDirectory(ExportWholeFileDirectoryRef ref) async {
  ref.keepAlive();
  try {
    if (Device.isNative) {
      final exportFolder = await FilePicker.platform
          .getDirectoryPath(dialogTitle: 'Select export folder');
      if (exportFolder != null) {
        ref.read(exportProgressProvider.notifier).update(0);

        final fileDir = ref.watch(fileDirectoryProvider).requireValue;
        var exportDirPath = '';
        if (exportFolder.endsWith('autosteering_export')) {
          exportDirPath = exportFolder;
        } else if (exportFolder.contains('autosteering_export')) {
          exportDirPath = path.join(
            exportFolder.substring(
              0,
              exportFolder.indexOf('autosteering_export') - 1,
            ),
            'autosteering_export',
          );
        } else {
          exportDirPath = path.join(exportFolder, 'autosteering_export');
        }
        final dir = Directory(exportDirPath);
        if (!dir.existsSync()) {
          dir.createSync(recursive: true);
        }

        final exportPath = path.join(
          exportDirPath,
          '''all_files-${DateTime.now().toIso8601String().replaceAll(':', '_')}.zip''',
        );

        final export = FileHandler.exportFileDirectory(
          dirPath: fileDir.path,
          exportPath: exportPath,
        );

        await for (final progress in export) {
          ref.read(exportProgressProvider.notifier).update(progress);
        }

        ref.read(exportProgressProvider.notifier).update(1);
        Logger.instance.i('Exported whole file directory to :$exportPath.');
        await Future.delayed(const Duration(milliseconds: 500), () {});
      }
    }
  } catch (error, stackTrace) {
    Logger.instance.e(
      'Failed exporting whole file directory.',
      error: error,
      stackTrace: stackTrace,
    );
  }
  ref
    ..invalidate(exportProgressProvider)
    ..invalidateSelf();
}

/// A provider for the progress of the currently ongoing export, if there is
/// one.
@riverpod
class ExportProgress extends _$ExportProgress {
  @override
  double? build() => null;

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for exporting all files in a [directory].
@riverpod
FutureOr<void> exportAll(
  ExportAllRef ref, {
  required String directory,
  bool zip = true,
}) async {
  ref.keepAlive();
  try {
    if (Device.isNative) {
      final exportFolder = await FilePicker.platform
          .getDirectoryPath(dialogTitle: 'Select export folder');
      if (exportFolder != null) {
        final dirPath = ref.watch(fileDirectoryProvider).requireValue.path;

        final dir = Directory(path.join(dirPath, directory));
        if (dir.existsSync()) {
          final files = dir
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
              exportDirPath = path.join(exportFolder, 'logs');
            } else if (exportFolder.contains('autosteering_export')) {
              exportDirPath = path.join(
                exportFolder.substring(
                  0,
                  exportFolder.indexOf('autosteering_export') - 1,
                ),
                'autosteering_export',
                directory,
              );
            } else {
              exportDirPath =
                  path.join(exportFolder, 'autosteering_export', directory);
            }
            final exportDir = Directory(exportDirPath);
            if (!exportDir.existsSync()) {
              exportDir.createSync(recursive: true);
            }
            ref.read(exportProgressProvider.notifier).update(0);
            if (zip) {
              final exportPath = path.join(
                exportDirPath,
                '''$directory-${DateTime.now().toIso8601String().replaceAll(':', '_')}.zip''',
              );
              final export = FileHandler.exportFileDirectory(
                dirPath: dir.path,
                exportPath: exportPath,
              );

              await for (final progress in export) {
                ref.read(exportProgressProvider.notifier).update(progress);
              }

              ref.read(exportProgressProvider.notifier).update(1);
              Logger.instance.i(
                'Exported ${files.length} $directory files to $exportPath.',
              );
              await Future.delayed(const Duration(milliseconds: 500), () {});
            }
          }
        } else {
          Logger.instance.i('No $directory directory found: ${dir.path}.');
        }
      }
    }
  } catch (error, stackTrace) {
    Logger.instance.e(
      'Failed to export $directory.',
      error: error,
      stackTrace: stackTrace,
    );
  }
  ref
    ..invalidate(exportProgressProvider)
    ..invalidateSelf();
}

/// A provider for the progress of the currently ongoing import, if there is
/// one.
@riverpod
class ImportProgress extends _$ImportProgress {
  @override
  double? build() => null;

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for importing all directory files from a zip file.
@riverpod
FutureOr<void> importWholeFileDirectory(ImportWholeFileDirectoryRef ref) async {
  ref.keepAlive();
  try {
    if (Device.isNative) {
      final importFile = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select ZIP file to import',
        type: FileType.custom,
        allowedExtensions: ['zip'],
      );
      if (importFile != null && importFile.files.firstOrNull?.path != null) {
        final dirPath = ref.watch(fileDirectoryProvider).requireValue.path;

        final inputStream = InputFileStream(importFile.files.first.path!);

        final archive = ZipDecoder().decodeBuffer(inputStream);

        final files = archive.files.where((f) => f.isFile);
        final numberOfFiles = files.length;
        var processed = 0;
        ref.read(importProgressProvider.notifier).update(0);
        for (final file in files) {
          final filePath = path.join(dirPath, path.normalize(file.name));
          if (path.isWithin(
            path.canonicalize(dirPath),
            path.canonicalize(filePath),
          )) {
            final output = File(filePath);
            final f = await output.create(recursive: true);
            final fp = await f.open(mode: FileMode.write);
            final bytes = file.content as List<int>;
            final fp2 = await fp.writeFrom(bytes);
            file.clear();
            await fp2.close();
            processed++;
            ref
                .read(importProgressProvider.notifier)
                .update(processed / numberOfFiles);
          }
        }
        ref.read(importProgressProvider.notifier).update(1);

        Logger.instance.i(
          '''
Imported whole file directory from ${importFile.files.first.path}.'
Reloading all settings and files...''',
        );
        ref
          ..invalidate(startupLoadingProvider)
          ..invalidate(fileDirectoryProvider)
          ..invalidate(settingsFileProvider)
          ..invalidate(reloadAllSettingsProvider);
        await Future.delayed(const Duration(milliseconds: 500), () {});
      } else {
        Logger.instance.i('No import all file found.');
      }
    }
  } catch (error, stackTrace) {
    Logger.instance.e(
      'Failed to import all files.',
      error: error,
      stackTrace: stackTrace,
    );
  }
  ref
    ..invalidate(importProgressProvider)
    ..invalidateSelf();
}
