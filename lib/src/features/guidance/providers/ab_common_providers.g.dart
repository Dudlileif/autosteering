// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_common_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$abTrackingPerpendicularDistanceHash() =>
    r'a51697663b64013ac069b5660ad6af160f4a3160';

/// A provider for the perpendicular distance from the AB tracking line
/// to the [MainVehicle].
///
/// Copied from [abTrackingPerpendicularDistance].
@ProviderFor(abTrackingPerpendicularDistance)
final abTrackingPerpendicularDistanceProvider =
    AutoDisposeProvider<double?>.internal(
  abTrackingPerpendicularDistance,
  name: r'abTrackingPerpendicularDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$abTrackingPerpendicularDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AbTrackingPerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$activeABConfigHash() => r'01913754703105bf7b2eb131e99cbebe0cd06b8d';

/// A provider for the currently active AB configuration.
///
/// Copied from [activeABConfig].
@ProviderFor(activeABConfig)
final activeABConfigProvider = Provider<ABConfig>.internal(
  activeABConfig,
  name: r'activeABConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeABConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveABConfigRef = ProviderRef<ABConfig>;
String _$loadABTrackingFromFileHash() =>
    r'5c5a10841d8aa7cf0bf00cba2b71839bec099e04';

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

/// A provider for loading an [ABTracking] from a file at [path], if it's
/// valid.
///
/// Copied from [loadABTrackingFromFile].
@ProviderFor(loadABTrackingFromFile)
const loadABTrackingFromFileProvider = LoadABTrackingFromFileFamily();

/// A provider for loading an [ABTracking] from a file at [path], if it's
/// valid.
///
/// Copied from [loadABTrackingFromFile].
class LoadABTrackingFromFileFamily extends Family {
  /// A provider for loading an [ABTracking] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadABTrackingFromFile].
  const LoadABTrackingFromFileFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadABTrackingFromFileProvider';

  /// A provider for loading an [ABTracking] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadABTrackingFromFile].
  LoadABTrackingFromFileProvider call(
    String path,
  ) {
    return LoadABTrackingFromFileProvider(
      path,
    );
  }

  @visibleForOverriding
  @override
  LoadABTrackingFromFileProvider getProviderOverride(
    covariant LoadABTrackingFromFileProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<ABTracking?> Function(LoadABTrackingFromFileRef ref) create) {
    return _$LoadABTrackingFromFileFamilyOverride(this, create);
  }
}

class _$LoadABTrackingFromFileFamilyOverride implements FamilyOverride {
  _$LoadABTrackingFromFileFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<ABTracking?> Function(LoadABTrackingFromFileRef ref) create;

  @override
  final LoadABTrackingFromFileFamily overriddenFamily;

  @override
  LoadABTrackingFromFileProvider getProviderOverride(
    covariant LoadABTrackingFromFileProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for loading an [ABTracking] from a file at [path], if it's
/// valid.
///
/// Copied from [loadABTrackingFromFile].
class LoadABTrackingFromFileProvider
    extends AutoDisposeFutureProvider<ABTracking?> {
  /// A provider for loading an [ABTracking] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadABTrackingFromFile].
  LoadABTrackingFromFileProvider(
    String path,
  ) : this._internal(
          (ref) => loadABTrackingFromFile(
            ref as LoadABTrackingFromFileRef,
            path,
          ),
          from: loadABTrackingFromFileProvider,
          name: r'loadABTrackingFromFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadABTrackingFromFileHash,
          dependencies: LoadABTrackingFromFileFamily._dependencies,
          allTransitiveDependencies:
              LoadABTrackingFromFileFamily._allTransitiveDependencies,
          path: path,
        );

  LoadABTrackingFromFileProvider._internal(
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
    FutureOr<ABTracking?> Function(LoadABTrackingFromFileRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadABTrackingFromFileProvider._internal(
        (ref) => create(ref as LoadABTrackingFromFileRef),
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
  AutoDisposeFutureProviderElement<ABTracking?> createElement() {
    return _LoadABTrackingFromFileProviderElement(this);
  }

  LoadABTrackingFromFileProvider _copyWith(
    FutureOr<ABTracking?> Function(LoadABTrackingFromFileRef ref) create,
  ) {
    return LoadABTrackingFromFileProvider._internal(
      (ref) => create(ref as LoadABTrackingFromFileRef),
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
    return other is LoadABTrackingFromFileProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadABTrackingFromFileRef on AutoDisposeFutureProviderRef<ABTracking?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _LoadABTrackingFromFileProviderElement
    extends AutoDisposeFutureProviderElement<ABTracking?>
    with LoadABTrackingFromFileRef {
  _LoadABTrackingFromFileProviderElement(super.provider);

  @override
  String get path => (origin as LoadABTrackingFromFileProvider).path;
}

String _$saveABTrackingHash() => r'ff83a3d349702c13606bacfe20f8d43adeaa7eb7';

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveABTracking].
@ProviderFor(saveABTracking)
const saveABTrackingProvider = SaveABTrackingFamily();

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveABTracking].
class SaveABTrackingFamily extends Family {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveABTracking].
  const SaveABTrackingFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveABTrackingProvider';

  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveABTracking].
  SaveABTrackingProvider call(
    ABTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return SaveABTrackingProvider(
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  SaveABTrackingProvider getProviderOverride(
    covariant SaveABTrackingProvider provider,
  ) {
    return call(
      provider.tracking,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(SaveABTrackingRef ref) create) {
    return _$SaveABTrackingFamilyOverride(this, create);
  }
}

class _$SaveABTrackingFamilyOverride implements FamilyOverride {
  _$SaveABTrackingFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(SaveABTrackingRef ref) create;

  @override
  final SaveABTrackingFamily overriddenFamily;

  @override
  SaveABTrackingProvider getProviderOverride(
    covariant SaveABTrackingProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveABTracking].
class SaveABTrackingProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveABTracking].
  SaveABTrackingProvider(
    ABTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => saveABTracking(
            ref as SaveABTrackingRef,
            tracking,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: saveABTrackingProvider,
          name: r'saveABTrackingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveABTrackingHash,
          dependencies: SaveABTrackingFamily._dependencies,
          allTransitiveDependencies:
              SaveABTrackingFamily._allTransitiveDependencies,
          tracking: tracking,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  SaveABTrackingProvider._internal(
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

  final ABTracking tracking;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveABTrackingRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveABTrackingProvider._internal(
        (ref) => create(ref as SaveABTrackingRef),
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
    ABTracking, {
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
    return _SaveABTrackingProviderElement(this);
  }

  SaveABTrackingProvider _copyWith(
    FutureOr<void> Function(SaveABTrackingRef ref) create,
  ) {
    return SaveABTrackingProvider._internal(
      (ref) => create(ref as SaveABTrackingRef),
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
    return other is SaveABTrackingProvider &&
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

mixin SaveABTrackingRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `tracking` of this provider.
  ABTracking get tracking;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveABTrackingProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveABTrackingRef {
  _SaveABTrackingProviderElement(super.provider);

  @override
  ABTracking get tracking => (origin as SaveABTrackingProvider).tracking;
  @override
  String? get overrideName => (origin as SaveABTrackingProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as SaveABTrackingProvider).downloadIfWeb;
}

String _$exportABTrackingHash() => r'233695d00d8c64e058d9daef28aa09bb6cd1a683';

/// A provider for exporting [tracking] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportABTracking].
@ProviderFor(exportABTracking)
const exportABTrackingProvider = ExportABTrackingFamily();

/// A provider for exporting [tracking] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportABTracking].
class ExportABTrackingFamily extends Family {
  /// A provider for exporting [tracking] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportABTracking].
  const ExportABTrackingFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportABTrackingProvider';

  /// A provider for exporting [tracking] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportABTracking].
  ExportABTrackingProvider call(
    ABTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) {
    return ExportABTrackingProvider(
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  ExportABTrackingProvider getProviderOverride(
    covariant ExportABTrackingProvider provider,
  ) {
    return call(
      provider.tracking,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(ExportABTrackingRef ref) create) {
    return _$ExportABTrackingFamilyOverride(this, create);
  }
}

class _$ExportABTrackingFamilyOverride implements FamilyOverride {
  _$ExportABTrackingFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportABTrackingRef ref) create;

  @override
  final ExportABTrackingFamily overriddenFamily;

  @override
  ExportABTrackingProvider getProviderOverride(
    covariant ExportABTrackingProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for exporting [tracking] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportABTracking].
class ExportABTrackingProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting [tracking] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportABTracking].
  ExportABTrackingProvider(
    ABTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) : this._internal(
          (ref) => exportABTracking(
            ref as ExportABTrackingRef,
            tracking,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: exportABTrackingProvider,
          name: r'exportABTrackingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportABTrackingHash,
          dependencies: ExportABTrackingFamily._dependencies,
          allTransitiveDependencies:
              ExportABTrackingFamily._allTransitiveDependencies,
          tracking: tracking,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  ExportABTrackingProvider._internal(
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

  final ABTracking tracking;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportABTrackingRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportABTrackingProvider._internal(
        (ref) => create(ref as ExportABTrackingRef),
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
    ABTracking, {
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
    return _ExportABTrackingProviderElement(this);
  }

  ExportABTrackingProvider _copyWith(
    FutureOr<void> Function(ExportABTrackingRef ref) create,
  ) {
    return ExportABTrackingProvider._internal(
      (ref) => create(ref as ExportABTrackingRef),
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
    return other is ExportABTrackingProvider &&
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

mixin ExportABTrackingRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `tracking` of this provider.
  ABTracking get tracking;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _ExportABTrackingProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportABTrackingRef {
  _ExportABTrackingProviderElement(super.provider);

  @override
  ABTracking get tracking => (origin as ExportABTrackingProvider).tracking;
  @override
  String? get overrideName => (origin as ExportABTrackingProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as ExportABTrackingProvider).downloadIfWeb;
}

String _$savedABTrackingsHash() => r'344fce88179ee4b2f7899f58055e87b69dfde3b0';

/// A provider for reading and holding all the saved [ABTracking] in the
/// user file directory.
///
/// Copied from [savedABTrackings].
@ProviderFor(savedABTrackings)
final savedABTrackingsProvider = FutureProvider<List<ABTracking>>.internal(
  savedABTrackings,
  name: r'savedABTrackingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedABTrackingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedABTrackingsRef = FutureProviderRef<List<ABTracking>>;
String _$deleteABTrackingHash() => r'e2692dd4e93ad4703f4026246d53fc4fd1f2da5d';

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteABTracking].
@ProviderFor(deleteABTracking)
const deleteABTrackingProvider = DeleteABTrackingFamily();

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteABTracking].
class DeleteABTrackingFamily extends Family {
  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteABTracking].
  const DeleteABTrackingFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteABTrackingProvider';

  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteABTracking].
  DeleteABTrackingProvider call(
    ABTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) {
    return DeleteABTrackingProvider(
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  DeleteABTrackingProvider getProviderOverride(
    covariant DeleteABTrackingProvider provider,
  ) {
    return call(
      provider.tracking,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<void> Function(DeleteABTrackingRef ref) create) {
    return _$DeleteABTrackingFamilyOverride(this, create);
  }
}

class _$DeleteABTrackingFamilyOverride implements FamilyOverride {
  _$DeleteABTrackingFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeleteABTrackingRef ref) create;

  @override
  final DeleteABTrackingFamily overriddenFamily;

  @override
  DeleteABTrackingProvider getProviderOverride(
    covariant DeleteABTrackingProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteABTracking].
class DeleteABTrackingProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteABTracking].
  DeleteABTrackingProvider(
    ABTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) : this._internal(
          (ref) => deleteABTracking(
            ref as DeleteABTrackingRef,
            tracking,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: deleteABTrackingProvider,
          name: r'deleteABTrackingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteABTrackingHash,
          dependencies: DeleteABTrackingFamily._dependencies,
          allTransitiveDependencies:
              DeleteABTrackingFamily._allTransitiveDependencies,
          tracking: tracking,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  DeleteABTrackingProvider._internal(
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

  final ABTracking tracking;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteABTrackingRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteABTrackingProvider._internal(
        (ref) => create(ref as DeleteABTrackingRef),
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
    ABTracking, {
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
    return _DeleteABTrackingProviderElement(this);
  }

  DeleteABTrackingProvider _copyWith(
    FutureOr<void> Function(DeleteABTrackingRef ref) create,
  ) {
    return DeleteABTrackingProvider._internal(
      (ref) => create(ref as DeleteABTrackingRef),
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
    return other is DeleteABTrackingProvider &&
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

mixin DeleteABTrackingRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `tracking` of this provider.
  ABTracking get tracking;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _DeleteABTrackingProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteABTrackingRef {
  _DeleteABTrackingProviderElement(super.provider);

  @override
  ABTracking get tracking => (origin as DeleteABTrackingProvider).tracking;
  @override
  String? get overrideName => (origin as DeleteABTrackingProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as DeleteABTrackingProvider).downloadIfWeb;
}

String _$importABTrackingHash() => r'b24f24d89432558ed32c8968160926bd9844660e';

/// A provider for importing an [ABTracking] from a file and applying it to
/// the [ConfiguredABTracking] provider.
///
/// Copied from [importABTracking].
@ProviderFor(importABTracking)
final importABTrackingProvider =
    AutoDisposeFutureProvider<ABTracking?>.internal(
  importABTracking,
  name: r'importABTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importABTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImportABTrackingRef = AutoDisposeFutureProviderRef<ABTracking?>;
String _$currentABTrackingTypeHash() =>
    r'6802edd8d8bf0a49686c0f342ef11b30b92d915d';

/// A provider for the current AB tracking type.
///
/// Copied from [CurrentABTrackingType].
@ProviderFor(CurrentABTrackingType)
final currentABTrackingTypeProvider =
    NotifierProvider<CurrentABTrackingType, ABTrackingType>.internal(
  CurrentABTrackingType.new,
  name: r'currentABTrackingTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentABTrackingTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentABTrackingType = Notifier<ABTrackingType>;
String _$showABTrackingHash() => r'9025fd2e2aef2696692f439fd53d1b512ae84958';

/// A provider for whether the AB-tracking should be shown.
///
/// Copied from [ShowABTracking].
@ProviderFor(ShowABTracking)
final showABTrackingProvider = NotifierProvider<ShowABTracking, bool>.internal(
  ShowABTracking.new,
  name: r'showABTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showABTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowABTracking = Notifier<bool>;
String _$aBDebugStepSizeHash() => r'9758a5466afb606e1e296ec4d9f2ee6b298d33fb';

/// A provider for the step size of an AB-line.
///
/// Copied from [ABDebugStepSize].
@ProviderFor(ABDebugStepSize)
final aBDebugStepSizeProvider =
    NotifierProvider<ABDebugStepSize, double>.internal(
  ABDebugStepSize.new,
  name: r'aBDebugStepSizeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBDebugStepSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABDebugStepSize = Notifier<double>;
String _$aBDebugNumPointsAheadHash() =>
    r'a24e5516cdedc8d4985daaf97909b1d807e202ce';

/// A provider for the number of points of the closest AB-line to be
/// generated ahead of the vehicle.
///
/// Copied from [ABDebugNumPointsAhead].
@ProviderFor(ABDebugNumPointsAhead)
final aBDebugNumPointsAheadProvider =
    NotifierProvider<ABDebugNumPointsAhead, int>.internal(
  ABDebugNumPointsAhead.new,
  name: r'aBDebugNumPointsAheadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBDebugNumPointsAheadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABDebugNumPointsAhead = Notifier<int>;
String _$aBDebugNumPointsBehindHash() =>
    r'82eb31cd0a86a56720db3038aa3365c826afb89d';

/// A provider for the number of points of the closest AB-line to be
/// generated behind of the vehicle.
///
/// Copied from [ABDebugNumPointsBehind].
@ProviderFor(ABDebugNumPointsBehind)
final aBDebugNumPointsBehindProvider =
    NotifierProvider<ABDebugNumPointsBehind, int>.internal(
  ABDebugNumPointsBehind.new,
  name: r'aBDebugNumPointsBehindProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBDebugNumPointsBehindHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABDebugNumPointsBehind = Notifier<int>;
String _$aBWidthHash() => r'd1d517533a8474b5f3494636ff74a7cf1dca6115';

/// A provider for the width of an AB-line.
///
/// Copied from [ABWidth].
@ProviderFor(ABWidth)
final aBWidthProvider = NotifierProvider<ABWidth, double>.internal(
  ABWidth.new,
  name: r'aBWidthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBWidthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABWidth = Notifier<double>;
String _$aBTurningRadiusHash() => r'615d6433b0ca314298f69339c19208d00ceb5df9';

/// A provider for the turning radius of an AB-line.
///
/// Copied from [ABTurningRadius].
@ProviderFor(ABTurningRadius)
final aBTurningRadiusProvider =
    NotifierProvider<ABTurningRadius, double>.internal(
  ABTurningRadius.new,
  name: r'aBTurningRadiusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBTurningRadiusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABTurningRadius = Notifier<double>;
String _$aBTurnOffsetMinSkipsHash() =>
    r'6f3450111f49b0865b57f009cd9c8520d7d5612f';

/// A provider for the width of an AB-line.
///
/// Copied from [ABTurnOffsetMinSkips].
@ProviderFor(ABTurnOffsetMinSkips)
final aBTurnOffsetMinSkipsProvider =
    NotifierProvider<ABTurnOffsetMinSkips, int>.internal(
  ABTurnOffsetMinSkips.new,
  name: r'aBTurnOffsetMinSkipsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBTurnOffsetMinSkipsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABTurnOffsetMinSkips = Notifier<int>;
String _$aBTrackingLimitModeHash() =>
    r'4b9a4b894392288254646d6d52104e80a5663da6';

/// A provider for which limit mode the AB tracking should use.
///
/// Copied from [ABTrackingLimitMode].
@ProviderFor(ABTrackingLimitMode)
final aBTrackingLimitModeProvider =
    NotifierProvider<ABTrackingLimitMode, ABLimitMode>.internal(
  ABTrackingLimitMode.new,
  name: r'aBTrackingLimitModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBTrackingLimitModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABTrackingLimitMode = Notifier<ABLimitMode>;
String _$aBOffsetOppositeTurnHash() =>
    r'6b1d3d2532a51ae4c8c6a20b617d00bdcacba1d7';

/// A provider for which swapping which way the AB-tracking should turn.
///
/// Copied from [ABOffsetOppositeTurn].
@ProviderFor(ABOffsetOppositeTurn)
final aBOffsetOppositeTurnProvider =
    NotifierProvider<ABOffsetOppositeTurn, bool>.internal(
  ABOffsetOppositeTurn.new,
  name: r'aBOffsetOppositeTurnProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBOffsetOppositeTurnHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABOffsetOppositeTurn = Notifier<bool>;
String _$aBSnapToClosestLineHash() =>
    r'ba1b35f9f50fc702ca710d828742ef335261f4c4';

/// A provider for whether the AB-tracking should snap to the closest line.
///
/// Copied from [ABSnapToClosestLine].
@ProviderFor(ABSnapToClosestLine)
final aBSnapToClosestLineProvider =
    NotifierProvider<ABSnapToClosestLine, bool>.internal(
  ABSnapToClosestLine.new,
  name: r'aBSnapToClosestLineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBSnapToClosestLineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABSnapToClosestLine = Notifier<bool>;
String _$configuredABTrackingHash() =>
    r'721cb82ab8e73539c8ebae597b83cfb22e5d60c5';

/// A provider for the currently configured [ABTracking].
///
/// Copied from [ConfiguredABTracking].
@ProviderFor(ConfiguredABTracking)
final configuredABTrackingProvider =
    NotifierProvider<ConfiguredABTracking, ABTracking?>.internal(
  ConfiguredABTracking.new,
  name: r'configuredABTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredABTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredABTracking = Notifier<ABTracking?>;
String _$configuredMenuABTrackingHash() =>
    r'22e8673a06e9d9d90f502d6f52953d3941174e72';

/// A provider for the currently configured [ABTracking].
///
/// Copied from [ConfiguredMenuABTracking].
@ProviderFor(ConfiguredMenuABTracking)
final configuredMenuABTrackingProvider =
    NotifierProvider<ConfiguredMenuABTracking, ABTracking?>.internal(
  ConfiguredMenuABTracking.new,
  name: r'configuredMenuABTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredMenuABTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredMenuABTracking = Notifier<ABTracking?>;
String _$displayABTrackingHash() => r'c87af4669ab69a5d1d63dbfe52b435458b6de676';

/// A provider for the [ABTracking] to display.
///
/// Copied from [DisplayABTracking].
@ProviderFor(DisplayABTracking)
final displayABTrackingProvider =
    NotifierProvider<DisplayABTracking, ABTracking?>.internal(
  DisplayABTracking.new,
  name: r'displayABTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayABTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisplayABTracking = Notifier<ABTracking?>;
String _$aBPointAHash() => r'e252191ee1e97e99fda0adb571430f78018385d5';

/// A provider for the starting point A of an AB-line.
///
/// Copied from [ABPointA].
@ProviderFor(ABPointA)
final aBPointAProvider = NotifierProvider<ABPointA, WayPoint?>.internal(
  ABPointA.new,
  name: r'aBPointAProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBPointAHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABPointA = Notifier<WayPoint?>;
String _$aBPointBHash() => r'7d313dff3f305bd28b49fdee7268389566b35b42';

/// A provider for the ending point B of an AB-line.
///
/// Copied from [ABPointB].
@ProviderFor(ABPointB)
final aBPointBProvider = NotifierProvider<ABPointB, WayPoint?>.internal(
  ABPointB.new,
  name: r'aBPointBProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBPointBHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABPointB = Notifier<WayPoint?>;
String _$aBTrackingShowAllLinesHash() =>
    r'00e1cfb03e0eb198ed297d2fbcdeaa29876a7561';

/// A provider for whether all the calculated lines for the AB tracking should
/// be shown.
///
/// Copied from [ABTrackingShowAllLines].
@ProviderFor(ABTrackingShowAllLines)
final aBTrackingShowAllLinesProvider =
    NotifierProvider<ABTrackingShowAllLines, bool>.internal(
  ABTrackingShowAllLines.new,
  name: r'aBTrackingShowAllLinesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBTrackingShowAllLinesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABTrackingShowAllLines = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
