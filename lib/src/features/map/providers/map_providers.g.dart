// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$offsetVehiclePositionHash() =>
    r'2ff19a43f87ee2431bad5e002ae4f5dfa94df6bc';

/// See also [offsetVehiclePosition].
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

/// See also [MapReady].
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

/// See also [MainMapController].
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

/// See also [HomePosition].
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

/// See also [CenterMapOnVehicle].
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

/// See also [ZoomTimerController].
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

/// See also [MapOffset].
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

/// See also [AlwaysPointNorth].
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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
