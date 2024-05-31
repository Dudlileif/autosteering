// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showMiniMapHash() => r'489b0f4ea6a29f5cd976e1085fd1258bf081f872';

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
    r'2cc95a43066ca0a447389424a40a831637646b7f';

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
    r'ec759ea3aef81d55ad98ff7b552974c7a3008c85';

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
String _$miniMapSizeHash() => r'e18b3a58783be66b3042a5f2618cc8faeed697f1';

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
