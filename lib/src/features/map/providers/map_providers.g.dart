// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapOffsetHash() => r'264c09201daa5721ac983436017a37f5f28e23f3';

/// How much the map center should be offset from the vehicle.
///
/// Copied from [mapOffset].
@ProviderFor(mapOffset)
final mapOffsetProvider = Provider<MapCenterOffset>.internal(
  mapOffset,
  name: r'mapOffsetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MapOffsetRef = ProviderRef<MapCenterOffset>;
String _$offsetVehiclePositionHash() =>
    r'932c255b65d3b9b8faf7fab7176808ba3387308b';

/// The map center offset applied to the vehicle position, contains the
/// actual center position of the map.
///
/// Copied from [offsetVehiclePosition].
@ProviderFor(offsetVehiclePosition)
final offsetVehiclePositionProvider = Provider<LatLng>.internal(
  offsetVehiclePosition,
  name: r'offsetVehiclePositionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$offsetVehiclePositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OffsetVehiclePositionRef = ProviderRef<LatLng>;
String _$mapCacheDateHash() => r'0b10a2822bb4319c72710f2de30016f2b501372c';

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

typedef MapCacheDateRef = AutoDisposeFutureProviderRef<DateTime?>;

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
    String path,
  ) {
    return MapCacheDateProvider(
      path,
    );
  }

  @override
  MapCacheDateProvider getProviderOverride(
    covariant MapCacheDateProvider provider,
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
    this.path,
  ) : super.internal(
          (ref) => mapCacheDate(
            ref,
            path,
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
        );

  final String path;

  @override
  bool operator ==(Object other) {
    return other is MapCacheDateProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$mapCacheDirectoriesHash() =>
    r'466efc3812ee4ab6265fa42d67f9be292e413542';

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

typedef MapCacheDirectoriesRef = AutoDisposeFutureProviderRef<List<String>>;
String _$mapReadyHash() => r'2931061d7ad71c99e4d4b04386d2adc722b6e029';

/// Whether the map is ready to be shown or not.
///
/// Copied from [MapReady].
@ProviderFor(MapReady)
final mapReadyProvider = NotifierProvider<MapReady, bool>.internal(
  MapReady.new,
  name: r'mapReadyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapReadyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapReady = Notifier<bool>;
String _$mainMapControllerHash() => r'161021f93fea3f2ea13ea30ce3b768d6718ced11';

/// The main [MapController] provider, which allows controlling the map from
/// outside the widget code itself.
///
/// Copied from [MainMapController].
@ProviderFor(MainMapController)
final mainMapControllerProvider =
    NotifierProvider<MainMapController, MapController>.internal(
  MainMapController.new,
  name: r'mainMapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mainMapControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MainMapController = Notifier<MapController>;
String _$homePositionHash() => r'9887c76d9fd12dbfe3d8dbe1040f342b26aaa652';

/// The home position of the vehicle, i.e. where the vehicle will reset to.
///
/// Copied from [HomePosition].
@ProviderFor(HomePosition)
final homePositionProvider = NotifierProvider<HomePosition, LatLng>.internal(
  HomePosition.new,
  name: r'homePositionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homePositionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomePosition = Notifier<LatLng>;
String _$centerMapOnVehicleHash() =>
    r'6268ec68323bb1790b8585e16fcdb04b57ec6e4b';

/// Whether the map should center on the vehicle or if it could be moved freely.
///
/// Copied from [CenterMapOnVehicle].
@ProviderFor(CenterMapOnVehicle)
final centerMapOnVehicleProvider =
    NotifierProvider<CenterMapOnVehicle, bool>.internal(
  CenterMapOnVehicle.new,
  name: r'centerMapOnVehicleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$centerMapOnVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CenterMapOnVehicle = Notifier<bool>;
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
String _$mapOffset2DHash() => r'bacee10fe6dceef24cc755af969461bc872bf088';

/// How much the map center should be offset from the vehicle when using
/// 2D view.
///
/// Copied from [MapOffset2D].
@ProviderFor(MapOffset2D)
final mapOffset2DProvider =
    NotifierProvider<MapOffset2D, MapCenterOffset>.internal(
  MapOffset2D.new,
  name: r'mapOffset2DProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapOffset2DHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapOffset2D = Notifier<MapCenterOffset>;
String _$mapOffset3DHash() => r'eed798ad2fa9d9781af96898d913a23068763984';

/// How much the map center should be offset from the vehicle when using
/// 3D view.
///
/// Copied from [MapOffset3D].
@ProviderFor(MapOffset3D)
final mapOffset3DProvider =
    NotifierProvider<MapOffset3D, MapCenterOffset>.internal(
  MapOffset3D.new,
  name: r'mapOffset3DProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapOffset3DHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapOffset3D = Notifier<MapCenterOffset>;
String _$alwaysPointNorthHash() => r'4c5a4f69391405ba0f11fabe94c3fc9e492e5ad4';

/// Whether the map always should point to the north and not rotate.
///
/// Copied from [AlwaysPointNorth].
@ProviderFor(AlwaysPointNorth)
final alwaysPointNorthProvider =
    NotifierProvider<AlwaysPointNorth, bool>.internal(
  AlwaysPointNorth.new,
  name: r'alwaysPointNorthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$alwaysPointNorthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AlwaysPointNorth = Notifier<bool>;
String _$mapUse3DPerspectiveHash() =>
    r'e2a44a841ae01677fcc8ea2de4c63e33677e2a06';

/// Whether to enable a 3D perspective for the map, otherwise an orthogonal
/// view is used.
///
/// Copied from [MapUse3DPerspective].
@ProviderFor(MapUse3DPerspective)
final mapUse3DPerspectiveProvider =
    NotifierProvider<MapUse3DPerspective, bool>.internal(
  MapUse3DPerspective.new,
  name: r'mapUse3DPerspectiveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapUse3DPerspectiveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapUse3DPerspective = Notifier<bool>;
String _$map3DPerspectiveAngleHash() =>
    r'2d41f3d840e1281e01a58b107c01bec1596c1188';

/// The angle that the 3D perspective should be seen from, as in radians
/// from the orthogonal view.
///
/// Copied from [Map3DPerspectiveAngle].
@ProviderFor(Map3DPerspectiveAngle)
final map3DPerspectiveAngleProvider =
    NotifierProvider<Map3DPerspectiveAngle, double>.internal(
  Map3DPerspectiveAngle.new,
  name: r'map3DPerspectiveAngleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$map3DPerspectiveAngleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Map3DPerspectiveAngle = Notifier<double>;
String _$mapZoomHash() => r'070ace7cb8cec2c2a0c7b1c56a4c50f8bb51a379';

/// The zoom value that the map should use when being created.
///
/// Copied from [MapZoom].
@ProviderFor(MapZoom)
final mapZoomProvider = NotifierProvider<MapZoom, double>.internal(
  MapZoom.new,
  name: r'mapZoomProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapZoomHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapZoom = Notifier<double>;
String _$mapAllowDownloadHash() => r'7c11393246dcc8e12c809f33c655bb676157b6a9';

/// Whether the map should be allowed to download tiles over the internet.
///
/// Copied from [MapAllowDownload].
@ProviderFor(MapAllowDownload)
final mapAllowDownloadProvider =
    NotifierProvider<MapAllowDownload, bool>.internal(
  MapAllowDownload.new,
  name: r'mapAllowDownloadProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapAllowDownloadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapAllowDownload = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
