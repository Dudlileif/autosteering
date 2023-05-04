import 'package:agopengps_flutter/src/features/vehicle/models/ackermann_steering.dart';
import 'package:agopengps_flutter/src/features/vehicle/models/vehicle_types/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// A base class for vehicles that steer with either a front or rear axle.
abstract class AxleSteeredVehicle extends Vehicle {
  const AxleSteeredVehicle({
    required this.wheelBase,
    required this.solidAxleDistance,
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

  /// The distance between the axles.
  final double wheelBase;

  /// The distance from the antenna [position] to the solid axle,
  /// this means the rear axle on front wheel steered vehicles, and
  /// the front axle on rear wheel steered vehicles.
  /// Expected positive for front wheel steered,
  /// negative for rear wheel steered.
  final double solidAxleDistance;

  /// The position of the center of the rear axle.
  LatLng get solidAxlePosition;

  /// The position of the center of the front axle.
  LatLng get steeringAxlePosition;

  /// The Ackermann steering geometry of the vehicle.
  AckermannSteering get ackermannSteering => AckermannSteering(
        steeringAngle: steeringAngle,
        wheelBase: wheelBase,
        trackWidth: trackWidth,
      );

  /// The angle of the left steering wheel when using Ackermann steering.
  double get leftSteeringWheelAngle;

  /// The angle of the right steering wheel when using Ackermann steering.
  double get rightSteeringWheelAngle;

  /// The max opposite steering angle for the wheel the angle sensor is
  /// mounted to. I.e. the angle to the right for a front left steering wheel.
  double get maxOppositeSteeringAngle => AckermannOppositeAngle(
        wheelAngleMax: steeringAngleMax,
        wheelBase: wheelBase,
        trackWidth: trackWidth,
      ).oppositeAngle;

  /// The turning radius corresponding to the current [steeringAngle].
  @override
  double? get currentTurningRadius => steeringAngle.abs() <= steeringAngleMax &&
          steeringAngle.abs() > minSteeringAngle
      ? ackermannSteering.turningRadius
      : null;

  /// The center point of which the [currentTurningRadius] revolves around.
  @override
  LatLng? get turningRadiusCenter => currentTurningRadius != null
      ? Vehicle.distance.offset(
          solidAxlePosition,
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
  List<LatLng> steeringWheelPoints({bool left = true}) {
    const wheelDiameter = 1.1;
    const wheelWidth = 0.48;

    final sign = left ? 1 : -1;
    final steeringWheelAngle =
        left ? leftSteeringWheelAngle : rightSteeringWheelAngle;

    final axleToCenterAngle = normalizeBearing(heading - (90 * sign));

    final frontOuterCenterToOuterFrontAngle = normalizeBearing(
      axleToCenterAngle + steeringWheelAngle - 90 * sign,
    );

    final frontOuterToFrontInnerAngle =
        normalizeBearing(frontOuterCenterToOuterFrontAngle + (90 * sign));

    final frontInnerToRearInnerAngle =
        normalizeBearing(frontOuterToFrontInnerAngle + (90 * sign));

    final rearInnerToRearOuterAngle =
        normalizeBearing(frontInnerToRearInnerAngle + (90 * sign));

    final wheelCenter = Vehicle.distance.offset(
      steeringAxlePosition,
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

  /// The left steering wheel polygon.
  Polygon get leftSteeringWheelPolygon => Polygon(
        points: steeringWheelPoints(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right steering wheel polygon.
  Polygon get rightSteeringWheelPolygon => Polygon(
        points: steeringWheelPoints(left: false),
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

  /// The bounds of the left solid axle wheel, or the right solid axle wheel if
  /// [left] is set to false.
  List<LatLng> solidAxleWheelPoints({bool left = true}) {
    const wheelDiameter = 1.8;
    const wheelWidth = 0.6;

    final sign = left ? 1 : -1;

    final axleToCenterAngle = normalizeBearing(heading - (90 * sign));

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
      solidAxlePosition,
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
  Polygon get leftSolidAxleWheelPolygon => Polygon(
        points: solidAxleWheelPoints(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right solid axle wheel polygon.
  Polygon get rightSolidAxleWheelPolygon => Polygon(
        points: solidAxleWheelPoints(left: false),
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
          solidAxlePosition,
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

  /// Returns a new [AxleSteeredVehicle] based on the this one, but with
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
    bool? invertSteeringInput,
    double? velocity,
    double? heading,
    double? steeringAngleInput,
    double? length,
    double? width,
    double? acceleration,
    bool? simulated,
  });
}
