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
String _$currentCountryHash() => r'b4e1485b70d819f76f000649a529f08cad697fc0';

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
    r'4dc452083bdeb44bb635faac383b3689691dcea8';

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
String _$enabledCountryLayersHash() =>
    r'f919be9712abeef57d130c40107bea4dfccfd6a3';

/// A set of the current selction of custom layers for the [CurrentCountry].
///
/// Copied from [EnabledCountryLayers].
@ProviderFor(EnabledCountryLayers)
final enabledCountryLayersProvider =
    NotifierProvider<EnabledCountryLayers, Set<TileLayerData>>.internal(
  EnabledCountryLayers.new,
  name: r'enabledCountryLayersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enabledCountryLayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnabledCountryLayers = Notifier<Set<TileLayerData>>;
String _$countryLayerOpacitiesHash() =>
    r'a7cd4c867af5b365932975fc477358a4389915cd';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
