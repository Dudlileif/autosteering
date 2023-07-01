import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// A base class for vehicles that steers with either a front or rear axle.
abstract class AxleSteeredVehicle extends Vehicle {
  const AxleSteeredVehicle({
    required this.wheelBase,
    required this.solidAxleDistance,
    required super.position,
    required super.antennaHeight,
    required super.minTurningRadius,
    required super.steeringAngleMax,
    required super.trackWidth,
    required super.pidParameters,
    this.solidAxleToFrontHitchDistance,
    this.solidAxleToRearHitchDistance,
    this.solidAxleToRearTowbarDistance,
    this.ackermannSteeringRatio = 1,
    this.steeringAxleWheelDiameter = 1.1,
    this.solidAxleWheelDiameter = 1.8,
    this.steeringAxleWheelWidth = 0.48,
    this.solidAxleWheelWidth = 0.6,
    super.invertSteeringInput = false,
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

  /// The distance between the axles.
  @override
  final double wheelBase;

  /// The distance from the antenna [position] to the solid axle,
  /// this means the rear axle on front wheel steered vehicles, and
  /// the front axle on rear wheel steered vehicles.
  /// Expected positive for front wheel steered,
  /// negative for rear wheel steered.
  final double solidAxleDistance;

  /// The distance to the front hitch point from the solid axle.
  final double? solidAxleToFrontHitchDistance;

  /// The distance to the rear hitch point from the solid axle.
  final double? solidAxleToRearHitchDistance;

  /// The distance to the rear towbar hitch point from the solid axle.
  final double? solidAxleToRearTowbarDistance;

  /// A modifier ratio for the Ackermann central angle. Defaults to 1.
  ///
  /// A higher value will cause a sharper turn, and a lower value a looser
  /// turn.
  /// ackermannAngle = [steeringAngleInput] / [ackermannSteeringRatio]
  final double ackermannSteeringRatio;

  /// The diameter of the steering axle wheels.
  final double steeringAxleWheelDiameter;

  /// The diameter of the solid axle wheels
  final double solidAxleWheelDiameter;

  /// The width of the steering axle wheels.
  final double steeringAxleWheelWidth;

  /// The width of the solid axle wheels.
  final double solidAxleWheelWidth;

  /// The position of the center of the rear axle.
  LatLng get solidAxlePosition;

  /// The position of the center of the front axle.
  LatLng get steeringAxlePosition;

  @override
  LatLng? get hitchFrontFixedPosition =>
      switch (solidAxleToFrontHitchDistance != null) {
        true =>
          solidAxlePosition.offset(solidAxleToFrontHitchDistance!, heading),
        false => null,
      };

  @override
  LatLng? get hitchRearFixedPosition =>
      switch (solidAxleToRearHitchDistance != null) {
        true => solidAxlePosition.offset(
            solidAxleToRearHitchDistance!,
            heading + 180,
          ),
        false => null,
      };

  @override
  LatLng? get hitchRearTowbarPosition =>
      switch (solidAxleToRearTowbarDistance != null) {
        true => solidAxlePosition.offset(
            solidAxleToRearTowbarDistance!,
            heading + 180,
          ),
        false => null,
      };

  /// Where the look ahead distance calculation should start.
  @override
  LatLng get lookAheadStartPosition => solidAxlePosition;

  /// Basic circle markers for showing the vehicle's Ackermann related
  /// points.
  @override
  List<CircleMarker> get steeringDebugMarkers => [
        CircleMarker(
          point: position,
          radius: 10,
        ),
        CircleMarker(
          point: solidAxlePosition,
          radius: 10,
          color: Colors.red,
        ),
        CircleMarker(
          point: steeringAxlePosition,
          radius: 10,
          color: Colors.blue,
        )
      ];

  /// Basic polylines for showing the vehicle's steering related
  /// points.
  @override
  List<Polyline> get steeringDebugLines => [
        Polyline(
          points: [
            solidAxlePosition,
            turningRadiusCenter!,
          ],
          color: Colors.red,
        ),
        Polyline(
          points: [
            steeringAxlePosition,
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
      ];

  /// The Ackermann steering geometry of the vehicle.
  AckermannSteering get ackermannSteering => AckermannSteering(
        steeringAngle: steeringAngle,
        wheelBase: wheelBase,
        trackWidth: trackWidth,
        steeringRatio: ackermannSteeringRatio,
      );

  /// The angle of the left steering wheel when using Ackermann steering.
  double get leftSteeringWheelAngle;

  /// The angle of the right steering wheel when using Ackermann steering.
  double get rightSteeringWheelAngle;

  /// The max opposite steering angle for the wheel the angle sensor is
  /// mounted to. I.e. the angle to the right for a front left steering wheel.
  double get maxOppositeSteeringAngle => AckermannOppositeAngle(
        wheelAngle: steeringAngleMax,
        wheelBase: wheelBase,
        trackWidth: trackWidth,
        steeringRatio: ackermannSteeringRatio,
      ).oppositeAngle;

  /// The turning radius corresponding to the current [steeringAngle].
  @override
  double? get currentTurningRadius =>
      steeringAngle.abs() <= steeringAngleMax && steeringAngle.abs() > 0
          ? ackermannSteering.turningRadius
          : null;

  /// The center point of which the [currentTurningRadius] revolves around.
  @override
  LatLng? get turningRadiusCenter => currentTurningRadius != null
      ? solidAxlePosition.offset(
          currentTurningRadius!,
          normalizeBearing(
            switch (isTurningLeft) {
              true => heading - 90,
              false => heading + 90
            },
          ),
        )
      : null;

  /// The bounds of the left steering wheel, or the right steering wheel if
  /// [left] is set to false.
  List<LatLng> wheelPoints({bool left = true, bool steering = true}) {
    final wheelDiameter = switch (steering) {
      true => steeringAxleWheelDiameter,
      false => solidAxleWheelDiameter,
    };
    final wheelWidth = switch (steering) {
      true => steeringAxleWheelWidth,
      false => solidAxleWheelWidth,
    };

    final sign = left ? 1 : -1;

    final steeringWheelAngle =
        left ? leftSteeringWheelAngle : rightSteeringWheelAngle;

    final axleToCenterAngle = normalizeBearing(heading - (90 * sign));

    final innerCenterToInnerRearAngle = normalizeBearing(
      switch (steering) {
        true => axleToCenterAngle + steeringWheelAngle - 90 * sign,
        false => axleToCenterAngle - 90 * sign,
      },
    );

    final innerRearToOuterRearAngle =
        normalizeBearing(innerCenterToInnerRearAngle + (90 * sign));

    final outerRearToOuterFrontAngle =
        normalizeBearing(innerRearToOuterRearAngle + (90 * sign));

    final outerFrontToInnerFrontAngle =
        normalizeBearing(outerRearToOuterFrontAngle + (90 * sign));

    final wheelInnerCenter = switch (steering) {
      true => steeringAxlePosition,
      false => solidAxlePosition,
    }
        .offset(
      trackWidth / 2 - wheelWidth / 2,
      axleToCenterAngle,
    );

    final wheelInnerRear = wheelInnerCenter.offset(
      wheelDiameter / 2,
      innerCenterToInnerRearAngle,
    );
    final wheelOuterRear = wheelInnerRear.offset(
      wheelWidth,
      innerRearToOuterRearAngle,
    );
    final wheelOuterFront = wheelOuterRear.offset(
      wheelDiameter,
      outerRearToOuterFrontAngle,
    );
    final wheelInnerFront = wheelOuterFront.offset(
      wheelWidth,
      outerFrontToInnerFrontAngle,
    );

    return [
      wheelInnerRear,
      wheelOuterRear,
      wheelOuterFront,
      wheelInnerFront,
    ];
  }

  /// The left steering wheel polygon.
  Polygon get leftSteeringWheelPolygon => Polygon(
        points: wheelPoints(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right steering wheel polygon.
  Polygon get rightSteeringWheelPolygon => Polygon(
        points: wheelPoints(left: false),
        isFilled: true,
        color: Colors.black,
      );

  /// Polygons for drawing the wheels of the vehicle.
  @override
  List<Polygon> get wheelPolygons => [
        leftSteeringWheelPolygon,
        rightSteeringWheelPolygon,
        leftSolidAxleWheelPolygon,
        rightSolidAxleWheelPolygon,
      ];

  /// The left solid axle wheel polygon.
  Polygon get leftSolidAxleWheelPolygon => Polygon(
        points: wheelPoints(steering: false),
        isFilled: true,
        color: Colors.black,
      );

  /// The right solid axle wheel polygon.
  Polygon get rightSolidAxleWheelPolygon => Polygon(
        points: wheelPoints(left: false, steering: false),
        isFilled: true,
        color: Colors.black,
      );

  /// The projected trajectory for the moving vehicle.
  ///
  /// Based on the current [steeringAngle], [velocity] and
  /// [currentTurningRadius].
  @override
  Path get trajectory {
    final points = <LatLng>[solidAxlePosition];

    if (currentTurningRadius != null) {
      final minTurningCircumference = 2 *
          pi *
          AckermannSteering(
            steeringAngle: steeringAngleMax,
            wheelBase: wheelBase,
            trackWidth: trackWidth,
            steeringRatio: ackermannSteeringRatio,
          ).turningRadius;

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
                true => heading +
                    90 +
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
                // Forward
                false => heading +
                    90 -
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
              },
            // Turning right
            false => switch (isReversing) {
                // Reversing
                true => heading -
                    90 -
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
                // Forward
                false => heading -
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
        solidAxlePosition.offset(
          isReversing ? -30 : 5 + 30,
          normalizeBearing(heading),
        ),
      );
    }

    return Path()..addAll(points);
  }

  /// Props used for checking for equality.
  @override
  List<Object> get props => super.props
    ..addAll([
      wheelBase,
      solidAxleDistance,
    ]);

  /// The distance from the center of the vehicle the corners.
  double get centerToCornerDistance =>
      sqrt(pow(length / 2, 2) + pow(width / 2, 2));

  /// The angle to north-west point of the max extent/bounds of the vehicle
  /// when it points to the north (0 degrees).
  double get northWestAngle => normalizeBearing(
        asin((width / 2) / centerToCornerDistance) * 360 / (2 * pi),
      );

  /// The angle to north-east point of the max extent/bounds of the vehicle
  /// when it points to the north (0 degrees).
  double get northEastAngle => normalizeBearing(
        360 - northWestAngle,
      );

  /// The angles for each corner of the max extent/bounds of the vehicle
  /// with regards to the [heading].
  double get frontLeftAngle => normalizeBearing(heading - northWestAngle);
  double get frontRightAngle => normalizeBearing(heading - northEastAngle);
  double get rearRightAngle =>
      normalizeBearing(heading - (northWestAngle + 180));
  double get rearLeftAngle =>
      normalizeBearing(heading - (northEastAngle + 180));

  /// The max extent/bounds points of the vehicle. The [heading] is followed.
  List<LatLng> get points {
    final frontLeft = position.offset(
      centerToCornerDistance,
      frontLeftAngle,
    );
    final frontRight = position.offset(
      centerToCornerDistance,
      frontRightAngle,
    );
    final rearRight = position.offset(
      centerToCornerDistance,
      rearRightAngle,
    );
    final rearLeft = position.offset(
      centerToCornerDistance,
      rearLeftAngle,
    );

    return [
      frontLeft,
      frontRight,
      rearRight,
      rearLeft,
    ];
  }

  /// Polygons for visualizing the extent of the vehicle.
  @override
  List<Polygon> get polygons => [
        Polygon(
          points: points,
          isFilled: true,
          color: Colors.yellow.withOpacity(0.5),
        )
      ];

  /// Returns a new [AxleSteeredVehicle] based on this one, but with
  /// parameters/variables altered.
  @override
  AxleSteeredVehicle copyWith({
    LatLng? position,
    double? antennaHeight,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    double? wheelBase,
    double? solidAxleDistance,
    double? ackermannSteeringRatio,
    double? steeringAxleWheelDiameter,
    double? solidAxleWheelDiameter,
    double? steeringAxleWheelWidth,
    double? solidAxleWheelWidth,
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
  });
}
