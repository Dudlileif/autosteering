// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_common_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$abTrackingPerpendicularDistanceHash() =>
    r'5921e2605443b8d72a236ff8ad777d5749e6f6a8';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AbTrackingPerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$activeABConfigHash() => r'a04ac3f20818e3dcb0c4797174bada5f38cfa463';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveABConfigRef = ProviderRef<ABConfig>;
String _$loadABTrackingFromFileHash() =>
    r'9c089210d74c10fa43ce0aea577e4c15834bbbce';

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
class LoadABTrackingFromFileFamily extends Family<AsyncValue<ABTracking?>> {
  /// A provider for loading an [ABTracking] from a file at [path], if it's
  /// valid.
  ///
  /// Copied from [loadABTrackingFromFile].
  const LoadABTrackingFromFileFamily();

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

  @override
  LoadABTrackingFromFileProvider getProviderOverride(
    covariant LoadABTrackingFromFileProvider provider,
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
  String? get name => r'loadABTrackingFromFileProvider';
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
    FutureOr<ABTracking?> Function(LoadABTrackingFromFileRef provider) create,
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
  AutoDisposeFutureProviderElement<ABTracking?> createElement() {
    return _LoadABTrackingFromFileProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$saveABTrackingHash() => r'0153ed4815d87f1d7d4cb4916655ba519f83be22';

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
class SaveABTrackingFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveABTracking].
  const SaveABTrackingFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveABTrackingProvider';
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

  final ABTracking tracking;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveABTrackingRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveABTrackingProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$exportABTrackingHash() => r'df3020bdcd032ce61d138a49315c1ae2e2be08c7';

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
class ExportABTrackingFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting [tracking] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportABTracking].
  const ExportABTrackingFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportABTrackingProvider';
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

  final ABTracking tracking;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportABTrackingRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportABTrackingProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$savedABTrackingsHash() => r'1e113dca6f21424d1e0c9c56621eb72de77c6121';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavedABTrackingsRef = FutureProviderRef<List<ABTracking>>;
String _$deleteABTrackingHash() => r'70ee2f763ab0cebbce286752a32fb4b0783d0e89';

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
class DeleteABTrackingFamily extends Family<AsyncValue<void>> {
  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteABTracking].
  const DeleteABTrackingFamily();

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

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteABTrackingProvider';
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

  final ABTracking tracking;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteABTrackingRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteABTrackingProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$importABTrackingHash() => r'e15ecf34fb74dd34dd59edd5229148703df47aff';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
String _$debugABTrackingHash() => r'4b7ddb864844d94c5bc11ff2114f8cdb0bf3e484';

/// A provider for whether the AB-tracking debug features should be shown.
///
/// Copied from [DebugABTracking].
@ProviderFor(DebugABTracking)
final debugABTrackingProvider =
    NotifierProvider<DebugABTracking, bool>.internal(
  DebugABTracking.new,
  name: r'debugABTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugABTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugABTracking = Notifier<bool>;
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
String _$aBWidthHash() => r'fc2b4b68f975bbd6163b0f9bb1176a198d415f4e';

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
String _$aBSidewaysOffsetHash() => r'b1fd3bf03e7b556ba796993d2946c2dc7f1a9ffb';

/// A provider for the sideways offset of an AB-line.
///
/// Copied from [ABSidewaysOffset].
@ProviderFor(ABSidewaysOffset)
final aBSidewaysOffsetProvider =
    NotifierProvider<ABSidewaysOffset, double>.internal(
  ABSidewaysOffset.new,
  name: r'aBSidewaysOffsetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBSidewaysOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABSidewaysOffset = Notifier<double>;
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
    r'6f02dc850fb6546352f016266ba7445aef21c9f0';

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
    r'5b086ad383e613ff2964c0e97a92c9282bb892f1';

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
    r'fd8fd83d4987359c06a488675144d5e82c0a95f4';

/// A provider for the currently configured [ABTracking].
///
/// Copied from [ConfiguredMenuABTracking].
@ProviderFor(ConfiguredMenuABTracking)
final configuredMenuABTrackingProvider =
    AsyncNotifierProvider<ConfiguredMenuABTracking, ABTracking?>.internal(
  ConfiguredMenuABTracking.new,
  name: r'configuredMenuABTrackingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredMenuABTrackingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredMenuABTracking = AsyncNotifier<ABTracking?>;
String _$displayABTrackingHash() => r'32b5e8257bbed076839d7d1e065d14572b2d4b2f';

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
String _$aBPointAHash() => r'512153928742a2f485f7f112a57cb15f31979475';

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
String _$aBPointBHash() => r'b215b17212fbadc46b9f9cdeef89b6808953d719';

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
String _$showABPointAHash() => r'9aeb6c8f9e43081b52c30e1c75cd504de2d0034a';

/// A provider for whether to show the starting point A of an AB-line.
///
/// Copied from [ShowABPointA].
@ProviderFor(ShowABPointA)
final showABPointAProvider = NotifierProvider<ShowABPointA, bool>.internal(
  ShowABPointA.new,
  name: r'showABPointAProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showABPointAHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowABPointA = Notifier<bool>;
String _$showABPointBHash() => r'd957ec5d535e0b6e2f29e00900bcae1a52ac3827';

/// A provider for whether to show the ending point B of an AB-line.
///
/// Copied from [ShowABPointB].
@ProviderFor(ShowABPointB)
final showABPointBProvider = NotifierProvider<ShowABPointB, bool>.internal(
  ShowABPointB.new,
  name: r'showABPointBProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showABPointBHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowABPointB = Notifier<bool>;
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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
