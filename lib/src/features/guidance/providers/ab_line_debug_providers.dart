import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ab_line_debug_providers.g.dart';

/// A provider for whether the [aBLineDebugProvider]'s state should be
/// used for autosteering.
@Riverpod(keepAlive: true)
class ABLineDebugEnabled extends _$ABLineDebugEnabled {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref
          .read(simInputProvider.notifier)
          .send((abLine: ref.watch(aBLineDebugProvider)));
    });

    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for whether the AB-line debugging features should be shown.
@Riverpod(keepAlive: true)
class ABLineDebugShow extends _$ABLineDebugShow {
  @override
  bool build() => false;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for the step size of an AB-line.
@Riverpod(keepAlive: true)
class ABLineDebugStepSize extends _$ABLineDebugStepSize {
  @override
  double build() => 5;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the number of points of the closest AB-line to be
/// generated ahead of the vehicle.
@Riverpod(keepAlive: true)
class ABLineDebugNumPointsAhead extends _$ABLineDebugNumPointsAhead {
  @override
  int build() => 5;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the number of points of the closest AB-line to be
/// generated behind of the vehicle.
@Riverpod(keepAlive: true)
class ABLineDebugNumPointsBehind extends _$ABLineDebugNumPointsBehind {
  @override
  int build() => 0;

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the starting point A of an AB-line.
@Riverpod(keepAlive: true)
class ABLinePointA extends _$ABLinePointA {
  @override
  LatLng? build() => null;

  /// Updates [state] to [point].
  void update(LatLng point) => Future(() => state = point);
}

/// A provider for the ending point B of an AB-line.
@Riverpod(keepAlive: true)
class ABLinePointB extends _$ABLinePointB {
  @override
  LatLng? build() => null;

  /// Updates [state] to [point].
  void update(LatLng point) => Future(() => state = point);
}

/// A provider for the width of an AB-line.
@Riverpod(keepAlive: true)
class ABLineWidth extends _$ABLineWidth {
  @override
  double build() => 12;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the AB-line object to debug.
@Riverpod(keepAlive: true)
class ABLineDebug extends _$ABLineDebug {
  @override
  ABLine? build() {
    final a = ref.watch(aBLinePointAProvider);
    final b = ref.watch(aBLinePointBProvider);

    if (a != null && b != null) {
      return ABLine(start: a, end: b, width: ref.watch(aBLineWidthProvider));
    }

    return null;
  }

  /// Move the line by one offset step to the right relative to [heading].
  void moveOffsetRight(double heading) =>
      Future(() => state = state?..moveOffsetRight(heading));

  /// Move the line by one offset step to the left relative to [heading].

  void moveOffsetLeft(double heading) =>
      Future(() => state = state?..moveOffsetLeft(heading));

  /// Update whether the closest line automatically should be selected.
  void updateSnapToClosestLine({required bool value}) =>
      Future(() => state = state?..snapToClosestLine = value);

  @override
  bool updateShouldNotify(ABLine? previous, ABLine? next) => true;
}

/// A provider for the activated [ABLineDebug] model, typically updated and
/// recieved from the simulator.
@riverpod
class DisplayABLine extends _$DisplayABLine {
  @override
  ABLine? build() => null;

  /// Updates [state] to [value].
  void update(ABLine? value) => Future(() => state = value);
}

/// A provider for the perpendicular distance from the [ABLineDebug] line
/// to the [MainVehicle].
@riverpod
double? abLinePerpendicularDistance(AbLinePerpendicularDistanceRef ref) =>
    switch (ref.watch(autoSteerEnabledProvider)) {
      true => ref.watch(displayABLineProvider),
      false => ref.watch(aBLineDebugProvider)
    }
        ?.signedPerpendicularDistanceToCurrentLine(
      point: ref.watch(
        mainVehicleProvider.select((vehicle) => vehicle.pursuitAxlePosition),
      ),
      heading:
          ref.watch(mainVehicleProvider.select((vehicle) => vehicle.bearing)),
    );
