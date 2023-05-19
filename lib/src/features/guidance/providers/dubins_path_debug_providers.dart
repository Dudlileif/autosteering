import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dubins_path_debug_providers.g.dart';

/// Whether the Dubins path feature should be debugged.
@Riverpod(keepAlive: true)
class EnableDubinsPathDebug extends _$EnableDubinsPathDebug {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}

/// Whether to show the turning circles for the Dubins path.
@Riverpod(keepAlive: true)
class ShowDubinsPathDebugCircles extends _$ShowDubinsPathDebugCircles {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}

/// The starting point for the Dubins path.
@Riverpod(keepAlive: true)
class DubinsPathDebugStartPoint extends _$DubinsPathDebugStartPoint {
  @override
  WayPoint? build() => null;

  void update(WayPoint point) => Future(() => state = point);
}

/// The ending point for the Dubins path.
@Riverpod(keepAlive: true)
class DubinsPathDebugEndPoint extends _$DubinsPathDebugEndPoint {
  @override
  WayPoint? build() => null;

  void update(WayPoint point) => Future(() => state = point);
}

/// Which type of Dubins path to debug/draw.
@riverpod
class DubinsPathDebugPathType extends _$DubinsPathDebugPathType {
  @override
  DubinsPathType? build() => null;

  void update(DubinsPathType pathType) => Future(() => state = pathType);
}

/// The current [DubinsPath] object that we can debug.
@riverpod
DubinsPath? debugDubinsPath(DebugDubinsPathRef ref) {
  final start = ref.watch(dubinsPathDebugStartPointProvider);
  final end = ref.watch(dubinsPathDebugEndPointProvider);

  if (start != null && end != null) {
    return DubinsPath(
      start: start,
      end: end,
      turningRadius: 1.2 * ref.watch(mainVehicleProvider).minTurningRadius,
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

  void update(double value) => Future(() => state = value);
}