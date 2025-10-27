// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider fort showing the country we are currently in, if the country
/// has defined custom map layers.
///
/// Can check the current location by querying the OSM servers.

@ProviderFor(CurrentCountry)
const currentCountryProvider = CurrentCountryProvider._();

/// A provider fort showing the country we are currently in, if the country
/// has defined custom map layers.
///
/// Can check the current location by querying the OSM servers.
final class CurrentCountryProvider
    extends $NotifierProvider<CurrentCountry, Country?> {
  /// A provider fort showing the country we are currently in, if the country
  /// has defined custom map layers.
  ///
  /// Can check the current location by querying the OSM servers.
  const CurrentCountryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentCountryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentCountryHash();

  @$internal
  @override
  CurrentCountry create() => CurrentCountry();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Country? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Country?>(value),
    );
  }
}

String _$currentCountryHash() => r'da6c317825d446c5f270175df0c6284659d2936c';

/// A provider fort showing the country we are currently in, if the country
/// has defined custom map layers.
///
/// Can check the current location by querying the OSM servers.

abstract class _$CurrentCountry extends $Notifier<Country?> {
  Country? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Country?, Country?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Country?, Country?>,
              Country?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider that contains all the custom layers available for the
/// [CurrentCountry].

@ProviderFor(AvailableCountryLayers)
const availableCountryLayersProvider = AvailableCountryLayersProvider._();

/// A provider that contains all the custom layers available for the
/// [CurrentCountry].
final class AvailableCountryLayersProvider
    extends $NotifierProvider<AvailableCountryLayers, List<TileLayerData>> {
  /// A provider that contains all the custom layers available for the
  /// [CurrentCountry].
  const AvailableCountryLayersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'availableCountryLayersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$availableCountryLayersHash();

  @$internal
  @override
  AvailableCountryLayers create() => AvailableCountryLayers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TileLayerData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TileLayerData>>(value),
    );
  }
}

String _$availableCountryLayersHash() =>
    r'6ba57f2f132153fa6f1e20f2b30d1654a3e80cc3';

/// A provider that contains all the custom layers available for the
/// [CurrentCountry].

abstract class _$AvailableCountryLayers extends $Notifier<List<TileLayerData>> {
  List<TileLayerData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<TileLayerData>, List<TileLayerData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<TileLayerData>, List<TileLayerData>>,
              List<TileLayerData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A set of the current selction of custom layers for the [CurrentCountry].

@ProviderFor(EnabledCountryLayers)
const enabledCountryLayersProvider = EnabledCountryLayersProvider._();

/// A set of the current selction of custom layers for the [CurrentCountry].
final class EnabledCountryLayersProvider
    extends $NotifierProvider<EnabledCountryLayers, Set<TileLayerData>> {
  /// A set of the current selction of custom layers for the [CurrentCountry].
  const EnabledCountryLayersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enabledCountryLayersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enabledCountryLayersHash();

  @$internal
  @override
  EnabledCountryLayers create() => EnabledCountryLayers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<TileLayerData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<TileLayerData>>(value),
    );
  }
}

String _$enabledCountryLayersHash() =>
    r'4316e4576051d9aaad2d8ae4f1928412c885aac2';

/// A set of the current selction of custom layers for the [CurrentCountry].

abstract class _$EnabledCountryLayers extends $Notifier<Set<TileLayerData>> {
  Set<TileLayerData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<TileLayerData>, Set<TileLayerData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<TileLayerData>, Set<TileLayerData>>,
              Set<TileLayerData>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// The selected country layers sorted by their index in the available layers
/// list.

@ProviderFor(sortedCountryLayers)
const sortedCountryLayersProvider = SortedCountryLayersProvider._();

/// The selected country layers sorted by their index in the available layers
/// list.

final class SortedCountryLayersProvider
    extends
        $FunctionalProvider<
          List<TileLayerData>,
          List<TileLayerData>,
          List<TileLayerData>
        >
    with $Provider<List<TileLayerData>> {
  /// The selected country layers sorted by their index in the available layers
  /// list.
  const SortedCountryLayersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortedCountryLayersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortedCountryLayersHash();

  @$internal
  @override
  $ProviderElement<List<TileLayerData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<TileLayerData> create(Ref ref) {
    return sortedCountryLayers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TileLayerData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TileLayerData>>(value),
    );
  }
}

String _$sortedCountryLayersHash() =>
    r'f6a4d6918f88c9d7f664c919e1701b98c8e513fa';

/// A map of the available country layers and their opacities, which can be
/// specified.

@ProviderFor(CountryLayerOpacities)
const countryLayerOpacitiesProvider = CountryLayerOpacitiesProvider._();

/// A map of the available country layers and their opacities, which can be
/// specified.
final class CountryLayerOpacitiesProvider
    extends $NotifierProvider<CountryLayerOpacities, Map<String, double>> {
  /// A map of the available country layers and their opacities, which can be
  /// specified.
  const CountryLayerOpacitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countryLayerOpacitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countryLayerOpacitiesHash();

  @$internal
  @override
  CountryLayerOpacities create() => CountryLayerOpacities();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, double> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, double>>(value),
    );
  }
}

String _$countryLayerOpacitiesHash() =>
    r'9167dfad3a889b3782ba872ef1c7815bc3564717';

/// A map of the available country layers and their opacities, which can be
/// specified.

abstract class _$CountryLayerOpacities extends $Notifier<Map<String, double>> {
  Map<String, double> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<String, double>, Map<String, double>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, double>, Map<String, double>>,
              Map<String, double>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
