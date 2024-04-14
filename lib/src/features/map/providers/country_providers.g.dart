// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sortedCountryLayersHash() =>
    r'9ce56f5047c67017fcacf0d53ff311f3dc38982c';

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

typedef SortedCountryLayersRef = AutoDisposeProviderRef<List<TileLayerData>>;
String _$currentCountryHash() => r'6f5b0a23c75961e95561f96a3bf6ebad644d0439';

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
    r'125e130f5608bb888d3e6ff34e297632391b7e77';

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
    r'86ded5316bdde2b7def9ad1d207ae7c9d3f162b2';

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
    r'96566d3294b321931bebe1407b166ad934306bff';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
