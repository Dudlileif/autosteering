import 'dart:async';
import 'dart:math';

import 'package:agopengps_flutter/src/features/common/utils/position_projection_extensions.dart';
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
  LatLng build() => const LatLng(0, 0);

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
              ref.watch(
                mainMapControllerProvider
                    .select((controller) => controller.zoom),
              ),
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

  void zoomIn() {
    cancel();
    Future(
      () =>
          state = Timer.periodic(const Duration(microseconds: 16667), (timer) {
        ref.read(mainMapControllerProvider.notifier).zoomIn(timer.tick * 0.001);
      }),
    );
  }

  void zoomOut() {
    cancel();
    Future(
      () =>
          state = Timer.periodic(const Duration(microseconds: 16667), (timer) {
        ref
            .read(mainMapControllerProvider.notifier)
            .zoomOut(timer.tick * 0.001);
      }),
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
  final offset = ref.watch(mapOffsetProvider);
  if (offset == const MapCenterOffset()) {
    return ref.watch(mainVehicleProvider.select((vehicle) => vehicle.position));
  }
  final vehicle = ref.watch(mainVehicleProvider);

  final use3DPerspective = ref.watch(mapUse3DPerspectiveProvider);
  final perspectiveAngle = ref.watch(map3DPerspectiveAngleProvider);

  return vehicle.position
      .offset(
        offset.x,
        normalizeBearing(vehicle.heading + 90),
      )
      .offset(
        switch (use3DPerspective) {
          false => offset.y,
          true => offset.y * (1 + tan(perspectiveAngle)),
        },
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

/// Whether to enable a 3D perspective for the map, otherwise an orthogonal
/// view is used.
@Riverpod(keepAlive: true)
class MapUse3DPerspective extends _$MapUse3DPerspective {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);
  void toggle() => Future(() => state = !state);
}

/// The angle that the 3D perspective should be seen from, as in radians
/// from the orthogonal view.
@Riverpod(keepAlive: true)
class Map3DPerspectiveAngle extends _$Map3DPerspectiveAngle {
  @override
  double build() => 40 * pi / 180;

  void update(double value) => Future(() => state = value);
}
