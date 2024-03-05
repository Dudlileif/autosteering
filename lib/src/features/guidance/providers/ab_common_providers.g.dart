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
    r'1dca363cb2e3b838d175abbdc279f0f04af7ee01';

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

String _$saveABTrackingHash() => r'55f6314b4b4a7c3d59221f24ce6e142cf01565fb';

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
  Override overrideWith(
      AsyncValue<void> Function(SaveABTrackingRef ref) create) {
    return _$SaveABTrackingFamilyOverride(this, create);
  }
}

class _$SaveABTrackingFamilyOverride implements FamilyOverride {
  _$SaveABTrackingFamilyOverride(this.overriddenFamily, this.create);

  final AsyncValue<void> Function(SaveABTrackingRef ref) create;

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
class SaveABTrackingProvider extends AutoDisposeProvider<AsyncValue<void>> {
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
    AsyncValue<void> Function(SaveABTrackingRef ref) create,
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
  AutoDisposeProviderElement<AsyncValue<void>> createElement() {
    return _SaveABTrackingProviderElement(this);
  }

  SaveABTrackingProvider _copyWith(
    AsyncValue<void> Function(SaveABTrackingRef ref) create,
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

mixin SaveABTrackingRef on AutoDisposeProviderRef<AsyncValue<void>> {
  /// The parameter `tracking` of this provider.
  ABTracking get tracking;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveABTrackingProviderElement
    extends AutoDisposeProviderElement<AsyncValue<void>>
    with SaveABTrackingRef {
  _SaveABTrackingProviderElement(super.provider);

  @override
  ABTracking get tracking => (origin as SaveABTrackingProvider).tracking;
  @override
  String? get overrideName => (origin as SaveABTrackingProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as SaveABTrackingProvider).downloadIfWeb;
}

String _$savedABTrackingsHash() => r'e7d2d37a72477e0243b704e193b90049d3643d50';

/// A provider for reading and holding all the saved [ABTracking] in the
/// user file directory.
///
/// Copied from [savedABTrackings].
@ProviderFor(savedABTrackings)
final savedABTrackingsProvider =
    Provider<AsyncValue<List<ABTracking>>>.internal(
  savedABTrackings,
  name: r'savedABTrackingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedABTrackingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedABTrackingsRef = ProviderRef<AsyncValue<List<ABTracking>>>;
String _$aBTrackingDebugShowHash() =>
    r'1fcc86d7408faea577768ca750987f0e55862ad0';

/// A provider for whether the AB-tracking debugging features should be shown.
///
/// Copied from [ABTrackingDebugShow].
@ProviderFor(ABTrackingDebugShow)
final aBTrackingDebugShowProvider =
    NotifierProvider<ABTrackingDebugShow, bool>.internal(
  ABTrackingDebugShow.new,
  name: r'aBTrackingDebugShowProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBTrackingDebugShowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABTrackingDebugShow = Notifier<bool>;
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
String _$aBWidthHash() => r'bd59cfec1cc976da5f751308939cb42623dd3f69';

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
    r'55d1f4397f68b4921c1985c25dcb3b86fdbd704e';

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
    r'2ccc778fc6b9dbe518d7f74ee2fe10d77ff6a747';

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
String _$displayABTrackingHash() => r'360974096215fab89c89a88002ea487b3721f80d';

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
    r'21c7c4b28493f8c307f9601213256d18b9596db7';

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
