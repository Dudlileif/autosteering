// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentinel_provders.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sentinelInstanceIdHash() =>
    r'2df91878eb3536ade9ab1de22b1801570fc273b7';

/// See also [SentinelInstanceId].
@ProviderFor(SentinelInstanceId)
final sentinelInstanceIdProvider =
    NotifierProvider<SentinelInstanceId, String?>.internal(
  SentinelInstanceId.new,
  name: r'sentinelInstanceIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sentinelInstanceIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SentinelInstanceId = Notifier<String?>;
String _$availableSentinelLayersHash() =>
    r'7bf62de8a9d66ed26fb2faf6564951e4e72413a8';

/// See also [AvailableSentinelLayers].
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

/// See also [SentinelMaxCloudCoveragePercent].
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
String _$selectedSentinelLayersHash() =>
    r'910f4f783d730729884fcdd0cc3c8ddf09fdc09d';

/// See also [SelectedSentinelLayers].
@ProviderFor(SelectedSentinelLayers)
final selectedSentinelLayersProvider =
    NotifierProvider<SelectedSentinelLayers, Set<SentinelLayer>>.internal(
  SelectedSentinelLayers.new,
  name: r'selectedSentinelLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedSentinelLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedSentinelLayers = Notifier<Set<SentinelLayer>>;
String _$sentinelLayerOpacitiesHash() =>
    r'133600f24775b6062e2c828f01d4ff4b60d93327';

/// See also [SentinelLayerOpacities].
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
