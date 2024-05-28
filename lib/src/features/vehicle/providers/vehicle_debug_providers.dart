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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_debug_providers.g.dart';

/// Whether to show vehicle debug polygons.
@riverpod
class DebugVehiclePolygons extends _$DebugVehiclePolygons {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle steering debug features.
@riverpod
class DebugVehicleSteering extends _$DebugVehicleSteering {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle trajectory debug features.
@riverpod
class DebugVehicleTrajectory extends _$DebugVehicleTrajectory {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle travelled path debug.
@riverpod
class DebugVehicleTravelledPath extends _$DebugVehicleTravelledPath {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// The amount of points [DebugVehicleTravelledPathList] should hold.
@Riverpod(keepAlive: true)
class DebugVehicleTravelledPathSize extends _$DebugVehicleTravelledPathSize {
  @override
  int build() => 100;

  /// Update the [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A list of the last [DebugVehicleTravelledPathSize] position points for the
/// vehicle.
@riverpod
class DebugVehicleTravelledPathList extends _$DebugVehicleTravelledPathList {
  @override
  List<LatLng> build() {
    if (ref.watch(debugVehicleTravelledPathProvider)) {
      ref.listen(
        mainVehicleProvider,
        (previous, next) => add(next.position.latLng),
        fireImmediately: true,
      );
    }

    return <LatLng>[];
  }

  /// Add the [point] to the travelled path.
  void add(LatLng point) => Future(() {
        if (state.length == ref.watch(debugVehicleTravelledPathSizeProvider)) {
          state.removeLast();
        }
        state = [point, ...state];
      });
}

/// Whether to show vehicle hitches debug.
@riverpod
class DebugVehicleHitches extends _$DebugVehicleHitches {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle antenna position debug.
@riverpod
class DebugVehicleAntennaPosition extends _$DebugVehicleAntennaPosition {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// The amount of seconds vehicle trajectories should predict.
@Riverpod(keepAlive: true)
class DebugVehicleTrajectorySeconds extends _$DebugVehicleTrajectorySeconds {
  @override
  double build() => 10;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// The minimum length vehicle trajectories should predict.
@Riverpod(keepAlive: true)
class DebugVehicleTrajectoryMinLength
    extends _$DebugVehicleTrajectoryMinLength {
  @override
  double build() => 10;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}
