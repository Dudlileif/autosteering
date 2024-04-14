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

import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';

export 'pure_pursuit/pure_pursuit_parameters.dart';
export 'stanley_path_tracking/stanley_parameters.dart';

part 'pure_pursuit/pure_pursuit_path_tracking.dart';
part 'stanley_path_tracking/stanley_path_tracking.dart';

/// An enumerator for which path tracking mode to use.
enum PathTrackingMode {
  /// Use Pure Pursuit (look ahead) to control the steering.
  purePursuit,

  /// Use Stanley path tracking to control the steering.
  stanley;

  /// Converts the enumerator value to a json compatible string.
  String toJson() => name;

  /// Finds the corresponding [PathTrackingMode] to the [json] string value.
  static PathTrackingMode fromJson(String json) =>
      values.firstWhere((element) => element.name == json);
}

/// An enumerator for if/how the last and first points of the path of the
/// [PathTracking] should loop.
enum PathTrackingLoopMode {
  /// Don't loop when reaching the end.
  none,

  /// Loop to the start point by using a straight line from the end point.
  straight,

  /// Loop to the start point by using a Dubins path from the end point.
  dubins;

  /// Converts the enumerator value to a json compatible string.
  String toJson() => name;

  /// Finds the corresponding [PathTrackingLoopMode] to the [json] string value.
  static PathTrackingLoopMode fromJson(String json) =>
      values.firstWhere((element) => element.name == json);
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
    this.name,
  }) {
    interPolateWayPoints();
  }

  factory PathTracking.fromJson(Map<String, dynamic> json) {
    final mode = PathTrackingMode.fromJson(json['mode'] as String);
    final wayPoints = List<Map<String, dynamic>>.from(json['points'] as List)
        .map(WayPoint.fromJson)
        .toList();
    final interpolationDistance = json['interpolation_distance'] as double;
    final loopMode = PathTrackingLoopMode.fromJson(json['loop_mode'] as String);

    return switch (mode) {
      PathTrackingMode.purePursuit => PurePursuitPathTracking(
          wayPoints: wayPoints,
          interpolationDistance: interpolationDistance,
          loopMode: loopMode,
          name: json['name'] as String?,
        ),
      PathTrackingMode.stanley => StanleyPathTracking(
          wayPoints: wayPoints,
          interpolationDistance: interpolationDistance,
          loopMode: loopMode,
          name: json['name'] as String?,
        ),
    };
  }

  /// Name or description of this.
  String? name;

  /// The list of waypoints to interpolate from.
  List<WayPoint> wayPoints;

  /// The maximum distance between points in the path, points will be
  /// interpolated if the [wayPoints] are too far apart.
  ///
  /// If set to 0 or null, no interpolation will be applied.
  double? interpolationDistance;

  /// Dictates what should happen between the last and the first points of
  /// [wayPoints]. This can add a straight line or Dubins path from last to
  /// first if specified, otherwise no loop will be added.
  PathTrackingLoopMode loopMode;

  /// The list of waypoints that the vehicle should follow.
  late List<WayPoint> path;

  /// The length of the path from start to the path point at the same index.
  late List<double> cumulativePathSegmentLengths;

  /// The [path]'s index for the currently tracked point.
  int get currentIndex => switch (
          loopMode != PathTrackingLoopMode.none || cumulativeIndex.isNegative) {
        true => cumulativeIndex % path.length,
        false => cumulativeIndex
      };

  /// The cumulative index for the currently tracked point.
  int cumulativeIndex = 0;

  /// The distance along the path from the start point to the vehicle
  double distanceAlongPathFromStart(Vehicle vehicle) {
    if (currentIndex == path.length - 1) {
      return cumulativePathSegmentLengths.last +
          vehicle.pathTrackingPoint.spherical.alongTrackDistanceTo(
            start: path.last.position,
            end: path.last.moveRhumb(distance: 100).position,
          );
    } else if (currentIndex >= path.length) {
      cumulativeIndex = path.length - 2;
    }
    return cumulativePathSegmentLengths[currentIndex] +
        vehicle.pathTrackingPoint.spherical.alongTrackDistanceTo(
          start: path[currentIndex].position,
          end: path[currentIndex + 1].position,
        );
  }

  /// Whether the path is completed.
  bool get isCompleted => cumulativeIndex.abs() >= path.length - 1;

  /// Updates [wayPoints] to [newWayPoints] and interpolats the result in
  /// [path].
  ///
  /// The maximum distances between the points are [newInterpolationDistance]
  /// and if [newLoopMode] is specified, a path from the last point to the first
  /// is added. These parameters will also update [interpolationDistance] and
  /// [loopMode].
  void interPolateWayPoints({
    List<WayPoint>? newWayPoints,
    double? newInterpolationDistance,
    PathTrackingLoopMode? newLoopMode,
  }) {
    wayPoints = newWayPoints ?? wayPoints;
    interpolationDistance = newInterpolationDistance ?? interpolationDistance;
    loopMode = newLoopMode ?? loopMode;
    path = List<WayPoint>.from(wayPoints);

    if (interpolationDistance != null && interpolationDistance! > 0) {
      var index = 0;

      while (index + 1 < path.length) {
        final point = path[index];
        final nextPoint = path[index + 1];
        if (point.position.rhumb.distanceTo(nextPoint.position) >
            interpolationDistance!) {
          path.insert(
            index + 1,
            point.copyWith(
              position: point.position.rhumb.destinationPoint(
                distance: interpolationDistance!,
                bearing:
                    point.position.rhumb.initialBearingTo(nextPoint.position),
              ),
            ),
          );
        }
        index++;
      }

      if (loopMode == PathTrackingLoopMode.straight) {
        while (path.last.position.rhumb.distanceTo(
              path.first.position,
            ) >
            (interpolationDistance ?? 4)) {
          path.add(
            path.last.copyWith(
              position: path.last.position.rhumb.destinationPoint(
                distance: interpolationDistance ?? 4,
                bearing: path.last.position.rhumb
                    .initialBearingTo(path.first.position),
              ),
            ),
          );
        }
      }
    }

    if (loopMode == PathTrackingLoopMode.dubins) {
      final dubinsPath = DubinsPath(
        start: path.last,
        end: path.first,
        turningRadius: 6,
        stepSize: (interpolationDistance ?? 4) / 3,
      ).bestDubinsPathPlan?.wayPoints;

      if (dubinsPath != null) {
        // Skip the first and last point of the dubins path to avoid duplicates
        // that cause wrong calculations.
        path.addAll(dubinsPath.getRange(1, dubinsPath.length - 2));
      }
    }

    cumulativePathSegmentLengths = [0];

    for (var i = 1; i < path.length - 1; i++) {
      cumulativePathSegmentLengths.add(
        cumulativePathSegmentLengths[i - 1] +
            path[i].distanceToRhumb(path[i - 1]),
      );
    }
  }

  /// The index of the next waypoint when driving forward.
  int get nextForwardIndex => cumulativeIndex + 1;

  /// The index of the next (previous) waypoint when driving in reverse.
  int get nextReversingIndex => cumulativeIndex - 1;

  /// The current waypoint.
  WayPoint currentWayPoint(Vehicle vehicle) {
    if (loopMode == PathTrackingLoopMode.none && isCompleted) {
      return closestWayPoint(vehicle);
    }

    return path[currentIndex];
  }

  /// The next waypoint when driving forward.
  WayPoint get nextForwardWayPoint {
    if (loopMode == PathTrackingLoopMode.none && isCompleted) {
      return (path.lastOrNull ?? wayPoints.last).moveRhumb(distance: 100);
    }
    return path[nextForwardIndex % path.length];
  }

  /// The next waypoint when driving in reverse.
  WayPoint get nextReversingWayPoint {
    if (loopMode == PathTrackingLoopMode.none && isCompleted) {
      return (path.firstOrNull ?? wayPoints.first)
          .moveRhumb(distance: 100, angleFromBearing: 180);
    }
    return path[nextReversingIndex % path.length];
  }

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
  Geographic perpendicularIntersect(Vehicle vehicle) {
    final nextPoint = nextWayPoint(vehicle).position;

    final currentPoint = currentWayPoint(vehicle);

    final distanceAlong = vehicle.pathTrackingPoint.spherical
        .alongTrackDistanceTo(start: currentPoint.position, end: nextPoint);

    if (!distanceAlong.isFinite) {
      return currentPoint.position;
    }

    var bearing = currentPoint.position.rhumb.initialBearingTo(nextPoint);

    if (bearing.isNaN) {
      bearing = currentPoint.bearing;
    }

    final intersect = currentPoint.position.rhumb
        .destinationPoint(distance: distanceAlong, bearing: bearing);
    return intersect;
  }

  /// The distance from the vehicle to the [perpendicularIntersect] point.
  ///
  /// The value is negative if the vehicle is to the left of the line.
  double perpendicularDistance(Vehicle vehicle) =>
      vehicle.pathTrackingPoint.spherical.crossTrackDistanceTo(
        start: currentWayPoint(vehicle).position,
        end: nextForwardWayPoint.position,
      );

  /// The waypoint in [path] that is closest to the [vehicle].
  WayPoint closestWayPoint(Vehicle vehicle) => path.reduce(
        (value, element) => element.position.rhumb.distanceTo(
                  vehicle.pathTrackingPoint,
                ) <
                value.position.rhumb.distanceTo(vehicle.pathTrackingPoint)
            ? element
            : value,
      );

  /// The index of the [closestWayPoint].
  int closestIndex(Vehicle vehicle) => path.indexOf(closestWayPoint(vehicle));

  /// Sets [cumulativeIndex] to the [closestIndex].
  void setIndexToClosestPoint(Vehicle vehicle) =>
      cumulativeIndex = closestIndex(vehicle);

  /// Try to advance to the next waypoint in the list.
  ///
  /// Will continue recursively until we are behind the next point.
  bool tryChangeWayPoint(Vehicle vehicle) {
    final nextPoint = nextWayPoint(vehicle);

    final currentPoint = currentWayPoint(vehicle);

    final progress = vehicle.pathTrackingPoint.spherical.alongTrackDistanceTo(
      start: currentPoint.position,
      end: nextPoint.position,
    );

    final segmentLength = currentPoint.distanceToRhumb(nextPoint);

    if (progress > segmentLength) {
      cumulativeIndex = nextIndex(vehicle);
      return tryChangeWayPoint(vehicle);
    }
    return false;
  }

  /// The next steering angle for the vehicle following the [path].
  double nextSteeringAngle(Vehicle vehicle);

  /// Converts the object to a json compatible structure.
  Map<String, dynamic> toJson() => {
        'points': wayPoints,
        'loop_mode': loopMode,
        'interpolation_distance': interpolationDistance,
        'name': name,
      };
}

/// An extension on [Vehicle] for finding the right path tracking reference
/// point.
extension VehiclePathTrackingExtension on Vehicle {
  /// Finds the point position corresponding to the [pathTrackingMode].
  Geographic get pathTrackingPoint => switch (pathTrackingMode) {
        PathTrackingMode.purePursuit => lookAheadStartPosition,
        PathTrackingMode.stanley => stanleyAxlePosition,
      };
}
