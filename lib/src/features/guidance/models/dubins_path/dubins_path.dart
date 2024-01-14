import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';

part 'dubins_path_type.dart';

/// A class for encompassing the data generated for a [DubinsPathType].
final class DubinsPathData {
  /// A class for encompassing the data generated for a [DubinsPathType].
  ///
  /// [pathType] describes which Dubins path type this data is for.
  /// [tangentStart] is where the tangent from the first circle to the final
  /// circle starts.
  /// [tangentEnd] is where the tangent from the first circle to the final
  /// circle ends.
  /// [startLength] is the path length of around the first circle.
  /// [middleLength] is the path length of the tangent or around the
  /// middle circle.
  /// [endLength] is the path lenght around the last circle.
  /// [middleCircleCenter] should be the center point of the middle circle if
  /// [pathType] is [DubinsPathType.lrl] or [DubinsPathType.rlr].

  DubinsPathData({
    required this.pathType,
    required this.tangentStart,
    required this.tangentEnd,
    required this.startLength,
    required this.middleLength,
    required this.endLength,
    this.middleCircleCenter,
  })  : totalLength = startLength + middleLength + endLength,
        assert(
          DubinsPathType.withStraight.contains(pathType) ||
              (DubinsPathType.onlyCircles.contains(pathType) &&
                  middleCircleCenter != null),
          '''
The Dubins path data must contain a middle circle center point if the path type
is made of three circles (lrl or rlr). 
          ''',
        );

  /// Which path type this is.
  final DubinsPathType pathType;

  /// The starting point of the tangent.
  final WayPoint tangentStart;

  /// The ending point of the tangent.
  final WayPoint tangentEnd;

  /// The length of the first path section.
  final double startLength;

  /// The length of the middle path section.
  final double middleLength;

  /// The length of the final path section.
  final double endLength;

  /// The total length of the path.
  final double totalLength;

  /// The center point of the middle circle if [pathType] is
  /// [DubinsPathType.lrl] or [DubinsPathType.rlr].
  final Geographic? middleCircleCenter;
}

/// A class for calculating Dubins paths between two points.
class DubinsPath {
  /// A class for calculating Dubins paths between two points.
  ///
  /// The [start] and [end] waypoints of the path must be set.
  /// The [turningRadius] dictates how tight the vehicle can turn at full
  /// steering lock. A slightly/somewhat larger radius might be easier to
  /// track in real time.
  /// The [stepSize] indicates the distance between the points on the
  /// generated path.
  DubinsPath({
    required this.start,
    required this.end,
    required this.turningRadius,
    required this.stepSize,
    this.allowCrossingDirectLine = true,
  }) {
    /// The number of degrees that [stepSize] meters along a turning circle
    /// amounts to.
    angleStepSize = 360 * stepSize / (2 * pi * turningRadius);

    /// The center position of the left starting circle.
    startLeftCircleCenter = start.position.spherical.destinationPoint(
      distance: turningRadius,
      bearing: (start.bearing - 90).wrap360(),
    );

    /// The center position of the right starting circle.
    startRightCircleCenter = start.position.spherical.destinationPoint(
      distance: turningRadius,
      bearing: (start.bearing + 90).wrap360(),
    );

    /// The center position of the left end circle.
    endLeftCircleCenter = end.position.spherical.destinationPoint(
      distance: turningRadius,
      bearing: (end.bearing - 90).wrap360(),
    );

    /// The center position of the right end circle.
    endRightCircleCenter = end.position.spherical.destinationPoint(
      distance: turningRadius,
      bearing: (end.bearing + 90).wrap360(),
    );

    // Set the data for all the path types.
    _pathDataIterable = DubinsPathType.values.map(
      pathData,
    );

    // Find the best path
    bestPathData = _pathDataIterable.reduce(
      (value, element) {
        if (!allowCrossingDirectLine) {
          final isCrossing = element?.tangentStart
                  .crossTrackDistanceToSpherical(start: start, end: end)
                  .sign !=
              element?.tangentEnd
                  .crossTrackDistanceToSpherical(start: start, end: end)
                  .sign;
          if (isCrossing) {
            return value;
          }
        }

        return (element?.totalLength ?? double.infinity) <
                (value?.totalLength ?? double.infinity)
            ? element
            : value;
      },
    );
  }

  /// The starting point of the path.
  final WayPoint start;

  /// The ending point of the path.
  final WayPoint end;

  /// The turning radius of the vehicle that is traversing the path.
  final double turningRadius;

  /// The distance in meter between each interpolated point.
  final double stepSize;

  /// Whether the best path can cross the straight line from [start] to [end].
  final bool allowCrossingDirectLine;

