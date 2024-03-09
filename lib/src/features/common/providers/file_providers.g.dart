// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileDirectoryHash() => r'e6a3328b4716ad17d353e807dafbdc48ff31f5f1';

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
class DirectorySizeFamily extends Family {
  /// A provider for finding the size of the [Directory] at [path].
  ///
  /// Returns the size in number of bytes.
  ///
  /// Copied from [directorySize].
  const DirectorySizeFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'directorySizeProvider';

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

  @visibleForOverriding
  @override
  DirectorySizeProvider getProviderOverride(
    covariant DirectorySizeProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<int?> Function(DirectorySizeRef ref) create) {
    return _$DirectorySizeFamilyOverride(this, create);
  }
}

class _$DirectorySizeFamilyOverride implements FamilyOverride {
  _$DirectorySizeFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<int?> Function(DirectorySizeRef ref) create;

  @override
  final DirectorySizeFamily overriddenFamily;

  @override
  DirectorySizeProvider getProviderOverride(
    covariant DirectorySizeProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<int?> Function(DirectorySizeRef ref) create,
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
  (String,) get argument {
    return (path,);
  }

  @override
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _DirectorySizeProviderElement(this);
  }

  DirectorySizeProvider _copyWith(
    FutureOr<int?> Function(DirectorySizeRef ref) create,
  ) {
    return DirectorySizeProvider._internal(
      (ref) => create(ref as DirectorySizeRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      path: path,
    );
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

String _$directoryDeleteHash() => r'9c1a9cb0b2160ab903903f0d0a22cd7fb12de594';

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
class DirectoryDeleteFamily extends Family {
  /// A provider for deleting the [Directory] at [path].
  ///
  /// Returns true if the directory no longer exists.
  ///
  /// Copied from [directoryDelete].
  const DirectoryDeleteFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'directoryDeleteProvider';

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

  @visibleForOverriding
  @override
  DirectoryDeleteProvider getProviderOverride(
    covariant DirectoryDeleteProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<bool> Function(DirectoryDeleteRef ref) create) {
    return _$DirectoryDeleteFamilyOverride(this, create);
  }
}

class _$DirectoryDeleteFamilyOverride implements FamilyOverride {
  _$DirectoryDeleteFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<bool> Function(DirectoryDeleteRef ref) create;

  @override
  final DirectoryDeleteFamily overriddenFamily;

  @override
  DirectoryDeleteProvider getProviderOverride(
    covariant DirectoryDeleteProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<bool> Function(DirectoryDeleteRef ref) create,
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
  (String,) get argument {
    return (path,);
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DirectoryDeleteProviderElement(this);
  }

  DirectoryDeleteProvider _copyWith(
    FutureOr<bool> Function(DirectoryDeleteRef ref) create,
  ) {
    return DirectoryDeleteProvider._internal(
      (ref) => create(ref as DirectoryDeleteRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      path: path,
    );
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
    r'f4787147bf67151da720df31581f3bb98e3708f3';

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
class SaveJsonToFileDirectoryFamily extends Family {
  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  ///
  /// Copied from [saveJsonToFileDirectory].
  const SaveJsonToFileDirectoryFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveJsonToFileDirectoryProvider';

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
    bool downloadIfWeb = false,
  }) {
    return SaveJsonToFileDirectoryProvider(
      object: object,
      fileName: fileName,
      folder: folder,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  SaveJsonToFileDirectoryProvider getProviderOverride(
    covariant SaveJsonToFileDirectoryProvider provider,
  ) {
    return call(
      object: provider.object,
      fileName: provider.fileName,
      folder: provider.folder,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(SaveJsonToFileDirectoryRef ref) create) {
    return _$SaveJsonToFileDirectoryFamilyOverride(this, create);
  }
}

class _$SaveJsonToFileDirectoryFamilyOverride implements FamilyOverride {
  _$SaveJsonToFileDirectoryFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(SaveJsonToFileDirectoryRef ref) create;

  @override
  final SaveJsonToFileDirectoryFamily overriddenFamily;

  @override
  SaveJsonToFileDirectoryProvider getProviderOverride(
    covariant SaveJsonToFileDirectoryProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => saveJsonToFileDirectory(
            ref as SaveJsonToFileDirectoryRef,
            object: object,
            fileName: fileName,
            folder: folder,
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
          downloadIfWeb: downloadIfWeb,
        );

  SaveJsonToFileDirectoryProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.object,
    required this.fileName,
    required this.folder,
    required this.downloadIfWeb,
  }) : super.internal();

  final dynamic object;
  final String fileName;
  final String folder;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveJsonToFileDirectoryRef ref) create,
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
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  ({
    dynamic object,
    String fileName,
    String folder,
    bool downloadIfWeb,
  }) get argument {
    return (
      object: object,
      fileName: fileName,
      folder: folder,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveJsonToFileDirectoryProviderElement(this);
  }

  SaveJsonToFileDirectoryProvider _copyWith(
    FutureOr<void> Function(SaveJsonToFileDirectoryRef ref) create,
  ) {
    return SaveJsonToFileDirectoryProvider._internal(
      (ref) => create(ref as SaveJsonToFileDirectoryRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      object: object,
      fileName: fileName,
      folder: folder,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveJsonToFileDirectoryProvider &&
        other.object == object &&
        other.fileName == fileName &&
        other.folder == folder &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, object.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);
    hash = _SystemHash.combine(hash, folder.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

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
  bool get downloadIfWeb =>
      (origin as SaveJsonToFileDirectoryProvider).downloadIfWeb;
}

String _$savedFilesHash() => r'ed8d314141f69b478fc607bcad51cb63977ab752';

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
class SavedFilesFamily extends Family {
  /// A provider for reading and holding all the saved equipment setups in the
  /// user file directory.
  ///
  /// Copied from [savedFiles].
  const SavedFilesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savedFilesProvider';

  /// A provider for reading and holding all the saved equipment setups in the
  /// user file directory.
  ///
  /// Copied from [savedFiles].
  SavedFilesProvider call({
    required dynamic Function(Map<String, dynamic> json) fromJson,
    required String folder,
  }) {
    return SavedFilesProvider(
      fromJson: fromJson,
      folder: folder,
    );
  }

  @visibleForOverriding
  @override
  SavedFilesProvider getProviderOverride(
    covariant SavedFilesProvider provider,
  ) {
    return call(
      fromJson: provider.fromJson,
      folder: provider.folder,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<dynamic>> Function(SavedFilesRef ref) create) {
    return _$SavedFilesFamilyOverride(this, create);
  }
}

class _$SavedFilesFamilyOverride implements FamilyOverride {
  _$SavedFilesFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<dynamic>> Function(SavedFilesRef ref) create;

  @override
  final SavedFilesFamily overriddenFamily;

  @override
  SavedFilesProvider getProviderOverride(
    covariant SavedFilesProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    required dynamic Function(Map<String, dynamic> json) fromJson,
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
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fromJson,
    required this.folder,
  }) : super.internal();

  final dynamic Function(Map<String, dynamic> json) fromJson;
  final String folder;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(SavedFilesRef ref) create,
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
  ({
    dynamic Function(Map<String, dynamic> json) fromJson,
    String folder,
  }) get argument {
    return (
      fromJson: fromJson,
      folder: folder,
    );
  }

  @override
  FutureProviderElement<List<dynamic>> createElement() {
    return _SavedFilesProviderElement(this);
  }

  SavedFilesProvider _copyWith(
    FutureOr<List<dynamic>> Function(SavedFilesRef ref) create,
  ) {
    return SavedFilesProvider._internal(
      (ref) => create(ref as SavedFilesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      fromJson: fromJson,
      folder: folder,
    );
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
  dynamic Function(Map<String, dynamic> json) get fromJson;

  /// The parameter `folder` of this provider.
  String get folder;
}

class _SavedFilesProviderElement extends FutureProviderElement<List<dynamic>>
    with SavedFilesRef {
  _SavedFilesProviderElement(super.provider);

  @override
  dynamic Function(Map<String, dynamic> json) get fromJson =>
      (origin as SavedFilesProvider).fromJson;
  @override
  String get folder => (origin as SavedFilesProvider).folder;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
