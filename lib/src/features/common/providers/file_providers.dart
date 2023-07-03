import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_providers.g.dart';

/// A provider for the main user file directory for the application.
@Riverpod(keepAlive: true)
Future<Directory> fileDirectory(FileDirectoryRef ref) async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final directory =
      Directory([documentsDirectory.path, '/AgOpenGPS_flutter'].join());
  await directory.create(recursive: true);

  return directory;
}

/// A provider for the main settings file for the application.
@Riverpod(keepAlive: true)
Future<File> settingsFile(SettingsFileRef ref) async {
  final file = await File(
    '${ref.watch(fileDirectoryProvider).requireValue.path}/settings.json',
  ).create(recursive: true);

  return file;
}
