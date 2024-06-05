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

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enabled_map_layers_providers.g.dart';

/// Whether the OpenStreetMap layer should be shown.
@riverpod
class ShowOSMLayer extends _$ShowOSMLayer {
  @override
  bool build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.mapLayersShowOpenStreetMap, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.mapLayersShowOpenStreetMap) ??
        true;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether the selected country layers should be shown.
@riverpod
bool showCountryLayers(ShowCountryLayersRef ref) =>
    ref.watch(enabledCountryLayersProvider.select((value) => value.isNotEmpty));

/// Whether the selected Sentinel layers should be shown.
@riverpod
bool showSentinelLayers(ShowSentinelLayersRef ref) => ref
    .watch(enabledSentinelLayersProvider.select((value) => value.isNotEmpty));

/// Whether the finished recorded path should be shown.
@riverpod
bool showFinishedPathLayer(ShowFinishedPathLayerRef ref) {
  final isEditing = ref.watch(editFinishedPathProvider);
  final showFinishedPath = ref.watch(showFinishedPathProvider);
  final finishedPathPoints = ref.watch(finishedPathRecordingListProvider);

  final enabled = !isEditing && showFinishedPath && finishedPathPoints != null;
  return enabled;
}

/// Whether the currently recording path should be shown.
@riverpod
bool showPathRecordingLayer(ShowPathRecordingLayerRef ref) =>
    ref.watch(enablePathRecorderProvider);

/// Whether the editable recorded path should be shown.
@riverpod
bool showEditablePathLayer(ShowEditablePathLayerRef ref) {
  final isEditing = ref.watch(editFinishedPathProvider);
  final points = ref.watch(finishedPathRecordingListProvider);

  final enabled = isEditing && points != null;
  return enabled;
}

/// Whether the vehicle image drawing layer should be shown.
@riverpod
class ShowVehicleDrawingLayer extends _$ShowVehicleDrawingLayer {
  @override
  bool build() => true;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether the debugging layer for the vehicle should be shown.
@riverpod
bool showVehicleDebugLayer(ShowVehicleDebugLayerRef ref) => [
      ref.watch(debugVehicleTravelledPathProvider),
      ref.watch(debugVehicleTrajectoryProvider),
      ref.watch(debugVehicleSteeringProvider),
      ref.watch(debugVehiclePolygonsProvider),
      ref.watch(debugVehicleHitchesProvider),
      ref.watch(debugVehicleAntennaPositionProvider),
    ].any((element) => element);

/// Whether the debugging layer for the Dubins path should be shown.
@riverpod
bool showDubinsPathDebugLayer(ShowDubinsPathDebugLayerRef ref) =>
    ref.watch(enableDubinsPathDebugProvider);

/// Whether the layer for the path tracking should be shown.
@riverpod
bool showPathTrackingLayer(ShowPathTrackingLayerRef ref) =>
    ref.watch(showPathTrackingProvider);

/// Whether the layer for field should be shown.
@riverpod
bool showFieldLayer(ShowFieldLayerRef ref) {
  final showField = ref.watch(showFieldProvider);
  final showBufferedField = ref.watch(showBufferedFieldProvider);
  final fieldExists =
      ref.watch(activeFieldProvider.select((value) => value != null));

  final showRecordedRings = ref.watch(showPathRecordingMenuProvider) &&
      ref.watch(
        activePathRecordingTargetProvider
            .select((value) => value == PathRecordingTarget.field),
      );

  final enabled =
      ((showField || showBufferedField) && fieldExists) || showRecordedRings;
  return enabled;
}

/// Whether the equipment drawing layer should be shown.
@riverpod
class ShowEquipmentDrawingLayer extends _$ShowEquipmentDrawingLayer {
  @override
  bool build() => true;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether the debugging layer for the equipment should be shown.
@riverpod
bool showEquipmentDebugLayer(ShowEquipmentDebugLayerRef ref) =>
    <bool>[
      ref.watch(debugEquipmentTurningProvider),
      ref.watch(debugEquipmentHitchesProvider),
      ref.watch(debugEquipmentTrajectoryProvider),
      ref.watch(debugEquipmentTravelledPathProvider),
    ].any((element) => element);

/// Whether the layer for AB-tracking should be shown.
@riverpod
bool showABTrackingLayer(ShowABTrackingLayerRef ref) =>
    ref.watch(showABTrackingProvider);

/// Whether the map should show grid lines.
@riverpod
class ShowGridLayer extends _$ShowGridLayer {
  @override
  bool build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.mapLayersShowGrid, next);
      }
      if (!next) {
        ref.invalidate(mapGridSizeProvider);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.mapLayersShowGrid) ??
        true;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether the layer for selectable path should be shown.
@riverpod
bool showSelectablePathLayer(ShowSelectablePathLayerRef ref) =>
    ref.watch(enableSelectablePathProvider) &&
    ref.watch(
      selectablePathPointsProvider.select(
        (value) => value != null && value.length >= 2,
      ),
    );
