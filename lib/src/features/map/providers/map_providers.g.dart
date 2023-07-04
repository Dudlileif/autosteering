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
    r'4f20d097b23213cd6ab1639833328be3dc50ea8f';

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
    r'0bbe5ef562ea8154bc497be0626337a17a97f870';

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
String _$alwaysPointNorthHash() => r'b7b98a0c768dbf808383c3f5d29ea22bb1581589';

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
