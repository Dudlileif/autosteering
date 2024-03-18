import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';

part 'file_providers.g.dart';

/// A provider for the main user file directory for the application.
@Riverpod(keepAlive: true)
FutureOr<Directory> fileDirectory(FileDirectoryRef ref) async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final path = [documentsDirectory.path, '/Autosteering'].join();
  final directory = Directory(path);

  if (directory.existsSync()) {
    Logger.instance.i('File directory found: $path');
    return directory;
  }
  Logger.instance.i('Attempting to create file directory: $path');

  await directory.create(recursive: true);

  Logger.instance.i('File directory created: $path');

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
  bool downloadIfWeb = false,
}) async {
  final dataString = const JsonEncoder.withIndent('    ').convert(object);

  if (Device.isWeb && downloadIfWeb) {
    html.AnchorElement()
      ..href = '${Uri.dataFromString(
        dataString,
        mimeType: 'text/plain',
        encoding: utf8,
      )}'
      ..download = '$fileName.json'
      ..style.display = 'none'
      ..click();
  } else {
    final path =
        '${ref.watch(fileDirectoryProvider).requireValue.path}/$folder/$fileName.json';
    final file = File(path);
    final exists = file.existsSync();
    if (!exists) {
      await file.create(recursive: true);
    }
    await file.writeAsString(dataString);
    Logger.instance.i(
      switch (exists) {
        false => 'Created and wrote data to $path',
        true => 'Wrote data to $path',
      },
    );
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
  bool downloadIfWeb = true,
}) async {
  final dataString = const JsonEncoder.withIndent('    ').convert(object);

  if (Device.isWeb && downloadIfWeb) {
    html.AnchorElement()
      ..href = '${Uri.dataFromString(
        dataString,
        mimeType: 'text/plain',
        encoding: utf8,
      )}'
      ..download = '$fileName.json'
      ..style.display = 'none'
      ..click();
  } else {
    final exportFolder = await FilePicker.platform
        .getDirectoryPath(dialogTitle: 'Select export folder');
    if (exportFolder != null) {
      var path = '';
      if (exportFolder.endsWith('autosteering_export')) {
        path = folder != null
            ? '$exportFolder/$folder/$fileName.json'
            : '$exportFolder/$fileName.json';
      } else if (exportFolder.contains('autosteering_export')) {
        path = folder != null
            ? '${exportFolder.substring(0, exportFolder.indexOf('autosteering_export') - 1)}/autosteering_export/$folder/$fileName.json'
            : '${exportFolder.substring(0, exportFolder.indexOf('autosteering_export') - 1)}/autosteering_export/$fileName.json';
      } else {
        path = folder != null
            ? '$exportFolder/autosteering_export/$folder/$fileName.json'
            : '$exportFolder/autosteering_export/$fileName.json';
      }
      final file = File(path);
      final exists = file.existsSync();
      if (!exists) {
        await file.create(recursive: true);
      }
      await file.writeAsString(dataString);
      Logger.instance.i(
        switch (exists) {
          false => 'Created and wrote data to $path',
          true => 'Wrote data to $path',
        },
      );
    } else {
      Logger.instance.i('No export folder selected.');
    }
  }
}

/// A provider for reading and holding all the saved equipment setups in the
/// user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<dynamic>> savedFiles(
  SavedFilesRef ref, {
  required dynamic Function(Map<String, dynamic> json) fromJson,
  required String folder,
}) async {
  if (Device.isWeb) {
    return [];
  }

  final dirPath = [
    ref.watch(fileDirectoryProvider).requireValue.path,
    folder,
  ].join('/');

  Logger.instance.i('Attempting to read saved files in: $dirPath');
  final dir = Directory(dirPath);
  if (!dir.existsSync()) {
    Logger.instance.i('Directory not found: $dirPath');
    return [];
  }

  // Remake the list if there are any file changes in the folder.
  dir.watch().listen((event) {
    ref.invalidateSelf();
  });

  final savedItems = <dynamic>[];

  if (dir.existsSync()) {
    final fileEntities = dir.listSync();
    if (fileEntities.isNotEmpty) {
      for (final fileEntity in fileEntities) {
        if (fileEntity is File) {
          final file = File.fromUri(fileEntity.uri);

          final decoded = jsonDecode(await file.readAsString());

          if (decoded is Map) {
            final json = Map<String, dynamic>.from(decoded);

            final item = fromJson(json);

            savedItems.add(item);
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
    final path =
        '${ref.watch(fileDirectoryProvider).requireValue.path}/$folder/$fileName.json';
    final file = File(path);
    var exists = file.existsSync();
    if (exists) {
      await file.delete(recursive: true);
      exists = file.existsSync();
      Logger.instance.i(
        switch (exists) {
          false => 'Deleted file: $path',
          true => 'Failed to delete file: $path',
        },
      );
    } else {
      Logger.instance.i('File already deleted/does not exist: $path');
    }
  }
}
