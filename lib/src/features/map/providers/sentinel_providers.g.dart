// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentinel_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$copernicusInstanceIdHash() =>
    r'0a1e6f470a8443ceed23cc711bf09573fcec32ce';

/// A provider for the Sentinel Dataspace instance id.
///
/// Copied from [CopernicusInstanceId].
@ProviderFor(CopernicusInstanceId)
final copernicusInstanceIdProvider =
    NotifierProvider<CopernicusInstanceId, String?>.internal(
  CopernicusInstanceId.new,
  name: r'copernicusInstanceIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$copernicusInstanceIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CopernicusInstanceId = Notifier<String?>;
String _$availableSentinelLayersHash() =>
    r'e54c0aefca7d5e1309260b740cbd2397ea1cc1b3';

/// A provider for the available Sentinel layers.
///
/// Copied from [AvailableSentinelLayers].
@ProviderFor(AvailableSentinelLayers)
final availableSentinelLayersProvider =
    NotifierProvider<AvailableSentinelLayers, List<SentinelLayer>>.internal(
  AvailableSentinelLayers.new,
  name: r'availableSentinelLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableSentinelLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AvailableSentinelLayers = Notifier<List<SentinelLayer>>;
String _$sentinelMaxCloudCoveragePercentHash() =>
    r'1dff6c54679fabeb5fe660d40081e8054fc8e9cc';

/// A provider for the max level of cloud coverage that the Sentinel layers
/// should query for.
///
/// Copied from [SentinelMaxCloudCoveragePercent].
@ProviderFor(SentinelMaxCloudCoveragePercent)
final sentinelMaxCloudCoveragePercentProvider =
    NotifierProvider<SentinelMaxCloudCoveragePercent, double>.internal(
  SentinelMaxCloudCoveragePercent.new,
  name: r'sentinelMaxCloudCoveragePercentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sentinelMaxCloudCoveragePercentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SentinelMaxCloudCoveragePercent = Notifier<double>;
String _$enabledSentinelLayersHash() =>
    r'5cd9eb2132a9573e8834b563f6563c8d1cf82837';

/// A provider for the set of selected Sentinel layers.
///
/// Copied from [EnabledSentinelLayers].
@ProviderFor(EnabledSentinelLayers)
final enabledSentinelLayersProvider =
    NotifierProvider<EnabledSentinelLayers, Set<SentinelLayer>>.internal(
  EnabledSentinelLayers.new,
  name: r'enabledSentinelLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enabledSentinelLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnabledSentinelLayers = Notifier<Set<SentinelLayer>>;
String _$sentinelLayerOpacitiesHash() =>
    r'45e4ee42a89e5167fb49727d1f0bc4c56276032e';

/// A map for the Sentinel layers and their opacities, which can be specified.
///
/// Copied from [SentinelLayerOpacities].
@ProviderFor(SentinelLayerOpacities)
final sentinelLayerOpacitiesProvider = NotifierProvider<SentinelLayerOpacities,
    Map<SentinelLayerType, double>>.internal(
  SentinelLayerOpacities.new,
  name: r'sentinelLayerOpacitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sentinelLayerOpacitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SentinelLayerOpacities = Notifier<Map<SentinelLayerType, double>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions