// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showMiniMapHash() => r'9fada958c4a57d796e52cef45c3ad98dcc44dac7';

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
    r'f17f3bdf15c4d5cea18e3bafbc9a3b634b33c73d';

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
String _$miniMapSizeHash() => r'1946e3b3523b482a98084e3394cdfff002a77e96';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
