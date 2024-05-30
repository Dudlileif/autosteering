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

import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sentinel_providers.g.dart';

/// A provider for the Sentinel Dataspace instance id.
@riverpod
class CopernicusInstanceId extends _$CopernicusInstanceId {
  @override
  String? build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.mapCopernicusInstanceId, next);
      }
    });

    return ref
        .read(settingsProvider.notifier)
        .getString(SettingsKey.mapCopernicusInstanceId);
  }

  /// Update the [state] to [value].
  void update(String? value) => Future(() => state = value);
}

/// A provider for the available Sentinel layers.
@riverpod
class AvailableSentinelLayers extends _$AvailableSentinelLayers {
  @override
  List<SentinelLayer> build() {
    final instanceId = ref.watch(copernicusInstanceIdProvider);

    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null && previous != next && instanceId != null) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.mapLayersSentinelSorted,
              next.map((e) => e.layerType.id).toList(),
            );
      }
    });

    if (instanceId != null) {
      if (ref
          .read(settingsProvider.notifier)
          .containsKey(SettingsKey.mapLayersSentinelSorted)) {
        final layerList = ref
            .read(settingsProvider.notifier)
            .getList(SettingsKey.mapLayersSentinelSorted)!;

        return List<String>.from(layerList)
            .map(
              (layerId) => SentinelLayer(
                instanceId: instanceId,
                layerType: SentinelLayerType.values
                    .firstWhere((element) => element.id == layerId),
              ),
            )
            .toList();
      }

      return SentinelLayerType.values
          .map(
            (layerType) => SentinelLayer(
              instanceId: instanceId,
              layerType: layerType,
            ),
          )
          .toList();
    }
    return [];
  }

  /// Reorders the item at [oldIndex] to [newIndex].
  void reorder(int oldIndex, int newIndex) => Future(() {
        var moveTo = newIndex;
        if (oldIndex < newIndex) {
          moveTo -= 1;
        }
        final layer = state.removeAt(oldIndex);
        state = List<SentinelLayer>.from(state)..insert(moveTo, layer);
      });

  @override
  bool updateShouldNotify(
    List<SentinelLayer> previous,
    List<SentinelLayer> next,
  ) =>
      true;
}

/// A provider for the max level of cloud coverage that the Sentinel layers
/// should query for.
@riverpod
class SentinelMaxCloudCoveragePercent
    extends _$SentinelMaxCloudCoveragePercent {
  @override
  double build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.mapSentinelMaxCloudCoveragePercent, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getDouble(SettingsKey.mapSentinelMaxCloudCoveragePercent) ??
        20;
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the set of selected Sentinel layers.
@riverpod
class EnabledSentinelLayers extends _$EnabledSentinelLayers {
  @override
  Set<SentinelLayer> build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.mapLayersSentinelEnabled,
              next.map((e) => e.layerType.id).toList(),
            );
      }
    });

    final layers = <SentinelLayer>{};

    final instanceId = ref.watch(copernicusInstanceIdProvider);
    if (instanceId != null) {
      if (ref
          .read(settingsProvider.notifier)
          .containsKey(SettingsKey.mapLayersSentinelEnabled)) {
        final layerList = ref
            .read(settingsProvider.notifier)
            .getList(SettingsKey.mapLayersSentinelEnabled)!;

        for (final layerId in List<String>.from(layerList)) {
          final layerType = SentinelLayerType.values
              .firstWhereOrNull((element) => element.id == layerId);
          if (layerType != null) {
            layers.add(
              SentinelLayer(instanceId: instanceId, layerType: layerType),
            );
          }
        }
      }
    }

    return layers;
  }

  /// Add the [layer] to the [state].
  void add(SentinelLayer layer) => Future(
        () => state = Set<SentinelLayer>.from(state)..add(layer),
      );

  /// Remove the [layer] from the [state].
  void remove(SentinelLayer layer) => Future(
        () => state = Set<SentinelLayer>.from(state)
          ..removeWhere((element) => element.layerType == layer.layerType),
      );

  /// Add the [layer] to the [state] if it's missing or remove it if it's
  /// already in the [state].
  void toggle(SentinelLayer layer) {
    final layerExists =
        state.any((element) => element.layerType == layer.layerType);
    if (layerExists) {
      remove(layer);
    } else {
      add(layer);
    }
  }

  /// Remove all the layers from the [state].
  void clear() => Future(() => state = {});

  @override
  bool updateShouldNotify(
    Set<SentinelLayer> previous,
    Set<SentinelLayer> next,
  ) =>
      true;
}

/// A map for the Sentinel layers and their opacities, which can be specified.
@riverpod
class SentinelLayerOpacities extends _$SentinelLayerOpacities {
  Timer? _saveToSettingsTimer;

  @override
  Map<SentinelLayerType, double> build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null) {
        if (!const DeepCollectionEquality().equals(previous, next)) {
          _saveToSettingsTimer?.cancel();
          _saveToSettingsTimer = Timer(
            const Duration(seconds: 1),
            () => ref.read(settingsProvider.notifier).update(
                  SettingsKey.mapLayersSentinelOpacities,
                  next.map<String, double>(
                    (key, value) => MapEntry(key.id, value),
                  )..removeWhere((key, value) => value == 0.5),
                ),
          );
        }
      }
    });

    final layers = {for (final layer in SentinelLayerType.values) layer: 0.5};

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.mapLayersSentinelOpacities)) {
      final layerMap = ref
          .read(settingsProvider.notifier)
          .getMap(SettingsKey.mapLayersSentinelOpacities)!;
      Map<String, double>.from(layerMap).forEach((key, value) {
        final layerType = SentinelLayerType.values
            .firstWhereOrNull((element) => element.id == key);
        if (layerType != null) {
          layers[layerType] = value;
        }
      });
    }

    return layers;
  }

  /// Update the [opacity] for the given [layer].
  void update(SentinelLayerType layer, double opacity) => Future(
        () => state = Map<SentinelLayerType, double>.from(state)
          ..update(layer, (value) => opacity),
      );

  /// Reset the [state] to the initial value by recreating it.
  void reset() => ref.invalidateSelf();

  @override
  bool updateShouldNotify(
    Map<SentinelLayerType, double> previous,
    Map<SentinelLayerType, double> next,
  ) =>
      true;
}
