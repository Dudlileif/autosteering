import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ab_common_providers.g.dart';

/// A provider for whether the AB-tracking debugging features should be shown.
@Riverpod(keepAlive: true)
class ABTrackingDebugShow extends _$ABTrackingDebugShow {
  @override
  bool build() => false;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for the step size of an AB-line.
@Riverpod(keepAlive: true)
class ABDebugStepSize extends _$ABDebugStepSize {
  @override
  double build() => 5;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the number of points of the closest AB-line to be
/// generated ahead of the vehicle.
@Riverpod(keepAlive: true)
class ABDebugNumPointsAhead extends _$ABDebugNumPointsAhead {
  @override
  int build() => 0;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the number of points of the closest AB-line to be
/// generated behind of the vehicle.
@Riverpod(keepAlive: true)
class ABDebugNumPointsBehind extends _$ABDebugNumPointsBehind {
  @override
  int build() => 0;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the width of an AB-line.
@Riverpod(keepAlive: true)
class ABWidth extends _$ABWidth {
  @override
  double build() => 12;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the turning radius of an AB-line.
@Riverpod(keepAlive: true)
class ABTurningRadius extends _$ABTurningRadius {
  @override
  double build() => ref.read(
        mainVehicleProvider.select((value) => 1.25 * value.minTurningRadius),
      );

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the width of an AB-line.
@Riverpod(keepAlive: true)
class ABTurnOffsetMinSkips extends _$ABTurnOffsetMinSkips {
  @override
  int build() => 0;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for which limit mode the AB tracking should use.
@Riverpod(keepAlive: true)
class ABTrackingLimitMode extends _$ABTrackingLimitMode {
  @override
  ABLimitMode build() => ABLimitMode.limitedTurnOutside;

  /// Updates [state] to [value].
  void update(ABLimitMode value) => Future(() => state = value);
}

/// A provider for which swapping which way the AB-tracking should turn.
@Riverpod(keepAlive: true)
class ABOffsetOppositeTurn extends _$ABOffsetOppositeTurn {
  @override
  bool build() => false;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Inverts [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for whether the AB-tracking should snap to the closest line.
@Riverpod(keepAlive: true)
class ABSnapToClosestLine extends _$ABSnapToClosestLine {
  @override
  bool build() => false;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Inverts [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for which limit mode the AB tracking should use.
@Riverpod(keepAlive: true)
class DisplayABTracking extends _$DisplayABTracking {
  @override
  ABTracking? build() => null;

  /// Updates [state] to [value].
  void update(ABTracking? value) => Future(() => state = value);
}

/// A provider for the calculated AB lines/curves.
@Riverpod(keepAlive: true)
class DisplayABTrackingLines extends _$DisplayABTrackingLines {
  @override
  Map<int, List<WayPoint>>? build() => null;

  /// Updates [state] to [value].
  void update(Map<int, List<WayPoint>>? value) => Future(() => state = value);
}

/// A provider for the starting point A of an AB-line.
@Riverpod(keepAlive: true)
class ABPointA extends _$ABPointA {
  @override
  WayPoint? build() {
    ref.listenSelf((previous, next) {
      if (next != null) {
        Logger.instance.i('AB point A set to: $next');
      }
    });
    return null;
  }

  /// Updates [state] to [point].
  void update(WayPoint point) => Future(() => state = point);
}

/// A provider for the ending point B of an AB-line.
@Riverpod(keepAlive: true)
class ABPointB extends _$ABPointB {
  @override
  WayPoint? build() {
    ref.listenSelf((previous, next) {
      if (next != null) {
        Logger.instance.i('AB point B set to: $next');
      }
    });
    return null;
  }

  /// Updates [state] to [point].
  void update(WayPoint point) => Future(() => state = point);
}

/// A provider for the perpendicular distance from the AB tracking line
/// to the [MainVehicle].
@riverpod
double? abTrackingPerpendicularDistance(
  AbTrackingPerpendicularDistanceRef ref,
) =>
    ref
        .watch(displayABTrackingProvider)
        ?.signedPerpendicularDistanceToCurrentLine(
          ref.watch(mainVehicleProvider),
        );

/// A provider for the currently active AB configuration.
@Riverpod(keepAlive: true)
ABConfig activeABConfig(ActiveABConfigRef ref) {
  ref.listenSelf((previous, next) {
    ref.read(simInputProvider.notifier).send(next);
  });

  return ABConfig(
    width: ref.watch(aBWidthProvider),
    turningRadius: ref.watch(aBTurningRadiusProvider),
    turnOffsetMinSkips: ref.watch(aBTurnOffsetMinSkipsProvider),
    snapToClosestLine: ref.watch(aBSnapToClosestLineProvider),
    offsetOppositeTurn: ref.watch(aBOffsetOppositeTurnProvider),
    limitMode: ref.watch(aBTrackingLimitModeProvider),
  );
}