  /// The number of degrees that [stepSize] meters along a turning circle
  /// amounts to.
  late double angleStepSize;

  /// The center position of the left starting circle.
  late Geographic startLeftCircleCenter;

  /// The center position of the right starting circle.
  late Geographic startRightCircleCenter;

  /// The center position of the left end circle.
  late Geographic endLeftCircleCenter;

  /// The center position of the right end circle.
  late Geographic endRightCircleCenter;

  /// An iterable of the part lengths for each Dubins path type.
  late Iterable<DubinsPathData?> _pathDataIterable;

  /// The shortest Dubins path between the points.
  ///
  /// Should not return null, but is allowed just in case.
  late DubinsPathData? bestPathData;

  /// The path data for the [pathType], can be null if the path is invalid or
  /// not possible.
  DubinsPathData? pathData(
    DubinsPathType? pathType,
  ) {
    // Allow null pathType for easier testing with ui.
    if (pathType == null) {
      return null;
    }

    // The circle which we calculate the first part of the path from.
    final startingCircle = switch (pathType.start) {
      DubinsSection.l => startLeftCircleCenter,
      DubinsSection.r => startRightCircleCenter,
      _ => startRightCircleCenter, // Not used as start can only be l or r.
    };

    // The circle which we calculate the last part of the path from.
    final endingCircle = switch (pathType.end) {
      DubinsSection.l => endLeftCircleCenter,
      DubinsSection.r => endRightCircleCenter,
      _ => endRightCircleCenter, // Not used as end can only be l or r.
    };

    // The bearing from the starting to the ending circle.
    final startToEndCircleBearing =
        startingCircle.spherical.initialBearingTo(endingCircle);

    // The distance from the starting to the ending circle.
    final startToEndCircleDistance =
        startingCircle.spherical.distanceTo(endingCircle);

    // Invalidate paths that can't physically exist.
    if (pathType == DubinsPathType.lsr || pathType == DubinsPathType.rsl) {
      // Diagonal distance has to be greater than one turning circle diameter.
      if (startToEndCircleDistance < 2 * turningRadius) {
        return null;
      }
    } else if (pathType == DubinsPathType.lrl ||
        pathType == DubinsPathType.rlr) {
      // Diagonal distance has to be smaller than two turning circle diameters.
      if (startToEndCircleDistance > 4 * turningRadius) {
        return null;
      }
    }

    // The angle/bearing from the starting circle to the start of the tangent.
    final theta = switch (pathType) {
      DubinsPathType.lsl => startToEndCircleBearing + 90,
      DubinsPathType.rsr => startToEndCircleBearing - 90,
      DubinsPathType.lsr => radianToDeg(
            acos(2 * turningRadius / startToEndCircleDistance),
          ) +
          startToEndCircleBearing,
      DubinsPathType.rsl => radianToDeg(
            -acos(2 * turningRadius / startToEndCircleDistance),
          ) +
          startToEndCircleBearing,
      DubinsPathType.lrl => radianToDeg(
            -acos(startToEndCircleDistance / (4 * turningRadius)),
          ) +
          startToEndCircleBearing,
      DubinsPathType.rlr => radianToDeg(
            acos(startToEndCircleDistance / (4 * turningRadius)),
          ) +
          startToEndCircleBearing,
    };

    // The starting point of the tangent.
    final tangentStart = startingCircle.spherical.destinationPoint(
      distance: turningRadius,
      bearing: theta,
    );

    // The bearing of the waypoint at the tangent starting point.
    late double tangentStartBearing;

    // The bearing of the waypoint at the tangent ending point.
    late double tangentEndBearing;

    // The ending point of the tangent.
    late Geographic tangentEnd;

    // The center of the middle circle if we're in an LRL or RLR path.
    Geographic? middleCircleCenter;

    // The length of the middle section of the path.
    late double middleLength;

    if (pathType == DubinsPathType.lsl || pathType == DubinsPathType.rsr) {
      tangentEndBearing = startToEndCircleBearing;

      // The end tangent point, but it might have a radius mismatch from the
      // end circle if the distance is long enough, so we use the bearing of
      // this point from the end circle to get the tangent point with correct
      // radius.
      final tangentEndBearingPoint = tangentStart.spherical.destinationPoint(
        distance: startToEndCircleDistance,
        bearing: startToEndCircleBearing,
      );

      // The bearing from the end circle to the end tangent.
      final endCircleToTangentEndBearing =
          endingCircle.spherical.initialBearingTo(tangentEndBearingPoint);

      // The end tangent point calculated from the end circle center.
      tangentEnd = endingCircle.spherical.destinationPoint(
        distance: turningRadius,
        bearing: endCircleToTangentEndBearing,
      );

      // The bearing from the start to end tangent points.
      tangentStartBearing = tangentStart.spherical.initialBearingTo(tangentEnd);

      middleLength = tangentStart.spherical.distanceTo(tangentEnd);
    } else if (pathType == DubinsPathType.lsr ||
        pathType == DubinsPathType.rsl) {
      // The starting circle is offset by one diameter to get the
      // diagonal tangent.
      final offsetStartingCircle = startingCircle.spherical.destinationPoint(
        distance: 2 * turningRadius,
        bearing: theta,
      );

      // The bearing from the offset starting circle to the ending circle.
      tangentStartBearing =
          offsetStartingCircle.spherical.initialBearingTo(endingCircle);

      // The bearing is the same since the tangent is straight.
      tangentEndBearing = tangentStartBearing;

      // The assumed tangent length.
      final tangentLength =
          offsetStartingCircle.spherical.distanceTo(endingCircle);

      // The end tangent point, but it might have a radius mismatch from the
      // end circle if the distance is long enough, so we use the bearing of
      // this point from the end circle to get the tangent point with correct
      // radius.
      final tangentEndBearingPoint = tangentStart.spherical.destinationPoint(
        distance: tangentLength,
        bearing: tangentStartBearing,
      );

      // The bearing from the end circle to the end tangent.
      final endCircleToTangentEndBearing =
          endingCircle.spherical.initialBearingTo(tangentEndBearingPoint);

      // The end tangent point calculated from the end circle center.
      tangentEnd = endingCircle.spherical.destinationPoint(
        distance: turningRadius,
        bearing: endCircleToTangentEndBearing,
      );

      middleLength = tangentStart.spherical.distanceTo(tangentEnd);
    } else if (pathType == DubinsPathType.lrl ||
        pathType == DubinsPathType.rlr) {
      // Change the sign of angle/bearing modifiers if we're turning left.
      final middleTurnSign = switch (pathType.mid) {
        DubinsSection.l => -1,
        _ => 1,
      };

      // Turn by 90 degrees since the vehicle drives orthogonal to the radius.
      tangentStartBearing = theta - middleTurnSign * 90;

      middleCircleCenter = startingCircle.spherical.destinationPoint(
        distance: 2 * turningRadius,
        bearing: theta,
      );

      // The angle/bearing from the middle circle to the ending circle.
      final middleToEndBearing =
          middleCircleCenter.spherical.initialBearingTo(endingCircle);

      // Turn by 90 degrees since the vehicle drives orthogonal to the radius.
      tangentEndBearing = middleToEndBearing + middleTurnSign * 90;

      tangentEnd = middleCircleCenter.spherical.destinationPoint(
        distance: turningRadius,
        bearing: middleToEndBearing,
      );

      // The angle/amount of the middle turning circle we're turning.
      final middleTurnAngle = mod2pi(
        middleTurnSign *
            degToRadian(
              middleCircleCenter.spherical.initialBearingTo(
                    tangentEnd,
                  ) -
                  middleCircleCenter.spherical.initialBearingTo(
                    tangentStart,
                  ),
            ),
      );

      middleLength = middleTurnAngle * turningRadius;
    }
    // Change the sign of angle/bearing modifiers if we're turning left.
    final startTurnSign = switch (pathType.start) {
      DubinsSection.l => -1,
      _ => 1,
    };

    // The angle/amount of the start turning circle we're turning.
    final startTurnAngle = mod2pi(
      startTurnSign *
          degToRadian(
            startingCircle.spherical.initialBearingTo(
                  tangentStart,
                ) -
                startingCircle.spherical.initialBearingTo(start.position),
          ),
    );

    // Change the sign of angle/bearing modifiers if we're turning left.
    final endTurnSign = switch (pathType.end) {
      DubinsSection.l => -1,
      _ => 1,
    };

    // The angle/amount of the ending turning circle we're turning.
    final endTurnAngle = mod2pi(
      endTurnSign *
          degToRadian(
            endingCircle.spherical.initialBearingTo(end.position) -
                endingCircle.spherical.initialBearingTo(tangentEnd),
          ),
    );
    // The length of the first section.
    final startLength = startTurnAngle * turningRadius;

    // The length of the last section.
    final endLength = endTurnAngle * turningRadius;

    return DubinsPathData(
      pathType: pathType,
      tangentStart: WayPoint(
        position: tangentStart,
        bearing: tangentStartBearing,
      ),
      tangentEnd: WayPoint(
        position: tangentEnd,
        bearing: tangentEndBearing,
      ),
      middleCircleCenter: middleCircleCenter,
      startLength: startLength,
      middleLength: middleLength,
      endLength: endLength,
    );
  }

