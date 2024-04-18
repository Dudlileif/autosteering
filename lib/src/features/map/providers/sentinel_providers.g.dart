// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentinel_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$copernicusInstanceIdHash() =>
    r'ddc4f4f0364bdce963a3e76dc7e90832959977d0';

/// A provider for the Sentinel Dataspace instance id.
///
/// Copied from [CopernicusInstanceId].
@ProviderFor(CopernicusInstanceId)
final copernicusInstanceIdProvider =
    AutoDisposeNotifierProvider<CopernicusInstanceId, String?>.internal(
  CopernicusInstanceId.new,
  name: r'copernicusInstanceIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$copernicusInstanceIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CopernicusInstanceId = AutoDisposeNotifier<String?>;
String _$availableSentinelLayersHash() =>
    r'39db3ad3fcd343727a6a20805aa1b962654dbab9';

/// A provider for the available Sentinel layers.
///
/// Copied from [AvailableSentinelLayers].
@ProviderFor(AvailableSentinelLayers)
final availableSentinelLayersProvider = AutoDisposeNotifierProvider<
    AvailableSentinelLayers, List<SentinelLayer>>.internal(
  AvailableSentinelLayers.new,
  name: r'availableSentinelLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableSentinelLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AvailableSentinelLayers = AutoDisposeNotifier<List<SentinelLayer>>;
String _$sentinelMaxCloudCoveragePercentHash() =>
    r'9f440d06accdd0a566ac2657080060a3e5587a8d';

/// A provider for the max level of cloud coverage that the Sentinel layers
/// should query for.
///
/// Copied from [SentinelMaxCloudCoveragePercent].
@ProviderFor(SentinelMaxCloudCoveragePercent)
final sentinelMaxCloudCoveragePercentProvider = AutoDisposeNotifierProvider<
    SentinelMaxCloudCoveragePercent, double>.internal(
  SentinelMaxCloudCoveragePercent.new,
  name: r'sentinelMaxCloudCoveragePercentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sentinelMaxCloudCoveragePercentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SentinelMaxCloudCoveragePercent = AutoDisposeNotifier<double>;
String _$enabledSentinelLayersHash() =>
    r'6070ce50d84395687808f893f8eb8bd6ff2a6f94';

/// A provider for the set of selected Sentinel layers.
///
/// Copied from [EnabledSentinelLayers].
@ProviderFor(EnabledSentinelLayers)
final enabledSentinelLayersProvider = AutoDisposeNotifierProvider<
    EnabledSentinelLayers, Set<SentinelLayer>>.internal(
  EnabledSentinelLayers.new,
  name: r'enabledSentinelLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enabledSentinelLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnabledSentinelLayers = AutoDisposeNotifier<Set<SentinelLayer>>;
String _$sentinelLayerOpacitiesHash() =>
    r'f64bd81c470e4871fc5c824d33de9eddaf7565be';

/// A map for the Sentinel layers and their opacities, which can be specified.
///
/// Copied from [SentinelLayerOpacities].
@ProviderFor(SentinelLayerOpacities)
final sentinelLayerOpacitiesProvider = AutoDisposeNotifierProvider<
    SentinelLayerOpacities, Map<SentinelLayerType, double>>.internal(
  SentinelLayerOpacities.new,
  name: r'sentinelLayerOpacitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sentinelLayerOpacitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SentinelLayerOpacities
    = AutoDisposeNotifier<Map<SentinelLayerType, double>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
