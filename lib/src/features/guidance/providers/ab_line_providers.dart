import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ab_line_providers.g.dart';

/// A provider for the AB-line object to debug.
@Riverpod(keepAlive: true)
class ABLineDebug extends _$ABLineDebug {
  @override
  ABLine? build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((abTracking: next));
    });

    final a = ref.watch(aBPointAProvider);
    final b = ref.watch(aBPointBProvider);

    if (a != null && b != null) {
      return ABLine(
        start: a.copyWith(bearing: a.initialBearingToSpherical(b)),
        end: b.copyWith(bearing: a.finalBearingToSpherical(b)),
        width: ref.read(aBWidthProvider),
        turningRadius: ref.read(aBTurningRadiusProvider),
        turnOffsetIncrease: ref.read(aBTurnOffsetIncreaseProvider),
        limitMode: ref.read(aBTrackingLimitModeProvider),
      );
    }

    return null;
  }

  /// Move the line by one offset step to the right relative to the [vehicle]'s
  /// bearing.
  void moveOffsetRight(Vehicle vehicle) =>
      Future(() => state = state?..moveOffsetRight(vehicle));

  /// Move the line by one offset step to the left relative to the [vehicle]'s
  /// bearing.
  void moveOffsetLeft(Vehicle vehicle) =>
      Future(() => state = state?..moveOffsetLeft(vehicle));

  /// Update whether the closest line automatically should be selected.
  void updateSnapToClosestLine({required bool value}) =>
      Future(() => state = state?..snapToClosestLine = value);

  @override
  bool updateShouldNotify(ABLine? previous, ABLine? next) => true;
}
