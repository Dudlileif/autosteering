import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enabled_map_layers_providers.g.dart';

/// Whether the OpenStreetMap layer should be shown.
@Riverpod(keepAlive: true)
class ShowOSMLayer extends _$ShowOSMLayer {
  @override
  bool build() => true;

  void toggle() => Future(() => state = !state);

  void update({required bool value}) => Future(() => state = value);
}

/// Whether the selected country layers should be shown.
@riverpod
bool showCountryLayers(ShowCountryLayersRef ref) {
  final enabled = ref.watch(selectedCountryLayersProvider).isNotEmpty;
  return enabled;
}

/// Whether the selected Sentinel layers should be shown.
@riverpod
bool showSentinelLayers(ShowSentinelLayersRef ref) {
  final enabled = ref.watch(selectedSentinelLayersProvider).isNotEmpty;
  return enabled;
}

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
bool showRecordingPathLayer(ShowRecordingPathLayerRef ref) {
  final enabled = ref.watch(enablePathRecorderProvider);
  return enabled;
}

/// Whether the editable recorded path should be shown.
@riverpod
bool showEditablePathLayer(ShowEditablePathLayerRef ref) {
  final isEditing = ref.watch(editFinishedPathProvider);
  final points = ref.watch(finishedPathRecordingListProvider);

  final enabled = isEditing && points != null;
  return enabled;
}

/// Whether the debugging layer for the vehicle should be shown.
@riverpod
bool showVehicleDebugLayer(ShowVehicleDebugLayerRef ref) {
  final debugTravelledPath = ref.watch(debugTravelledPathProvider);
  final debugTrajectory = ref.watch(debugTrajectoryProvider);
  final debugSteering = ref.watch(debugSteeringProvider);
  final debugPolygons = ref.watch(debugVehiclePolygonsProvider);

  final enabled =
      debugTravelledPath || debugTrajectory || debugSteering || debugPolygons;
  return enabled;
}

/// Whether the debugging layer for the Dubins path should be shown.
@riverpod
bool showDubinsPathDebugLayer(ShowDubinsPathDebugLayerRef ref) {
  final enabled = ref.watch(enableDubinsPathDebugProvider);
  return enabled;
}

/// Whether the debugging layer for the pure pursuit should be shown.
@riverpod
bool showPurePursuitDebugLayer(ShowPurePursuitDebugLayerRef ref) {
  final enabled = ref.watch(debugPurePursuitProvider);
  return enabled;
}

/// Whether the debugging layer for the test field should be shown.
@riverpod
bool showFieldDebugLayer(ShowFieldDebugLayerRef ref) {
  final showTestField = ref.watch(showTestFieldProvider);
  final showBufferedTestField = ref.watch(showBufferedTestFieldProvider);
  final testFieldExists = ref.watch(testFieldProvider) != null;

  final enabled = (showTestField || showBufferedTestField) && testFieldExists;
  return enabled;
}
