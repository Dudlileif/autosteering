import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mini_map_providers.g.dart';

/// Whether the mini map should be shown.
@Riverpod(keepAlive: true)
class ShowMiniMap extends _$ShowMiniMap {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
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

/// The mini map [MapController] provider, which allows controlling the
/// map from outside the widget code itself.
@Riverpod(keepAlive: true)
class MiniMapController extends _$MiniMapController {
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

/// Whether the mini map always should point to the north and not rotate.
@Riverpod(keepAlive: true)
class MiniMapLockToField extends _$MiniMapLockToField {
  @override
  bool build() {
    ref
      ..listen(
        miniMapSizeProvider,
        (previous, next) =>
            Future.delayed(const Duration(milliseconds: 100), updateBounds),
      )
      ..listenSelf((previous, next) {
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
      final bbox = field.squaredByDiagonalBoundingBox;
      if (bbox != null) {
        final rotation = mapController.rotation;
        mapController
          ..rotate(0)
          ..fitBounds(
            LatLngBounds.fromPoints(
              bbox.corners2D.map((point) => point.latLng).toList(),
            ),
            options: const FitBoundsOptions(padding: EdgeInsets.all(4)),
          )
          ..rotate(rotation);
      } else {
        mapController.fitBounds(
          LatLngBounds.fromPoints(
            field.mapBoundingBox((point) => point.latLng).toList(),
          ),
          options: const FitBoundsOptions(padding: EdgeInsets.all(4)),
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
    ref.listenSelf((previous, next) {
      if (next) {
        ref.read(miniMapControllerProvider).rotate(0);
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
@Riverpod(keepAlive: true)
class MiniMapSize extends _$MiniMapSize {
  @override
  double build() {
    ref.listenSelf((previous, next) {
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
