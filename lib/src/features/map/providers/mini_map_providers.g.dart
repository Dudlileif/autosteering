// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showMiniMapHash() => r'a24979994252d3ac874fea635631e323d0106eb6';

/// Whether the mini map should be shown.
///
/// Copied from [ShowMiniMap].
@ProviderFor(ShowMiniMap)
final showMiniMapProvider = NotifierProvider<ShowMiniMap, bool>.internal(
  ShowMiniMap.new,
  name: r'showMiniMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showMiniMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowMiniMap = Notifier<bool>;
String _$miniMapReadyHash() => r'ded8c7d96056a32ee3954e84edaa1daf8e2928e4';

/// Whether the map is ready to be shown or not.
///
/// Copied from [MiniMapReady].
@ProviderFor(MiniMapReady)
final miniMapReadyProvider = NotifierProvider<MiniMapReady, bool>.internal(
  MiniMapReady.new,
  name: r'miniMapReadyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$miniMapReadyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MiniMapReady = Notifier<bool>;
String _$miniMapControllerHash() => r'7e44e646a23fd34c4f6798edbcd67e4d11824e13';

/// The mini map [MapController] provider, which allows controlling the
/// map from outside the widget code itself.
///
/// Copied from [MiniMapController].
@ProviderFor(MiniMapController)
final miniMapControllerProvider =
    NotifierProvider<MiniMapController, MapController>.internal(
  MiniMapController.new,
  name: r'miniMapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$miniMapControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MiniMapController = Notifier<MapController>;
String _$miniMapLockToFieldHash() =>
    r'a10b9a3d175688c65f38896fb9c3292bf0965902';

/// Whether the mini map always should point to the north and not rotate.
///
/// Copied from [MiniMapLockToField].
@ProviderFor(MiniMapLockToField)
final miniMapLockToFieldProvider =
    NotifierProvider<MiniMapLockToField, bool>.internal(
  MiniMapLockToField.new,
  name: r'miniMapLockToFieldProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$miniMapLockToFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MiniMapLockToField = Notifier<bool>;
String _$miniMapAlwaysPointNorthHash() =>
    r'1060b12d398b845b570b648e5a7ad4c7f77ca72f';

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
String _$miniMapSizeHash() => r'e4702c9fb1678a6d7e37bca00e5a2b32f832ac09';

/// Whether the mini map always should point to the north and not rotate.
///
/// Copied from [MiniMapSize].
@ProviderFor(MiniMapSize)
final miniMapSizeProvider = NotifierProvider<MiniMapSize, double>.internal(
  MiniMapSize.new,
  name: r'miniMapSizeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$miniMapSizeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MiniMapSize = Notifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
