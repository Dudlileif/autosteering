import 'dart:async';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_providers.g.dart';

/// Whether the map is ready to be shown or not.
@Riverpod(keepAlive: true)
class MapReady extends _$MapReady {
  @override
  bool build() => false;

  void ready() => Future(() => state = true);
}

/// The main [MapController] provider, which allows controlling the map from
/// outside the widget code itself.
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

/// The home position of the vehicle, i.e. where the vehicle will reset to.
@Riverpod(keepAlive: true)
class HomePosition extends _$HomePosition {
  @override
  LatLng build() => LatLng(0, 0);

  void update(LatLng position) => Future(() => state = position);
}

/// Whether the map should center on the vehicle or if it could be moved freely.
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

/// A provider for controlling the zoom when a gamepad button is held down.
///
/// The map will keep zooming in/out while the button is held down.
@riverpod
class ZoomTimerController extends _$ZoomTimerController {
  @override
  Timer? build() => null;

  void cancel() => Future(() => state?.cancel());

  void update(Zoom zoomAction) {
    cancel();
    Future(
      () => state = switch (zoomAction) {
        Zoom.zoomIn =>
          Timer.periodic(const Duration(milliseconds: 10), (timer) {
            ref
                .read(mainMapControllerProvider.notifier)
                .zoomIn(timer.tick * 0.001);
          }),
        Zoom.zoomOut =>
          Timer.periodic(const Duration(milliseconds: 10), (timer) {
            ref
                .read(mainMapControllerProvider.notifier)
                .zoomOut(timer.tick * 0.001);
          }),
      },
    );
  }
}

/// How much the map center should be offset from the vehicle.
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

/// The map center offset applied to the vehicle position, contains the
/// actual center position of the map.
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

/// Whether the map always should point to the north and not rotate.
@Riverpod(keepAlive: true)
class AlwaysPointNorth extends _$AlwaysPointNorth {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next) {
        ref.read(mainMapControllerProvider).rotate(0);
      }
    });
    return false;
  }

  void toggle() => Future(() => state = !state);

  void update({required bool value}) => Future(() => state = value);
}
