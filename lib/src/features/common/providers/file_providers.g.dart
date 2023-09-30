// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileDirectoryHash() => r'370712d81a20524536eb63f1435bf3d3e5c1f48f';

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

typedef FileDirectoryRef = FutureProviderRef<Directory>;
String _$directorySizeHash() => r'337aa83b96d3e5f675df8befcf5d3ec4f8d021ab';

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

String _$directoryDeleteHash() => r'4edeb463982ed4a2a40857cabf18a243b469514a';

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
    r'910d2132310ef50265a607a6e3c5a3d63c592ffc';

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
  }) {
    return SaveJsonToFileDirectoryProvider(
      object: object,
      fileName: fileName,
      folder: folder,
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
  }) : this._internal(
          (ref) => saveJsonToFileDirectory(
            ref as SaveJsonToFileDirectoryRef,
            object: object,
            fileName: fileName,
            folder: folder,
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
  }) : super.internal();

  final dynamic object;
  final String fileName;
  final String folder;

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
        other.folder == folder;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, object.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);
    hash = _SystemHash.combine(hash, folder.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveJsonToFileDirectoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `object` of this provider.
  dynamic get object;

  /// The parameter `fileName` of this provider.
  String get fileName;

  /// The parameter `folder` of this provider.
  String get folder;
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
}

String _$savedFilesHash() => r'09342e8c9d2156cd992f84acbf176df2a873446e';

/// A provider for reading and holding all the saved equipment setups in the
/// user file directory.
///
/// Copied from [savedFiles].
@ProviderFor(savedFiles)
const savedFilesProvider = SavedFilesFamily();

/// A provider for reading and holding all the saved equipment setups in the
/// user file directory.
///
/// Copied from [savedFiles].
class SavedFilesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// A provider for reading and holding all the saved equipment setups in the
  /// user file directory.
  ///
  /// Copied from [savedFiles].
  const SavedFilesFamily();

  /// A provider for reading and holding all the saved equipment setups in the
  /// user file directory.
  ///
  /// Copied from [savedFiles].
  SavedFilesProvider call({
    required dynamic Function(Map<String, dynamic>) fromJson,
    required String folder,
  }) {
    return SavedFilesProvider(
      fromJson: fromJson,
      folder: folder,
    );
  }

  @override
  SavedFilesProvider getProviderOverride(
    covariant SavedFilesProvider provider,
  ) {
    return call(
      fromJson: provider.fromJson,
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
  String? get name => r'savedFilesProvider';
}

/// A provider for reading and holding all the saved equipment setups in the
/// user file directory.
///
/// Copied from [savedFiles].
class SavedFilesProvider extends FutureProvider<List<dynamic>> {
  /// A provider for reading and holding all the saved equipment setups in the
  /// user file directory.
  ///
  /// Copied from [savedFiles].
  SavedFilesProvider({
    required dynamic Function(Map<String, dynamic>) fromJson,
    required String folder,
  }) : this._internal(
          (ref) => savedFiles(
            ref as SavedFilesRef,
            fromJson: fromJson,
            folder: folder,
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
  }) : super.internal();

  final dynamic Function(Map<String, dynamic>) fromJson;
  final String folder;

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
        other.folder == folder;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fromJson.hashCode);
    hash = _SystemHash.combine(hash, folder.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SavedFilesRef on FutureProviderRef<List<dynamic>> {
  /// The parameter `fromJson` of this provider.
  dynamic Function(Map<String, dynamic>) get fromJson;

  /// The parameter `folder` of this provider.
  String get folder;
}

class _SavedFilesProviderElement extends FutureProviderElement<List<dynamic>>
    with SavedFilesRef {
  _SavedFilesProviderElement(super.provider);

  @override
  dynamic Function(Map<String, dynamic>) get fromJson =>
      (origin as SavedFilesProvider).fromJson;
  @override
  String get folder => (origin as SavedFilesProvider).folder;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
