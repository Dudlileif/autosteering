import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'look_ahead_providers.g.dart';

/// A provider for the look ahead distance for the guidance modes.
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

/// A provider for the velocity gain for the [LookAheadDistance].
@Riverpod(keepAlive: true)
class LookAheadVelocityGain extends _$LookAheadVelocityGain {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((lookAheadVelocityGain: state));
    });
    return 0.5;
  }

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}
