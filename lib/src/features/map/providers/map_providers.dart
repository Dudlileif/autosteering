import 'dart:async';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_providers.g.dart';

@Riverpod(keepAlive: true)
class MapReady extends _$MapReady {
  @override
  bool build() => false;

  void ready() => Future(() => state = true);
}

@Riverpod(keepAlive: true)
class MainMapController extends _$MainMapController {
  @override
  MapController build() => MapController();

  void zoomIn(double value) => Future(
        () => state.move(state.center, state.zoom + value),
      );

  void zoomOut(double value) => Future(
        () => state.move(state.center, state.zoom - value),
      );
}

@Riverpod(keepAlive: true)
class HomePosition extends _$HomePosition {
  @override
  LatLng build() => LatLng(0, 0);

  void update(LatLng position) => Future(() => state = position);
}

@Riverpod(keepAlive: true)
class CenterMapOnVehicle extends _$CenterMapOnVehicle {
  @override
  bool build() => true;

  void update(bool? value) {
    Future(() => state = value ?? state);
    if (value != null) {
      if (value) {
        ref.read(mainMapControllerProvider).move(
              ref.watch(offsetVehiclePositionProvider),
              ref.watch(mainMapControllerProvider).zoom,
            );
      }
    }
  }

  void invert() => update(!state);
}

@riverpod
class ZoomTimerController extends _$ZoomTimerController {
  @override
  Timer? build() => null;

  void cancel() => Future(() => state?.cancel());
  void update(Zoom zoomAction) {
    cancel();
    Future(
      () => state = zoomAction == Zoom.zoomIn
          ? Timer.periodic(const Duration(milliseconds: 10), (timer) {
              ref
                  .read(mainMapControllerProvider.notifier)
                  .zoomIn(timer.tick * 0.001);
            })
          : Timer.periodic(const Duration(milliseconds: 10), (timer) {
              ref
                  .read(mainMapControllerProvider.notifier)
                  .zoomOut(timer.tick * 0.001);
            }),
    );
  }
}

@Riverpod(keepAlive: true)
class MapOffset extends _$MapOffset {
  @override
  MapCenterOffset build() => const MapCenterOffset();

  void update({double? x, double? y}) => Future(
        () => state = state.copyWith(
          x: x ?? state.x,
          y: y ?? state.y,
        ),
      );
}

@Riverpod(keepAlive: true)
LatLng offsetVehiclePosition(OffsetVehiclePositionRef ref) {
  final vehicle = ref.watch(mainVehicleProvider);
  final offset = ref.watch(mapOffsetProvider);
  const distance = Distance(roundResult: false);

  return distance.offset(
    distance.offset(
      vehicle.position,
      offset.x,
      normalizeBearing(vehicle.heading + 90),
    ),
    offset.y,
    vehicle.heading,
  );
}

@Riverpod(keepAlive: true)
class UseOSMLayer extends _$UseOSMLayer {
  @override
  bool build() => true;

  void toggle() => Future(() => state = !state);

  void update({required bool value}) => Future(() => state = value);
}
