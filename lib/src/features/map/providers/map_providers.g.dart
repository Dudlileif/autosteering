// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapOffsetHash() => r'b8bbceca43463ca497cded9989ed80bc93c1fc98';

/// How much the map center should be offset from the vehicle.
///
/// Copied from [mapOffset].
@ProviderFor(mapOffset)
final mapOffsetProvider = AutoDisposeProvider<MapCenterOffset>.internal(
  mapOffset,
  name: r'mapOffsetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MapOffsetRef = AutoDisposeProviderRef<MapCenterOffset>;
String _$offsetVehiclePositionHash() =>
    r'581e0cf4438c8f86b9067529dec3b7df56afe008';

/// The map center offset applied to the vehicle position, contains the
/// actual center position of the map.
///
/// Copied from [offsetVehiclePosition].
@ProviderFor(offsetVehiclePosition)
final offsetVehiclePositionProvider = AutoDisposeProvider<LatLng>.internal(
  offsetVehiclePosition,
  name: r'offsetVehiclePositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$offsetVehiclePositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OffsetVehiclePositionRef = AutoDisposeProviderRef<LatLng>;
String _$mapCacheDateHash() => r'18cbbbeec7b58f48dcd447634fc9cffd0dcbd75a';

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

/// A provider for finding the first cache date of the map layer cache
/// at the given [path].
///
/// Copied from [mapCacheDate].
@ProviderFor(mapCacheDate)
const mapCacheDateProvider = MapCacheDateFamily();

/// A provider for finding the first cache date of the map layer cache
/// at the given [path].
///
/// Copied from [mapCacheDate].
class MapCacheDateFamily extends Family<AsyncValue<DateTime?>> {
  /// A provider for finding the first cache date of the map layer cache
  /// at the given [path].
  ///
  /// Copied from [mapCacheDate].
  const MapCacheDateFamily();

  /// A provider for finding the first cache date of the map layer cache
  /// at the given [path].
  ///
  /// Copied from [mapCacheDate].
  MapCacheDateProvider call(
    String filePath,
  ) {
    return MapCacheDateProvider(
      filePath,
    );
  }

  @override
  MapCacheDateProvider getProviderOverride(
    covariant MapCacheDateProvider provider,
  ) {
    return call(
      provider.filePath,
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
  String? get name => r'mapCacheDateProvider';
}

/// A provider for finding the first cache date of the map layer cache
/// at the given [path].
///
/// Copied from [mapCacheDate].
class MapCacheDateProvider extends AutoDisposeFutureProvider<DateTime?> {
  /// A provider for finding the first cache date of the map layer cache
  /// at the given [path].
  ///
  /// Copied from [mapCacheDate].
  MapCacheDateProvider(
    String filePath,
  ) : this._internal(
          (ref) => mapCacheDate(
            ref as MapCacheDateRef,
            filePath,
          ),
          from: mapCacheDateProvider,
          name: r'mapCacheDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapCacheDateHash,
          dependencies: MapCacheDateFamily._dependencies,
          allTransitiveDependencies:
              MapCacheDateFamily._allTransitiveDependencies,
          filePath: filePath,
        );

  MapCacheDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filePath,
  }) : super.internal();

  final String filePath;

  @override
  Override overrideWith(
    FutureOr<DateTime?> Function(MapCacheDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapCacheDateProvider._internal(
        (ref) => create(ref as MapCacheDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filePath: filePath,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DateTime?> createElement() {
    return _MapCacheDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapCacheDateProvider && other.filePath == filePath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filePath.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MapCacheDateRef on AutoDisposeFutureProviderRef<DateTime?> {
  /// The parameter `filePath` of this provider.
  String get filePath;
}

class _MapCacheDateProviderElement
    extends AutoDisposeFutureProviderElement<DateTime?> with MapCacheDateRef {
  _MapCacheDateProviderElement(super.provider);

  @override
  String get filePath => (origin as MapCacheDateProvider).filePath;
}

String _$mapCacheDirectoriesHash() =>
    r'c6af4beb4c54652d190a0bf89d94f79fb6834e1a';

/// A provider for listing all the map layer cache folders.
///
/// Copied from [mapCacheDirectories].
@ProviderFor(mapCacheDirectories)
final mapCacheDirectoriesProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
  mapCacheDirectories,
  name: r'mapCacheDirectoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapCacheDirectoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MapCacheDirectoriesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$mapReadyHash() => r'36f729a428a7b1c5015737d8834d2c0b15df71ab';

/// Whether the map is ready to be shown or not.
///
/// Copied from [MapReady].
@ProviderFor(MapReady)
final mapReadyProvider = AutoDisposeNotifierProvider<MapReady, bool>.internal(
  MapReady.new,
  name: r'mapReadyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapReadyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapReady = AutoDisposeNotifier<bool>;
String _$mainMapControllerHash() => r'd86c68d7c52e5619b02fb085cedf0d871848bdb8';

/// The main [MapController] provider, which allows controlling the map from
/// outside the widget code itself.
///
/// Copied from [MainMapController].
@ProviderFor(MainMapController)
final mainMapControllerProvider =
    AutoDisposeNotifierProvider<MainMapController, MapController>.internal(
  MainMapController.new,
  name: r'mainMapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mainMapControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MainMapController = AutoDisposeNotifier<MapController>;
String _$homePositionHash() => r'dc5c6a2620e680e82f5ee31284bcb1fe5da601ef';

/// The home position of the vehicle, i.e. where the vehicle will reset to.
///
/// Copied from [HomePosition].
@ProviderFor(HomePosition)
final homePositionProvider =
    AutoDisposeNotifierProvider<HomePosition, LatLng>.internal(
  HomePosition.new,
  name: r'homePositionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homePositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomePosition = AutoDisposeNotifier<LatLng>;
String _$centerMapOnVehicleHash() =>
    r'6e42a9a720ede68c1e54bd256046430361849173';

/// Whether the map should center on the vehicle or if it could be moved freely.
///
/// Copied from [CenterMapOnVehicle].
@ProviderFor(CenterMapOnVehicle)
final centerMapOnVehicleProvider =
    AutoDisposeNotifierProvider<CenterMapOnVehicle, bool>.internal(
  CenterMapOnVehicle.new,
  name: r'centerMapOnVehicleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$centerMapOnVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CenterMapOnVehicle = AutoDisposeNotifier<bool>;
String _$zoomTimerControllerHash() =>
    r'd9243c1dd58f6f89846247a2c1ad48684a5bf5eb';

/// A provider for controlling the zoom when a gamepad button is held down.
///
/// The map will keep zooming in/out while the button is held down.
///
/// Copied from [ZoomTimerController].
@ProviderFor(ZoomTimerController)
final zoomTimerControllerProvider =
    AutoDisposeNotifierProvider<ZoomTimerController, Timer?>.internal(
  ZoomTimerController.new,
  name: r'zoomTimerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$zoomTimerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ZoomTimerController = AutoDisposeNotifier<Timer?>;
String _$mapOffset2DHash() => r'61edf217771e62a642a6839ef2f09369edcb5054';

/// How much the map center should be offset from the vehicle when using
/// 2D view.
///
/// Copied from [MapOffset2D].
@ProviderFor(MapOffset2D)
final mapOffset2DProvider =
    AutoDisposeNotifierProvider<MapOffset2D, MapCenterOffset>.internal(
  MapOffset2D.new,
  name: r'mapOffset2DProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapOffset2DHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapOffset2D = AutoDisposeNotifier<MapCenterOffset>;
String _$mapOffset3DHash() => r'5cf6b59d77109e1b658a050688c679d4195c212a';

/// How much the map center should be offset from the vehicle when using
/// 3D view.
///
/// Copied from [MapOffset3D].
@ProviderFor(MapOffset3D)
final mapOffset3DProvider =
    AutoDisposeNotifierProvider<MapOffset3D, MapCenterOffset>.internal(
  MapOffset3D.new,
  name: r'mapOffset3DProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapOffset3DHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapOffset3D = AutoDisposeNotifier<MapCenterOffset>;
String _$alwaysPointNorthHash() => r'34219ed8614164321d8799ffdd299d8f460ff0ad';

/// Whether the map always should point to the north and not rotate.
///
/// Copied from [AlwaysPointNorth].
@ProviderFor(AlwaysPointNorth)
final alwaysPointNorthProvider =
    AutoDisposeNotifierProvider<AlwaysPointNorth, bool>.internal(
  AlwaysPointNorth.new,
  name: r'alwaysPointNorthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$alwaysPointNorthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AlwaysPointNorth = AutoDisposeNotifier<bool>;
String _$mapUse3DPerspectiveHash() =>
    r'78fc37044a94d5afe2ac1e2e317d7e1bfd575303';

/// Whether to enable a 3D perspective for the map, otherwise an orthogonal
/// view is used.
///
/// Copied from [MapUse3DPerspective].
@ProviderFor(MapUse3DPerspective)
final mapUse3DPerspectiveProvider =
    AutoDisposeNotifierProvider<MapUse3DPerspective, bool>.internal(
  MapUse3DPerspective.new,
  name: r'mapUse3DPerspectiveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapUse3DPerspectiveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapUse3DPerspective = AutoDisposeNotifier<bool>;
String _$map3DPerspectiveAngleHash() =>
    r'eb242d22c74963558ad446fdf18a4ca6fb8d3b3b';

/// The angle that the 3D perspective should be seen from, as in radians
/// from the orthogonal view.
///
/// Copied from [Map3DPerspectiveAngle].
@ProviderFor(Map3DPerspectiveAngle)
final map3DPerspectiveAngleProvider =
    AutoDisposeNotifierProvider<Map3DPerspectiveAngle, double>.internal(
  Map3DPerspectiveAngle.new,
  name: r'map3DPerspectiveAngleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$map3DPerspectiveAngleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Map3DPerspectiveAngle = AutoDisposeNotifier<double>;
String _$mapZoomHash() => r'9b86aaf1b7c0bb8e07ed467ebfb892e0336f0514';

/// The zoom value that the map should use when being created.
///
/// Copied from [MapZoom].
@ProviderFor(MapZoom)
final mapZoomProvider = AutoDisposeNotifierProvider<MapZoom, double>.internal(
  MapZoom.new,
  name: r'mapZoomProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapZoomHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapZoom = AutoDisposeNotifier<double>;
String _$mapAllowDownloadHash() => r'1ced70a153678e5415176206bf4f38a06024352d';

/// Whether the map should be allowed to download tiles over the internet.
///
/// Copied from [MapAllowDownload].
@ProviderFor(MapAllowDownload)
final mapAllowDownloadProvider =
    AutoDisposeNotifierProvider<MapAllowDownload, bool>.internal(
  MapAllowDownload.new,
  name: r'mapAllowDownloadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapAllowDownloadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapAllowDownload = AutoDisposeNotifier<bool>;
String _$mapGridSizeHash() => r'724dc6e828b687e501539db9f96fdf664cc54683';

/// The size of the currently displayed map grid.
///
/// Copied from [MapGridSize].
@ProviderFor(MapGridSize)
final mapGridSizeProvider =
    AutoDisposeNotifierProvider<MapGridSize, double?>.internal(
  MapGridSize.new,
  name: r'mapGridSizeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapGridSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapGridSize = AutoDisposeNotifier<double?>;
String _$showGridSizeIndicatorHash() =>
    r'd900954a852121d822ea4b7f4729e96d33e0b2c7';

/// Whether the grid size indicator should be shown.
///
/// Copied from [ShowGridSizeIndicator].
@ProviderFor(ShowGridSizeIndicator)
final showGridSizeIndicatorProvider =
    AutoDisposeNotifierProvider<ShowGridSizeIndicator, bool>.internal(
  ShowGridSizeIndicator.new,
  name: r'showGridSizeIndicatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showGridSizeIndicatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowGridSizeIndicator = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
