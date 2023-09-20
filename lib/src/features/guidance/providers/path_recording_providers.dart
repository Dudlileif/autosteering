import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'path_recording_providers.g.dart';

/// Whether the recorder is enabled.
@Riverpod(keepAlive: true)
class EnablePathRecorder extends _$EnablePathRecorder {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// A list of the currently recording points.
@Riverpod(keepAlive: true)
class PathRecordingList extends _$PathRecordingList {
  @override
  List<WayPoint> build() {
    final points = <WayPoint>[];

    ref.listen(
      enablePathRecorderProvider,
      (prevDoRecord, doRecord) async {
        if (doRecord) {
          ref.listen(mainVehicleProvider.select((vehicle) => vehicle.wayPoint),
              (prevWayPoint, wayPoint) async {
            if (prevWayPoint != wayPoint) {
              if (points.isNotEmpty) {
                final distance = points.last.position.spherical.distanceTo(
                  wayPoint.position,
                );
                if (distance > 20) {
                  await add(wayPoint);
                } else if (distance > 1 && points.length >= 2) {
                  final prevBearing = points[points.length - 2]
                      .position
                      .spherical
                      .initialBearingTo(
                        points.last.position,
                      );
                  final bearing =
                      points.last.position.spherical.initialBearingTo(
                    wayPoint.position,
                  );

                  final bearingDiff = (prevBearing - bearing).abs();

                  if (bearingDiff > 1) {
                    await add(wayPoint);
                  }
                } else if (points.length < 2 && distance > 1) {
                  await add(wayPoint);
                }
              } else {
                await add(wayPoint);
              }
            }
          });
        } else if (prevDoRecord != null) {
          if (prevDoRecord && !doRecord) {
            if (state.isNotEmpty) {
              final position = ref.read(
                mainVehicleProvider.select((vehicle) => vehicle.wayPoint),
              );
              if (state.last != position) {
                await add(position);
              }
              ref
                  .read(finishedPathRecordingListProvider.notifier)
                  .update(points);
            }
            ref.invalidateSelf();
          }
        }
      },
      fireImmediately: true,
    );

    return points;
  }

  /// Add the [point] to the [state].
  Future<void> add(WayPoint point) => Future(() => state = state..add(point));

  /// Remove all the waypoints.
  void clear() => Future(() => state.clear());
}

/// A list of path points for the last finished recording.
@Riverpod(keepAlive: true)
class FinishedPathRecordingList extends _$FinishedPathRecordingList {
  @override
  List<WayPoint>? build() => null;

  /// Update the [state] to [points].
  void update(List<WayPoint> points) => Future(() => state = points);

  /// Move the [point] to [index].
  void movePoint(int index, WayPoint point) => Future(
        () => state = state
          ?..insert(index, point)
          ..removeAt(index + 1),
      );

  /// Insert [point] at [index].
  void insert(int index, WayPoint point) =>
      Future(() => state = state?..insert(index, point));

  /// Remove point at [index].
  void remove(int index) => Future(
        () => state = state?..removeAt(index),
      );

  /// Set the state to null.
  void clear() => Future(() => state = null);

  @override
  bool updateShouldNotify(List<WayPoint>? previous, List<WayPoint>? next) =>
      true;
}

/// Whether to show the last fininshed path recording.
@Riverpod(keepAlive: true)
class ShowFinishedPath extends _$ShowFinishedPath {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}

/// Whether to activate editing of the last finished path recording.
@Riverpod(keepAlive: true)
class EditFinishedPath extends _$EditFinishedPath {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}
