import 'dart:math';

import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ArticulatedTractor extends Vehicle {
  const ArticulatedTractor({
    required this.pivotToAntennaDistance,
    required this.pivotToFrontAxle,
    required this.pivotToRearAxle,
    required super.position,
    required super.antennaHeight,
    required super.minTurningRadius,
    required super.steeringAngleMax,
    required super.trackWidth,
    super.invertSteeringInput = false,
    super.velocity = 0,
    super.heading = 0,
    super.steeringAngleInput = 0,
    super.length = 4,
    super.width = 2.5,
    super.acceleration = 0,
    super.simulated = false,
  });

  /// The distance from the vehicle articulation pivot point to the antenna
  /// [position].
  final double pivotToAntennaDistance;

  /// The distance from the vehicle articulation pivot point to the front
  /// axle center position.
  final double pivotToFrontAxle;

  /// The distance from the vehicle articulation pivot point to the rear
  /// axle center position.
  final double pivotToRearAxle;

  /// The position of the vehicle articulation pivot point.
  LatLng get pivotPosition => Vehicle.distance.offset(
        position,
        pivotToAntennaDistance,
        normalizeBearing(heading - 180 + steeringAngle),
      );

  /// The angle from the pivot point to the front axle.
  double get frontAxleAngle => normalizeBearing(heading + steeringAngle);

  /// The position of the front axle center point.
  LatLng get frontAxlePosition => Vehicle.distance.offset(
        pivotPosition,
        pivotToFrontAxle,
        frontAxleAngle,
      );

  /// The angle from the pivot point to the rear axle.
  double get rearAxleAngle => normalizeBearing(heading + 180 - steeringAngle);

  /// The position of the front axle center point.
  LatLng get rearAxlePosition => Vehicle.distance.offset(
        pivotPosition,
        pivotToRearAxle,
        rearAxleAngle,
      );

  /// The turning radius corresponding to the current [steeringAngle].
  ///
  /// Found by calculating the hypotenuse of the isosceles triangle with
  /// base [pivotToFrontAxle] distance and base angle 90 - [steeringAngle].
  /// https://keisan.casio.com/exec/system/1273850202
  /// We don't divide by two since both bodies of the vehicle is rotating
  /// around the pivot.
  @override
  double? get currentTurningRadius => steeringAngle.abs() <= steeringAngleMax &&
          steeringAngle.abs() > minSteeringAngle
      ? pivotToFrontAxle / cos(degToRadian(90 - steeringAngle.abs()))
      : null;

  /// The center point of which the [currentTurningRadius] revolves around.
  @override
  LatLng? get turningRadiusCenter => currentTurningRadius != null
      ? Vehicle.distance.offset(
          frontAxlePosition,
          currentTurningRadius!,
          normalizeBearing(
            switch (isTurningLeft) {
              true => frontAxleAngle - 90,
              false => frontAxleAngle + 90,
            },
          ),
        )
      : null;

  // The bounds of the left solid axle wheel, or the right solid axle wheel if
  /// [left] is set to false.
  List<LatLng> frontWheelPoints({bool left = true}) {
    const wheelDiameter = 1.8;
    const wheelWidth = 1.3;

    final sign = left ? 1 : -1;

    final axleToCenterAngle = normalizeBearing(frontAxleAngle - (90 * sign));

    final frontOuterCenterToOuterFrontAngle = normalizeBearing(
      axleToCenterAngle - 90 * sign,
    );

    final frontOuterToFrontInnerAngle =
        normalizeBearing(frontOuterCenterToOuterFrontAngle + (90 * sign));

    final frontInnerToRearInnerAngle =
        normalizeBearing(frontOuterToFrontInnerAngle + (90 * sign));

    final rearInnerToRearOuterAngle =
        normalizeBearing(frontInnerToRearInnerAngle + (90 * sign));

    final wheelCenter = Vehicle.distance.offset(
      frontAxlePosition,
      trackWidth / 2 - wheelWidth / 2,
      axleToCenterAngle,
    );

    final wheelOuterFront = Vehicle.distance.offset(
      wheelCenter,
      wheelDiameter / 2,
      frontOuterCenterToOuterFrontAngle,
    );
    final wheelInnerFront = Vehicle.distance.offset(
      wheelOuterFront,
      wheelWidth,
      frontOuterToFrontInnerAngle,
    );
    final wheelInnerRear = Vehicle.distance.offset(
      wheelInnerFront,
      wheelDiameter,
      frontInnerToRearInnerAngle,
    );
    final wheelOuterRear = Vehicle.distance.offset(
      wheelInnerRear,
      wheelWidth,
      rearInnerToRearOuterAngle,
    );

    return [
      wheelOuterFront,
      wheelInnerFront,
      wheelInnerRear,
      wheelOuterRear,
    ];
  }

  /// The left solid axle wheel polygon.
  Polygon get leftFrontWheelPolygon => Polygon(
        points: frontWheelPoints(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right solid axle wheel polygon.
  Polygon get rightFrontWheelPolygon => Polygon(
        points: frontWheelPoints(left: false),
        isFilled: true,
        color: Colors.black,
      );

  // The bounds of the left solid axle wheel, or the right solid axle wheel if
  /// [left] is set to false.
  List<LatLng> rearWheelPoints({bool left = true}) {
    const wheelDiameter = 1.8;
    const wheelWidth = 1.3;

    final sign = left ? 1 : -1;

    final axleToCenterAngle = normalizeBearing(rearAxleAngle - (90 * sign));

    final frontOuterCenterToOuterFrontAngle = normalizeBearing(
      axleToCenterAngle - 90 * sign,
    );

    final frontOuterToFrontInnerAngle =
        normalizeBearing(frontOuterCenterToOuterFrontAngle + (90 * sign));

    final frontInnerToRearInnerAngle =
        normalizeBearing(frontOuterToFrontInnerAngle + (90 * sign));

    final rearInnerToRearOuterAngle =
        normalizeBearing(frontInnerToRearInnerAngle + (90 * sign));

    final wheelCenter = Vehicle.distance.offset(
      rearAxlePosition,
      trackWidth / 2 - wheelWidth / 2,
      axleToCenterAngle,
    );

    final wheelOuterFront = Vehicle.distance.offset(
      wheelCenter,
      wheelDiameter / 2,
      frontOuterCenterToOuterFrontAngle,
    );
    final wheelInnerFront = Vehicle.distance.offset(
      wheelOuterFront,
      wheelWidth,
      frontOuterToFrontInnerAngle,
    );
    final wheelInnerRear = Vehicle.distance.offset(
      wheelInnerFront,
      wheelDiameter,
      frontInnerToRearInnerAngle,
    );
    final wheelOuterRear = Vehicle.distance.offset(
      wheelInnerRear,
      wheelWidth,
      rearInnerToRearOuterAngle,
    );

    return [
      wheelOuterFront,
      wheelInnerFront,
      wheelInnerRear,
      wheelOuterRear,
    ];
  }

  /// The left solid axle wheel polygon.
  Polygon get leftRearWheelPolygon => Polygon(
        points: rearWheelPoints(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right solid axle wheel polygon.
  Polygon get rightRearWheelPolygon => Polygon(
        points: rearWheelPoints(left: false),
        isFilled: true,
        color: Colors.black,
      );

  /// Polygons for drawing the wheels of the vehicle.
  @override
  List<Polygon> get wheelPolygons => [
        leftFrontWheelPolygon,
        rightFrontWheelPolygon,
        leftRearWheelPolygon,
        rightRearWheelPolygon,
      ];

  /// The projected trajectory for the moving vehicle.
  ///
  /// Based on the current [steeringAngle], [velocity] and
  /// [currentTurningRadius].
  @override
  Path<LatLng> get trajectory {
    final points = <LatLng>[frontAxlePosition];

    if (currentTurningRadius != null) {
      final minTurningCircumference = 2 *
          pi *
          pivotToFrontAxle /
          cos(degToRadian(90 - steeringAngleMax.abs()));

      // Clamp the number of turning revolutions so that we only display
      // up to one whole turning circle.
      final revolutionsOfTurningCircle =
          (minTurningCircumference / (2 * pi * currentTurningRadius!))
              .clamp(0, 1);

      const numberOfPoints = 36;
      for (var i = 0; i < numberOfPoints + 1; i++) {
        {
          // The angle from the turning circle center to the projected
          // position.
          final angle = switch (isTurningLeft) {
            // Turning left
            true => switch (isReversing) {
                // Reversing
                true => frontAxleAngle +
                    90 +
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
                // Forward
                false => frontAxleAngle +
                    90 -
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
              },
            // Turning right
            false => switch (isReversing) {
                // Reversing
                true => frontAxleAngle -
                    90 -
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
                // Forward
                false => frontAxleAngle -
                    90 +
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
              },
          };

          points.add(
            Vehicle.distance.offset(
              turningRadiusCenter!,
              currentTurningRadius!,
              normalizeBearing(angle),
            ),
          );
        }
      }
    } else {
      points.add(
        Vehicle.distance.offset(
          position,
          isReversing ? -30 : 5 + 30,
          normalizeBearing(heading),
        ),
      );
    }

    return Path()..addAll(points);
  }

  /// Polygons for visualizing the extent of the vehicle.
  @override
  List<Polygon> get polygons {
    final rearLeftCornerAngle = normalizeBearing(heading - 90 - steeringAngle);
    final rearLeftCenter = Vehicle.distance.offset(
      rearAxlePosition,
      1,
      rearLeftCornerAngle,
    );
    final rearLeftSide = [
      Vehicle.distance.offset(
        rearLeftCenter,
        1,
        normalizeBearing(rearLeftCornerAngle - 90),
      ),
      Vehicle.distance.offset(
        rearLeftCenter,
        1,
        normalizeBearing(rearLeftCornerAngle + 90),
      )
    ];

    final rearRightCornerAngle = normalizeBearing(heading + 90 - steeringAngle);
    final rearRightCenter = Vehicle.distance.offset(
      rearAxlePosition,
      1,
      rearRightCornerAngle,
    );
    final rearRightSide = [
      Vehicle.distance.offset(
        rearRightCenter,
        1,
        normalizeBearing(rearRightCornerAngle - 90),
      ),
      Vehicle.distance.offset(
        rearRightCenter,
        1,
        normalizeBearing(rearRightCornerAngle + 90),
      )
    ];

    final frontLeftCornerAngle = normalizeBearing(heading - 90 + steeringAngle);
    final frontLeftCenter = Vehicle.distance.offset(
      frontAxlePosition,
      1,
      frontLeftCornerAngle,
    );
    final frontLeftSide = [
      Vehicle.distance.offset(
        frontLeftCenter,
        1,
        normalizeBearing(frontLeftCornerAngle - 90),
      ),
      Vehicle.distance.offset(
        frontLeftCenter,
        1,
        normalizeBearing(frontLeftCornerAngle + 90),
      )
    ];

    final frontRightCornerAngle =
        normalizeBearing(heading + 90 + steeringAngle);
    final frontRightCenter = Vehicle.distance.offset(
      frontAxlePosition,
      1,
      frontRightCornerAngle,
    );
    final frontRightSide = [
      Vehicle.distance.offset(
        frontRightCenter,
        1,
        normalizeBearing(frontRightCornerAngle - 90),
      ),
      Vehicle.distance.offset(
        frontRightCenter,
        1,
        normalizeBearing(frontRightCornerAngle + 90),
      )
    ];

    return [
      Polygon(
        points: [
          pivotPosition,
          ...frontLeftSide,
          ...frontRightSide,
        ],
        isFilled: true,
        color: Colors.yellow.withOpacity(0.5),
      ),
      Polygon(
        points: [
          pivotPosition,
          ...rearRightSide,
          ...rearLeftSide,
        ],
        isFilled: true,
        color: Colors.yellow.withOpacity(0.5),
      )
    ];
  }

  /// Returns a new [ArticulatedTractor] based on the this one, but with
  /// parameters/variables altered.
  @override
  ArticulatedTractor copyWith({
    double? pivotToAntennaDistance,
    double? pivotToFrontAxle,
    double? pivotToRearAxle,
    LatLng? position,
    double? antennaHeight,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    bool? invertSteeringInput,
    double? velocity,
    double? heading,
    double? steeringAngleInput,
    double? length,
    double? width,
    double? acceleration,
    bool? simulated,
  }) =>
      ArticulatedTractor(
        position: position ?? this.position,
        antennaHeight: antennaHeight ?? this.antennaHeight,
        minTurningRadius: minTurningRadius ?? this.minTurningRadius,
        steeringAngleMax: steeringAngleMax ?? this.steeringAngleMax,
        trackWidth: trackWidth ?? this.trackWidth,
        pivotToAntennaDistance:
            pivotToAntennaDistance ?? this.pivotToAntennaDistance,
        pivotToFrontAxle: pivotToFrontAxle ?? this.pivotToFrontAxle,
        pivotToRearAxle: pivotToRearAxle ?? this.pivotToRearAxle,
        invertSteeringInput: invertSteeringInput ?? this.invertSteeringInput,
        velocity: velocity ?? this.velocity,
        heading: heading ?? this.heading,
        steeringAngleInput: steeringAngleInput ?? this.steeringAngleInput,
        length: length ?? this.length,
        width: width ?? this.width,
        acceleration: acceleration ?? this.acceleration,
        simulated: simulated ?? this.simulated,
      );
}
