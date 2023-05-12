import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_debug_providers.g.dart';

@Riverpod(keepAlive: true)
class DebugVehiclePolygons extends _$DebugVehiclePolygons {
  @override
  bool build() => true;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state = !state);
}

@Riverpod(keepAlive: true)
class DebugSteering extends _$DebugSteering {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state = !state);
}

@Riverpod(keepAlive: true)
class DebugTrajectory extends _$DebugTrajectory {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state = !state);
}

@Riverpod(keepAlive: true)
class DebugTravelledPath extends _$DebugTravelledPath {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state = !state);
}

@Riverpod(keepAlive: true)
class DebugTravelledPathSize extends _$DebugTravelledPathSize {
  @override
  int build() => 100;

  void update(int value) => Future(() => state = value);
}

@riverpod
class DebugTravelledPathList extends _$DebugTravelledPathList {
  @override
  List<LatLng> build() {
    if (ref.watch(debugTravelledPathProvider)) {
      ref.listen(
        mainVehicleProvider,
        (previous, next) => add(next.position),
        fireImmediately: true,
      );
    }

    return <LatLng>[];
  }

  void add(LatLng point) => Future(() {
        if (state.length == ref.watch(debugTravelledPathSizeProvider)) {
          state.removeLast();
        }
        state = [point, ...state];
      });
}
