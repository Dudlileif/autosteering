// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sortedCountryLayersHash() =>
    r'f6a4d6918f88c9d7f664c919e1701b98c8e513fa';

/// The selected country layers sorted by their index in the available layers
/// list.
///
/// Copied from [sortedCountryLayers].
@ProviderFor(sortedCountryLayers)
final sortedCountryLayersProvider =
    AutoDisposeProvider<List<TileLayerData>>.internal(
  sortedCountryLayers,
  name: r'sortedCountryLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sortedCountryLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SortedCountryLayersRef = AutoDisposeProviderRef<List<TileLayerData>>;
String _$currentCountryHash() => r'888e1aa0449805c4a52241f6abc55a7db5e5bc0d';

/// A provider fort showing the country we are currently in, if the country
/// has defined custom map layers.
///
/// Can check the current location by querying the OSM servers.
///
/// Copied from [CurrentCountry].
@ProviderFor(CurrentCountry)
final currentCountryProvider =
    AutoDisposeNotifierProvider<CurrentCountry, Country?>.internal(
  CurrentCountry.new,
  name: r'currentCountryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCountryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentCountry = AutoDisposeNotifier<Country?>;
String _$availableCountryLayersHash() =>
    r'6ba57f2f132153fa6f1e20f2b30d1654a3e80cc3';

/// A provider that contains all the custom layers available for the
/// [CurrentCountry].
///
/// Copied from [AvailableCountryLayers].
@ProviderFor(AvailableCountryLayers)
final availableCountryLayersProvider = AutoDisposeNotifierProvider<
    AvailableCountryLayers, List<TileLayerData>>.internal(
  AvailableCountryLayers.new,
  name: r'availableCountryLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableCountryLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AvailableCountryLayers = AutoDisposeNotifier<List<TileLayerData>>;
String _$enabledCountryLayersHash() =>
    r'4316e4576051d9aaad2d8ae4f1928412c885aac2';

/// A set of the current selction of custom layers for the [CurrentCountry].
///
/// Copied from [EnabledCountryLayers].
@ProviderFor(EnabledCountryLayers)
final enabledCountryLayersProvider = AutoDisposeNotifierProvider<
    EnabledCountryLayers, Set<TileLayerData>>.internal(
  EnabledCountryLayers.new,
  name: r'enabledCountryLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enabledCountryLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnabledCountryLayers = AutoDisposeNotifier<Set<TileLayerData>>;
String _$countryLayerOpacitiesHash() =>
    r'9167dfad3a889b3782ba872ef1c7815bc3564717';

/// A map of the available country layers and their opacities, which can be
/// specified.
///
/// Copied from [CountryLayerOpacities].
@ProviderFor(CountryLayerOpacities)
final countryLayerOpacitiesProvider = AutoDisposeNotifierProvider<
    CountryLayerOpacities, Map<String, double>>.internal(
  CountryLayerOpacities.new,
  name: r'countryLayerOpacitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countryLayerOpacitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CountryLayerOpacities = AutoDisposeNotifier<Map<String, double>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
