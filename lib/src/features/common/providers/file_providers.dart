import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';

part 'file_providers.g.dart';

/// A provider for the main user file directory for the application.
@Riverpod(keepAlive: true)
FutureOr<Directory> fileDirectory(FileDirectoryRef ref) async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final directory =
      Directory([documentsDirectory.path, '/AgOpenGPS_flutter'].join());
  await directory.create(recursive: true);

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
    return !(await directory.delete(recursive: true)).existsSync();
  }
  return !directory.existsSync();
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
}) async {
  final dataString = const JsonEncoder.withIndent('    ').convert(object);

  if (Device.isWeb) {
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
    final file = File(
      '''${ref.watch(fileDirectoryProvider).requireValue.path}/$folder/$fileName.json''',
    );
    await file.create(recursive: true);

    await file.writeAsString(dataString);
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

  final dir = Directory(
    [
      ref.watch(fileDirectoryProvider).requireValue.path,
      folder,
    ].join('/'),
  );

  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  // Remake the list if there are any file changes in the folder.
  dir.watch(recursive: true).listen((event) {
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
  return savedItems;
}
