// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showMiniMapHash() => r'b82ead444cd9748a7d5f3c5ea55668fef41010fd';

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
String _$miniMapControllerHash() => r'004a44e3e7f94e0004cba26f0d0bf1d651196aa0';

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
    r'1316d97e0555b0fa03ea0993ff99461527f3f183';

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
    r'71a5bbb2de89e41df811320f98fe21f8725ede40';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
