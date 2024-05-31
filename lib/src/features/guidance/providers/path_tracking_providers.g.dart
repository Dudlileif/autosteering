// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_tracking_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pathTrackingPerpendicularDistanceHash() =>
    r'84c59cac95e6c209f1abd2aab04b2d1dba6fda3f';

/// A provider for the perpendicular distance from the [DisplayPathTracking]
/// line to the [MainVehicle].
///
/// Copied from [pathTrackingPerpendicularDistance].
@ProviderFor(pathTrackingPerpendicularDistance)
final pathTrackingPerpendicularDistanceProvider =
    AutoDisposeProvider<double?>.internal(
  pathTrackingPerpendicularDistance,
  name: r'pathTrackingPerpendicularDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathTrackingPerpendicularDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PathTrackingPerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$loadPathTrackingFromFileHash() =>
    r'be456a58dd91cd51413f56ed289d82119233662e';

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

/// A provider for loading an [PathTracking] from a file at [path], if it's
/// valid.
///
/// Copied from [loadPathTrackingFromFile].
@ProviderFor(loadPathTrackingFromFile)
const loadPathTrackingFromFileProvider = LoadPathTrackingFromFileFamily();

/// A provider for loading an [PathTracking] from a file at [path], if it's
/// valid.
///
/// Copied from [loadPathTrackingFromFile].
class LoadPathTrackingFromFileFamily extends Family {
  /// A provider for loading an [PathTracking] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadPathTrackingFromFile].
  const LoadPathTrackingFromFileFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadPathTrackingFromFileProvider';

  /// A provider for loading an [PathTracking] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadPathTrackingFromFile].
  LoadPathTrackingFromFileProvider call(
    String path,
  ) {
    return LoadPathTrackingFromFileProvider(
      path,
    );
  }

  @visibleForOverriding
  @override
  LoadPathTrackingFromFileProvider getProviderOverride(
    covariant LoadPathTrackingFromFileProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<PathTracking?> Function(LoadPathTrackingFromFileRef ref)
          create) {
    return _$LoadPathTrackingFromFileFamilyOverride(this, create);
  }
}

class _$LoadPathTrackingFromFileFamilyOverride implements FamilyOverride {
  _$LoadPathTrackingFromFileFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<PathTracking?> Function(LoadPathTrackingFromFileRef ref)
      create;

  @override
  final LoadPathTrackingFromFileFamily overriddenFamily;

  @override
  LoadPathTrackingFromFileProvider getProviderOverride(
    covariant LoadPathTrackingFromFileProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for loading an [PathTracking] from a file at [path], if it's
/// valid.
///
/// Copied from [loadPathTrackingFromFile].
class LoadPathTrackingFromFileProvider
    extends AutoDisposeFutureProvider<PathTracking?> {
  /// A provider for loading an [PathTracking] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadPathTrackingFromFile].
  LoadPathTrackingFromFileProvider(
    String path,
  ) : this._internal(
          (ref) => loadPathTrackingFromFile(
            ref as LoadPathTrackingFromFileRef,
            path,
          ),
          from: loadPathTrackingFromFileProvider,
          name: r'loadPathTrackingFromFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadPathTrackingFromFileHash,
          dependencies: LoadPathTrackingFromFileFamily._dependencies,
          allTransitiveDependencies:
              LoadPathTrackingFromFileFamily._allTransitiveDependencies,
          path: path,
        );

  LoadPathTrackingFromFileProvider._internal(
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
    FutureOr<PathTracking?> Function(LoadPathTrackingFromFileRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadPathTrackingFromFileProvider._internal(
        (ref) => create(ref as LoadPathTrackingFromFileRef),
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
  AutoDisposeFutureProviderElement<PathTracking?> createElement() {
    return _LoadPathTrackingFromFileProviderElement(this);
  }

  LoadPathTrackingFromFileProvider _copyWith(
    FutureOr<PathTracking?> Function(LoadPathTrackingFromFileRef ref) create,
  ) {
    return LoadPathTrackingFromFileProvider._internal(
      (ref) => create(ref as LoadPathTrackingFromFileRef),
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
    return other is LoadPathTrackingFromFileProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadPathTrackingFromFileRef
    on AutoDisposeFutureProviderRef<PathTracking?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _LoadPathTrackingFromFileProviderElement
    extends AutoDisposeFutureProviderElement<PathTracking?>
    with LoadPathTrackingFromFileRef {
  _LoadPathTrackingFromFileProviderElement(super.provider);

  @override
  String get path => (origin as LoadPathTrackingFromFileProvider).path;
}

String _$savePathTrackingHash() => r'26b1d1c135d54f119ae27fca98ba9916c9fe7f03';

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [savePathTracking].
@ProviderFor(savePathTracking)
const savePathTrackingProvider = SavePathTrackingFamily();

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [savePathTracking].
class SavePathTrackingFamily extends Family {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [savePathTracking].
  const SavePathTrackingFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savePathTrackingProvider';

  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [savePathTracking].
  SavePathTrackingProvider call(
    PathTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return SavePathTrackingProvider(
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  SavePathTrackingProvider getProviderOverride(
    covariant SavePathTrackingProvider provider,
  ) {
    return call(
      provider.tracking,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(SavePathTrackingRef ref) create) {
    return _$SavePathTrackingFamilyOverride(this, create);
  }
}

class _$SavePathTrackingFamilyOverride implements FamilyOverride {
  _$SavePathTrackingFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(SavePathTrackingRef ref) create;

  @override
  final SavePathTrackingFamily overriddenFamily;

  @override
  SavePathTrackingProvider getProviderOverride(
    covariant SavePathTrackingProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [savePathTracking].
class SavePathTrackingProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [savePathTracking].
  SavePathTrackingProvider(
    PathTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => savePathTracking(
            ref as SavePathTrackingRef,
            tracking,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: savePathTrackingProvider,
          name: r'savePathTrackingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savePathTrackingHash,
          dependencies: SavePathTrackingFamily._dependencies,
          allTransitiveDependencies:
              SavePathTrackingFamily._allTransitiveDependencies,
          tracking: tracking,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  SavePathTrackingProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tracking,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final PathTracking tracking;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SavePathTrackingRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavePathTrackingProvider._internal(
        (ref) => create(ref as SavePathTrackingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tracking: tracking,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    PathTracking, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SavePathTrackingProviderElement(this);
  }

  SavePathTrackingProvider _copyWith(
    FutureOr<void> Function(SavePathTrackingRef ref) create,
  ) {
    return SavePathTrackingProvider._internal(
      (ref) => create(ref as SavePathTrackingRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      tracking: tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SavePathTrackingProvider &&
        other.tracking == tracking &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tracking.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SavePathTrackingRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `tracking` of this provider.
  PathTracking get tracking;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SavePathTrackingProviderElement
    extends AutoDisposeFutureProviderElement<void> with SavePathTrackingRef {
  _SavePathTrackingProviderElement(super.provider);

  @override
  PathTracking get tracking => (origin as SavePathTrackingProvider).tracking;
  @override
  String? get overrideName => (origin as SavePathTrackingProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as SavePathTrackingProvider).downloadIfWeb;
}

String _$exportPathTrackingHash() =>
    r'7e5e84fa9ce850e02779f4ac7bc99d871455b017';

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportPathTracking].
@ProviderFor(exportPathTracking)
const exportPathTrackingProvider = ExportPathTrackingFamily();

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportPathTracking].
class ExportPathTrackingFamily extends Family {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportPathTracking].
  const ExportPathTrackingFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportPathTrackingProvider';

  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportPathTracking].
  ExportPathTrackingProvider call(
    PathTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return ExportPathTrackingProvider(
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  ExportPathTrackingProvider getProviderOverride(
    covariant ExportPathTrackingProvider provider,
  ) {
    return call(
      provider.tracking,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(ExportPathTrackingRef ref) create) {
    return _$ExportPathTrackingFamilyOverride(this, create);
  }
}

class _$ExportPathTrackingFamilyOverride implements FamilyOverride {
  _$ExportPathTrackingFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportPathTrackingRef ref) create;

  @override
  final ExportPathTrackingFamily overriddenFamily;

  @override
  ExportPathTrackingProvider getProviderOverride(
    covariant ExportPathTrackingProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportPathTracking].
class ExportPathTrackingProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportPathTracking].
  ExportPathTrackingProvider(
    PathTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => exportPathTracking(
            ref as ExportPathTrackingRef,
            tracking,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: exportPathTrackingProvider,
          name: r'exportPathTrackingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportPathTrackingHash,
          dependencies: ExportPathTrackingFamily._dependencies,
          allTransitiveDependencies:
              ExportPathTrackingFamily._allTransitiveDependencies,
          tracking: tracking,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  ExportPathTrackingProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tracking,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final PathTracking tracking;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportPathTrackingRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportPathTrackingProvider._internal(
        (ref) => create(ref as ExportPathTrackingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tracking: tracking,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    PathTracking, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportPathTrackingProviderElement(this);
  }

  ExportPathTrackingProvider _copyWith(
    FutureOr<void> Function(ExportPathTrackingRef ref) create,
  ) {
    return ExportPathTrackingProvider._internal(
      (ref) => create(ref as ExportPathTrackingRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      tracking: tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportPathTrackingProvider &&
        other.tracking == tracking &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tracking.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExportPathTrackingRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `tracking` of this provider.
  PathTracking get tracking;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _ExportPathTrackingProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportPathTrackingRef {
  _ExportPathTrackingProviderElement(super.provider);

  @override
  PathTracking get tracking => (origin as ExportPathTrackingProvider).tracking;
  @override
  String? get overrideName =>
      (origin as ExportPathTrackingProvider).overrideName;
  @override
  bool get downloadIfWeb =>
      (origin as ExportPathTrackingProvider).downloadIfWeb;
}

String _$savedPathTrackingsHash() =>
    r'33bdc3da0be34077a6d0af5f33320caa5c175741';

/// A provider for reading and holding all the saved [PathTracking] in the
/// user file directory.
///
/// Copied from [savedPathTrackings].
@ProviderFor(savedPathTrackings)
final savedPathTrackingsProvider = FutureProvider<List<PathTracking>>.internal(
  savedPathTrackings,
  name: r'savedPathTrackingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedPathTrackingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedPathTrackingsRef = FutureProviderRef<List<PathTracking>>;
String _$deletePathTrackingHash() =>
    r'1df82e0b05cbe20dbd51320edb60dbefefbf191b';

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].
///
/// Copied from [deletePathTracking].
@ProviderFor(deletePathTracking)
const deletePathTrackingProvider = DeletePathTrackingFamily();

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].
///
/// Copied from [deletePathTracking].
class DeletePathTrackingFamily extends Family {
  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deletePathTracking].
  const DeletePathTrackingFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deletePathTrackingProvider';

  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deletePathTracking].
  DeletePathTrackingProvider call(
    PathTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) {
    return DeletePathTrackingProvider(
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  DeletePathTrackingProvider getProviderOverride(
    covariant DeletePathTrackingProvider provider,
  ) {
    return call(
      provider.tracking,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(DeletePathTrackingRef ref) create) {
    return _$DeletePathTrackingFamilyOverride(this, create);
  }
}

class _$DeletePathTrackingFamilyOverride implements FamilyOverride {
  _$DeletePathTrackingFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeletePathTrackingRef ref) create;

  @override
  final DeletePathTrackingFamily overriddenFamily;

  @override
  DeletePathTrackingProvider getProviderOverride(
    covariant DeletePathTrackingProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].
///
/// Copied from [deletePathTracking].
class DeletePathTrackingProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deletePathTracking].
  DeletePathTrackingProvider(
    PathTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) : this._internal(
          (ref) => deletePathTracking(
            ref as DeletePathTrackingRef,
            tracking,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: deletePathTrackingProvider,
          name: r'deletePathTrackingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deletePathTrackingHash,
          dependencies: DeletePathTrackingFamily._dependencies,
          allTransitiveDependencies:
              DeletePathTrackingFamily._allTransitiveDependencies,
          tracking: tracking,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  DeletePathTrackingProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tracking,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final PathTracking tracking;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeletePathTrackingRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeletePathTrackingProvider._internal(
        (ref) => create(ref as DeletePathTrackingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tracking: tracking,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    PathTracking, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeletePathTrackingProviderElement(this);
  }

  DeletePathTrackingProvider _copyWith(
    FutureOr<void> Function(DeletePathTrackingRef ref) create,
  ) {
    return DeletePathTrackingProvider._internal(
      (ref) => create(ref as DeletePathTrackingRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      tracking: tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeletePathTrackingProvider &&
        other.tracking == tracking &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tracking.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeletePathTrackingRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `tracking` of this provider.
  PathTracking get tracking;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _DeletePathTrackingProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeletePathTrackingRef {
  _DeletePathTrackingProviderElement(super.provider);

  @override
  PathTracking get tracking => (origin as DeletePathTrackingProvider).tracking;
  @override
  String? get overrideName =>
      (origin as DeletePathTrackingProvider).overrideName;
  @override
  bool get downloadIfWeb =>
      (origin as DeletePathTrackingProvider).downloadIfWeb;
}

String _$importPathTrackingHash() =>
    r'a8be30fa6266eaa6e043d994d1e158353dc1385f';

/// A provider for importing a [PathTracking] from a file and applying it to
/// the [ConfiguredPathTracking] provider.
///
/// Copied from [importPathTracking].
@ProviderFor(importPathTracking)
final importPathTrackingProvider =
    AutoDisposeFutureProvider<PathTracking?>.internal(
  importPathTracking,
  name: r'importPathTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importPathTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImportPathTrackingRef = AutoDisposeFutureProviderRef<PathTracking?>;
String _$pathInterpolationDistanceHash() =>
    r'3838e0d5947ecf47190196f1fa4998a29f429156';

/// A provider for the path interpolation distance.
///
/// Copied from [PathInterpolationDistance].
@ProviderFor(PathInterpolationDistance)
final pathInterpolationDistanceProvider =
    NotifierProvider<PathInterpolationDistance, double>.internal(
  PathInterpolationDistance.new,
  name: r'pathInterpolationDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathInterpolationDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathInterpolationDistance = Notifier<double>;
String _$pathTrackingPointsHash() =>
    r'225ee956c9e62f4ceaef54b35b9440a9da0a130d';

/// A provider for holding the [WayPoint]s for the [ConfiguredPathTracking].
///
/// Copied from [PathTrackingPoints].
@ProviderFor(PathTrackingPoints)
final pathTrackingPointsProvider =
    NotifierProvider<PathTrackingPoints, List<WayPoint>?>.internal(
  PathTrackingPoints.new,
  name: r'pathTrackingPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathTrackingPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathTrackingPoints = Notifier<List<WayPoint>?>;
String _$configuredPathTrackingHash() =>
    r'00e84454d1e4b3aa96a0df55fbceb8d8c28ec37e';

/// A provider for creating and holding a [PathTracking] model for the
/// previously recorded waypoints.
///
/// Copied from [ConfiguredPathTracking].
@ProviderFor(ConfiguredPathTracking)
final configuredPathTrackingProvider =
    NotifierProvider<ConfiguredPathTracking, PathTracking?>.internal(
  ConfiguredPathTracking.new,
  name: r'configuredPathTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredPathTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredPathTracking = Notifier<PathTracking?>;
String _$pathTrackingLoopHash() => r'51f6c0dd235e7e6abe6aa472772905295ebe9c94';

/// A provider for which looping mode the [ConfiguredPathTracking] should
/// follow.
///
/// Copied from [PathTrackingLoop].
@ProviderFor(PathTrackingLoop)
final pathTrackingLoopProvider =
    NotifierProvider<PathTrackingLoop, PathTrackingLoopMode>.internal(
  PathTrackingLoop.new,
  name: r'pathTrackingLoopProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pathTrackingLoopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PathTrackingLoop = Notifier<PathTrackingLoopMode>;
String _$displayPathTrackingHash() =>
    r'e7975c05e94f5a05718849e81357757707c67352';

/// A provider for the activated [ConfiguredPathTracking] model, typically
/// recieved and updated from the simulator.
///
/// Copied from [DisplayPathTracking].
@ProviderFor(DisplayPathTracking)
final displayPathTrackingProvider =
    NotifierProvider<DisplayPathTracking, PathTracking?>.internal(
  DisplayPathTracking.new,
  name: r'displayPathTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayPathTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisplayPathTracking = Notifier<PathTracking?>;
String _$showPathTrackingHash() => r'4aaabec2c84ce508eef43de33976367de2f6079f';

/// A provider for whether or not the path tracking should be shown.
///
/// Copied from [ShowPathTracking].
@ProviderFor(ShowPathTracking)
final showPathTrackingProvider =
    NotifierProvider<ShowPathTracking, bool>.internal(
  ShowPathTracking.new,
  name: r'showPathTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showPathTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowPathTracking = Notifier<bool>;
String _$debugPathTrackingHash() => r'db41c00fa0d4a921e7251aea9fce8d341463b4c9';

/// Whether the path tracking debug features should show.
///
/// Copied from [DebugPathTracking].
@ProviderFor(DebugPathTracking)
final debugPathTrackingProvider =
    NotifierProvider<DebugPathTracking, bool>.internal(
  DebugPathTracking.new,
  name: r'debugPathTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugPathTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugPathTracking = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
