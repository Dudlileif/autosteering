import 'dart:convert';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
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
    ref.listenSelf(
      (previous, next) {
        if (next != previous) {
          ref
              .read(settingsProvider.notifier)
              .update(SettingsKey.currentCountry, next?.name);
        }
      },
    );
    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.currentCountry)) {
      final name = ref.read(settingsProvider)[SettingsKey.currentCountry.name];
      if (name != null) {
        final country = Countries.current(name as String);
        if (country != null) {
          return country;
        }
      }
    }
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
                  ref.read(enabledCountryLayersProvider.notifier).clear();
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
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.sortedAvailableCountryLayers,
              next.map((e) => e.name).toList(),
            );
      }
    });

    final country = ref.watch(currentCountryProvider);
    if (country != null) {
      if (ref
          .read(settingsProvider.notifier)
          .containsKey(SettingsKey.sortedAvailableCountryLayers)) {
        final layerList = ref
            .read(settingsProvider.notifier)
            .getList(SettingsKey.sortedAvailableCountryLayers)!;

        return List<String>.from(layerList)
            .map(
              (layerName) => country.availableLayers
                  .firstWhere((element) => element.name == layerName),
            )
            .toList();
      }

      return List.from(country.availableLayers);
    }
    return [];
  }

  void reorder(int oldIndex, int newIndex) => Future(() {
        var moveTo = newIndex;
        if (oldIndex < newIndex) {
          moveTo -= 1;
        }
        final layer = state.removeAt(oldIndex);
        state = List<TileLayerData>.from(state)..insert(moveTo, layer);
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
class EnabledCountryLayers extends _$EnabledCountryLayers {
  @override
  Set<TileLayerData> build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.enabledCountryLayers,
              next.map((e) => e.name).toList(),
            );
      }
    });

    final layers = <TileLayerData>{};

    final country = ref.watch(currentCountryProvider);
    if (country != null) {
      if (ref
          .read(settingsProvider.notifier)
          .containsKey(SettingsKey.enabledCountryLayers)) {
        final countryList = ref
            .read(settingsProvider.notifier)
            .getList(SettingsKey.enabledCountryLayers)!;

        for (final name in List<String>.from(countryList)) {
          final layer = country.layer(name);
          if (layer != null) {
            layers.add(layer);
          }
        }
      }
    }

    return layers;
  }

  void add(TileLayerData layer) => Future(
        () => state = Set<TileLayerData>.from(state)..add(layer),
      );
  void remove(TileLayerData layer) => Future(
        () => state = Set<TileLayerData>.from(state)
          ..removeWhere((element) => element.name == layer.name),
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

  return ref.watch(enabledCountryLayersProvider).sorted(
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
    ref.listenSelf((previous, next) {
      ref.read(settingsProvider.notifier).update(
            SettingsKey.countryLayersOpacities,
            Map<String, double>.from(next)
              ..removeWhere((key, value) => value == 0.5),
          );
    });

    final country = ref.watch(currentCountryProvider);
    final availableLayers = country?.availableLayers ?? [];

    final layers = {for (final layer in availableLayers) layer.name: 0.5};

    if (country != null) {
      if (ref
          .read(settingsProvider.notifier)
          .containsKey(SettingsKey.countryLayersOpacities)) {
        final countryMap = ref
            .read(settingsProvider.notifier)
            .getMap(SettingsKey.countryLayersOpacities)!;

        Map<String, double>.from(countryMap).forEach((name, opacity) {
          final layer = country.layer(name);
          if (layer != null) {
            layers[layer.name] = opacity;
          }
        });
      }
    }

    return layers;
  }

  void update(TileLayerData layer, double opacity) => Future(
        () => state = Map<String, double>.from(state)
          ..update(layer.name, (value) => opacity),
      );

  void reset() => ref.invalidateSelf();

  @override
  bool updateShouldNotify(
    Map<String, double> previous,
    Map<String, double> next,
  ) =>
      !const DeepCollectionEquality().equals(previous, next);
}
