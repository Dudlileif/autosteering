import 'package:agopengps_flutter/src/features/common/utils/position_projection_extensions.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_debug_providers.g.dart';

/// Whether to show vehicle debug polygons.
@Riverpod(keepAlive: true)
class DebugVehiclePolygons extends _$DebugVehiclePolygons {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle steering debug features.
@Riverpod(keepAlive: true)
class DebugSteering extends _$DebugSteering {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle trajectory debug features.
@Riverpod(keepAlive: true)
class DebugTrajectory extends _$DebugTrajectory {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle travelled path debug.
@Riverpod(keepAlive: true)
class DebugTravelledPath extends _$DebugTravelledPath {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// The amount of points [DebugTravelledPathList] should hold.
@Riverpod(keepAlive: true)
class DebugTravelledPathSize extends _$DebugTravelledPathSize {
  @override
  int build() => 100;

  /// Update the [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A list of the last [DebugTravelledPathSize] position points for the vehicle.
@riverpod
class DebugTravelledPathList extends _$DebugTravelledPathList {
  @override
  List<LatLng> build() {
    if (ref.watch(debugTravelledPathProvider)) {
      ref.listen(
        mainVehicleProvider,
        (previous, next) => add(next.lookAheadStartPosition.latLng),
        fireImmediately: true,
      );
    }

    return <LatLng>[];
  }

  /// Add the [point] to the travelled path.
  void add(LatLng point) => Future(() {
        if (state.length == ref.watch(debugTravelledPathSizeProvider)) {
          state.removeLast();
        }
        state = [point, ...state];
      });
}

/// Whether to show vehicle hitches debug.
@Riverpod(keepAlive: true)
class DebugVehicleHitches extends _$DebugVehicleHitches {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle antenna position debug.
@Riverpod(keepAlive: true)
class DebugVehicleAntennaPosition extends _$DebugVehicleAntennaPosition {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle antenna position debug.
@Riverpod(keepAlive: true)
class DebugVehicleIMU extends _$DebugVehicleIMU {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// Whether to show vehicle autosteer parameters debug.
@Riverpod(keepAlive: true)
class DebugVehicleAutosteerParameters
    extends _$DebugVehicleAutosteerParameters {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}
