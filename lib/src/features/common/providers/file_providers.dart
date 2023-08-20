import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
