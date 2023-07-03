import 'dart:convert';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'country_providers.g.dart';

/// A provider fort showing the country we are currently in, if the country
/// has defined custom map layers.
///
/// Can check the current location by querying the OSM servers.
@Riverpod(keepAlive: true)
class CurrentCountry extends _$CurrentCountry {
  @override
  Country? build() {
    update();
    return null;
  }

  Future<void> update() async => Future(() async {
        if (ref.watch(mapReadyProvider)) {
          if (state == null) {
            final dio = Dio();
            final position = ref.watch(
              mainMapControllerProvider
                  .select((controller) => controller.center),
            );
            final response = await dio.get<String>(
              'https://nominatim.openstreetmap.org/reverse.php',
              queryParameters: {
                'lat': position.latitude,
                'lon': position.longitude,
                'zoom': 3,
                'accept-language': 'en',
                'format': 'jsonv2',
              },
            );

            if (response.data != null) {
              final data =
                  Map<String, dynamic>.from(jsonDecode(response.data!) as Map);
              if (data.containsKey('name')) {
                final name = data['name'] as String;
                state = Countries.current(name);
                if (state == null) {
                  ref.read(showOSMLayerProvider.notifier).update(value: true);
                  ref.read(selectedCountryLayersProvider.notifier).clear();
                }
              } else if (data.containsKey('error')) {
                await update();
              }
            }
          }
        }
      });
}

/// A provider that contains all the custom layers available for the
/// [CurrentCountry].
@Riverpod(keepAlive: true)
class AvailableCountryLayers extends _$AvailableCountryLayers {
  @override
  List<TileLayerData> build() {
    final country = ref.watch(currentCountryProvider);
    if (country != null) {
      return [...country.availableLayers];
    }
    return [];
  }

  void reorder(int oldIndex, int newIndex) => Future(() {
        var moveTo = newIndex;
        if (oldIndex < newIndex) {
          moveTo -= 1;
        }
        final layer = state.removeAt(oldIndex);
        state = state..insert(moveTo, layer);
      });

  @override
  bool updateShouldNotify(
    List<TileLayerData> previous,
    List<TileLayerData> next,
  ) =>
      true;
}

/// A set of the current selction of custom layers for the [CurrentCountry].
@Riverpod(keepAlive: true)
class SelectedCountryLayers extends _$SelectedCountryLayers {
  @override
  Set<TileLayerData> build() => <TileLayerData>{};

  void add(TileLayerData layer) => Future(
        () => state = state..add(layer),
      );
  void remove(TileLayerData layer) => Future(
        () =>
            state = state..removeWhere((element) => element.name == layer.name),
      );

  void toggle(TileLayerData layer) {
    final layerExists = state.any((element) => element.name == layer.name);
    if (layerExists) {
      remove(layer);
    } else {
      add(layer);
    }
  }

  void clear() => Future(() => state = {});

  @override
  bool updateShouldNotify(
    Set<TileLayerData> previous,
    Set<TileLayerData> next,
  ) =>
      true;
}

/// The selected country layers sorted by their index in the available layers
/// list.
@riverpod
List<TileLayerData> sortedCountryLayers(SortedCountryLayersRef ref) {
  final availableLayers = ref.watch(availableCountryLayersProvider);

  return ref.watch(selectedCountryLayersProvider).sorted(
        (key1, key2) => availableLayers
            .indexOf(key2)
            .compareTo(availableLayers.indexOf(key1)),
      );
}

/// A map of the available country layers and their opacities, which can be
/// specified.
@Riverpod(keepAlive: true)
class CountryLayerOpacities extends _$CountryLayerOpacities {
  @override
  Map<String, double> build() {
    final country = ref.watch(currentCountryProvider);
    final availableLayers = country?.availableLayers ?? [];

    return {for (final layer in availableLayers) layer.name: 0.5};
  }

  void update(TileLayerData layer, double opacity) => Future(
        () => state = state..update(layer.name, (value) => opacity),
      );

  void reset() => ref.invalidateSelf();

  @override
  bool updateShouldNotify(
    Map<String, double> previous,
    Map<String, double> next,
  ) =>
      true;
}
