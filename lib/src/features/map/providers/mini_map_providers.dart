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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mini_map_providers.g.dart';

/// Whether the mini map should be shown.
@riverpod
class ShowMiniMap extends _$ShowMiniMap {
  @override
  bool build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listen(activeFieldProvider, (previous, next) {
        if (ref.read(miniMapReadyProvider)) {
          if (ref.read(miniMapLockToFieldProvider)) {
            if (next != null) {
              ref.read(miniMapLockToFieldProvider.notifier).updateBounds();
            } else {
              final mapController = ref.read(miniMapControllerProvider);
              final vehicle = ref.read(
                mainVehicleProvider.select(
                  (value) => (position: value.position, bearing: value.bearing),
                ),
              );
              mapController.moveAndRotate(
                vehicle.position.latLng,
                mapController.camera.zoom,
                -vehicle.bearing,
              );
            }
          }
        }
      });
    listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.miniMapShow, next);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.miniMapShow) ??
        false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether the map is ready to be shown or not.
@riverpod
class MiniMapReady extends _$MiniMapReady {
  @override
  bool build() => false;

  /// Set the [state] to true to indicate that the map is ready.
  void ready() => Future(() => state = true);
}

/// The mini map [MapController] provider, which allows controlling the
/// map from outside the widget code itself.
@riverpod
class MiniMapController extends _$MiniMapController {
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
}

/// Whether the mini map always should point to the north and not rotate.
@riverpod
class MiniMapLockToField extends _$MiniMapLockToField {
  @override
  bool build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listen(
        miniMapSizeProvider,
        (previous, next) =>
            Timer(const Duration(milliseconds: 100), updateBounds),
      );
    listenSelf((previous, next) {
      if (next) {
        updateBounds();
      }
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.miniMapLockToField, next);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.miniMapLockToField) ??
        false;
  }

  /// Updates the bounds of the map controller in [miniMapControllerProvider] to
  /// fit the currently active field, with room to rotate.
  void updateBounds() {
    final field = ref.watch(activeFieldProvider);
    if (field != null) {
      final mapController = ref.watch(miniMapControllerProvider);
      final bbox = field.rotationCenteredSquaredByDiagonalBoundingBox;
      if (bbox != null) {
        final rotation = mapController.camera.rotation;
        mapController
          ..rotate(0)
          ..fitCamera(
            CameraFit.bounds(
              bounds: LatLngBounds.fromPoints(
                bbox.corners2D.map((point) => point.latLng).toList(),
              ),
              padding: const EdgeInsets.all(4),
            ),
          )
          ..rotate(rotation);
      } else {
        mapController.fitCamera(
          CameraFit.bounds(
            bounds: LatLngBounds.fromPoints(
              field.mapBoundingBox((point) => point.latLng).toList(),
            ),
            padding: const EdgeInsets.all(4),
          ),
        );
      }
    }
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether the mini map always should point to the north and not rotate.
@Riverpod(keepAlive: true)
class MiniMapAlwaysPointNorth extends _$MiniMapAlwaysPointNorth {
  @override
  bool build() {
    ref.watch(reloadAllSettingsProvider);
    listenSelf((previous, next) {
      if (ref.read(miniMapReadyProvider)) {
        if (next) {
          ref.read(miniMapControllerProvider).rotate(0);
        } else {
          ref.read(miniMapControllerProvider).rotate(
                ref.read(
                  mainVehicleProvider.select((value) => -value.bearing),
                ),
              );
        }
      }
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.miniMapAlwaysPointNorth, next);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.miniMapAlwaysPointNorth) ??
        false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether the mini map always should point to the north and not rotate.
@riverpod
class MiniMapSize extends _$MiniMapSize {
  @override
  double build() {
    ref.watch(reloadAllSettingsProvider);
    listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.miniMapSize, next);
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getDouble(SettingsKey.miniMapSize) ??
        300;
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}