  /// Whether this path type is possible.
  bool isPathTypePossible(DubinsPathType pathType) =>
      _pathDataIterable
          .firstWhere(
            (element) => element?.pathType == pathType,
            orElse: () => null,
          )
          ?.totalLength !=
      null;

  /// Calculates the next [WayPoint] step along the path.
  ///
  /// Starts from the previous point [origin] and moves [stepSize] meters
  /// along the path.
  ///
  /// The [pathType] is used to acquire the correct turning circle if
  /// we're turning.
  ///
  /// The [section] describes which section type of the path
  /// we're in, and the [sectionIndex] tells where this section fits in the
  /// path's section order.
  WayPoint _interpolate({
    required WayPoint origin,
    required DubinsPathType pathType,
    required DubinsSection section,
    required int sectionIndex,
    required double currentLength,
  }) {
    Geographic? circleCenter;
    var angleStep = 0.0;
    var bearing = origin.bearing;

    late Geographic nextPoint;

    final path = pathData(pathType);

    // Find the correct turningCircle if we're turning.
    if (section == DubinsSection.l) {
      circleCenter = switch (sectionIndex) {
        0 => startLeftCircleCenter,
        1 => path!.middleCircleCenter!,
        _ => endLeftCircleCenter,
      };
    } else if (section == DubinsSection.r) {
      circleCenter = switch (sectionIndex) {
        0 => startRightCircleCenter,
        1 => path!.middleCircleCenter!,
        _ => endRightCircleCenter,
      };
    }
    // Calculate next point when turning.
    if (circleCenter != null) {
      final angle = circleCenter.spherical.initialBearingTo(origin.position);

      // Make the step negative if we're turning left, positive otherwise.
      final sign = switch (section) {
        DubinsSection.l => -1,
        _ => 1,
      };

      // Calculate the angle step when we're turning, which we then use to
      // revolve around the [circleCenter].
      angleStep = sign * angleStepSize;

      nextPoint = circleCenter.spherical.destinationPoint(
        distance: turningRadius,
        bearing: angle + angleStep,
      );

      bearing += angleStep;
    }
    // Calculate next point when going straight.
    else {
      nextPoint = origin.position.spherical.destinationPoint(
        distance: stepSize,
        bearing: origin.bearing,
      );

      bearing = pathData(pathType)!
          .tangentStart
          .position
          .spherical
          .finalBearingTo(nextPoint);
    }

    return WayPoint(
      position: nextPoint,
      bearing: bearing,
      velocity: origin.velocity,
    );
  }

