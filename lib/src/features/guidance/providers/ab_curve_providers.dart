import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ab_curve_providers.g.dart';

/// A provider for the curve points for the AB-curve.
@Riverpod(keepAlive: true)
class ABCurvePoints extends _$ABCurvePoints {
  @override
  List<WayPoint>? build() => null;

  /// Updates [state] to [points].
  void update(List<WayPoint> points) => Future(() => state = points);
}

/// A provider for the AB-line object to debug.
@Riverpod(keepAlive: true)
class ABCurveDebug extends _$ABCurveDebug {
  @override
  ABCurve? build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((abTracking: next));
    });

    final points = ref.watch(aBCurvePointsProvider);
    if (points != null) {
      if ((points.length) >= 2) {
        return ABCurve(
          start: points.first,
          end: points.last,
          baseCurve: points,
          width: ref.read(aBWidthProvider),
          turningRadius: ref.read(aBTurningRadiusProvider),
          turnOffsetIncrease: ref.read(aBTurnOffsetIncreaseProvider),
          limitMode: ref.read(aBTrackingLimitModeProvider),
        );
      }
    }

    return null;
  }

  /// Move the curve by one offset step to the right relative to the [vehicle]'s
  /// bearing.
  void moveOffsetRight(Vehicle vehicle) =>
      Future(() => state = state?..moveOffsetRight(vehicle));

  /// Move the curve by one offset step to the left relative to the [vehicle]'s
  /// bearing.
  void moveOffsetLeft(Vehicle vehicle) =>
      Future(() => state = state?..moveOffsetLeft(vehicle));

  /// Update whether the closest curve automatically should be selected.
  void updateSnapToClosestLine({required bool value}) =>
      Future(() => state = state?..snapToClosestLine = value);

  @override
  bool updateShouldNotify(ABCurve? previous, ABCurve? next) => true;
}
