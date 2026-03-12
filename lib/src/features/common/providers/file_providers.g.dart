// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the main user file directory for the application.

@ProviderFor(fileDirectory)
final fileDirectoryProvider = FileDirectoryProvider._();

/// A provider for the main user file directory for the application.

final class FileDirectoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<Directory>,
          Directory,
          FutureOr<Directory>
        >
    with $FutureModifier<Directory>, $FutureProvider<Directory> {
  /// A provider for the main user file directory for the application.
  FileDirectoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileDirectoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fileDirectoryHash();

  @$internal
  @override
  $FutureProviderElement<Directory> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Directory> create(Ref ref) {
    return fileDirectory(ref);
  }
}

String _$fileDirectoryHash() => r'de03bf7973f971ec08ab41dca91e128bdf1cde67';

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.

@ProviderFor(directorySize)
final directorySizeProvider = DirectorySizeFamily._();

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.

final class DirectorySizeProvider
    extends $FunctionalProvider<AsyncValue<int?>, int?, FutureOr<int?>>
    with $FutureModifier<int?>, $FutureProvider<int?> {
  /// A provider for finding the size of the [Directory] at [path].
  ///
  /// Returns the size in number of bytes.
  DirectorySizeProvider._({
    required DirectorySizeFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'directorySizeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$directorySizeHash();

  @override
  String toString() {
    return r'directorySizeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int?> create(Ref ref) {
    final argument = this.argument as String;
    return directorySize(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DirectorySizeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$directorySizeHash() => r'b90c199175380fd44b557570d59b9d1d5b227d54';

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.

final class DirectorySizeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<int?>, String> {
  DirectorySizeFamily._()
    : super(
        retry: null,
        name: r'directorySizeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for finding the size of the [Directory] at [path].
  ///
  /// Returns the size in number of bytes.

  DirectorySizeProvider call(String path) =>
      DirectorySizeProvider._(argument: path, from: this);

  @override
  String toString() => r'directorySizeProvider';
}

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.

@ProviderFor(directoryDelete)
final directoryDeleteProvider = DirectoryDeleteFamily._();

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.

final class DirectoryDeleteProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// A provider for deleting the [Directory] at [path].
  ///
  /// Returns true if the directory no longer exists.
  DirectoryDeleteProvider._({
    required DirectoryDeleteFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'directoryDeleteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$directoryDeleteHash();

  @override
  String toString() {
    return r'directoryDeleteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return directoryDelete(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DirectoryDeleteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$directoryDeleteHash() => r'90572cbddfc04c88c20660db40dc9e98ce7cd066';

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.

final class DirectoryDeleteFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  DirectoryDeleteFamily._()
    : super(
        retry: null,
        name: r'directoryDeleteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting the [Directory] at [path].
  ///
  /// Returns true if the directory no longer exists.

  DirectoryDeleteProvider call(String path) =>
      DirectoryDeleteProvider._(argument: path, from: this);

  @override
  String toString() => r'directoryDeleteProvider';
}

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.

@ProviderFor(saveJsonToFileDirectory)
final saveJsonToFileDirectoryProvider = SaveJsonToFileDirectoryFamily._();

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.

final class SaveJsonToFileDirectoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  SaveJsonToFileDirectoryProvider._({
    required SaveJsonToFileDirectoryFamily super.from,
    required ({
      dynamic object,
      String fileName,
      String folder,
      String? subFolder,
      bool downloadIfWeb,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'saveJsonToFileDirectoryProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveJsonToFileDirectoryHash();

  @override
  String toString() {
    return r'saveJsonToFileDirectoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument
            as ({
              dynamic object,
              String fileName,
              String folder,
              String? subFolder,
              bool downloadIfWeb,
            });
    return saveJsonToFileDirectory(
      ref,
      object: argument.object,
      fileName: argument.fileName,
      folder: argument.folder,
      subFolder: argument.subFolder,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveJsonToFileDirectoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveJsonToFileDirectoryHash() =>
    r'8fd1a0658073ac1359d23b6a27c357a58d072eee';

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.

final class SaveJsonToFileDirectoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({
            dynamic object,
            String fileName,
            String folder,
            String? subFolder,
            bool downloadIfWeb,
          })
        > {
  SaveJsonToFileDirectoryFamily._()
    : super(
        retry: null,
        name: r'saveJsonToFileDirectoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.

  SaveJsonToFileDirectoryProvider call({
    required dynamic object,
    required String fileName,
    required String folder,
    String? subFolder,
    bool downloadIfWeb = false,
  }) => SaveJsonToFileDirectoryProvider._(
    argument: (
      object: object,
      fileName: fileName,
      folder: folder,
      subFolder: subFolder,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'saveJsonToFileDirectoryProvider';
}

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.

@ProviderFor(exportJsonToFileDirectory)
final exportJsonToFileDirectoryProvider = ExportJsonToFileDirectoryFamily._();

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.

final class ExportJsonToFileDirectoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  ExportJsonToFileDirectoryProvider._({
    required ExportJsonToFileDirectoryFamily super.from,
    required ({
      dynamic object,
      String fileName,
      String? folder,
      String? subFolder,
      bool downloadIfWeb,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'exportJsonToFileDirectoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportJsonToFileDirectoryHash();

  @override
  String toString() {
    return r'exportJsonToFileDirectoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument
            as ({
              dynamic object,
              String fileName,
              String? folder,
              String? subFolder,
              bool downloadIfWeb,
            });
    return exportJsonToFileDirectory(
      ref,
      object: argument.object,
      fileName: argument.fileName,
      folder: argument.folder,
      subFolder: argument.subFolder,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportJsonToFileDirectoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportJsonToFileDirectoryHash() =>
    r'd2aea414c93d370bc7b411d3e7f998a7980aec2c';

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.

final class ExportJsonToFileDirectoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({
            dynamic object,
            String fileName,
            String? folder,
            String? subFolder,
            bool downloadIfWeb,
          })
        > {
  ExportJsonToFileDirectoryFamily._()
    : super(
        retry: null,
        name: r'exportJsonToFileDirectoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.

  ExportJsonToFileDirectoryProvider call({
    required dynamic object,
    required String fileName,
    String? folder,
    String? subFolder,
    bool downloadIfWeb = true,
  }) => ExportJsonToFileDirectoryProvider._(
    argument: (
      object: object,
      fileName: fileName,
      folder: folder,
      subFolder: subFolder,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'exportJsonToFileDirectoryProvider';
}

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.

@ProviderFor(savedFiles)
final savedFilesProvider = SavedFilesFamily._();

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.

final class SavedFilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<dynamic>>,
          List<dynamic>,
          FutureOr<List<dynamic>>
        >
    with $FutureModifier<List<dynamic>>, $FutureProvider<List<dynamic>> {
  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  SavedFilesProvider._({
    required SavedFilesFamily super.from,
    required ({
      dynamic Function(Map<String, dynamic> json) fromJson,
      String folder,
      bool rebuildOnFileModification,
      bool elementsInSubFolders,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'savedFilesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$savedFilesHash();

  @override
  String toString() {
    return r'savedFilesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<dynamic>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              dynamic Function(Map<String, dynamic> json) fromJson,
              String folder,
              bool rebuildOnFileModification,
              bool elementsInSubFolders,
            });
    return savedFiles(
      ref,
      fromJson: argument.fromJson,
      folder: argument.folder,
      rebuildOnFileModification: argument.rebuildOnFileModification,
      elementsInSubFolders: argument.elementsInSubFolders,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SavedFilesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$savedFilesHash() => r'eb4e3905c75aa69754a359c45c84729d2aea5fb3';

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.

final class SavedFilesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<dynamic>>,
          ({
            dynamic Function(Map<String, dynamic> json) fromJson,
            String folder,
            bool rebuildOnFileModification,
            bool elementsInSubFolders,
          })
        > {
  SavedFilesFamily._()
    : super(
        retry: null,
        name: r'savedFilesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.

  SavedFilesProvider call({
    required dynamic Function(Map<String, dynamic> json) fromJson,
    required String folder,
    bool rebuildOnFileModification = true,
    bool elementsInSubFolders = false,
  }) => SavedFilesProvider._(
    argument: (
      fromJson: fromJson,
      folder: folder,
      rebuildOnFileModification: rebuildOnFileModification,
      elementsInSubFolders: elementsInSubFolders,
    ),
    from: this,
  );

  @override
  String toString() => r'savedFilesProvider';
}

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.

@ProviderFor(savedFilesInSubDirectories)
final savedFilesInSubDirectoriesProvider = SavedFilesInSubDirectoriesFamily._();

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.

final class SavedFilesInSubDirectoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<dynamic>>,
          List<dynamic>,
          FutureOr<List<dynamic>>
        >
    with $FutureModifier<List<dynamic>>, $FutureProvider<List<dynamic>> {
  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  SavedFilesInSubDirectoriesProvider._({
    required SavedFilesInSubDirectoriesFamily super.from,
    required ({
      dynamic Function(Map<String, dynamic> json) fromJson,
      String folder,
      bool rebuildOnFileModification,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'savedFilesInSubDirectoriesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$savedFilesInSubDirectoriesHash();

  @override
  String toString() {
    return r'savedFilesInSubDirectoriesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<dynamic>> create(Ref ref) {
    final argument =
        this.argument
            as ({
              dynamic Function(Map<String, dynamic> json) fromJson,
              String folder,
              bool rebuildOnFileModification,
            });
    return savedFilesInSubDirectories(
      ref,
      fromJson: argument.fromJson,
      folder: argument.folder,
      rebuildOnFileModification: argument.rebuildOnFileModification,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SavedFilesInSubDirectoriesProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$savedFilesInSubDirectoriesHash() =>
    r'6ce1afc7c614269b7005cceaa77df573e95ff8fa';

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.

final class SavedFilesInSubDirectoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<dynamic>>,
          ({
            dynamic Function(Map<String, dynamic> json) fromJson,
            String folder,
            bool rebuildOnFileModification,
          })
        > {
  SavedFilesInSubDirectoriesFamily._()
    : super(
        retry: null,
        name: r'savedFilesInSubDirectoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.

  SavedFilesInSubDirectoriesProvider call({
    required dynamic Function(Map<String, dynamic> json) fromJson,
    required String folder,
    bool rebuildOnFileModification = true,
  }) => SavedFilesInSubDirectoriesProvider._(
    argument: (
      fromJson: fromJson,
      folder: folder,
      rebuildOnFileModification: rebuildOnFileModification,
    ),
    from: this,
  );

  @override
  String toString() => r'savedFilesInSubDirectoriesProvider';
}

/// A provider for deleting the [fileName] in [folder] if it exists.

@ProviderFor(deleteJsonFromFileDirectory)
final deleteJsonFromFileDirectoryProvider =
    DeleteJsonFromFileDirectoryFamily._();

/// A provider for deleting the [fileName] in [folder] if it exists.

final class DeleteJsonFromFileDirectoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting the [fileName] in [folder] if it exists.
  DeleteJsonFromFileDirectoryProvider._({
    required DeleteJsonFromFileDirectoryFamily super.from,
    required ({String fileName, String folder}) super.argument,
  }) : super(
         retry: null,
         name: r'deleteJsonFromFileDirectoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteJsonFromFileDirectoryHash();

  @override
  String toString() {
    return r'deleteJsonFromFileDirectoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({String fileName, String folder});
    return deleteJsonFromFileDirectory(
      ref,
      fileName: argument.fileName,
      folder: argument.folder,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteJsonFromFileDirectoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteJsonFromFileDirectoryHash() =>
    r'bb71b7567f602978f267b9ccc7583224f87028c7';

/// A provider for deleting the [fileName] in [folder] if it exists.

final class DeleteJsonFromFileDirectoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({String fileName, String folder})
        > {
  DeleteJsonFromFileDirectoryFamily._()
    : super(
        retry: null,
        name: r'deleteJsonFromFileDirectoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting the [fileName] in [folder] if it exists.

  DeleteJsonFromFileDirectoryProvider call({
    required String fileName,
    required String folder,
  }) => DeleteJsonFromFileDirectoryProvider._(
    argument: (fileName: fileName, folder: folder),
    from: this,
  );

  @override
  String toString() => r'deleteJsonFromFileDirectoryProvider';
}

/// A provider for deleting the [directoryName] in [folder] if it exists.

@ProviderFor(deleteDirectoryFromFileDirectory)
final deleteDirectoryFromFileDirectoryProvider =
    DeleteDirectoryFromFileDirectoryFamily._();

/// A provider for deleting the [directoryName] in [folder] if it exists.

final class DeleteDirectoryFromFileDirectoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting the [directoryName] in [folder] if it exists.
  DeleteDirectoryFromFileDirectoryProvider._({
    required DeleteDirectoryFromFileDirectoryFamily super.from,
    required ({String directoryName, String folder}) super.argument,
  }) : super(
         retry: null,
         name: r'deleteDirectoryFromFileDirectoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteDirectoryFromFileDirectoryHash();

  @override
  String toString() {
    return r'deleteDirectoryFromFileDirectoryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({String directoryName, String folder});
    return deleteDirectoryFromFileDirectory(
      ref,
      directoryName: argument.directoryName,
      folder: argument.folder,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteDirectoryFromFileDirectoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteDirectoryFromFileDirectoryHash() =>
    r'f5552dab7445ae257cc382d1dffa7a92e293d4ab';

/// A provider for deleting the [directoryName] in [folder] if it exists.

final class DeleteDirectoryFromFileDirectoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({String directoryName, String folder})
        > {
  DeleteDirectoryFromFileDirectoryFamily._()
    : super(
        retry: null,
        name: r'deleteDirectoryFromFileDirectoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting the [directoryName] in [folder] if it exists.

  DeleteDirectoryFromFileDirectoryProvider call({
    required String directoryName,
    required String folder,
  }) => DeleteDirectoryFromFileDirectoryProvider._(
    argument: (directoryName: directoryName, folder: folder),
    from: this,
  );

  @override
  String toString() => r'deleteDirectoryFromFileDirectoryProvider';
}

/// A provider for exporting the whole file directory to a ZIP file.

@ProviderFor(exportWholeFileDirectory)
final exportWholeFileDirectoryProvider = ExportWholeFileDirectoryProvider._();

/// A provider for exporting the whole file directory to a ZIP file.

final class ExportWholeFileDirectoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting the whole file directory to a ZIP file.
  ExportWholeFileDirectoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exportWholeFileDirectoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exportWholeFileDirectoryHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return exportWholeFileDirectory(ref);
  }
}

String _$exportWholeFileDirectoryHash() =>
    r'1b86bbaf94c73b217fcfecf7a46422cab2c63faf';

/// A provider for the progress of the currently ongoing export, if there is
/// one.

@ProviderFor(ExportProgress)
final exportProgressProvider = ExportProgressProvider._();

/// A provider for the progress of the currently ongoing export, if there is
/// one.
final class ExportProgressProvider
    extends $NotifierProvider<ExportProgress, double?> {
  /// A provider for the progress of the currently ongoing export, if there is
  /// one.
  ExportProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exportProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exportProgressHash();

  @$internal
  @override
  ExportProgress create() => ExportProgress();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$exportProgressHash() => r'e345b26f7fc97d563c9a80a694913ad2707efa8a';

/// A provider for the progress of the currently ongoing export, if there is
/// one.

abstract class _$ExportProgress extends $Notifier<double?> {
  double? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double?, double?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double?, double?>,
              double?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for exporting all files in a [directory].

@ProviderFor(exportAll)
final exportAllProvider = ExportAllFamily._();

/// A provider for exporting all files in a [directory].

final class ExportAllProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting all files in a [directory].
  ExportAllProvider._({
    required ExportAllFamily super.from,
    required ({String directory, bool zip}) super.argument,
  }) : super(
         retry: null,
         name: r'exportAllProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportAllHash();

  @override
  String toString() {
    return r'exportAllProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({String directory, bool zip});
    return exportAll(ref, directory: argument.directory, zip: argument.zip);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportAllProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportAllHash() => r'b00616867ee9da4ffd3c441c4ec89a18d1b3f521';

/// A provider for exporting all files in a [directory].

final class ExportAllFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({String directory, bool zip})
        > {
  ExportAllFamily._()
    : super(
        retry: null,
        name: r'exportAllProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting all files in a [directory].

  ExportAllProvider call({required String directory, bool zip = true}) =>
      ExportAllProvider._(
        argument: (directory: directory, zip: zip),
        from: this,
      );

  @override
  String toString() => r'exportAllProvider';
}

/// A provider for the progress of the currently ongoing import, if there is
/// one.

@ProviderFor(ImportProgress)
final importProgressProvider = ImportProgressProvider._();

/// A provider for the progress of the currently ongoing import, if there is
/// one.
final class ImportProgressProvider
    extends $NotifierProvider<ImportProgress, double?> {
  /// A provider for the progress of the currently ongoing import, if there is
  /// one.
  ImportProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'importProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$importProgressHash();

  @$internal
  @override
  ImportProgress create() => ImportProgress();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$importProgressHash() => r'1449469df452e916f31da19b9df8d26ac2ffbf09';

/// A provider for the progress of the currently ongoing import, if there is
/// one.

abstract class _$ImportProgress extends $Notifier<double?> {
  double? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double?, double?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double?, double?>,
              double?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for importing all directory files from a zip file.

@ProviderFor(importWholeFileDirectory)
final importWholeFileDirectoryProvider = ImportWholeFileDirectoryProvider._();

/// A provider for importing all directory files from a zip file.

final class ImportWholeFileDirectoryProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for importing all directory files from a zip file.
  ImportWholeFileDirectoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'importWholeFileDirectoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$importWholeFileDirectoryHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return importWholeFileDirectory(ref);
  }
}

String _$importWholeFileDirectoryHash() =>
    r'649a6ce371c61fd52ea6aca6a9bf4690a32c3985';
