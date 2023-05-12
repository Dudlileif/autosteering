import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enabled_map_layers_providers.g.dart';

@Riverpod(keepAlive: true)
class ShowOSMLayer extends _$ShowOSMLayer {
  @override
  bool build() => true;

  void toggle() => Future(() => state = !state);

  void update({required bool value}) => Future(() => state = value);
}

@riverpod
bool showCountryLayers(ShowCountryLayersRef ref) {
  final enabled = ref.watch(selectedCountryLayersProvider).isNotEmpty;
  return enabled;
}

@riverpod
bool showSentinelLayers(ShowSentinelLayersRef ref) {
  final enabled = ref.watch(selectedSentinelLayersProvider).isNotEmpty;
  return enabled;
}

@riverpod
bool showFinishedPathLayer(ShowFinishedPathLayerRef ref) {
  final isEditing = ref.watch(editFinishedPathProvider);
  final showFinishedPath = ref.watch(showFinishedPathProvider);
  final finishedPathPoints = ref.watch(finishedPathRecordingListProvider);

  final enabled = !isEditing && showFinishedPath && finishedPathPoints != null;
  return enabled;
}

@riverpod
bool showFinishedPolygonLayer(ShowFinishedPolygonLayerRef ref) {
  final showPolygon = ref.watch(showFinishedPolygonProvider);
  final finishedPathPoints = ref.watch(finishedPathRecordingListProvider);

  final enabled = showPolygon && finishedPathPoints != null;
  return enabled;
}

@riverpod
bool showRecordingPathLayer(ShowRecordingPathLayerRef ref) {
  final enabled = ref.watch(enablePathRecorderProvider);
  return enabled;
}

@riverpod
bool showEditablePathLayer(ShowEditablePathLayerRef ref) {
  final isEditing = ref.watch(editFinishedPathProvider);
  final points = ref.watch(finishedPathRecordingListProvider);

  final enabled = isEditing && points != null;
  return enabled;
}

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
