// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showMiniMapHash() => r'513352096bf01f8d799c4a05c054c2930695d6e2';

/// Whether the mini map should be shown.
///
/// Copied from [ShowMiniMap].
@ProviderFor(ShowMiniMap)
final showMiniMapProvider =
    AutoDisposeNotifierProvider<ShowMiniMap, bool>.internal(
  ShowMiniMap.new,
  name: r'showMiniMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showMiniMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowMiniMap = AutoDisposeNotifier<bool>;
String _$miniMapReadyHash() => r'757d08346738862dd344aafe5891c9c290001ef0';

/// Whether the map is ready to be shown or not.
///
/// Copied from [MiniMapReady].
@ProviderFor(MiniMapReady)
final miniMapReadyProvider =
    AutoDisposeNotifierProvider<MiniMapReady, bool>.internal(
  MiniMapReady.new,
  name: r'miniMapReadyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$miniMapReadyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MiniMapReady = AutoDisposeNotifier<bool>;
String _$miniMapControllerHash() => r'dce494710268299011edddb8eecc7ab7f9c2e84a';

/// The mini map [MapController] provider, which allows controlling the
/// map from outside the widget code itself.
///
/// Copied from [MiniMapController].
@ProviderFor(MiniMapController)
final miniMapControllerProvider =
    AutoDisposeNotifierProvider<MiniMapController, MapController>.internal(
  MiniMapController.new,
  name: r'miniMapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$miniMapControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MiniMapController = AutoDisposeNotifier<MapController>;
String _$miniMapLockToFieldHash() =>
    r'de4f0f13fec719a82df594f58b8a831a86ccc645';

/// Whether the mini map always should point to the north and not rotate.
///
/// Copied from [MiniMapLockToField].
@ProviderFor(MiniMapLockToField)
final miniMapLockToFieldProvider =
    AutoDisposeNotifierProvider<MiniMapLockToField, bool>.internal(
  MiniMapLockToField.new,
  name: r'miniMapLockToFieldProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$miniMapLockToFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MiniMapLockToField = AutoDisposeNotifier<bool>;
String _$miniMapAlwaysPointNorthHash() =>
    r'1ec4ab2f97d16d9260b159ff7d8b2c9665133f07';

/// Whether the mini map always should point to the north and not rotate.
///
/// Copied from [MiniMapAlwaysPointNorth].
@ProviderFor(MiniMapAlwaysPointNorth)
final miniMapAlwaysPointNorthProvider =
    NotifierProvider<MiniMapAlwaysPointNorth, bool>.internal(
  MiniMapAlwaysPointNorth.new,
  name: r'miniMapAlwaysPointNorthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$miniMapAlwaysPointNorthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MiniMapAlwaysPointNorth = Notifier<bool>;
String _$miniMapSizeHash() => r'2d209cd72ad7be46bd686724ae49229b4c1fb906';

/// Whether the mini map always should point to the north and not rotate.
///
/// Copied from [MiniMapSize].
@ProviderFor(MiniMapSize)
final miniMapSizeProvider =
    AutoDisposeNotifierProvider<MiniMapSize, double>.internal(
  MiniMapSize.new,
  name: r'miniMapSizeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$miniMapSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MiniMapSize = AutoDisposeNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
