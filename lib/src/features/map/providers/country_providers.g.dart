// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

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
String _$currentCountryHash() => r'082612c2647e2abb2ce483dde9c9391ab9163dab';

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
    r'd0730bb4a9eda773043017382e4b866334be5fb1';

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
    r'ac3ed79ec6b25024c39da4f65df3e613fdd05e87';

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
    r'88510f313e7d4573af8bff064b7d01393af081b5';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
