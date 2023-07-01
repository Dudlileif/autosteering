import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// An articulated tractor with two bodies with solid axles that are joined
/// at a pivot point.
///
/// Geometry: https://eprints.qut.edu.au/21740/1/corke_00928568.pdf
class ArticulatedTractor extends Vehicle {
  const ArticulatedTractor({
    required this.pivotToAntennaDistance,
    required this.pivotToFrontAxle,
    required this.pivotToRearAxle,
    required super.position,
    required super.antennaHeight,

    /// The minimum turning radius of the front axle.
    required super.minTurningRadius,
    required super.steeringAngleMax,
    required super.trackWidth,
    this.frontAxleToHitchDistance,
    this.rearAxleToHitchDistance = 1.6,
    this.rearAxleToTowbarDistance = 1,
    this.wheelDiameter = 1.8,
    this.wheelWidth = 1.3,
    this.wheelSpacing = 0.15,
    this.numWheels = 2,
    super.invertSteeringInput = false,
    super.pidParameters = const PidParameters(p: 20, i: 0, d: 10),
    super.velocity = 0,
    super.heading = 0,
    super.steeringAngleInput = 0,
    super.length = 4,
    super.width = 2.5,
    super.simulated = false,
    super.hitchFrontFixedChild,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
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

  final double? frontAxleToHitchDistance;

  final double? rearAxleToHitchDistance;

  final double? rearAxleToTowbarDistance;

  /// The diameter of the wheels.
  final double wheelDiameter;

  /// The width of the wheels.
  final double wheelWidth;

  /// The distance between the twin/triple etc. wheels.
  final double wheelSpacing;

  /// The number of wheels, i.e. twin/triples etc...
  final int numWheels;

  @override
  double get wheelBase => pivotToFrontAxle + pivotToRearAxle;

  /// The position of the vehicle articulation pivot point.
  LatLng get pivotPosition => position.offset(
        pivotToAntennaDistance,
        normalizeBearing(heading - 180 + steeringAngle / 2),
      );

  /// Where the look ahead distance calculation should start.
  @override
  LatLng get lookAheadStartPosition => pivotPosition;

  /// The angle from the pivot point to the front axle.
  double get frontAxleAngle => normalizeBearing(heading + steeringAngle / 2);

  /// The position of the front axle center point.
  LatLng get frontAxlePosition => pivotPosition.offset(
        pivotToFrontAxle,
        frontAxleAngle,
      );

  /// The angle from the pivot point to the rear axle.
  double get rearAxleAngle =>
      normalizeBearing(heading + 180 - steeringAngle / 2);

  /// The position of the front axle center point.
  LatLng get rearAxlePosition => pivotPosition.offset(
        pivotToRearAxle,
        rearAxleAngle,
      );

  @override
  LatLng? get hitchFrontFixedPosition =>
      switch (frontAxleToHitchDistance != null) {
        true => frontAxlePosition.offset(
            frontAxleToHitchDistance!,
            frontAxleAngle,
          ),
        false => null,
      };

  @override
  LatLng? get hitchRearFixedPosition =>
      switch (rearAxleToHitchDistance != null) {
        true => rearAxlePosition.offset(
            rearAxleToHitchDistance!,
            rearAxleAngle,
          ),
        false => null,
      };

  @override
  LatLng? get hitchRearTowbarPosition =>
      switch (rearAxleToTowbarDistance != null) {
        true => rearAxlePosition.offset(
            rearAxleToTowbarDistance!,
            heading + 180,
          ),
        false => null,
      };

  /// The position of the pursuit axle in the the vehicle direction. Used when
  /// calculating the pure pursuit values.
  ///
  /// The mirror position of the antenna position from the pivot point is used
  /// when the tractor is reversing.
  @override
  LatLng get pursuitAxlePosition => switch (isReversing) {
        true => pivotPosition.offset(
            pivotToAntennaDistance,
            rearAxleAngle,
          ),
        false => position,
      };

  /// Basic circle markers for showing the vehicle's steering related
  /// points.
  @override
  List<CircleMarker> get steeringDebugMarkers => [
        CircleMarker(
          point: position,
          radius: 10,
        ),
        CircleMarker(
          point: rearAxlePosition,
          radius: 10,
          color: Colors.red,
        ),
        CircleMarker(
          point: frontAxlePosition,
          radius: 10,
          color: Colors.blue,
        ),
        CircleMarker(
          point: pivotPosition,
          radius: 10,
          color: Colors.black,
        )
      ];

  /// Basic polylines for showing the vehicle's steering related
  /// points.
  @override
  List<Polyline> get steeringDebugLines => [
        Polyline(
          points: [
            rearAxlePosition,
            turningRadiusCenter!,
          ],
          color: Colors.red,
        ),
        Polyline(
          points: [
            frontAxlePosition,
            turningRadiusCenter!,
          ],
          color: Colors.blue,
        ),
        Polyline(
          points: [
            position,
            turningRadiusCenter!,
          ],
          color: Colors.green,
        ),
        Polyline(
          points: [
            pivotPosition,
            turningRadiusCenter!,
          ],
          color: Colors.black,
        ),
      ];

  /// The turning radius of the front axle corresponding to the current
  /// [steeringAngle].
  ///
  /// https://eprints.qut.edu.au/21740/1/corke_00928568.pdf
  @override
  double? get currentTurningRadius =>
      steeringAngle.abs() <= steeringAngleMax && steeringAngle.abs() > 0
          ? (pivotToFrontAxle * cos(degToRadian(steeringAngle.abs())) +
                  pivotToRearAxle) /
              sin(degToRadian(steeringAngle.abs()))
          : null;

  /// The turning radius of the rear axle corresponding to the current
  /// [steeringAngle].
  ///
  /// https://eprints.qut.edu.au/21740/1/corke_00928568.pdf
  double? get currentRearTurningRadius =>
      steeringAngle.abs() <= steeringAngleMax && steeringAngle.abs() > 0
          ? (pivotToRearAxle * cos(degToRadian(steeringAngle.abs())) +
                  pivotToFrontAxle) /
              sin(degToRadian(steeringAngle.abs()))
          : null;

  /// The center point of which the [currentTurningRadius] revolves around.
  @override
  LatLng? get turningRadiusCenter => currentTurningRadius != null
      ? frontAxlePosition.offset(
          currentTurningRadius!,
          normalizeBearing(
            switch (isTurningLeft) {
              true => frontAxleAngle - 90,
              false => frontAxleAngle + 90,
            },
          ),
        )
      : null;

  /// The left front wheel polygon.
  Polygon get leftFrontWheelPolygon => Polygon(
        points: wheelPoints(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right front wheel polygon.
  Polygon get rightFrontWheelPolygon => Polygon(
        points: wheelPoints(left: false),
        isFilled: true,
        color: Colors.black,
      );

  /// The bounds of any of the specified wheels of the tractor.
  ///
  /// [left] is used to choose left (default, true) or right side (false).
  /// [rear] is used to choose front (default, false) or rear (true).
  List<LatLng> wheelPoints({bool left = true, bool rear = false}) {
    final sign = left ? 1 : -1;

    final axleToCenterAngle = switch (rear) {
      true => normalizeBearing(rearAxleAngle + 90 * sign),
      false => normalizeBearing(frontAxleAngle - 90 * sign)
    };

    final innerCenterToInnerRearAngle = normalizeBearing(
      axleToCenterAngle - 90 * sign,
    );

    final rearInnerToRearOuterAngle =
        normalizeBearing(innerCenterToInnerRearAngle + 90 * sign);

    final rearOuterToFrontOuterAngle =
        normalizeBearing(rearInnerToRearOuterAngle + 90 * sign);

    final frontOuterToFrontInnerAngle =
        normalizeBearing(rearOuterToFrontOuterAngle + 90 * sign);

    final wheelInnerCenter = switch (rear) {
      true => rearAxlePosition,
      false => frontAxlePosition,
    }
        .offset(
      trackWidth / 2 -
          (wheelWidth * numWheels + (numWheels - 1) * wheelSpacing) / 2,
      axleToCenterAngle,
    );

    final wheelInnerRear = wheelInnerCenter.offset(
      wheelDiameter / 2,
      innerCenterToInnerRearAngle,
    );
    final wheelOuterRear = wheelInnerRear.offset(
      wheelWidth * numWheels + (numWheels - 1) * wheelSpacing,
      rearInnerToRearOuterAngle,
    );
    final wheelOuterFront = wheelOuterRear.offset(
      wheelDiameter,
      rearOuterToFrontOuterAngle,
    );
    final wheelInnerFront = wheelOuterFront.offset(
      wheelWidth * numWheels + (numWheels - 1) * wheelSpacing,
      frontOuterToFrontInnerAngle,
    );

    return [
      wheelInnerRear,
      wheelOuterRear,
      wheelOuterFront,
      wheelInnerFront,
    ];
  }

  /// The left rear wheel polygon.
  Polygon get leftRearWheelPolygon => Polygon(
        points: wheelPoints(rear: true),
        isFilled: true,
        color: Colors.black,
      );

  /// The right rear wheel polygon.
  Polygon get rightRearWheelPolygon => Polygon(
        points: wheelPoints(left: false, rear: true),
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
          (pivotToFrontAxle * cos(degToRadian(steeringAngleMax)) +
              pivotToRearAxle) /
          sin(degToRadian(steeringAngleMax));

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
            turningRadiusCenter!.offset(
              currentTurningRadius!,
              normalizeBearing(angle),
            ),
          );
        }
      }
    } else {
      points.add(
        position.offset(
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
    final rearLeftCornerAngle = normalizeBearing(rearAxleAngle + 90);
    final rearLeftCenter = rearAxlePosition.offset(
      1,
      rearLeftCornerAngle,
    );
    final rearLeftSide = [
      rearLeftCenter.offset(
        1,
        normalizeBearing(rearLeftCornerAngle - 90),
      ),
      rearLeftCenter.offset(
        1,
        normalizeBearing(rearLeftCornerAngle + 90),
      )
    ];

    final rearRightCornerAngle = normalizeBearing(rearAxleAngle - 90);
    final rearRightCenter = rearAxlePosition.offset(
      1,
      rearRightCornerAngle,
    );
    final rearRightSide = [
      rearRightCenter.offset(
        1,
        normalizeBearing(rearRightCornerAngle - 90),
      ),
      rearRightCenter.offset(
        1,
        normalizeBearing(rearRightCornerAngle + 90),
      )
    ];

    final frontLeftCornerAngle = normalizeBearing(frontAxleAngle - 90);
    final frontLeftCenter = frontAxlePosition.offset(
      1,
      frontLeftCornerAngle,
    );
    final frontLeftSide = [
      frontLeftCenter.offset(
        1,
        normalizeBearing(frontLeftCornerAngle - 90),
      ),
      frontLeftCenter.offset(
        1,
        normalizeBearing(frontLeftCornerAngle + 90),
      )
    ];

    final frontRightCornerAngle = normalizeBearing(frontAxleAngle + 90);
    final frontRightCenter = frontAxlePosition.offset(
      1,
      frontRightCornerAngle,
    );
    final frontRightSide = [
      frontRightCenter.offset(
        1,
        normalizeBearing(frontRightCornerAngle - 90),
      ),
      frontRightCenter.offset(
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
    double? frontAxleToHitchDistance,
    double? rearAxleToHitchDistance,
    double? rearAxleToTowbarDistance,
    LatLng? position,
    double? antennaHeight,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    double? wheelDiameter,
    double? wheelWidth,
    double? wheelSpacing,
    int? numWheels,
    bool? invertSteeringInput,
    PidParameters? pidParameters,
    double? velocity,
    double? heading,
    double? steeringAngleInput,
    double? length,
    double? width,
    bool? simulated,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
  }) =>
      ArticulatedTractor(
        position: position ?? this.position,
        antennaHeight: antennaHeight ?? this.antennaHeight,
        minTurningRadius: minTurningRadius ?? this.minTurningRadius,
        steeringAngleMax: steeringAngleMax ?? this.steeringAngleMax,
        trackWidth: trackWidth ?? this.trackWidth,
        wheelDiameter: wheelDiameter ?? this.wheelDiameter,
        wheelWidth: wheelWidth ?? this.wheelWidth,
        wheelSpacing: wheelSpacing ?? this.wheelSpacing,
        numWheels: numWheels ?? this.numWheels,
        pivotToAntennaDistance:
            pivotToAntennaDistance ?? this.pivotToAntennaDistance,
        pivotToFrontAxle: pivotToFrontAxle ?? this.pivotToFrontAxle,
        pivotToRearAxle: pivotToRearAxle ?? this.pivotToRearAxle,
        frontAxleToHitchDistance:
            frontAxleToHitchDistance ?? this.frontAxleToHitchDistance,
        rearAxleToHitchDistance:
            rearAxleToHitchDistance ?? this.rearAxleToHitchDistance,
        rearAxleToTowbarDistance:
            rearAxleToTowbarDistance ?? this.rearAxleToTowbarDistance,
        invertSteeringInput: invertSteeringInput ?? this.invertSteeringInput,
        pidParameters: pidParameters ?? this.pidParameters,
        velocity: velocity ?? this.velocity,
        heading: heading ?? this.heading,
        steeringAngleInput: steeringAngleInput ?? this.steeringAngleInput,
        length: length ?? this.length,
        width: width ?? this.width,
        simulated: simulated ?? this.simulated,
        hitchFrontFixedChild: hitchFrontFixedChild ?? this.hitchFrontFixedChild,
        hitchRearFixedChild: hitchRearFixedChild ?? this.hitchRearFixedChild,
        hitchRearTowbarChild: hitchRearTowbarChild ?? this.hitchRearTowbarChild,
      );
}
