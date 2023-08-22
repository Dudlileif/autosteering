import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enabled_map_layers_providers.g.dart';

/// Whether the OpenStreetMap layer should be shown.
@Riverpod(keepAlive: true)
class ShowOSMLayer extends _$ShowOSMLayer {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.showOpenStreetMap, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.showOpenStreetMap) ??
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

/// Whether the polygon contained by the finished recorded path should be
/// shown.
@riverpod
bool showFinishedPolygonLayer(ShowFinishedPolygonLayerRef ref) {
  final showPolygon = ref.watch(showFinishedPolygonProvider);
  final finishedPathPoints = ref.watch(finishedPathRecordingListProvider);

  final enabled = showPolygon && finishedPathPoints != null;
  return enabled;
}

/// Whether the currently recording path should be shown.
@riverpod
bool showRecordingPathLayer(ShowRecordingPathLayerRef ref) =>
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
@Riverpod(keepAlive: true)
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
bool showVehicleDebugLayer(ShowVehicleDebugLayerRef ref) {
  final debugTravelledPath = ref.watch(debugTravelledPathProvider);
  final debugTrajectory = ref.watch(debugTrajectoryProvider);
  final debugSteering = ref.watch(debugSteeringProvider);
  final debugPolygons = ref.watch(debugVehiclePolygonsProvider);
  final debugHitches = ref.watch(debugVehicleHitchesProvider);
  final debugAntennaPosition = ref.watch(debugVehicleAntennaPositionProvider);

  final enabled = debugTravelledPath ||
      debugTrajectory ||
      debugSteering ||
      debugPolygons ||
      debugHitches ||
      debugAntennaPosition;
  return enabled;
}

/// Whether the debugging layer for the Dubins path should be shown.
@riverpod
bool showDubinsPathDebugLayer(ShowDubinsPathDebugLayerRef ref) =>
    ref.watch(enableDubinsPathDebugProvider);

/// Whether the debugging layer for the pure pursuit should be shown.
@riverpod
bool showPathTrackingDebugLayer(ShowPathTrackingDebugLayerRef ref) =>
    ref.watch(debugPathTrackingProvider);

/// Whether the debugging layer for the test field should be shown.
@riverpod
bool showFieldDebugLayer(ShowFieldDebugLayerRef ref) {
  final showTestField = ref.watch(showTestFieldProvider);
  final showBufferedTestField = ref.watch(showBufferedTestFieldProvider);
  final testFieldExists = ref.watch(testFieldProvider) != null;

  final enabled = (showTestField || showBufferedTestField) && testFieldExists;
  return enabled;
}

/// Whether the debugging layer for the equipment should be shown.
@riverpod
bool showEquipmentDebugLayer(ShowEquipmentDebugLayerRef ref) =>
    ref.watch(showEquipmentDebugProvider);

/// Whether the debugging layer for the AB-line should be shown.
@riverpod
bool showABLineDebugLayer(ShowABLineDebugLayerRef ref) =>
    ref.watch(aBLineDebugShowProvider);
