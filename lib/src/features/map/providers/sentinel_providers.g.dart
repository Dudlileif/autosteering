// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentinel_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$copernicusInstanceIdHash() =>
    r'97ddf17211c226eb72fdb080718fb05204cb26fa';

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
    r'db4a46125443ed994b7eb8420afc2ff0d97b3819';

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
    r'b966dbe264051389c049e0834e0d4cdcb398ab69';

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
    r'bee60205b8ed030f2a8146c71d0aeeff7001fd63';

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
    r'729dfb09620f667171fa36234731ce13f1314033';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
