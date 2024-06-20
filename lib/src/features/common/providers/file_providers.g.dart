// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileDirectoryHash() => r'0d7bbbb97993af78abe5df58d8a641a45423d458';

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
    r'ac389047f30dd98e9fb4f0695a7ea38ef7299fa8';

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

  @visibleForOverriding
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
    super.create, {
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
        subFolder: subFolder,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  ({
    dynamic object,
    String fileName,
    String folder,
    String? subFolder,
    bool downloadIfWeb,
  }) get argument {
    return (
      object: object,
      fileName: fileName,
      folder: folder,
      subFolder: subFolder,
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
      subFolder: subFolder,
      downloadIfWeb: downloadIfWeb,
    );
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
    r'87eec3dc92ce76fdeab0ae702ef31a17c31578f4';

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
class ExportJsonToFileDirectoryFamily extends Family {
  /// A provider for saving [object] to [fileName].json to a file in the [folder]
  /// in the file drectory.
  ///
  /// Caution: Expects [object] to have a .toJson() method implemented.
  ///
  /// Copied from [exportJsonToFileDirectory].
  const ExportJsonToFileDirectoryFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportJsonToFileDirectoryProvider';

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

  @visibleForOverriding
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

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(ExportJsonToFileDirectoryRef ref) create) {
    return _$ExportJsonToFileDirectoryFamilyOverride(this, create);
  }
}

class _$ExportJsonToFileDirectoryFamilyOverride implements FamilyOverride {
  _$ExportJsonToFileDirectoryFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportJsonToFileDirectoryRef ref) create;

  @override
  final ExportJsonToFileDirectoryFamily overriddenFamily;

  @override
  ExportJsonToFileDirectoryProvider getProviderOverride(
    covariant ExportJsonToFileDirectoryProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(ExportJsonToFileDirectoryRef ref) create,
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
  ({
    dynamic object,
    String fileName,
    String? folder,
    String? subFolder,
    bool downloadIfWeb,
  }) get argument {
    return (
      object: object,
      fileName: fileName,
      folder: folder,
      subFolder: subFolder,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportJsonToFileDirectoryProviderElement(this);
  }

  ExportJsonToFileDirectoryProvider _copyWith(
    FutureOr<void> Function(ExportJsonToFileDirectoryRef ref) create,
  ) {
    return ExportJsonToFileDirectoryProvider._internal(
      (ref) => create(ref as ExportJsonToFileDirectoryRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      object: object,
      fileName: fileName,
      folder: folder,
      subFolder: subFolder,
      downloadIfWeb: downloadIfWeb,
    );
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

String _$savedFilesHash() => r'54d5b11822d84068f845c5895ba0a8c59d82cfd1';

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
class SavedFilesFamily extends Family {
  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
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

  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  ///
  /// Copied from [savedFiles].
  SavedFilesProvider call({
    required dynamic Function(Map<String, dynamic> json) fromJson,
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

  @visibleForOverriding
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
    required dynamic Function(Map<String, dynamic> json) fromJson,
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
    super.create, {
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

  final dynamic Function(Map<String, dynamic> json) fromJson;
  final String folder;
  final bool rebuildOnFileModification;
  final bool elementsInSubFolders;

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
        rebuildOnFileModification: rebuildOnFileModification,
        elementsInSubFolders: elementsInSubFolders,
      ),
    );
  }

  @override
  ({
    dynamic Function(Map<String, dynamic> json) fromJson,
    String folder,
    bool rebuildOnFileModification,
    bool elementsInSubFolders,
  }) get argument {
    return (
      fromJson: fromJson,
      folder: folder,
      rebuildOnFileModification: rebuildOnFileModification,
      elementsInSubFolders: elementsInSubFolders,
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
      rebuildOnFileModification: rebuildOnFileModification,
      elementsInSubFolders: elementsInSubFolders,
    );
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

mixin SavedFilesRef on FutureProviderRef<List<dynamic>> {
  /// The parameter `fromJson` of this provider.
  dynamic Function(Map<String, dynamic> json) get fromJson;

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
  dynamic Function(Map<String, dynamic> json) get fromJson =>
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
    r'14160093fe72b8a4c90f450f01154789f8743b73';

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
class SavedFilesInSubDirectoriesFamily extends Family {
  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  ///
  /// Copied from [savedFilesInSubDirectories].
  const SavedFilesInSubDirectoriesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savedFilesInSubDirectoriesProvider';

  /// A provider for reading and holding all the saved objects of
  /// the given type in the in the user file directory.
  ///
  /// Copied from [savedFilesInSubDirectories].
  SavedFilesInSubDirectoriesProvider call({
    required dynamic Function(Map<String, dynamic> json) fromJson,
    required String folder,
    bool rebuildOnFileModification = true,
  }) {
    return SavedFilesInSubDirectoriesProvider(
      fromJson: fromJson,
      folder: folder,
      rebuildOnFileModification: rebuildOnFileModification,
    );
  }

  @visibleForOverriding
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

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<dynamic>> Function(SavedFilesInSubDirectoriesRef ref)
          create) {
    return _$SavedFilesInSubDirectoriesFamilyOverride(this, create);
  }
}

class _$SavedFilesInSubDirectoriesFamilyOverride implements FamilyOverride {
  _$SavedFilesInSubDirectoriesFamilyOverride(
      this.overriddenFamily, this.create);

  final FutureOr<List<dynamic>> Function(SavedFilesInSubDirectoriesRef ref)
      create;

  @override
  final SavedFilesInSubDirectoriesFamily overriddenFamily;

  @override
  SavedFilesInSubDirectoriesProvider getProviderOverride(
    covariant SavedFilesInSubDirectoriesProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    required dynamic Function(Map<String, dynamic> json) fromJson,
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
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fromJson,
    required this.folder,
    required this.rebuildOnFileModification,
  }) : super.internal();

  final dynamic Function(Map<String, dynamic> json) fromJson;
  final String folder;
  final bool rebuildOnFileModification;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(SavedFilesInSubDirectoriesRef ref) create,
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
  ({
    dynamic Function(Map<String, dynamic> json) fromJson,
    String folder,
    bool rebuildOnFileModification,
  }) get argument {
    return (
      fromJson: fromJson,
      folder: folder,
      rebuildOnFileModification: rebuildOnFileModification,
    );
  }

  @override
  FutureProviderElement<List<dynamic>> createElement() {
    return _SavedFilesInSubDirectoriesProviderElement(this);
  }

  SavedFilesInSubDirectoriesProvider _copyWith(
    FutureOr<List<dynamic>> Function(SavedFilesInSubDirectoriesRef ref) create,
  ) {
    return SavedFilesInSubDirectoriesProvider._internal(
      (ref) => create(ref as SavedFilesInSubDirectoriesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      fromJson: fromJson,
      folder: folder,
      rebuildOnFileModification: rebuildOnFileModification,
    );
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

mixin SavedFilesInSubDirectoriesRef on FutureProviderRef<List<dynamic>> {
  /// The parameter `fromJson` of this provider.
  dynamic Function(Map<String, dynamic> json) get fromJson;

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
  dynamic Function(Map<String, dynamic> json) get fromJson =>
      (origin as SavedFilesInSubDirectoriesProvider).fromJson;
  @override
  String get folder => (origin as SavedFilesInSubDirectoriesProvider).folder;
  @override
  bool get rebuildOnFileModification =>
      (origin as SavedFilesInSubDirectoriesProvider).rebuildOnFileModification;
}

String _$deleteJsonFromFileDirectoryHash() =>
    r'232132d19d72be35fafdf8448f51a80d80cdac8d';

/// A provider for deleting the [fileName] in [folder] if it exists.
///
/// Copied from [deleteJsonFromFileDirectory].
@ProviderFor(deleteJsonFromFileDirectory)
const deleteJsonFromFileDirectoryProvider = DeleteJsonFromFileDirectoryFamily();

/// A provider for deleting the [fileName] in [folder] if it exists.
///
/// Copied from [deleteJsonFromFileDirectory].
class DeleteJsonFromFileDirectoryFamily extends Family {
  /// A provider for deleting the [fileName] in [folder] if it exists.
  ///
  /// Copied from [deleteJsonFromFileDirectory].
  const DeleteJsonFromFileDirectoryFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteJsonFromFileDirectoryProvider';

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

  @visibleForOverriding
  @override
  DeleteJsonFromFileDirectoryProvider getProviderOverride(
    covariant DeleteJsonFromFileDirectoryProvider provider,
  ) {
    return call(
      fileName: provider.fileName,
      folder: provider.folder,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(DeleteJsonFromFileDirectoryRef ref) create) {
    return _$DeleteJsonFromFileDirectoryFamilyOverride(this, create);
  }
}

class _$DeleteJsonFromFileDirectoryFamilyOverride implements FamilyOverride {
  _$DeleteJsonFromFileDirectoryFamilyOverride(
      this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeleteJsonFromFileDirectoryRef ref) create;

  @override
  final DeleteJsonFromFileDirectoryFamily overriddenFamily;

  @override
  DeleteJsonFromFileDirectoryProvider getProviderOverride(
    covariant DeleteJsonFromFileDirectoryProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(DeleteJsonFromFileDirectoryRef ref) create,
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
  ({
    String fileName,
    String folder,
  }) get argument {
    return (
      fileName: fileName,
      folder: folder,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteJsonFromFileDirectoryProviderElement(this);
  }

  DeleteJsonFromFileDirectoryProvider _copyWith(
    FutureOr<void> Function(DeleteJsonFromFileDirectoryRef ref) create,
  ) {
    return DeleteJsonFromFileDirectoryProvider._internal(
      (ref) => create(ref as DeleteJsonFromFileDirectoryRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      fileName: fileName,
      folder: folder,
    );
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
    r'1d899567355ef22cd0559c86a0497fe8fba8448f';

/// A provider for deleting the [directoryName] in [folder] if it exists.
///
/// Copied from [deleteDirectoryFromFileDirectory].
@ProviderFor(deleteDirectoryFromFileDirectory)
const deleteDirectoryFromFileDirectoryProvider =
    DeleteDirectoryFromFileDirectoryFamily();

/// A provider for deleting the [directoryName] in [folder] if it exists.
///
/// Copied from [deleteDirectoryFromFileDirectory].
class DeleteDirectoryFromFileDirectoryFamily extends Family {
  /// A provider for deleting the [directoryName] in [folder] if it exists.
  ///
  /// Copied from [deleteDirectoryFromFileDirectory].
  const DeleteDirectoryFromFileDirectoryFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteDirectoryFromFileDirectoryProvider';

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

  @visibleForOverriding
  @override
  DeleteDirectoryFromFileDirectoryProvider getProviderOverride(
    covariant DeleteDirectoryFromFileDirectoryProvider provider,
  ) {
    return call(
      directoryName: provider.directoryName,
      folder: provider.folder,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(DeleteDirectoryFromFileDirectoryRef ref) create) {
    return _$DeleteDirectoryFromFileDirectoryFamilyOverride(this, create);
  }
}

class _$DeleteDirectoryFromFileDirectoryFamilyOverride
    implements FamilyOverride {
  _$DeleteDirectoryFromFileDirectoryFamilyOverride(
      this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeleteDirectoryFromFileDirectoryRef ref) create;

  @override
  final DeleteDirectoryFromFileDirectoryFamily overriddenFamily;

  @override
  DeleteDirectoryFromFileDirectoryProvider getProviderOverride(
    covariant DeleteDirectoryFromFileDirectoryProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(DeleteDirectoryFromFileDirectoryRef ref) create,
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
  ({
    String directoryName,
    String folder,
  }) get argument {
    return (
      directoryName: directoryName,
      folder: folder,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteDirectoryFromFileDirectoryProviderElement(this);
  }

  DeleteDirectoryFromFileDirectoryProvider _copyWith(
    FutureOr<void> Function(DeleteDirectoryFromFileDirectoryRef ref) create,
  ) {
    return DeleteDirectoryFromFileDirectoryProvider._internal(
      (ref) => create(ref as DeleteDirectoryFromFileDirectoryRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      directoryName: directoryName,
      folder: folder,
    );
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
    r'a2b987f5d594154c8f308b95ad8f3c78f5f2af3f';

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

typedef ExportWholeFileDirectoryRef = AutoDisposeFutureProviderRef<void>;
String _$exportAllHash() => r'8be8c125bd85c4728942cd2feb4b43ad3f2fc3b8';

/// A provider for exporting all files in a [directory].
///
/// Copied from [exportAll].
@ProviderFor(exportAll)
const exportAllProvider = ExportAllFamily();

/// A provider for exporting all files in a [directory].
///
/// Copied from [exportAll].
class ExportAllFamily extends Family {
  /// A provider for exporting all files in a [directory].
  ///
  /// Copied from [exportAll].
  const ExportAllFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportAllProvider';

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

  @visibleForOverriding
  @override
  ExportAllProvider getProviderOverride(
    covariant ExportAllProvider provider,
  ) {
    return call(
      directory: provider.directory,
      zip: provider.zip,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(ExportAllRef ref) create) {
    return _$ExportAllFamilyOverride(this, create);
  }
}

class _$ExportAllFamilyOverride implements FamilyOverride {
  _$ExportAllFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportAllRef ref) create;

  @override
  final ExportAllFamily overriddenFamily;

  @override
  ExportAllProvider getProviderOverride(
    covariant ExportAllProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    super.create, {
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
    FutureOr<void> Function(ExportAllRef ref) create,
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
  ({
    String directory,
    bool zip,
  }) get argument {
    return (
      directory: directory,
      zip: zip,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportAllProviderElement(this);
  }

  ExportAllProvider _copyWith(
    FutureOr<void> Function(ExportAllRef ref) create,
  ) {
    return ExportAllProvider._internal(
      (ref) => create(ref as ExportAllRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      directory: directory,
      zip: zip,
    );
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
