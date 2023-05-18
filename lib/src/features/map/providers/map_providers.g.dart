// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$offsetVehiclePositionHash() =>
    r'75b52632382383648e85d8f84c0b5a954e888064';

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
String _$homePositionHash() => r'6d6ea4b473964c1f64a70739e69bf44512264eeb';

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
    r'89addbc27d6c66b66bd52f5feba007f0aa480afd';

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
    r'033d1227ff87f645fe562bd349cba49d854ffb3d';

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
String _$mapOffsetHash() => r'b46b6719a6b0032ff0f70065900ed94a4837f396';

/// How much the map center should be offset from the vehicle.
///
/// Copied from [MapOffset].
@ProviderFor(MapOffset)
final mapOffsetProvider = NotifierProvider<MapOffset, MapCenterOffset>.internal(
  MapOffset.new,
  name: r'mapOffsetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapOffset = Notifier<MapCenterOffset>;
String _$alwaysPointNorthHash() => r'f8a05832feb870dadc2d754f8633c256ab5eaa23';

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
    r'a0651b05e8a2c04f9a9108bbb64899bb5887ebcb';

/// Whether to enable a 3D perspective for the map, otherwise a orthogonal
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
    r'fd39a0b32f0090b1204d523b4b28872e2261b187';

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
