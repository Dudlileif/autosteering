import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'file_providers.g.dart';

/** 
 * TODO: Fix Web implementation -> html.window.localstorage, change file storage
 *  Add a platform agnostic storage/persistance system 
*/

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
