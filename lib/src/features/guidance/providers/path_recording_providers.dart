// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'path_recording_providers.g.dart';

/// Whether the recorder is enabled.
@Riverpod(keepAlive: true)
class EnablePathRecorder extends _$EnablePathRecorder {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next || previous != null) {
        Logger.instance.i('Path recorder ${switch (next) {
          true => 'enabled',
          false => 'disabled'
        }}.');
      }
    });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// A provider for the minimum distance between recorded points, i.e. when
/// to add new points when going turning.
@Riverpod(keepAlive: true)
class PathRecordingTurnMinDistance extends _$PathRecordingTurnMinDistance {
  @override
  double build() => 1;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the maximum distance between recorded points, i.e. when
/// to add new points when going straight.
@Riverpod(keepAlive: true)
class PathRecordingMaxDistance extends _$PathRecordingMaxDistance {
  @override
  double build() => 20;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the maximum angle between recorded points, i.e. when to
/// add new points in turns if after [PathRecordingTurnMinDistance] has been
/// passed.
@Riverpod(keepAlive: true)
class PathRecordingTriggerAngle extends _$PathRecordingTriggerAngle {
  @override
  double build() => 1;

  /// Updates [state] to [value].
  void update(double value) => Future(() => state = value);
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
                final distance = points.last.position.rhumb.distanceTo(
                  wayPoint.position,
                );
                if (distance > ref.read(pathRecordingMaxDistanceProvider)) {
                  await add(wayPoint);
                } else if (distance >
                        ref.read(pathRecordingTurnMinDistanceProvider) &&
                    points.length >= 2) {
                  final prevBearing =
                      points[points.length - 2].position.rhumb.initialBearingTo(
                            points.last.position,
                          );
                  final bearing = points.last.position.rhumb.initialBearingTo(
                    wayPoint.position,
                  );

                  if (bearingDifference(prevBearing, bearing) >
                      ref.read(pathRecordingTriggerAngleProvider)) {
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
  List<WayPoint>? build() {
    ref.listenSelf((previous, next) {
      if (next != null || previous != null) {
        Logger.instance
            .i('Finished path recording list: ${next?.length} points.');
      }
    });
    return null;
  }

  /// Update the [state] to [points].
  void update(List<WayPoint> points) => Future(() => state = points);

  /// Move the [point] to [index].
  void movePoint(int index, WayPoint point) => Future(
        () {
          var bearing = point.bearing;
          if (state != null && state!.length > index + 1) {
            bearing = point.initialBearingToRhumb(state![index + 1]);
          } else if (state != null &&
              state!.length > 1 &&
              index == state!.length - 1) {
            bearing = state![index - 1].finalBearingToRhumb(point);
          }

          return state = state
            ?..insert(index, point.copyWith(bearing: bearing))
            ..removeAt(index + 1);
        },
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
  bool build() {
    ref.listenSelf((previous, next) {
      if (next || previous != null) {
        Logger.instance.i('Editing recorded path: $next.');
      }
    });
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state != state);
}
