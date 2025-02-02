// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_tracking_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pathTrackingPerpendicularDistanceHash() =>
    r'ab61512d7ccd9748ae77183141f2bb13657d91e9';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PathTrackingPerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$loadPathTrackingFromFileHash() =>
    r'1bd1565ccac6edd0976ed44d73f99a2816ece0e1';

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
class LoadPathTrackingFromFileFamily extends Family<AsyncValue<PathTracking?>> {
  /// A provider for loading an [PathTracking] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadPathTrackingFromFile].
  const LoadPathTrackingFromFileFamily();

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

  @override
  LoadPathTrackingFromFileProvider getProviderOverride(
    covariant LoadPathTrackingFromFileProvider provider,
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
  String? get name => r'loadPathTrackingFromFileProvider';
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
    FutureOr<PathTracking?> Function(LoadPathTrackingFromFileRef provider)
        create,
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
  AutoDisposeFutureProviderElement<PathTracking?> createElement() {
    return _LoadPathTrackingFromFileProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$savePathTrackingHash() => r'5f8be03f26d7b23c96ba905ea99d125515453057';

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
class SavePathTrackingFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [savePathTracking].
  const SavePathTrackingFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savePathTrackingProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(SavePathTrackingRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SavePathTrackingProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'db15fe7381f02c1a3312bee2ecd235c8360e7640';

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
class ExportPathTrackingFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportPathTracking].
  const ExportPathTrackingFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportPathTrackingProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(ExportPathTrackingRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportPathTrackingProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'af0113ed05ba71176298ddc62b963c93bb7c40d7';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavedPathTrackingsRef = FutureProviderRef<List<PathTracking>>;
String _$deletePathTrackingHash() =>
    r'b510007c9f5577e46da70958dd8c88e3bc22fe41';

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
class DeletePathTrackingFamily extends Family<AsyncValue<void>> {
  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deletePathTracking].
  const DeletePathTrackingFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deletePathTrackingProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(DeletePathTrackingRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeletePathTrackingProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'268e63b8faf3fc76f311a1ab96dfaa6b4391d2b9';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImportPathTrackingRef = AutoDisposeFutureProviderRef<PathTracking?>;
String _$exportGuidancesHash() => r'c3a70f44a023ff06985977bc6f6cbf05b7d30e7b';

/// A provider for exporting all guidance files.
///
/// Copied from [exportGuidances].
@ProviderFor(exportGuidances)
const exportGuidancesProvider = ExportGuidancesFamily();

/// A provider for exporting all guidance files.
///
/// Copied from [exportGuidances].
class ExportGuidancesFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting all guidance files.
  ///
  /// Copied from [exportGuidances].
  const ExportGuidancesFamily();

  /// A provider for exporting all guidance files.
  ///
  /// Copied from [exportGuidances].
  ExportGuidancesProvider call({
    bool zip = true,
  }) {
    return ExportGuidancesProvider(
      zip: zip,
    );
  }

  @override
  ExportGuidancesProvider getProviderOverride(
    covariant ExportGuidancesProvider provider,
  ) {
    return call(
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
  String? get name => r'exportGuidancesProvider';
}

/// A provider for exporting all guidance files.
///
/// Copied from [exportGuidances].
class ExportGuidancesProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting all guidance files.
  ///
  /// Copied from [exportGuidances].
  ExportGuidancesProvider({
    bool zip = true,
  }) : this._internal(
          (ref) => exportGuidances(
            ref as ExportGuidancesRef,
            zip: zip,
          ),
          from: exportGuidancesProvider,
          name: r'exportGuidancesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportGuidancesHash,
          dependencies: ExportGuidancesFamily._dependencies,
          allTransitiveDependencies:
              ExportGuidancesFamily._allTransitiveDependencies,
          zip: zip,
        );

  ExportGuidancesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.zip,
  }) : super.internal();

  final bool zip;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportGuidancesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportGuidancesProvider._internal(
        (ref) => create(ref as ExportGuidancesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        zip: zip,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportGuidancesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportGuidancesProvider && other.zip == zip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, zip.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExportGuidancesRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `zip` of this provider.
  bool get zip;
}

class _ExportGuidancesProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportGuidancesRef {
  _ExportGuidancesProviderElement(super.provider);

  @override
  bool get zip => (origin as ExportGuidancesProvider).zip;
}

String _$pathInterpolationDistanceHash() =>
    r'2f3dd72ebc9b619f2fa786217d2162ccaf6659cf';

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
    r'67fef335827c9ce6545ee764535ce808c929dd6d';

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
String _$pathTrackingLoopHash() => r'9e18bb1af4a02e1301d6d53c7efbae48e92d1cf7';

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
    r'75006e9bed786d31170be96c14532152b1cd073e';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
