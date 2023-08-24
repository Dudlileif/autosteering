import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';
import 'package:geobase/geobase.dart';

part 'pure_pursuit/pure_pursuit_parameters.dart';
part 'pure_pursuit/pure_pursuit_path_tracking.dart';
part 'stanley_path_tracking/stanley_parameters.dart';
part 'stanley_path_tracking/stanley_path_tracking.dart';

/// An enumerator for which path tracking mode to use.
enum PathTrackingMode {
  /// Use a PID-controller to control the steering.
  pid,

  /// Use Pure Pursuit (look ahead) to control the steering.
  purePursuit,

  /// Use Stanley path tracking to control the steering.
  stanley,
}

/// An enumerator for if/how the last and first points of the path of the
/// [PathTracking] should loop.
enum PathTrackingLoopMode {
  /// Don't loop when reaching the end.
  none,

  /// Loop to the start point by using a straight line from the end point.
  straight,

  /// Loop to the start point by using a Dubins path from the end point.
  dubins,
}

/// A general absctract class for path tracking.
sealed class PathTracking {
  /// A general absctract class for path tracking.
  ///
  /// The path tracking algorithm finds a point on the path and attempts
  /// to chase it until it reaches the end of the path.
  ///
  /// The [wayPoints] gives the path that the vehicle should follow.
  ///
  /// The [interpolationDistance] is the maximum distance between points in the
  /// path, points will be interpolated if the [wayPoints] are too far apart.
  ///
  /// The [loopMode] dictates what if the path should loop back to the start
  /// with a Dubins path, straight path or not loop.
  PathTracking({
    required this.wayPoints,
    this.interpolationDistance = 4,
    this.loopMode = PathTrackingLoopMode.none,
  }) {
    interPolateWayPoints(
      maxDistance: interpolationDistance,
      loopMode: loopMode,
    );
  }

  /// The list of waypoints to interpolate from.
  final List<WayPoint> wayPoints;

  /// The maximum distance between points in the path, points will be
  /// interpolated if the [wayPoints] are too far apart.
  final double interpolationDistance;

  /// Dictates what should happen between the last and the first points of
  /// [wayPoints]. This can add a straight line or Dubins path from last to
  /// first if specified, otherwise no loop will be added.
  final PathTrackingLoopMode loopMode;

  /// The list of waypoints that the vehicle should follow.
  late List<WayPoint> path;

  /// The index of the current way point.
  int currentIndex = 0;

  /// Interpolates the [wayPoints] and puts the result in [path].
  ///
  /// The maximum distances between the points are [maxDistance] and if
  /// [loopMode] is specified, a path from the last point to the first
  /// is added.
  void interPolateWayPoints({
    double maxDistance = 4,
    PathTrackingLoopMode loopMode = PathTrackingLoopMode.none,
  }) {
    path = List<WayPoint>.from(wayPoints);

    var index = 0;

    while (index + 1 < path.length) {
      final point = path[index];
      final nextPoint = path[index + 1];
      if (point.position.spherical.distanceTo(nextPoint.position) >
          maxDistance) {
        path.insert(
          index + 1,
          point.copyWith(
            position: point.position.spherical.destinationPoint(
              distance: maxDistance,
              bearing:
                  point.position.spherical.initialBearingTo(nextPoint.position),
            ),
          ),
        );
      }
      index++;
    }

    if (loopMode == PathTrackingLoopMode.straight) {
      while (path.last.position.spherical.distanceTo(
            path.first.position,
          ) >
          maxDistance) {
        path.add(
          path.last.copyWith(
            position: path.last.position.spherical.destinationPoint(
              distance: maxDistance,
              bearing: path.last.position.spherical
                  .initialBearingTo(path.first.position),
            ),
          ),
        );
      }
    } else if (loopMode == PathTrackingLoopMode.dubins) {
      final dubinsPath = DubinsPath(
        start: path.last,
        end: path.first,
        turningRadius: 6,
        stepSize: maxDistance / 3,
      ).bestDubinsPathPlan?.wayPoints;

      if (dubinsPath != null) {
        // Skip the first and last point of the dubins path to avoid duplicates
        // that cause wrong calculations.
        path.addAll(dubinsPath.getRange(1, dubinsPath.length - 2));
      }
    }
  }

  /// The index of the next waypoint when driving forward.
  int get nextForwardIndex => switch (currentIndex == path.length - 1) {
        true => 0,
        false => currentIndex + 1
      };

  /// The index of the next (previous) waypoint when driving in reverse.
  int get nextReversingIndex => switch (currentIndex == 0) {
        true => path.length - 1,
        false => currentIndex - 1
      };

  /// The current waypoint.
  WayPoint get currentWayPoint => path[currentIndex];

  /// The next waypoint when driving forward.
  WayPoint get nextForwardWayPoint => path[nextForwardIndex];

  /// The next waypoint when driving in reverse.
  WayPoint get nextReversingWayPoint => path[nextReversingIndex];

  /// The next waypoint index with vehicle driving direction taken into
  /// consideration.
  int nextIndex(Vehicle vehicle) => switch (vehicle.isReversing) {
        true => nextReversingIndex,
        false => nextForwardIndex,
      };

  /// The next waypoint with vehicle driving direction taken into consideration.
  WayPoint nextWayPoint(Vehicle vehicle) => switch (vehicle.isReversing) {
        true => nextReversingWayPoint,
        false => nextForwardWayPoint,
      };

  /// The intersection point that is projected from the vehicle onto the
  /// line from the current to the next waypoint.
  Geographic perpendicularIntersect(Vehicle vehicle);

  /// The distance from the vehicle to the [perpendicularIntersect] point.
  ///
  /// The value is negative if the vehicle is to the left of the line.
  double perpendicularDistance(Vehicle vehicle);

  /// The waypoint in [path] that is closest to the [vehicle].
  WayPoint closestWayPoint(Vehicle vehicle);

  /// The index of the [closestWayPoint].
  int closestIndex(Vehicle vehicle) => path.indexOf(closestWayPoint(vehicle));

  /// Try to advance to the next waypoint in the list.
  void tryChangeWayPoint(Vehicle vehicle);

  /// The next steering angle for the vehicle following the [path].
  ///
  /// The [mode] can be specified to use different steering modes for
  /// the path tracking systems that support it, be aware that not all
  /// [PathTrackingMode]s are supported by all path tracking systems. They will
  /// then default to the most usual supported one.
  double nextSteeringAngle(Vehicle vehicle, {PathTrackingMode? mode});
}
