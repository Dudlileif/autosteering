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

import 'dart:async';
import 'dart:convert';

import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/settings/settings.dart';
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
              .update(SettingsKey.mapCurrentCountry, next?.name);
        }
      },
    );
    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.mapCurrentCountry)) {
      final name =
          ref.read(settingsProvider)[SettingsKey.mapCurrentCountry.name];
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

  /// Attempt to find a country for the current map center position.
  Future<void> update() async => Future(() async {
        if (ref.watch(mapReadyProvider)) {
          if (state == null) {
            final dio = Dio();
            final position = ref.watch(
              mainMapControllerProvider
                  .select((controller) => controller.camera.center),
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
              SettingsKey.mapLayersCountrySorted,
              next.map((e) => e.name).toList(),
            );
      }
    });

    final country = ref.watch(currentCountryProvider);
    if (country != null) {
      if (ref
          .read(settingsProvider.notifier)
          .containsKey(SettingsKey.mapLayersCountrySorted)) {
        final layerList = ref
            .read(settingsProvider.notifier)
            .getList(SettingsKey.mapLayersCountrySorted)!;

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

  /// Reorder the item at [oldIndex] to [newIndex].
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
              SettingsKey.mapLayersCountryEnabled,
              next.map((e) => e.name).toList(),
            );
      }
    });

    final layers = <TileLayerData>{};

    final country = ref.watch(currentCountryProvider);
    if (country != null) {
      if (ref
          .read(settingsProvider.notifier)
          .containsKey(SettingsKey.mapLayersCountryEnabled)) {
        final countryList = ref
            .read(settingsProvider.notifier)
            .getList(SettingsKey.mapLayersCountryEnabled)!;

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

  /// Add the [layer] to the [state]-
  void add(TileLayerData layer) => Future(
        () => state = Set<TileLayerData>.from(state)..add(layer),
      );

  /// Remvoe the [layer] from the [state].
  void remove(TileLayerData layer) => Future(
        () => state = Set<TileLayerData>.from(state)
          ..removeWhere((element) => element.name == layer.name),
      );

  /// Add the [layer] to the [state] if it's missing or remove it if it's
  /// already in the [state].
  void toggle(TileLayerData layer) {
    final layerExists = state.any((element) => element.name == layer.name);
    if (layerExists) {
      remove(layer);
    } else {
      add(layer);
    }
  }

  /// Remove all the layers from the state.
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
  Timer? _saveToSettingsTimer;

  @override
  Map<String, double> build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        if (!const DeepCollectionEquality().equals(previous, next)) {
          _saveToSettingsTimer?.cancel();
          _saveToSettingsTimer = Timer(
            const Duration(seconds: 1),
            () => ref.read(settingsProvider.notifier).update(
                  SettingsKey.mapLayersCountryOpacities,
                  Map<String, double>.from(next)
                    ..removeWhere((key, value) => value == 0.5),
                ),
          );
        }
      }
    });

    final country = ref.watch(currentCountryProvider);
    final availableLayers = country?.availableLayers ?? [];

    final layers = {for (final layer in availableLayers) layer.name: 0.5};

    if (country != null) {
      if (ref
          .read(settingsProvider.notifier)
          .containsKey(SettingsKey.mapLayersCountryOpacities)) {
        final countryMap = ref
            .read(settingsProvider.notifier)
            .getMap(SettingsKey.mapLayersCountryOpacities)!;

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

  /// Update the [opacity] for the given [layer].
  void update(TileLayerData layer, double opacity) => Future(
        () => state = Map<String, double>.from(state)
          ..update(layer.name, (value) => opacity),
      );

  /// Reset the [state] to the initial value by recreating it.
  void reset() => ref.invalidateSelf();

  @override
  bool updateShouldNotify(
    Map<String, double> previous,
    Map<String, double> next,
  ) =>
      !const DeepCollectionEquality().equals(previous, next);
}
