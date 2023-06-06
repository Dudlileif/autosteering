import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pure_pursuit_providers.g.dart';

/// A provider for creating and holding a [PurePursuit] model for the
/// previously recorded waypoints.
@Riverpod(keepAlive: true)
PurePursuit? purePursuit(PurePursuitRef ref) {
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

/// A provider for whether or not the vehicle should follow the [purePursuit]
/// tracking model.
@Riverpod(keepAlive: true)
class EnablePurePursuit extends _$EnablePurePursuit {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref
          .read(simVehicleInputProvider.notifier)
          .send((purePursuit: ref.watch(purePursuitProvider)));

      ref
          .read(simVehicleInputProvider.notifier)
          .send((enablePurePursuit: next));
    });
    return false;
  }

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}

/// A provider for which steering mode the [PurePursuit] model should use.
@Riverpod(keepAlive: true)
class PursuitMode extends _$PursuitMode {
  @override
  PurePursuitMode build() {
    ref.listenSelf((previous, next) {
      ref.read(simVehicleInputProvider.notifier).send(state);
    });
    return PurePursuitMode.pid;
  }

  void update(PurePursuitMode value) => Future(() => state = value);
}

/// A provider for which looping mode the [purePursuit] should follow.
@Riverpod(keepAlive: true)
class PurePursuitLoop extends _$PurePursuitLoop {
  @override
  PurePursuitLoopMode build() {
    ref.listenSelf((previous, next) {
      ref.read(simVehicleInputProvider.notifier).send((loopModePursuit: next));
    });
    return PurePursuitLoopMode.none;
  }

  void update(PurePursuitLoopMode value) => Future(() => state = value);
}

/// A provider for the look ahead distance of the [PurePursuit] model.
@Riverpod(keepAlive: true)
class LookAheadDistance extends _$LookAheadDistance {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      ref
          .read(simVehicleInputProvider.notifier)
          .send((lookAheadDistance: state));
    });
    return 4;
  }

  void update(double value) => Future(() => state = value);
}

/// A provider for the activated [PurePursuit] model, typically recieved and
/// updated from the simulator.
@riverpod
class DisplayPurePursuit extends _$DisplayPurePursuit {
  @override
  PurePursuit? build() => null;

  void update(PurePursuit? pursuit) => Future(
        () => state = pursuit,
      );

  void clear() => Future(() => state = null);
}

/// A provider for whether or not the pure pursuit debugging features should
/// show.
@Riverpod(keepAlive: true)
class DebugPurePursuit extends _$DebugPurePursuit {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}
