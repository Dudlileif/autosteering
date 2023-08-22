import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'path_tracking_providers.g.dart';

/// A provider for the velocity gain for the [LookAheadDistance].
@Riverpod(keepAlive: true)
class PathInterpolationDistance extends _$PathInterpolationDistance {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      ref
          .read(simInputProvider.notifier)
          .send((pathInterpolationDistance: state));
    });
    return 4;
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for creating and holding a [PathTracking] model for the
/// previously recorded waypoints.
@Riverpod(keepAlive: true)
class ConfiguredPathTracking extends _$ConfiguredPathTracking {
  @override
  PathTracking? build() {
    final wayPoints = ref.watch(finishedPathRecordingListProvider);
    if (wayPoints != null) {
      return switch (ref.watch(activePathTrackingModeProvider)) {
        PathTrackingMode.pid || PathTrackingMode.purePursuit => PurePursuit(
            wayPoints: wayPoints,
            interpolationDistance: ref.watch(pathInterpolationDistanceProvider),
            loopMode: ref.watch(pathTrackingLoopProvider),
          ),
        PathTrackingMode.stanley => StanleyPathTracking(
            wayPoints: wayPoints,
            interpolationDistance: ref.watch(pathInterpolationDistanceProvider),
            loopMode: ref.watch(pathTrackingLoopProvider),
          )
      };
    }
    return null;
  }

  /// Send the [state] to the simulator.
  void sendToSim() =>
      ref.read(simInputProvider.notifier).send((pathTracking: state));
}

/// A provider for whether or not the vehicle should follow the
/// [ConfiguredPathTracking] tracking model.
@Riverpod(keepAlive: true)
class EnablePathTracking extends _$EnablePathTracking {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((enablePathTracking: next));
      if (next) {
        ref.read(configuredPathTrackingProvider.notifier).sendToSim();
      }
    });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}

/// A provider for which steering mode the [ConfiguredPathTracking] model should
/// use.
@Riverpod(keepAlive: true)
class ActivePathTrackingMode extends _$ActivePathTrackingMode {
  @override
  PathTrackingMode build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send(state);
    });
    return PathTrackingMode.purePursuit;
  }

  /// Update the [state] to [value].
  void update(PathTrackingMode value) => Future(() => state = value);
}

/// A provider for which looping mode the [ConfiguredPathTracking] should
/// follow.
@Riverpod(keepAlive: true)
class PathTrackingLoop extends _$PathTrackingLoop {
  @override
  PathTrackingLoopMode build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((pathTrackingLoopMode: next));
    });
    return PathTrackingLoopMode.none;
  }

  /// Update the [state] to [value].
  void update(PathTrackingLoopMode value) => Future(() => state = value);
}

/// A provider for the activated [ConfiguredPathTracking] model, typically
/// recieved and updated from the simulator.
@riverpod
class DisplayPathTracking extends _$DisplayPathTracking {
  @override
  PathTracking? build() => null;

  /// Update the [state] to [pathTracking].
  void update(PathTracking? pathTracking) => Future(() => state = pathTracking);

  /// Set the state to null.
  void clear() => Future(() => state = null);
}

/// A provider for the perpendicular distance from the [DisplayPathTracking]
/// line to the [MainVehicle].
@riverpod
double? pathTrackingPerpendicularDistance(
  PathTrackingPerpendicularDistanceRef ref,
) =>
    ref
        .watch(displayPathTrackingProvider)
        ?.perpendicularDistance(ref.watch(mainVehicleProvider));

/// A provider for whether or not the path tracking debugging features should
/// show.
@Riverpod(keepAlive: true)
class DebugPathTracking extends _$DebugPathTracking {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}
