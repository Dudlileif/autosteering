import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:collection/collection.dart';
import 'package:latlong2/latlong.dart';

part 'dubins_path_type.dart';
part 'dubins_section.dart';

/// A class for encompassing the data generated for a [DubinsPathType].
final class DubinsPathData {
  DubinsPathData({
    required this.pathType,
    required this.tangentStart,
    required this.tangentEnd,
    required this.startLength,
    required this.middleLength,
    required this.endLength,
    required this.totalLength,
    this.middleCircleCenter,
  });

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
  final LatLng? middleCircleCenter;
}

/// A class for calculating Dubins paths between two points.
class DubinsPath {
  DubinsPath({
    required this.start,
    required this.end,
    required this.turningRadius,
    required this.stepSize,
  }) {
    /// The number of degrees that [stepSize] meters along a turning circle
    /// amounts to.
    angleStepSize = 360 * stepSize / (2 * pi * turningRadius);

    /// The center position of the left starting circle.
    startLeftCircleCenter = start.position.offset(
      turningRadius,
      normalizeBearing(start.heading - 90),
    );

    /// The center position of the right starting circle.
    startRightCircleCenter = start.position.offset(
      turningRadius,
      normalizeBearing(start.heading + 90),
    );

    /// The center position of the left end circle.
    endLeftCircleCenter = end.position.offset(
      turningRadius,
      normalizeBearing(end.heading - 90),
    );

    /// The center position of the right end circle.
    endRightCircleCenter = end.position.offset(
      turningRadius,
      normalizeBearing(end.heading + 90),
    );

    // Set the data for all the path types.
    _pathDataIterable = DubinsPathType.values.map(
      pathData,
    );

    // Find the best path
    bestPathData = _pathDataIterable.reduce(
      (value, element) => (element?.totalLength ?? double.infinity) <
              (value?.totalLength ?? double.infinity)
          ? element
          : value,
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

  /// The number of degrees that [stepSize] meters along a turning circle
  /// amounts to.
  late double angleStepSize;

  /// The center position of the left starting circle.
  late LatLng startLeftCircleCenter;

  /// The center position of the right starting circle.
  late LatLng startRightCircleCenter;

  /// The center position of the left end circle.
  late LatLng endLeftCircleCenter;

  /// The center position of the right end circle.
  late LatLng endRightCircleCenter;

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

    // The heading from the starting to the ending circle.
    final startToEndCircleHeading = startingCircle.bearingTo(endingCircle);

    // The distance from the starting to the ending circle.
    final startToEndCircleDistance = startingCircle.distanceTo(endingCircle);

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

    // The angle/heading from the starting circle to the start of the tangent.
    final theta = switch (pathType) {
      DubinsPathType.lsl => startToEndCircleHeading + 90,
      DubinsPathType.rsr => startToEndCircleHeading - 90,
      DubinsPathType.lsr => radianToDeg(
            acos(2 * turningRadius / startToEndCircleDistance),
          ) +
          startToEndCircleHeading,
      DubinsPathType.rsl => radianToDeg(
            -acos(2 * turningRadius / startToEndCircleDistance),
          ) +
          startToEndCircleHeading,
      DubinsPathType.lrl => radianToDeg(
            -acos(startToEndCircleDistance / (4 * turningRadius)),
          ) +
          startToEndCircleHeading,
      DubinsPathType.rlr => radianToDeg(
            acos(startToEndCircleDistance / (4 * turningRadius)),
          ) +
          startToEndCircleHeading,
    };

    // The starting point of the tangent.
    final tangentStart = startingCircle.offset(
      turningRadius,
      theta,
    );

    // The heading of the waypoint at the tangent starting point.
    late double tangentStartHeading;

    // The heading of the waypoint at the tangent ending point.
    late double tangentEndHeading;

    // The ending point of the tangent.
    late LatLng tangentEnd;

    // The center of the middle circle if we're in an LRL or RLR path.
    LatLng? middleCircleCenter;

    // The length of the middle section of the path.
    late double middleLength;

    if (pathType == DubinsPathType.lsl || pathType == DubinsPathType.rsr) {
      tangentEndHeading = startToEndCircleHeading;

      // The end tangent point, but it might have a radius mismatch from the
      // end circle if the distance is long enough, so we use the heading of
      // this point from the end circle to get the tangent point with correct
      // radius.
      final tangentEndHeadingPoint = tangentStart.offset(
        startToEndCircleDistance,
        startToEndCircleHeading,
      );

      // The heading from the end circle to the end tangent.
      final endCircleToTangentEndHeading =
          endingCircle.bearingTo(tangentEndHeadingPoint);

      // The end tangent point calculated from the end circle center.
      tangentEnd = endingCircle.offset(
        turningRadius,
        endCircleToTangentEndHeading,
      );

      // The heading from the start to end tangent points.
      tangentStartHeading = tangentStart.bearingTo(tangentEnd);

      middleLength = tangentStart.distanceTo(tangentEnd);
    } else if (pathType == DubinsPathType.lsr ||
        pathType == DubinsPathType.rsl) {
      // The starting circle is offset by one diameter to get the
      // diagonal tangent.
      final offsetStartingCircle = startingCircle.offset(
        2 * turningRadius,
        theta,
      );

      // The heading from the offset starting circle to the ending circle.
      tangentStartHeading = offsetStartingCircle.bearingTo(endingCircle);

      // The heading is the same since the tangent is straight.
      tangentEndHeading = tangentStartHeading;

      // The assumed tangent length.
      final tangentLength = offsetStartingCircle.distanceTo(endingCircle);

      // The end tangent point, but it might have a radius mismatch from the
      // end circle if the distance is long enough, so we use the heading of
      // this point from the end circle to get the tangent point with correct
      // radius.
      final tangentEndHeadingPoint = tangentStart.offset(
        tangentLength,
        tangentStartHeading,
      );

      // The heading from the end circle to the end tangent.
      final endCircleToTangentEndHeading =
          endingCircle.bearingTo(tangentEndHeadingPoint);

      // The end tangent point calculated from the end circle center.
      tangentEnd = endingCircle.offset(
        turningRadius,
        endCircleToTangentEndHeading,
      );

      middleLength = tangentStart.distanceTo(tangentEnd);
    } else if (pathType == DubinsPathType.lrl ||
        pathType == DubinsPathType.rlr) {
      // Change the sign of angle/heading modifiers if we're turning left.
      final middleTurnSign = switch (pathType.mid) {
        DubinsSection.l => -1,
        _ => 1,
      };

      // Turn by 90 degrees since the vehicle drives orthogonal to the radius.
      tangentStartHeading = theta - middleTurnSign * 90;

      middleCircleCenter = startingCircle.offset(
        2 * turningRadius,
        theta,
      );

      // The angle/heading from the middle circle to the ending circle.
      final middleToEndHeading = middleCircleCenter.bearingTo(endingCircle);

      // Turn by 90 degrees since the vehicle drives orthogonal to the radius.
      tangentEndHeading = middleToEndHeading + middleTurnSign * 90;

      tangentEnd = middleCircleCenter.offset(
        turningRadius,
        middleToEndHeading,
      );

      // The angle/amount of the middle turning circle we're turning.
      final middleTurnAngle = mod2pi(
        middleTurnSign *
            degToRadian(
              middleCircleCenter.bearingTo(
                    tangentEnd,
                  ) -
                  middleCircleCenter.bearingTo(
                    tangentStart,
                  ),
            ),
      );

      middleLength = middleTurnAngle * turningRadius;
    }
    // Change the sign of angle/heading modifiers if we're turning left.
    final startTurnSign = switch (pathType.start) {
      DubinsSection.l => -1,
      _ => 1,
    };

    // The angle/amount of the start turning circle we're turning.
    final startTurnAngle = mod2pi(
      startTurnSign *
          degToRadian(
            startingCircle.bearingTo(
                  tangentStart,
                ) -
                startingCircle.bearingTo(start.position),
          ),
    );

    // Change the sign of angle/heading modifiers if we're turning left.
    final endTurnSign = switch (pathType.end) {
      DubinsSection.l => -1,
      _ => 1,
    };

    // The angle/amount of the ending turning circle we're turning.
    final endTurnAngle = mod2pi(
      endTurnSign *
          degToRadian(
            endingCircle.bearingTo(end.position) -
                endingCircle.bearingTo(tangentEnd),
          ),
    );
    // The length of the first section.
    final startLength = startTurnAngle * turningRadius;

    // The length of the last section.
    final endLength = endTurnAngle * turningRadius;

    // The total length of the path from start to finish.
    final totalLength = startLength + middleLength + endLength;

    return DubinsPathData(
      pathType: pathType,
      tangentStart: WayPoint(
        position: tangentStart,
        heading: tangentStartHeading,
      ),
      tangentEnd: WayPoint(
        position: tangentEnd,
        heading: tangentEndHeading,
      ),
      middleCircleCenter: middleCircleCenter,
      startLength: startLength,
      middleLength: middleLength,
      endLength: endLength,
      totalLength: totalLength,
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
    LatLng? circleCenter;
    var angleStep = 0.0;

    late LatLng nextPoint;

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
      final angle = circleCenter.bearingTo(origin.position);

      // Make the step negative if we're turning left, positive otherwise.
      final sign = switch (section) {
        DubinsSection.l => -1,
        _ => 1,
      };

      // Calculate the angle step when we're turning, which we then use to
      // revolve around the [circleCenter].
      angleStep = sign * angleStepSize;

      nextPoint = circleCenter.offset(
        turningRadius,
        angle + angleStep,
      );
    }
    // Calculate next point when going straight.
    else {
      final stepFraction = currentLength / pathData(pathType)!.middleLength;
      nextPoint = LatLngTween(
        begin: pathData(pathType)!.tangentStart.position,
        end: pathData(pathType)!.tangentEnd.position,
      ).transform(stepFraction);
    }

    return WayPoint(
      position: nextPoint,
      heading: origin.heading + angleStep,
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
