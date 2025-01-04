// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileDirectoryHash() => r'de03bf7973f971ec08ab41dca91e128bdf1cde67';

/// A provider for the main user file directory for the application.
///
/// Copied from [fileDirectory].
@ProviderFor(fileDirectory)
final fileDirectoryProvider = FutureProvider<Directory>.internal(
  fileDirectory,
  name: r'fileDirectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fileDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FileDirectoryRef = FutureProviderRef<Directory>;
String _$directorySizeHash() => r'b90c199175380fd44b557570d59b9d1d5b227d54';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.
///
/// Copied from [directorySize].
@ProviderFor(directorySize)
const directorySizeProvider = DirectorySizeFamily();

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.
///
/// Copied from [directorySize].
class DirectorySizeFamily extends Family<AsyncValue<int?>> {
  /// A provider for finding the size of the [Directory] at [path].
  ///
  /// Returns the size in number of bytes.
  ///
  /// Copied from [directorySize].
  const DirectorySizeFamily();

  /// A provider for finding the size of the [Directory] at [path].
  ///
  /// Returns the size in number of bytes.
  ///
  /// Copied from [directorySize].
  DirectorySizeProvider call(
    String path,
  ) {
    return DirectorySizeProvider(
      path,
    );
  }

  @override
  DirectorySizeProvider getProviderOverride(
    covariant DirectorySizeProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'directorySizeProvider';
}

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.
///
/// Copied from [directorySize].
class DirectorySizeProvider extends AutoDisposeFutureProvider<int?> {
  /// A provider for finding the size of the [Directory] at [path].
  ///
  /// Returns the size in number of bytes.
  ///
  /// Copied from [directorySize].
  DirectorySizeProvider(
    String path,
  ) : this._internal(
          (ref) => directorySize(
            ref as DirectorySizeRef,
            path,
          ),
          from: directorySizeProvider,
          name: r'directorySizeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$directorySizeHash,
          dependencies: DirectorySizeFamily._dependencies,
          allTransitiveDependencies:
              DirectorySizeFamily._allTransitiveDependencies,
          path: path,
        );

  DirectorySizeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  Override overrideWith(
    FutureOr<int?> Function(DirectorySizeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DirectorySizeProvider._internal(
        (ref) => create(ref as DirectorySizeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _DirectorySizeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DirectorySizeProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DirectorySizeRef on AutoDisposeFutureProviderRef<int?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _DirectorySizeProviderElement
    extends AutoDisposeFutureProviderElement<int?> with DirectorySizeRef {
  _DirectorySizeProviderElement(super.provider);

  @override
  String get path => (origin as DirectorySizeProvider).path;
}

String _$directoryDeleteHash() => r'90572cbddfc04c88c20660db40dc9e98ce7cd066';

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.
///
/// Copied from [directoryDelete].
@ProviderFor(directoryDelete)
const directoryDeleteProvider = DirectoryDeleteFamily();

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.
///
/// Copied from [directoryDelete].
class DirectoryDeleteFamily extends Family<AsyncValue<bool>> {
  /// A provider for deleting the [Directory] at [path].
  ///
  /// Returns true if the directory no longer exists.
  ///
  /// Copied from [directoryDelete].
  const DirectoryDeleteFamily();

  /// A provider for deleting the [Directory] at [path].
  ///
  /// Returns true if the directory no longer exists.
  ///
  /// Copied from [directoryDelete].
  DirectoryDeleteProvider call(
    String path,
  ) {
    return DirectoryDeleteProvider(
      path,
    );
  }

  @override
  DirectoryDeleteProvider getProviderOverride(
    covariant DirectoryDeleteProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'directoryDeleteProvider';
}

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.
///
/// Copied from [directoryDelete].
class DirectoryDeleteProvider extends AutoDisposeFutureProvider<bool> {
  /// A provider for deleting the [Directory] at [path].
  ///
  /// Returns true if the directory no longer exists.
  ///
  /// Copied from [directoryDelete].
  DirectoryDeleteProvider(
    String path,
  ) : this._internal(
          (ref) => directoryDelete(
            ref as DirectoryDeleteRef,
            path,
          ),
          from: directoryDeleteProvider,
          name: r'directoryDeleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$directoryDeleteHash,
          dependencies: DirectoryDeleteFamily._dependencies,
          allTransitiveDependencies:
              DirectoryDeleteFamily._allTransitiveDependencies,
          path: path,
        );

  DirectoryDeleteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DirectoryDeleteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DirectoryDeleteProvider._internal(
        (ref) => create(ref as DirectoryDeleteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DirectoryDeleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DirectoryDeleteProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DirectoryDeleteRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `path` of this provider.
  String get path;
}

class _DirectoryDeleteProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DirectoryDeleteRef {
  _DirectoryDeleteProviderElement(super.provider);

  @override
  String get path => (origin as DirectoryDeleteProvider).path;
}

String _$saveJsonToFileDirectoryHash() =>
    r'22edbc7f95aea84ee2427d51b95842b633aa016a';

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.
///
/// Copied from [saveJsonToFileDirectory].
@ProviderFor(saveJsonToFileDirectory)
const saveJsonToFileDirectoryProvider = SaveJsonToFileDirectoryFamily();

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.
///
/// Copied from [saveJsonToFileDirectory].
class SaveJsonToFileDirectoryFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  ///
  /// Copied from [saveJsonToFileDirectory].
  const SaveJsonToFileDirectoryFamily();

  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  ///
  /// Copied from [saveJsonToFileDirectory].
  SaveJsonToFileDirectoryProvider call({
    required dynamic object,
    required String fileName,
    required String folder,
    String? subFolder,
    bool downloadIfWeb = false,
  }) {
    return SaveJsonToFileDirectoryProvider(
      object: object,
      fileName: fileName,
      folder: folder,
      subFolder: subFolder,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  SaveJsonToFileDirectoryProvider getProviderOverride(
    covariant SaveJsonToFileDirectoryProvider provider,
  ) {
    return call(
      object: provider.object,
      fileName: provider.fileName,
      folder: provider.folder,
      subFolder: provider.subFolder,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveJsonToFileDirectoryProvider';
}

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.
///
/// Copied from [saveJsonToFileDirectory].
class SaveJsonToFileDirectoryProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  ///
  /// Copied from [saveJsonToFileDirectory].
  SaveJsonToFileDirectoryProvider({
    required dynamic object,
    required String fileName,
    required String folder,
    String? subFolder,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => saveJsonToFileDirectory(
            ref as SaveJsonToFileDirectoryRef,
            object: object,
            fileName: fileName,
            folder: folder,
            subFolder: subFolder,
            downloadIfWeb: downloadIfWeb,
          ),
          from: saveJsonToFileDirectoryProvider,
          name: r'saveJsonToFileDirectoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveJsonToFileDirectoryHash,
          dependencies: SaveJsonToFileDirectoryFamily._dependencies,
          allTransitiveDependencies:
              SaveJsonToFileDirectoryFamily._allTransitiveDependencies,
          object: object,
          fileName: fileName,
          folder: folder,
          subFolder: subFolder,
          downloadIfWeb: downloadIfWeb,
        );

  SaveJsonToFileDirectoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.object,
    required this.fileName,
    required this.folder,
    required this.subFolder,
    required this.downloadIfWeb,
  }) : super.internal();

  final dynamic object;
  final String fileName;
  final String folder;
  final String? subFolder;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveJsonToFileDirectoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveJsonToFileDirectoryProvider._internal(
        (ref) => create(ref as SaveJsonToFileDirectoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        object: object,
        fileName: fileName,
        folder: folder,
        subFolder: subFolder,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveJsonToFileDirectoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveJsonToFileDirectoryProvider &&
        other.object == object &&
        other.fileName == fileName &&
        other.folder == folder &&
        other.subFolder == subFolder &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, object.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);
    hash = _SystemHash.combine(hash, folder.hashCode);
    hash = _SystemHash.combine(hash, subFolder.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveJsonToFileDirectoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `object` of this provider.
  dynamic get object;

  /// The parameter `fileName` of this provider.
  String get fileName;

  /// The parameter `folder` of this provider.
  String get folder;

  /// The parameter `subFolder` of this provider.
  String? get subFolder;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveJsonToFileDirectoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with SaveJsonToFileDirectoryRef {
  _SaveJsonToFileDirectoryProviderElement(super.provider);

  @override
  dynamic get object => (origin as SaveJsonToFileDirectoryProvider).object;
  @override
  String get fileName => (origin as SaveJsonToFileDirectoryProvider).fileName;
  @override
  String get folder => (origin as SaveJsonToFileDirectoryProvider).folder;
  @override
  String? get subFolder =>
      (origin as SaveJsonToFileDirectoryProvider).subFolder;
  @override
  bool get downloadIfWeb =>
      (origin as SaveJsonToFileDirectoryProvider).downloadIfWeb;
}

String _$exportJsonToFileDirectoryHash() =>
    r'8217681ffeb02d471630e45473c50a8e9cf3976f';

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.
///
/// Copied from [exportJsonToFileDirectory].
@ProviderFor(exportJsonToFileDirectory)
const exportJsonToFileDirectoryProvider = ExportJsonToFileDirectoryFamily();

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.
///
/// Copied from [exportJsonToFileDirectory].
class ExportJsonToFileDirectoryFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  ///
  /// Copied from [exportJsonToFileDirectory].
  const ExportJsonToFileDirectoryFamily();

  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  ///
  /// Copied from [exportJsonToFileDirectory].
  ExportJsonToFileDirectoryProvider call({
    required dynamic object,
    required String fileName,
    String? folder,
    String? subFolder,
    bool downloadIfWeb = true,
  }) {
    return ExportJsonToFileDirectoryProvider(
      object: object,
      fileName: fileName,
      folder: folder,
      subFolder: subFolder,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  ExportJsonToFileDirectoryProvider getProviderOverride(
    covariant ExportJsonToFileDirectoryProvider provider,
  ) {
    return call(
      object: provider.object,
      fileName: provider.fileName,
      folder: provider.folder,
      subFolder: provider.subFolder,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportJsonToFileDirectoryProvider';
}

/// A provider for saving [object] to [fileName].json to a file in the [folder]
/// in the file drectory.
///
/// Caution: Expects [object] to have a .toJson() method implemented.
///
/// Copied from [exportJsonToFileDirectory].
class ExportJsonToFileDirectoryProvider
    extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  ///
  /// Copied from [exportJsonToFileDirectory].
  ExportJsonToFileDirectoryProvider({
    required dynamic object,
    required String fileName,
    String? folder,
    String? subFolder,
    bool downloadIfWeb = true,
  }) : this._internal(
          (ref) => exportJsonToFileDirectory(
            ref as ExportJsonToFileDirectoryRef,
            object: object,
            fileName: fileName,
            folder: folder,
            subFolder: subFolder,
            downloadIfWeb: downloadIfWeb,
          ),
          from: exportJsonToFileDirectoryProvider,
          name: r'exportJsonToFileDirectoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportJsonToFileDirectoryHash,
          dependencies: ExportJsonToFileDirectoryFamily._dependencies,
          allTransitiveDependencies:
              ExportJsonToFileDirectoryFamily._allTransitiveDependencies,
          object: object,
          fileName: fileName,
          folder: folder,
          subFolder: subFolder,
          downloadIfWeb: downloadIfWeb,
        );

  ExportJsonToFileDirectoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.object,
    required this.fileName,
    required this.folder,
    required this.subFolder,
    required this.downloadIfWeb,
  }) : super.internal();

  final dynamic object;
  final String fileName;
  final String? folder;
  final String? subFolder;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportJsonToFileDirectoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportJsonToFileDirectoryProvider._internal(
        (ref) => create(ref as ExportJsonToFileDirectoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        object: object,
        fileName: fileName,
        folder: folder,
        subFolder: subFolder,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportJsonToFileDirectoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportJsonToFileDirectoryProvider &&
        other.object == object &&
        other.fileName == fileName &&
        other.folder == folder &&
        other.subFolder == subFolder &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, object.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);
    hash = _SystemHash.combine(hash, folder.hashCode);
    hash = _SystemHash.combine(hash, subFolder.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExportJsonToFileDirectoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `object` of this provider.
  dynamic get object;

  /// The parameter `fileName` of this provider.
  String get fileName;

  /// The parameter `folder` of this provider.
  String? get folder;

  /// The parameter `subFolder` of this provider.
  String? get subFolder;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _ExportJsonToFileDirectoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ExportJsonToFileDirectoryRef {
  _ExportJsonToFileDirectoryProviderElement(super.provider);

  @override
  dynamic get object => (origin as ExportJsonToFileDirectoryProvider).object;
  @override
  String get fileName => (origin as ExportJsonToFileDirectoryProvider).fileName;
  @override
  String? get folder => (origin as ExportJsonToFileDirectoryProvider).folder;
  @override
  String? get subFolder =>
      (origin as ExportJsonToFileDirectoryProvider).subFolder;
  @override
  bool get downloadIfWeb =>
      (origin as ExportJsonToFileDirectoryProvider).downloadIfWeb;
}

String _$savedFilesHash() => r'eb4e3905c75aa69754a359c45c84729d2aea5fb3';

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.
///
/// Copied from [savedFiles].
@ProviderFor(savedFiles)
const savedFilesProvider = SavedFilesFamily();

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.
///
/// Copied from [savedFiles].
class SavedFilesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  ///
  /// Copied from [savedFiles].
  const SavedFilesFamily();

  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  ///
  /// Copied from [savedFiles].
  SavedFilesProvider call({
    required dynamic Function(Map<String, dynamic>) fromJson,
    required String folder,
    bool rebuildOnFileModification = true,
    bool elementsInSubFolders = false,
  }) {
    return SavedFilesProvider(
      fromJson: fromJson,
      folder: folder,
      rebuildOnFileModification: rebuildOnFileModification,
      elementsInSubFolders: elementsInSubFolders,
    );
  }

  @override
  SavedFilesProvider getProviderOverride(
    covariant SavedFilesProvider provider,
  ) {
    return call(
      fromJson: provider.fromJson,
      folder: provider.folder,
      rebuildOnFileModification: provider.rebuildOnFileModification,
      elementsInSubFolders: provider.elementsInSubFolders,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savedFilesProvider';
}

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.
///
/// Copied from [savedFiles].
class SavedFilesProvider extends FutureProvider<List<dynamic>> {
  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  ///
  /// Copied from [savedFiles].
  SavedFilesProvider({
    required dynamic Function(Map<String, dynamic>) fromJson,
    required String folder,
    bool rebuildOnFileModification = true,
    bool elementsInSubFolders = false,
  }) : this._internal(
          (ref) => savedFiles(
            ref as SavedFilesRef,
            fromJson: fromJson,
            folder: folder,
            rebuildOnFileModification: rebuildOnFileModification,
            elementsInSubFolders: elementsInSubFolders,
          ),
          from: savedFilesProvider,
          name: r'savedFilesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savedFilesHash,
          dependencies: SavedFilesFamily._dependencies,
          allTransitiveDependencies:
              SavedFilesFamily._allTransitiveDependencies,
          fromJson: fromJson,
          folder: folder,
          rebuildOnFileModification: rebuildOnFileModification,
          elementsInSubFolders: elementsInSubFolders,
        );

  SavedFilesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fromJson,
    required this.folder,
    required this.rebuildOnFileModification,
    required this.elementsInSubFolders,
  }) : super.internal();

  final dynamic Function(Map<String, dynamic>) fromJson;
  final String folder;
  final bool rebuildOnFileModification;
  final bool elementsInSubFolders;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(SavedFilesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavedFilesProvider._internal(
        (ref) => create(ref as SavedFilesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fromJson: fromJson,
        folder: folder,
        rebuildOnFileModification: rebuildOnFileModification,
        elementsInSubFolders: elementsInSubFolders,
      ),
    );
  }

  @override
  FutureProviderElement<List<dynamic>> createElement() {
    return _SavedFilesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavedFilesProvider &&
        other.fromJson == fromJson &&
        other.folder == folder &&
        other.rebuildOnFileModification == rebuildOnFileModification &&
        other.elementsInSubFolders == elementsInSubFolders;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fromJson.hashCode);
    hash = _SystemHash.combine(hash, folder.hashCode);
    hash = _SystemHash.combine(hash, rebuildOnFileModification.hashCode);
    hash = _SystemHash.combine(hash, elementsInSubFolders.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SavedFilesRef on FutureProviderRef<List<dynamic>> {
  /// The parameter `fromJson` of this provider.
  dynamic Function(Map<String, dynamic>) get fromJson;

  /// The parameter `folder` of this provider.
  String get folder;

  /// The parameter `rebuildOnFileModification` of this provider.
  bool get rebuildOnFileModification;

  /// The parameter `elementsInSubFolders` of this provider.
  bool get elementsInSubFolders;
}

class _SavedFilesProviderElement extends FutureProviderElement<List<dynamic>>
    with SavedFilesRef {
  _SavedFilesProviderElement(super.provider);

  @override
  dynamic Function(Map<String, dynamic>) get fromJson =>
      (origin as SavedFilesProvider).fromJson;
  @override
  String get folder => (origin as SavedFilesProvider).folder;
  @override
  bool get rebuildOnFileModification =>
      (origin as SavedFilesProvider).rebuildOnFileModification;
  @override
  bool get elementsInSubFolders =>
      (origin as SavedFilesProvider).elementsInSubFolders;
}

String _$savedFilesInSubDirectoriesHash() =>
    r'6ce1afc7c614269b7005cceaa77df573e95ff8fa';

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.
///
/// Copied from [savedFilesInSubDirectories].
@ProviderFor(savedFilesInSubDirectories)
const savedFilesInSubDirectoriesProvider = SavedFilesInSubDirectoriesFamily();

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.
///
/// Copied from [savedFilesInSubDirectories].
class SavedFilesInSubDirectoriesFamily
    extends Family<AsyncValue<List<dynamic>>> {
  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  ///
  /// Copied from [savedFilesInSubDirectories].
  const SavedFilesInSubDirectoriesFamily();

  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  ///
  /// Copied from [savedFilesInSubDirectories].
  SavedFilesInSubDirectoriesProvider call({
    required dynamic Function(Map<String, dynamic>) fromJson,
    required String folder,
    bool rebuildOnFileModification = true,
  }) {
    return SavedFilesInSubDirectoriesProvider(
      fromJson: fromJson,
      folder: folder,
      rebuildOnFileModification: rebuildOnFileModification,
    );
  }

  @override
  SavedFilesInSubDirectoriesProvider getProviderOverride(
    covariant SavedFilesInSubDirectoriesProvider provider,
  ) {
    return call(
      fromJson: provider.fromJson,
      folder: provider.folder,
      rebuildOnFileModification: provider.rebuildOnFileModification,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savedFilesInSubDirectoriesProvider';
}

/// A provider for reading and holding all the saved objects of
/// the given type in the in the user file directory.
///
/// Copied from [savedFilesInSubDirectories].
class SavedFilesInSubDirectoriesProvider extends FutureProvider<List<dynamic>> {
  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  ///
  /// Copied from [savedFilesInSubDirectories].
  SavedFilesInSubDirectoriesProvider({
    required dynamic Function(Map<String, dynamic>) fromJson,
    required String folder,
    bool rebuildOnFileModification = true,
  }) : this._internal(
          (ref) => savedFilesInSubDirectories(
            ref as SavedFilesInSubDirectoriesRef,
            fromJson: fromJson,
            folder: folder,
            rebuildOnFileModification: rebuildOnFileModification,
          ),
          from: savedFilesInSubDirectoriesProvider,
          name: r'savedFilesInSubDirectoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savedFilesInSubDirectoriesHash,
          dependencies: SavedFilesInSubDirectoriesFamily._dependencies,
          allTransitiveDependencies:
              SavedFilesInSubDirectoriesFamily._allTransitiveDependencies,
          fromJson: fromJson,
          folder: folder,
          rebuildOnFileModification: rebuildOnFileModification,
        );

  SavedFilesInSubDirectoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fromJson,
    required this.folder,
    required this.rebuildOnFileModification,
  }) : super.internal();

  final dynamic Function(Map<String, dynamic>) fromJson;
  final String folder;
  final bool rebuildOnFileModification;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(SavedFilesInSubDirectoriesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavedFilesInSubDirectoriesProvider._internal(
        (ref) => create(ref as SavedFilesInSubDirectoriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fromJson: fromJson,
        folder: folder,
        rebuildOnFileModification: rebuildOnFileModification,
      ),
    );
  }

  @override
  FutureProviderElement<List<dynamic>> createElement() {
    return _SavedFilesInSubDirectoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavedFilesInSubDirectoriesProvider &&
        other.fromJson == fromJson &&
        other.folder == folder &&
        other.rebuildOnFileModification == rebuildOnFileModification;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fromJson.hashCode);
    hash = _SystemHash.combine(hash, folder.hashCode);
    hash = _SystemHash.combine(hash, rebuildOnFileModification.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SavedFilesInSubDirectoriesRef on FutureProviderRef<List<dynamic>> {
  /// The parameter `fromJson` of this provider.
  dynamic Function(Map<String, dynamic>) get fromJson;

  /// The parameter `folder` of this provider.
  String get folder;

  /// The parameter `rebuildOnFileModification` of this provider.
  bool get rebuildOnFileModification;
}

class _SavedFilesInSubDirectoriesProviderElement
    extends FutureProviderElement<List<dynamic>>
    with SavedFilesInSubDirectoriesRef {
  _SavedFilesInSubDirectoriesProviderElement(super.provider);

  @override
  dynamic Function(Map<String, dynamic>) get fromJson =>
      (origin as SavedFilesInSubDirectoriesProvider).fromJson;
  @override
  String get folder => (origin as SavedFilesInSubDirectoriesProvider).folder;
  @override
  bool get rebuildOnFileModification =>
      (origin as SavedFilesInSubDirectoriesProvider).rebuildOnFileModification;
}

String _$deleteJsonFromFileDirectoryHash() =>
    r'bb71b7567f602978f267b9ccc7583224f87028c7';

/// A provider for deleting the [fileName] in [folder] if it exists.
///
/// Copied from [deleteJsonFromFileDirectory].
@ProviderFor(deleteJsonFromFileDirectory)
const deleteJsonFromFileDirectoryProvider = DeleteJsonFromFileDirectoryFamily();

/// A provider for deleting the [fileName] in [folder] if it exists.
///
/// Copied from [deleteJsonFromFileDirectory].
class DeleteJsonFromFileDirectoryFamily extends Family<AsyncValue<void>> {
  /// A provider for deleting the [fileName] in [folder] if it exists.
  ///
  /// Copied from [deleteJsonFromFileDirectory].
  const DeleteJsonFromFileDirectoryFamily();

  /// A provider for deleting the [fileName] in [folder] if it exists.
  ///
  /// Copied from [deleteJsonFromFileDirectory].
  DeleteJsonFromFileDirectoryProvider call({
    required String fileName,
    required String folder,
  }) {
    return DeleteJsonFromFileDirectoryProvider(
      fileName: fileName,
      folder: folder,
    );
  }

  @override
  DeleteJsonFromFileDirectoryProvider getProviderOverride(
    covariant DeleteJsonFromFileDirectoryProvider provider,
  ) {
    return call(
      fileName: provider.fileName,
      folder: provider.folder,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteJsonFromFileDirectoryProvider';
}

/// A provider for deleting the [fileName] in [folder] if it exists.
///
/// Copied from [deleteJsonFromFileDirectory].
class DeleteJsonFromFileDirectoryProvider
    extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting the [fileName] in [folder] if it exists.
  ///
  /// Copied from [deleteJsonFromFileDirectory].
  DeleteJsonFromFileDirectoryProvider({
    required String fileName,
    required String folder,
  }) : this._internal(
          (ref) => deleteJsonFromFileDirectory(
            ref as DeleteJsonFromFileDirectoryRef,
            fileName: fileName,
            folder: folder,
          ),
          from: deleteJsonFromFileDirectoryProvider,
          name: r'deleteJsonFromFileDirectoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteJsonFromFileDirectoryHash,
          dependencies: DeleteJsonFromFileDirectoryFamily._dependencies,
          allTransitiveDependencies:
              DeleteJsonFromFileDirectoryFamily._allTransitiveDependencies,
          fileName: fileName,
          folder: folder,
        );

  DeleteJsonFromFileDirectoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileName,
    required this.folder,
  }) : super.internal();

  final String fileName;
  final String folder;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteJsonFromFileDirectoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteJsonFromFileDirectoryProvider._internal(
        (ref) => create(ref as DeleteJsonFromFileDirectoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileName: fileName,
        folder: folder,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteJsonFromFileDirectoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteJsonFromFileDirectoryProvider &&
        other.fileName == fileName &&
        other.folder == folder;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);
    hash = _SystemHash.combine(hash, folder.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteJsonFromFileDirectoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `fileName` of this provider.
  String get fileName;

  /// The parameter `folder` of this provider.
  String get folder;
}

class _DeleteJsonFromFileDirectoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteJsonFromFileDirectoryRef {
  _DeleteJsonFromFileDirectoryProviderElement(super.provider);

  @override
  String get fileName =>
      (origin as DeleteJsonFromFileDirectoryProvider).fileName;
  @override
  String get folder => (origin as DeleteJsonFromFileDirectoryProvider).folder;
}

String _$deleteDirectoryFromFileDirectoryHash() =>
    r'f5552dab7445ae257cc382d1dffa7a92e293d4ab';

/// A provider for deleting the [directoryName] in [folder] if it exists.
///
/// Copied from [deleteDirectoryFromFileDirectory].
@ProviderFor(deleteDirectoryFromFileDirectory)
const deleteDirectoryFromFileDirectoryProvider =
    DeleteDirectoryFromFileDirectoryFamily();

/// A provider for deleting the [directoryName] in [folder] if it exists.
///
/// Copied from [deleteDirectoryFromFileDirectory].
class DeleteDirectoryFromFileDirectoryFamily extends Family<AsyncValue<void>> {
  /// A provider for deleting the [directoryName] in [folder] if it exists.
  ///
  /// Copied from [deleteDirectoryFromFileDirectory].
  const DeleteDirectoryFromFileDirectoryFamily();

  /// A provider for deleting the [directoryName] in [folder] if it exists.
  ///
  /// Copied from [deleteDirectoryFromFileDirectory].
  DeleteDirectoryFromFileDirectoryProvider call({
    required String directoryName,
    required String folder,
  }) {
    return DeleteDirectoryFromFileDirectoryProvider(
      directoryName: directoryName,
      folder: folder,
    );
  }

  @override
  DeleteDirectoryFromFileDirectoryProvider getProviderOverride(
    covariant DeleteDirectoryFromFileDirectoryProvider provider,
  ) {
    return call(
      directoryName: provider.directoryName,
      folder: provider.folder,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteDirectoryFromFileDirectoryProvider';
}

/// A provider for deleting the [directoryName] in [folder] if it exists.
///
/// Copied from [deleteDirectoryFromFileDirectory].
class DeleteDirectoryFromFileDirectoryProvider
    extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting the [directoryName] in [folder] if it exists.
  ///
  /// Copied from [deleteDirectoryFromFileDirectory].
  DeleteDirectoryFromFileDirectoryProvider({
    required String directoryName,
    required String folder,
  }) : this._internal(
          (ref) => deleteDirectoryFromFileDirectory(
            ref as DeleteDirectoryFromFileDirectoryRef,
            directoryName: directoryName,
            folder: folder,
          ),
          from: deleteDirectoryFromFileDirectoryProvider,
          name: r'deleteDirectoryFromFileDirectoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteDirectoryFromFileDirectoryHash,
          dependencies: DeleteDirectoryFromFileDirectoryFamily._dependencies,
          allTransitiveDependencies:
              DeleteDirectoryFromFileDirectoryFamily._allTransitiveDependencies,
          directoryName: directoryName,
          folder: folder,
        );

  DeleteDirectoryFromFileDirectoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.directoryName,
    required this.folder,
  }) : super.internal();

  final String directoryName;
  final String folder;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteDirectoryFromFileDirectoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteDirectoryFromFileDirectoryProvider._internal(
        (ref) => create(ref as DeleteDirectoryFromFileDirectoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        directoryName: directoryName,
        folder: folder,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteDirectoryFromFileDirectoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteDirectoryFromFileDirectoryProvider &&
        other.directoryName == directoryName &&
        other.folder == folder;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, directoryName.hashCode);
    hash = _SystemHash.combine(hash, folder.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteDirectoryFromFileDirectoryRef
    on AutoDisposeFutureProviderRef<void> {
  /// The parameter `directoryName` of this provider.
  String get directoryName;

  /// The parameter `folder` of this provider.
  String get folder;
}

class _DeleteDirectoryFromFileDirectoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteDirectoryFromFileDirectoryRef {
  _DeleteDirectoryFromFileDirectoryProviderElement(super.provider);

  @override
  String get directoryName =>
      (origin as DeleteDirectoryFromFileDirectoryProvider).directoryName;
  @override
  String get folder =>
      (origin as DeleteDirectoryFromFileDirectoryProvider).folder;
}

String _$exportWholeFileDirectoryHash() =>
    r'9e02b4510fbb3b3cdce8d132e5eaabb89779a7bc';

/// A provider for exporting the whole file directory to a ZIP file.
///
/// Copied from [exportWholeFileDirectory].
@ProviderFor(exportWholeFileDirectory)
final exportWholeFileDirectoryProvider =
    AutoDisposeFutureProvider<void>.internal(
  exportWholeFileDirectory,
  name: r'exportWholeFileDirectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exportWholeFileDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExportWholeFileDirectoryRef = AutoDisposeFutureProviderRef<void>;
String _$exportAllHash() => r'cd62124dcce7c014ca145b5b5734d307beaca35a';

/// A provider for exporting all files in a [directory].
///
/// Copied from [exportAll].
@ProviderFor(exportAll)
const exportAllProvider = ExportAllFamily();

/// A provider for exporting all files in a [directory].
///
/// Copied from [exportAll].
class ExportAllFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting all files in a [directory].
  ///
  /// Copied from [exportAll].
  const ExportAllFamily();

  /// A provider for exporting all files in a [directory].
  ///
  /// Copied from [exportAll].
  ExportAllProvider call({
    required String directory,
    bool zip = true,
  }) {
    return ExportAllProvider(
      directory: directory,
      zip: zip,
    );
  }

  @override
  ExportAllProvider getProviderOverride(
    covariant ExportAllProvider provider,
  ) {
    return call(
      directory: provider.directory,
      zip: provider.zip,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportAllProvider';
}

/// A provider for exporting all files in a [directory].
///
/// Copied from [exportAll].
class ExportAllProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting all files in a [directory].
  ///
  /// Copied from [exportAll].
  ExportAllProvider({
    required String directory,
    bool zip = true,
  }) : this._internal(
          (ref) => exportAll(
            ref as ExportAllRef,
            directory: directory,
            zip: zip,
          ),
          from: exportAllProvider,
          name: r'exportAllProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportAllHash,
          dependencies: ExportAllFamily._dependencies,
          allTransitiveDependencies: ExportAllFamily._allTransitiveDependencies,
          directory: directory,
          zip: zip,
        );

  ExportAllProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.directory,
    required this.zip,
  }) : super.internal();

  final String directory;
  final bool zip;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportAllRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportAllProvider._internal(
        (ref) => create(ref as ExportAllRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        directory: directory,
        zip: zip,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportAllProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportAllProvider &&
        other.directory == directory &&
        other.zip == zip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, directory.hashCode);
    hash = _SystemHash.combine(hash, zip.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExportAllRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `directory` of this provider.
  String get directory;

  /// The parameter `zip` of this provider.
  bool get zip;
}

class _ExportAllProviderElement extends AutoDisposeFutureProviderElement<void>
    with ExportAllRef {
  _ExportAllProviderElement(super.provider);

  @override
  String get directory => (origin as ExportAllProvider).directory;
  @override
  bool get zip => (origin as ExportAllProvider).zip;
}

String _$importWholeFileDirectoryHash() =>
    r'649a6ce371c61fd52ea6aca6a9bf4690a32c3985';

/// A provider for importing all directory files from a zip file.
///
/// Copied from [importWholeFileDirectory].
@ProviderFor(importWholeFileDirectory)
final importWholeFileDirectoryProvider =
    AutoDisposeFutureProvider<void>.internal(
  importWholeFileDirectory,
  name: r'importWholeFileDirectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importWholeFileDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImportWholeFileDirectoryRef = AutoDisposeFutureProviderRef<void>;
String _$exportProgressHash() => r'e345b26f7fc97d563c9a80a694913ad2707efa8a';

/// A provider for the progress of the currently ongoing export, if there is
/// one.
///
/// Copied from [ExportProgress].
@ProviderFor(ExportProgress)
final exportProgressProvider =
    AutoDisposeNotifierProvider<ExportProgress, double?>.internal(
  ExportProgress.new,
  name: r'exportProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exportProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExportProgress = AutoDisposeNotifier<double?>;
String _$importProgressHash() => r'1449469df452e916f31da19b9df8d26ac2ffbf09';

/// A provider for the progress of the currently ongoing import, if there is
/// one.
///
/// Copied from [ImportProgress].
@ProviderFor(ImportProgress)
final importProgressProvider =
    AutoDisposeNotifierProvider<ImportProgress, double?>.internal(
  ImportProgress.new,
  name: r'importProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImportProgress = AutoDisposeNotifier<double?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
