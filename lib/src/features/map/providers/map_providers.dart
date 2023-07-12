import 'dart:async';
import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
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

  /// Set the [state] to true to indicate that the map is ready.
  void ready() => Future(() => state = true);
}

/// The main [MapController] provider, which allows controlling the map from
/// outside the widget code itself.
@Riverpod(keepAlive: true)
class MainMapController extends _$MainMapController {
  @override
  MapController build() => MapController();

  /// Increase the zoom value of the [state] by [value].
  void zoomIn(double value) => Future(
        () => state.move(state.center, state.zoom + value),
      );

  /// Decrease the zoom value of the [state] by [value].
  void zoomOut(double value) => Future(
        () => state.move(state.center, state.zoom - value),
      );
}

/// The home position of the vehicle, i.e. where the vehicle will reset to.
@Riverpod(keepAlive: true)
class HomePosition extends _$HomePosition {
  @override
  LatLng build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.homePosition, next);
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.homePosition)) {
      return LatLng.fromJson(
        ref.read(settingsProvider.notifier).getMap(SettingsKey.homePosition)!,
      );
    }

    return const LatLng(0, 0);
  }

  /// Update the [state] to [position].
  void update(LatLng position) => Future(() => state = position);
}

/// Whether the map should center on the vehicle or if it could be moved freely.
@Riverpod(keepAlive: true)
class CenterMapOnVehicle extends _$CenterMapOnVehicle {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next) {
        ref.read(mainMapControllerProvider).rotate(0);
      }
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.centerMapOnVehicle, next);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.centerMapOnVehicle) ??
        true;
  }

  /// Update the [state] to [value]. Will update the map if necessary.
  void update({bool? value}) {
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

  /// Invert the current [state].
  void invert() => update(value: !state);
}

/// A provider for controlling the zoom when a gamepad button is held down.
///
/// The map will keep zooming in/out while the button is held down.
@riverpod
class ZoomTimerController extends _$ZoomTimerController {
  @override
  Timer? build() => null;

  /// Cancel the timer, i.e. stop the last activated zooming event.
  void cancel() => Future(() => state?.cancel());

  /// Start to zoom in.
  void zoomIn() {
    cancel();
    Future(
      () =>
          state = Timer.periodic(const Duration(microseconds: 16667), (timer) {
        ref.read(mainMapControllerProvider.notifier).zoomIn(timer.tick * 0.001);
      }),
    );
  }

  /// Start to zoom out.
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
MapCenterOffset mapOffset(MapOffsetRef ref) {
  return switch (ref.watch(mapUse3DPerspectiveProvider)) {
    true => ref.watch(mapOffset3DProvider),
    false => ref.watch(mapOffset2DProvider),
  };
}

/// How much the map center should be offset from the vehicle when using
/// 2D view.
@Riverpod(keepAlive: true)
class MapOffset2D extends _$MapOffset2D {
  @override
  MapCenterOffset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.mapCenterOffset2D, state);
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.mapCenterOffset2D)) {
      return MapCenterOffset.fromJson(
        ref
            .read(settingsProvider.notifier)
            .getMap(SettingsKey.mapCenterOffset2D)!,
      );
    }

    return const MapCenterOffset();
  }

  /// Update the [state] offset with [x] and [y].
  void update({double? x, double? y}) => Future(
        () => state = state.copyWith(
          x: x ?? state.x,
          y: y ?? state.y,
        ),
      );
}

/// How much the map center should be offset from the vehicle when using
/// 3D view.
@Riverpod(keepAlive: true)
class MapOffset3D extends _$MapOffset3D {
  @override
  MapCenterOffset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.mapCenterOffset3D, state);
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.mapCenterOffset3D)) {
      return MapCenterOffset.fromJson(
        ref
            .read(settingsProvider.notifier)
            .getMap(SettingsKey.mapCenterOffset3D)!,
      );
    }

    return const MapCenterOffset();
  }

  /// Update the [state] offset with [x] and [y].
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
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.alwaysPointNorth, next);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.alwaysPointNorth) ??
        false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to enable a 3D perspective for the map, otherwise an orthogonal
/// view is used.
@Riverpod(keepAlive: true)
class MapUse3DPerspective extends _$MapUse3DPerspective {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.enableMap3D, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.enableMap3D) ??
        false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// The angle that the 3D perspective should be seen from, as in radians
/// from the orthogonal view.
@Riverpod(keepAlive: true)
class Map3DPerspectiveAngle extends _$Map3DPerspectiveAngle {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.mapPerspectiveAngle, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getDouble(SettingsKey.mapPerspectiveAngle) ??
        40 * pi / 180;
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}
