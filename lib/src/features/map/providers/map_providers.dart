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
import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/providers/providers.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

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
        () => state.move(state.camera.center, state.camera.zoom + value),
      );

  /// Decrease the zoom value of the [state] by [value].
  void zoomOut(double value) => Future(
        () => state.move(state.camera.center, state.camera.zoom - value),
      );

  /// Increase the zoom value of the [state] by [value], and snap the result to
  /// the closest [value] step.
  void zoomInSnap(double value) => Future(
        () {
          final newZoom = state.camera.zoom + value;
          return state.move(
            state.camera.center,
            newZoom.truncateToDouble() +
                ((newZoom - newZoom.truncate()) ~/ value) * value,
          );
        },
      );

  /// Decrease the zoom value of the [state] by [value], and snap the result to
  /// the closest [value] step.
  void zoomOutSnap(double value) => Future(
        () {
          final newZoom = state.camera.zoom - value;
          return state.move(
            state.camera.center,
            newZoom.truncateToDouble() +
                ((newZoom - newZoom.truncate()) ~/ value) * value,
          );
        },
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
            .update(SettingsKey.mapHomePosition, next);
        ref.read(simInputProvider.notifier).send((velocity: 0));
        ref.read(simInputProvider.notifier).send((steeringAngle: 0));

        ref.read(simInputProvider.notifier).send(
          (position: next.gbPosition),
        );
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.mapHomePosition)) {
      return LatLng.fromJson(
        ref
            .read(settingsProvider.notifier)
            .getMap(SettingsKey.mapHomePosition)!,
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
            .update(SettingsKey.mapCenterMapOnVehicle, next);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.mapCenterMapOnVehicle) ??
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
                    .select((controller) => controller.camera.zoom),
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
  Timer? _saveToSettingsTimer;

  @override
  MapCenterOffset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        _saveToSettingsTimer?.cancel();

        _saveToSettingsTimer = Timer(
          const Duration(seconds: 1),
          () => ref
              .read(settingsProvider.notifier)
              .update(SettingsKey.mapCenterOffset3D, state),
        );
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
  Timer? _saveToSettingsTimer;

  @override
  MapCenterOffset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        _saveToSettingsTimer?.cancel();

        _saveToSettingsTimer = Timer(
          const Duration(seconds: 1),
          () => ref
              .read(settingsProvider.notifier)
              .update(SettingsKey.mapCenterOffset3D, state),
        );
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
    return ref.watch(
      mainVehicleProvider.select((vehicle) => vehicle.position.latLng),
    );
  }
  final vehicle = ref.watch(mainVehicleProvider);

  final use3DPerspective = ref.watch(mapUse3DPerspectiveProvider);
  final perspectiveAngle = ref.watch(map3DPerspectiveAngleProvider);

  return vehicle.position.rhumb
      .destinationPoint(
        distance: offset.x,
        bearing: (vehicle.bearing + 90).wrap360(),
      )
      .rhumb
      .destinationPoint(
        distance: switch (use3DPerspective) {
          false => offset.y,
          true => offset.y * (1 + tan(perspectiveAngle.toRadians())),
        },
        bearing: vehicle.bearing,
      )
      .latLng;
}

/// Whether the map always should point to the north and not rotate.
@Riverpod(keepAlive: true)
class AlwaysPointNorth extends _$AlwaysPointNorth {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (ref.read(mapReadyProvider)) {
        if (next) {
          ref.read(mainMapControllerProvider).rotate(0);
        } else {
          ref.read(mainMapControllerProvider).rotate(
                ref.read(mainVehicleProvider.select((value) => -value.bearing)),
              );
        }
      }
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.mapAlwaysPointNorth, next);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.mapAlwaysPointNorth) ??
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
            .update(SettingsKey.mapEnable3D, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.mapEnable3D) ??
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
  Timer? _saveToSettingsTimer;

  @override
  double build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        _saveToSettingsTimer?.cancel();

        _saveToSettingsTimer = Timer(
          const Duration(seconds: 1),
          () => ref
              .read(settingsProvider.notifier)
              .update(SettingsKey.map3DPerspectiveAngle, next),
        );
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getDouble(SettingsKey.map3DPerspectiveAngle) ??
        40;
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// The zoom value that the map should use when being created.
@Riverpod(keepAlive: true)
class MapZoom extends _$MapZoom {
  Timer? _saveToSettingsTimer;

  @override
  double build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        _saveToSettingsTimer?.cancel();
        _saveToSettingsTimer = Timer(
          const Duration(seconds: 1),
          () => ref
              .read(settingsProvider.notifier)
              .update(SettingsKey.mapZoom, next),
        );
      }
    });

    return ref.read(settingsProvider.notifier).getDouble(SettingsKey.mapZoom) ??
        19;
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for finding the first cache date of the map layer cache
/// at the given [path].
@riverpod
FutureOr<DateTime?> mapCacheDate(MapCacheDateRef ref, String path) async {
  final file = File([path, 'created'].join('/'));

  if (file.existsSync()) {
    return DateTime.tryParse(await file.readAsString());
  }
  return null;
}

/// A provider for listing all the map layer cache folders.
@riverpod
FutureOr<List<String>> mapCacheDirectories(MapCacheDirectoriesRef ref) async =>
    await Directory(
      [
        ref.watch(fileDirectoryProvider).requireValue.path,
        'map_image_cache',
      ].join('/'),
    ).findSubfoldersWithTargetFile();

/// Whether the map should be allowed to download tiles over the internet.
@Riverpod(keepAlive: true)
class MapAllowDownload extends _$MapAllowDownload {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.mapAllowDownload, next);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.mapAllowDownload) ??
        true;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}



