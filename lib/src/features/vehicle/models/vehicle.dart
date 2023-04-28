import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    /// Center/antenna position of the vehicle. Assumed centered based on the
    /// [width] of the vehicle.
    required LatLng position,

    /// The length of the vehicle, in meters.
    required double length,

    /// The width of the vehicle, in meters.
    required double width,

    /// The distance between the axels.
    required double wheelBase,

    /// The distance from [position] to the rear axle.
    required double rearAxleDistance,

    /// The best/minimum turning radius, in meters.
    required double minTurningRadius,

    /// The maximum angle that the steering wheels can turn, in degrees.
    required double wheelAngleMax,

    /// The heading of the vehicle, in degrees.
    @Default(0) double heading,

    /// The angle at which the steering wheels are turned, in degrees.
    @Default(0) double wheelAngle,

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
  static const distance = Distance(roundResult: false);

  /// The position of the center of the rear axle.
  LatLng get rearAxlePosition => distance.offset(
        position,
        rearAxleDistance,
        normalizeBearing(heading - 180),
      );

  /// The position of the center of the front axle.
  LatLng get frontAxlePosition => distance.offset(
        position,
        wheelBase - rearAxleDistance,
        normalizeBearing(heading),
      );

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
    final frontLeft = distance.offset(
      position,
      centerToCornerDistance,
      frontLeftAngle,
    );
    final frontRight = distance.offset(
      position,
      centerToCornerDistance,
      frontRightAngle,
    );
    final rearRight = distance.offset(
      position,
      centerToCornerDistance,
      rearRightAngle,
    );
    final rearLeft = distance.offset(
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
      );

  /// The bounds of the left front wheel, or the right fron wheel if [left]
  ///  is set to false.
  List<LatLng> frontWheelPoints({bool left = true}) {
    const wheelDiameter = 1.3;
    const wheelWidth = 0.48;

    final sign = left ? 1 : -1;

    final axleToOuterCenterAngle = normalizeBearing(heading - (90 * sign));
    final frontOuterCenterToOuterFrontAngle =
        normalizeBearing(axleToOuterCenterAngle + wheelAngle + (90 * sign));
    final frontOuterToFrontInnerAngle =
        normalizeBearing(frontOuterCenterToOuterFrontAngle + (90 * sign));
    final frontInnerToRearInnerAngle =
        normalizeBearing(frontOuterToFrontInnerAngle + (90 * sign));
    final rearInnerToRearOuterAngle =
        normalizeBearing(frontInnerToRearInnerAngle + (90 * sign));

    final frontWheelOuterCenter = distance.offset(
      frontAxlePosition,
      width / 2 - wheelWidth / 3,
      axleToOuterCenterAngle,
    );
    final frontWheelOuterFront = distance.offset(
      frontWheelOuterCenter,
      wheelDiameter / 2,
      frontOuterCenterToOuterFrontAngle,
    );
    final frontWheelInnerFront = distance.offset(
      frontWheelOuterFront,
      wheelWidth,
      frontOuterToFrontInnerAngle,
    );
    final frontWheelInnerRear = distance.offset(
      frontWheelInnerFront,
      wheelDiameter,
      frontInnerToRearInnerAngle,
    );
    final frontWheelOuterRear = distance.offset(
      frontWheelInnerRear,
      wheelWidth,
      rearInnerToRearOuterAngle,
    );

    final points = <LatLng>[
      frontWheelOuterCenter,
      frontWheelOuterFront,
      frontWheelInnerFront,
      frontWheelInnerRear,
      frontWheelOuterRear,
    ];

    return points;
  }

  /// The left front wheel polygon.
  Polygon get leftFrontWheelPolygon => Polygon(
        points: frontWheelPoints(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right front wheel polygon.
  Polygon get rightFrontWheelPolygon => Polygon(
        points: frontWheelPoints(left: false),
        isFilled: true,
        color: Colors.black,
      );

  /// The turning radius corresponding to the current [wheelAngle].
  ///
  /// Will default to [minTurningRadius] if the angle is above [wheelAngleMax].
  double? get currentTurningRadius =>
      wheelAngle.abs() <= wheelAngleMax && wheelAngle.abs() > 0.01
          ? minTurningRadius * (wheelAngleMax / wheelAngle.abs())
          : null;

  /// The center point of which the [currentTurningRadius] revolves around.
  LatLng? get turningRadiusCenter => currentTurningRadius != null
      ? distance.offset(
          rearAxlePosition,
          currentTurningRadius!,
          normalizeBearing(heading + wheelAngle),
        )
      : null;

  /// The projected trajectory for the moving vehicle.
  ///
  /// Based on the current [wheelAngle], [velocity] and [currentTurningRadius].
  Path get trajectory {
    final points = <LatLng>[position];

    for (var i = 0; i < 10; i++) {
      final currentTurningRadiusCenter = currentTurningRadius != null
          ? distance.offset(
              points[i],
              currentTurningRadius!,
              normalizeBearing(heading + wheelAngle),
            )
          : position;

      points.add(
        distance.offset(
          currentTurningRadiusCenter,
          i * (0.5 + velocity / 2),
          normalizeBearing(heading + wheelAngle * i),
        ),
      );
    }

    return Path()..addAll(points);
  }

  /// Whether the vehicle is reversing or not.
  bool get isReversing => velocity < 0;
}
