import 'dart:math';

import 'package:agopengps_flutter/src/features/vehicle/models/ackermann_steering.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    /// Which type of vehicle this is, either a conventional tractor,
    /// articulated tractor or harvester.
    required VehicleType type,

    /// Center/antenna position of the vehicle. Assumed centered based on the
    /// [width] of the vehicle.
    required LatLng position,

    /// The height of the antenna above the ground, in meters.
    required double antennaHeight,

    /// The length of the vehicle, in meters.
    required double length,

    /// The width of the vehicle, in meters.
    required double width,

    /// The distance between the axles.
    required double wheelBase,

    /// The distance from the antenna [position] to the solid axle,
    /// this means the rear axle on front wheel steered vehicles, and
    /// the front axle on rear wheel steered vehicles.
    /// Expected positive for front wheel steered,
    /// negative for rear wheel steered.
    required double solidAxleDistance,

    /// The distance between the center of the wheels on the solid axle.
    required double trackWidth,

    /// The best/minimum turning radius, in meters.
    required double minTurningRadius,

    /// The maximum angle that the steering wheels can turn, in degrees.
    required double wheelAngleMax,

    /// The heading of the vehicle, in degrees.
    @Default(0) double heading,

    /// This is the Ackermann input angle, imagined to be on the middle of
    /// the steering axle, as if the vehicle only had one center
    /// steering wheel.
    @Default(0) double steeringAngle,

    /// The velocity of the vehicle, in m/s, meters per second, in the heading
    /// direction.
    @Default(0) double velocity,

    /// The acceleration of the vehicle, in m/s^2, in the heading direction.
    @Default(0) double acceleration,

    /// Whether the vehicle is simulated.
    @Default(false) bool simulated,
  }) = _Vehicle;
  const Vehicle._();

  factory Vehicle.fromJson(Map<String, Object?> json) =>
      _$VehicleFromJson(json);

  /// Geo-calculator used to calculate offsets.
  static const _distance = Distance(roundResult: false);

  /// The position of the center of the rear axle.
  LatLng get solidAxlePosition => _distance.offset(
        position,
        solidAxleDistance,
        normalizeBearing(
          switch (type) {
            VehicleType.conventionalTractor => heading - 180,
            VehicleType.harvester => heading,
            VehicleType.articulatedTractor => heading,
          },
        ),
      );

  /// The position of the center of the front axle.
  LatLng get steeringAxlePosition => _distance.offset(
        position,
        switch (type) {
          VehicleType.conventionalTractor => wheelBase - solidAxleDistance,
          VehicleType.harvester => -wheelBase + solidAxleDistance,
          VehicleType.articulatedTractor => 0,
        },
        normalizeBearing(heading),
      );

  AckermannSteering get ackermannSteering => AckermannSteering(
        steeringAngle: steeringAngle,
        wheelBase: wheelBase,
        trackWidth: trackWidth,
      );

  /// The angle of the left steering wheel when using Ackermann steering.
  double get leftSteeringWheelAngle => switch (type) {
        VehicleType.conventionalTractor => ackermannSteering.leftAngle,
        VehicleType.harvester => -ackermannSteering.leftAngle,
        VehicleType.articulatedTractor => 0
      };

  /// The angle of the right steering wheel when using Ackermann steering.
  double get rightSteeringWheelAngle => switch (type) {
        VehicleType.conventionalTractor => ackermannSteering.rightAngle,
        VehicleType.harvester => -ackermannSteering.rightAngle,
        VehicleType.articulatedTractor => 0
      };

  /// The max opposite steering angle for the wheel the angle sensor is
  /// mounted to. I.e. the angle to the right for a front left steering wheel.
  double get maxOppositeSteeringAngle => AckermannOppositeAngle(
        wheelAngleMax: wheelAngleMax,
        wheelBase: wheelBase,
        trackWidth: trackWidth,
      ).oppositeAngle;

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
    final frontLeft = _distance.offset(
      position,
      centerToCornerDistance,
      frontLeftAngle,
    );
    final frontRight = _distance.offset(
      position,
      centerToCornerDistance,
      frontRightAngle,
    );
    final rearRight = _distance.offset(
      position,
      centerToCornerDistance,
      rearRightAngle,
    );
    final rearLeft = _distance.offset(
      position,
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

  /// A polygon for visualizing the extent of the vehicle. The [heading] is
  /// followed.
  Polygon get polygon => Polygon(
        points: points,
        isFilled: true,
        color: Colors.yellow.withOpacity(0.5),
      );

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

    final wheelCenter = _distance.offset(
      steeringAxlePosition,
      trackWidth / 2 - wheelWidth / 2,
      axleToCenterAngle,
    );

    final wheelOuterFront = _distance.offset(
      wheelCenter,
      wheelDiameter / 2,
      frontOuterCenterToOuterFrontAngle,
    );
    final wheelInnerFront = _distance.offset(
      wheelOuterFront,
      wheelWidth,
      frontOuterToFrontInnerAngle,
    );
    final wheelInnerRear = _distance.offset(
      wheelInnerFront,
      wheelDiameter,
      frontInnerToRearInnerAngle,
    );
    final wheelOuterRear = _distance.offset(
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

    final wheelCenter = _distance.offset(
      solidAxlePosition,
      trackWidth / 2 - wheelWidth / 2,
      axleToCenterAngle,
    );

    final wheelOuterFront = _distance.offset(
      wheelCenter,
      wheelDiameter / 2,
      frontOuterCenterToOuterFrontAngle,
    );
    final wheelInnerFront = _distance.offset(
      wheelOuterFront,
      wheelWidth,
      frontOuterToFrontInnerAngle,
    );
    final wheelInnerRear = _distance.offset(
      wheelInnerFront,
      wheelDiameter,
      frontInnerToRearInnerAngle,
    );
    final wheelOuterRear = _distance.offset(
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

  // Reqiure wheel angle above 1 deg when using simulator, 0.01 deg otherwise.
  // This is due to some error at low angle calculation, which could
  // give wrong movement.
  double get minSteeringAngle => simulated ? 1 : 0.01;

  /// The turning radius corresponding to the current [steeringAngle].
  double? get currentTurningRadius => steeringAngle.abs() <= wheelAngleMax &&
          steeringAngle.abs() > minSteeringAngle
      ? ackermannSteering.turningRadius
      : null;

  /// The center point of which the [currentTurningRadius] revolves around.
  LatLng? get turningRadiusCenter => currentTurningRadius != null
      ? _distance.offset(
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

  /// The angular velocity of the vehicle, if it is turning.
  /// degrees/s, does not care about clockwise/counter-clockwise direction.
  double? get angularVelocity => currentTurningRadius != null
      ? (velocity / (2 * pi * currentTurningRadius!)) * 360
      : null;

  /// The projected trajectory for the moving vehicle.
  ///
  /// Based on the current [steeringAngle], [velocity] and
  /// [currentTurningRadius].
  Path get trajectory {
    final points = <LatLng>[solidAxlePosition];

    if (currentTurningRadius != null) {
      final minTurningCircumference = 2 *
          pi *
          AckermannSteering(
            steeringAngle: wheelAngleMax,
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
            _distance.offset(
              turningRadiusCenter!,
              currentTurningRadius!,
              normalizeBearing(angle),
            ),
          );
        }
      }
    } else {
      points.add(
        _distance.offset(
          solidAxlePosition,
          isReversing ? -30 : 5 + 30,
          normalizeBearing(heading),
        ),
      );
    }

    return Path()..addAll(points);
  }

  /// Whether the vehicle is reversing or not.
  bool get isReversing => velocity < 0;

  /// Whether the vehicle is turning to the left,
  /// otherwise assumed turning to the right.
  bool get isTurningLeft => steeringAngle < 0;
}

enum VehicleType {
  conventionalTractor(SteeringAxle.front),
  articulatedTractor(SteeringAxle.none),
  harvester(SteeringAxle.rear);

  const VehicleType(this.steeringAxle);

  final SteeringAxle steeringAxle;
}

enum SteeringAxle {
  front,
  none,
  rear;
}