  /// Generates the path between [start] and [end] for the
  /// selected [pathType], if it is possible.
  List<WayPoint>? _generateLocalPath(DubinsPathType pathType) {
    // The list of points we will return.
    final wayPoints = <WayPoint>[start];

    // The data we use to get the section lengths.
    final path = pathData(pathType);

    if (path == null) {
      return null;
    }

    // Iterate through the sections and interpolate towards the next
    // section/end.
    pathType.sections.forEachIndexed((index, section) {
      final sectionLength = switch (index) {
        0 => path.startLength,
        1 => path.middleLength,
        _ => path.endLength,
      };
      // No points to add if section has no length.
      if (sectionLength == 0) {
        return;
      }

      // How far we're along the section.
      var currentLength = stepSize;

      // Add points while the we have enough distance to the next section/end.
      // i.e. larger than stepSize.
      while (currentLength <= sectionLength) {
        wayPoints.add(
          _interpolate(
            origin: wayPoints.last,
            pathType: pathType,
            section: section,
            sectionIndex: index,
            currentLength: currentLength,
          ),
        );

        currentLength += stepSize;
      }
      // Add the ending point of the correct section
      wayPoints.add(
        switch (index) {
          0 => path.tangentStart.copyWith(velocity: wayPoints.last.velocity),
          1 => path.tangentEnd.copyWith(velocity: wayPoints.last.velocity),
          _ => end,
        },
      );
    });

    return wayPoints;
  }

  /// The Dubins path planned out for this [pathType].
  ///
  /// This will also return info about the length of the sections of the path
  /// as well as the total length.
  ({
    List<WayPoint>? wayPoints,
    DubinsPathData pathData,
  })? dubinsPathPlan(DubinsPathType pathType) {
    final data = pathData(pathType);

    if (data == null) {
      return null;
    }

    return (
      wayPoints: _generateLocalPath(pathType),
      pathData: data,
    );
  }

  /// The best Dubins path planned out.
  ///
  /// This will also return info about the length of the sections of the path
  /// as well as the total length.
  ({
    List<WayPoint>? wayPoints,
    DubinsPathData pathData,
  })? get bestDubinsPathPlan => dubinsPathPlan(bestPathData!.pathType);
}
