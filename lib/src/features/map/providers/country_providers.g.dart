// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentCountryHash() => r'e674d2f08e41fc881509fba4fd304057ca66a552';

/// A provider fort showing the country we are currently in, if the country
/// has defined custom map layers.
///
/// Can check the current location by querying the OSM servers.
///
/// Copied from [CurrentCountry].
@ProviderFor(CurrentCountry)
final currentCountryProvider =
    NotifierProvider<CurrentCountry, Country?>.internal(
  CurrentCountry.new,
  name: r'currentCountryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCountryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentCountry = Notifier<Country?>;
String _$availableCountryLayersHash() =>
    r'558c96a7495d3d83408e41446eff9af46073a47b';

/// A provider that contains all the custom layers available for the
/// [CurrentCountry].
///
/// Copied from [AvailableCountryLayers].
@ProviderFor(AvailableCountryLayers)
final availableCountryLayersProvider =
    NotifierProvider<AvailableCountryLayers, List<TileLayerData>>.internal(
  AvailableCountryLayers.new,
  name: r'availableCountryLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableCountryLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AvailableCountryLayers = Notifier<List<TileLayerData>>;
String _$selectedCountryLayersHash() =>
    r'f1542b4e5e1a4fe0c67f4f9a2d14bc50f223ace1';

/// A set of the current selction of custom layers for the [CurrentCountry].
///
/// Copied from [SelectedCountryLayers].
@ProviderFor(SelectedCountryLayers)
final selectedCountryLayersProvider =
    NotifierProvider<SelectedCountryLayers, Set<TileLayerData>>.internal(
  SelectedCountryLayers.new,
  name: r'selectedCountryLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCountryLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCountryLayers = Notifier<Set<TileLayerData>>;
String _$countryLayerOpacitiesHash() =>
    r'8e5035439847e8333b010ad9c41eeb81d4e74a94';

/// A map of the available country layers and their opacities, which can be
/// specified.
///
/// Copied from [CountryLayerOpacities].
@ProviderFor(CountryLayerOpacities)
final countryLayerOpacitiesProvider =
    NotifierProvider<CountryLayerOpacities, Map<String, double>>.internal(
  CountryLayerOpacities.new,
  name: r'countryLayerOpacitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countryLayerOpacitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CountryLayerOpacities = Notifier<Map<String, double>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
