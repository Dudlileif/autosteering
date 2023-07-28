import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pure_pursuit_providers.g.dart';

/// A provider for creating and holding a [PurePursuit] model for the
/// previously recorded waypoints.
@Riverpod(keepAlive: true)
class ConfiguredPurePursuit extends _$ConfiguredPurePursuit {
  @override
  PurePursuit? build() {
    final wayPoints = ref.watch(finishedPathRecordingListProvider);
    if (wayPoints != null) {
      return PurePursuit(
        wayPoints: wayPoints,
        interpolationDistance: ref.watch(lookAheadDistanceProvider),
        loopMode: ref.watch(purePursuitLoopProvider),
      );
    }
    return null;
  }

  /// Send the [state] to the simulator.
  void sendToSim() =>
      ref.read(simInputProvider.notifier).send((purePursuit: state));
}

/// A provider for whether or not the vehicle should follow the
/// [ConfiguredPurePursuit] tracking model.
@Riverpod(keepAlive: true)
class EnablePurePursuit extends _$EnablePurePursuit {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((enablePurePursuit: next));
      if (next) {
        ref.read(configuredPurePursuitProvider.notifier).sendToSim();
      }
    });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}

/// A provider for which steering mode the [ConfiguredPurePursuit] model should
/// use.
@Riverpod(keepAlive: true)
class PursuitMode extends _$PursuitMode {
  @override
  PurePursuitMode build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send(state);
    });
    return PurePursuitMode.lookAhead;
  }

  /// Update the [state] to [value].
  void update(PurePursuitMode value) => Future(() => state = value);
}

/// A provider for which looping mode the [ConfiguredPurePursuit] should follow.
@Riverpod(keepAlive: true)
class PurePursuitLoop extends _$PurePursuitLoop {
  @override
  PurePursuitLoopMode build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((loopModePursuit: next));
    });
    return PurePursuitLoopMode.none;
  }

  /// Update the [state] to [value].
  void update(PurePursuitLoopMode value) => Future(() => state = value);
}

/// A provider for the look ahead distance of the [ConfiguredPurePursuit] model.
@Riverpod(keepAlive: true)
class LookAheadDistance extends _$LookAheadDistance {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((lookAheadDistance: state));
    });
    return 4;
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the activated [ConfiguredPurePursuit] model, typically
/// recieved and updated from the simulator.
@riverpod
class DisplayPurePursuit extends _$DisplayPurePursuit {
  @override
  PurePursuit? build() => null;

  /// Update the [state] to [pursuit].
  void update(PurePursuit? pursuit) => Future(() => state = pursuit);

  /// Set the state to null.
  void clear() => Future(() => state = null);
}

/// A provider for the perpendicular distance from the [DisplayPurePursuit] line
/// to the [MainVehicle].
@riverpod
double? purePursuitPerpendicularDistance(
  PurePursuitPerpendicularDistanceRef ref,
) =>
    ref
        .watch(displayPurePursuitProvider)
        ?.perpendicularDistance(ref.watch(mainVehicleProvider));

/// A provider for whether or not the pure pursuit debugging features should
/// show.
@Riverpod(keepAlive: true)
class DebugPurePursuit extends _$DebugPurePursuit {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}
