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

import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dubins_path_debug_providers.g.dart';

/// Whether the Dubins path feature should be debugged.
@Riverpod(keepAlive: true)
class EnableDubinsPathDebug extends _$EnableDubinsPathDebug {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// Whether to show the turning circles for the Dubins path.
@Riverpod(keepAlive: true)
class ShowDubinsPathDebugCircles extends _$ShowDubinsPathDebugCircles {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// The starting point for the Dubins path.
@Riverpod(keepAlive: true)
class DubinsPathDebugStartPoint extends _$DubinsPathDebugStartPoint {
  @override
  WayPoint? build() => null;

  /// Update the [state] to [point].
  void update(WayPoint point) => Future(() => state = point);
}

/// The ending point for the Dubins path.
@Riverpod(keepAlive: true)
class DubinsPathDebugEndPoint extends _$DubinsPathDebugEndPoint {
  @override
  WayPoint? build() => null;

  /// Update the [state] to [point].
  void update(WayPoint point) => Future(() => state = point);
}

/// Which type of Dubins path to debug/draw.
@riverpod
class DubinsPathDebugPathType extends _$DubinsPathDebugPathType {
  @override
  DubinsPathType? build() => null;

  /// Update the [state] to [pathType].
  void update(DubinsPathType pathType) => Future(() => state = pathType);
}

/// The current [DubinsPath] object that we can debug.
@riverpod
DubinsPath? debugDubinsPath(Ref ref) {
  final start = ref.watch(dubinsPathDebugStartPointProvider);
  final end = ref.watch(dubinsPathDebugEndPointProvider);

  if (start != null && end != null) {
    return DubinsPath(
      start: start,
      end: end,
      turningRadius: 1.2 *
          ref.watch(
            mainVehicleProvider.select((vehicle) => vehicle.minTurningRadius),
          ),
      stepSize: ref.watch(dubinsPathDebugStepSizeProvider),
    );
  }

  return null;
}

/// Which type of Dubins path to debug/draw.
@Riverpod(keepAlive: true)
class DubinsPathDebugStepSize extends _$DubinsPathDebugStepSize {
  @override
  double build() => 0.1;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}
