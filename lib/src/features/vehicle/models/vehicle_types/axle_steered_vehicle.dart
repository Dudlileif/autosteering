part of '../vehicle.dart';

/// A base class for vehicles that steers with either a front or rear axle.
///
/// The steering axle is based on Ackermann geometry.
sealed class AxleSteeredVehicle extends Vehicle {
  /// A base class for vehicles that steers with either a front or rear axle.
  ///
  /// The steering axle is based on Ackermann geometry.
  AxleSteeredVehicle({
    required this.wheelBase,
    required this.solidAxleDistance,
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
    super.stanleyParameters,
    super.antennaLateralOffset,
    super.position,
    super.invertSteeringInput,
    super.velocity,
    super.bearing,
    super.steeringAngleInput,
    super.length = 4,
    super.width = 2.5,
    super.isSimulated,
    super.useIMUPitchAndRoll,
    super.hitchFrontFixedChild,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    super.name,
    super.uuid,
    super.lastUsed,
  });

  /// The distance between the axles.
  @override
  double wheelBase;

  /// The distance from the antenna [position] to the solid axle,
  /// this means the rear axle on front wheel steered vehicles, and
  /// the front axle on rear wheel steered vehicles.
  /// Expected positive for front wheel steered,
  /// negative for rear wheel steered.
  double solidAxleDistance;

  /// The distance to the front hitch point from the solid axle.
  double? solidAxleToFrontHitchDistance;

  /// The distance to the rear hitch point from the solid axle.
  double? solidAxleToRearHitchDistance;

  /// The distance to the rear towbar hitch point from the solid axle.
  double? solidAxleToRearTowbarDistance;

  /// A modifier ratio for the Ackermann central angle. Defaults to 1.
  ///
  /// A higher value will cause a sharper turn, and a lower value a looser
  /// turn.
  /// ackermannAngle = [steeringAngleInput] / [ackermannSteeringRatio]
  double ackermannSteeringRatio;

  /// The diameter of the steering axle wheels.
  double steeringAxleWheelDiameter;

  /// The diameter of the solid axle wheels
  double solidAxleWheelDiameter;

  /// The width of the steering axle wheels.
  double steeringAxleWheelWidth;

  /// The width of the solid axle wheels.
  double solidAxleWheelWidth;

  /// The position of the center of the rear axle.
  Geographic get solidAxlePosition;

  /// The position of the center of the front axle.
  Geographic get steeringAxlePosition;

  @override
  Geographic get pursuitAxlePosition => solidAxlePosition;

  @override
  Geographic? get hitchFrontFixedPoint =>
      switch (solidAxleToFrontHitchDistance != null) {
        true => solidAxlePosition.spherical.destinationPoint(
            distance: solidAxleToFrontHitchDistance!,
            bearing: bearing,
          ),
        false => null,
      };

  @override
  Geographic? get hitchRearFixedPoint =>
      switch (solidAxleToRearHitchDistance != null) {
        true => solidAxlePosition.spherical.destinationPoint(
            distance: solidAxleToRearHitchDistance!,
            bearing: bearing + 180,
          ),
        false => null,
      };

  @override
  Geographic? get hitchRearTowbarPoint =>
      switch (solidAxleToRearTowbarDistance != null) {
        true => solidAxlePosition.spherical.destinationPoint(
            distance: solidAxleToRearTowbarDistance!,
            bearing: bearing + 180,
          ),
        false => null,
      };

  /// Where the look ahead distance calculation should start.
  @override
  Geographic get lookAheadStartPosition => solidAxlePosition;

  /// Basic circle markers for showing the vehicle's Ackermann related
  /// points.
  @override
  List<map.CircleMarker> get steeringDebugMarkers => [
        map.CircleMarker(
          point: position.latLng,
          radius: 10,
        ),
        map.CircleMarker(
          point: solidAxlePosition.latLng,
          radius: 10,
          color: Colors.red,
        ),
        map.CircleMarker(
          point: steeringAxlePosition.latLng,
          radius: 10,
          color: Colors.blue,
        ),
      ];

  /// Basic polylines for showing the vehicle's steering related
  /// points.
  @override
  List<map.Polyline> get steeringDebugLines => [
        map.Polyline(
          points: [
            solidAxlePosition.latLng,
            turningRadiusCenter!.latLng,
          ],
          color: Colors.red,
        ),
        map.Polyline(
          points: [
            steeringAxlePosition.latLng,
            turningRadiusCenter!.latLng,
          ],
          color: Colors.blue,
        ),
        map.Polyline(
          points: [
            position.latLng,
            turningRadiusCenter!.latLng,
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
  Geographic? get turningRadiusCenter => currentTurningRadius != null
      ? solidAxlePosition.spherical.destinationPoint(
          distance: currentTurningRadius!,
          bearing: switch (isTurningLeft) {
            true => bearing - 90,
            false => bearing + 90
          }
              .wrap360(),
        )
      : null;

  @override
  void updatePositionAndBearingTurning(
    double period,
    Geographic turningCircleCenter,
  ) {
    // How many degrees of the turning circle the current angular
    // velocity during the period amounts to. Relative to the current
    // position, is negative when reversing.
    final turningCircleAngle = angularVelocity! * period;

    // The angle from the turning circle center to the projected
    // position.
    final angle = switch (isTurningLeft) {
      // Turning left
      true => bearing + 90 - turningCircleAngle,
      // Turning right
      false => bearing - 90 + turningCircleAngle,
    };
    // Projected solid axle position from the turning radius
    // center.
    final solidAxlePositon = turningCircleCenter.spherical.destinationPoint(
      distance: currentTurningRadius!,
      bearing: angle.wrap360(),
    );

    // The bearing of the vehicle at the projected position.
    final projectedBearing = switch (isTurningLeft) {
      true => bearing - turningCircleAngle,
      false => bearing + turningCircleAngle,
    }
        .wrap360();

    // The vehicle center position, which is offset from the solid
    // axle position.
    final vehiclePosition = solidAxlePositon.spherical.destinationPoint(
      distance: solidAxleDistance,
      bearing: switch (this) {
        Tractor() => projectedBearing,
        Harvester() => projectedBearing + 180,
      },
    );

    // Update the vehicle state.

    position = vehiclePosition;
    bearing = projectedBearing;
  }

  /// The bounds of the left steering wheel, or the right steering wheel if
  /// [left] is set to false.
  List<Geographic> wheelPoints({bool left = true, bool steering = true}) {
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

    final axleToCenterAngle = (bearing - (90 * sign)).wrap360();

    final innerCenterToInnerRearAngle = switch (steering) {
      true => axleToCenterAngle + steeringWheelAngle - 90 * sign,
      false => axleToCenterAngle - 90 * sign,
    }
        .wrap360();

    final innerRearToOuterRearAngle =
        (innerCenterToInnerRearAngle + (90 * sign)).wrap360();

    final outerRearToOuterFrontAngle =
        (innerRearToOuterRearAngle + (90 * sign)).wrap360();

    final outerFrontToInnerFrontAngle =
        (outerRearToOuterFrontAngle + (90 * sign)).wrap360();

    final wheelInnerCenter = switch (steering) {
      true => steeringAxlePosition,
      false => solidAxlePosition,
    }
        .spherical
        .destinationPoint(
          distance: trackWidth / 2 - wheelWidth / 2,
          bearing: axleToCenterAngle,
        );

    final wheelInnerRear = wheelInnerCenter.spherical.destinationPoint(
      distance: wheelDiameter / 2,
      bearing: innerCenterToInnerRearAngle,
    );
    final wheelOuterRear = wheelInnerRear.spherical.destinationPoint(
      distance: wheelWidth,
      bearing: innerRearToOuterRearAngle,
    );
    final wheelOuterFront = wheelOuterRear.spherical.destinationPoint(
      distance: wheelDiameter,
      bearing: outerRearToOuterFrontAngle,
    );
    final wheelInnerFront = wheelOuterFront.spherical.destinationPoint(
      distance: wheelWidth,
      bearing: outerFrontToInnerFrontAngle,
    );

    return [
      wheelInnerRear,
      wheelOuterRear,
      wheelOuterFront,
      wheelInnerFront,
    ];
  }

  /// The left steering wheel polygon.
  map.Polygon get leftSteeringWheelPolygon => map.Polygon(
        points: wheelPoints().map((e) => e.latLng).toList(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right steering wheel polygon.
  map.Polygon get rightSteeringWheelPolygon => map.Polygon(
        points: wheelPoints(left: false).map((e) => e.latLng).toList(),
        isFilled: true,
        color: Colors.black,
      );

  /// The left solid axle wheel polygon.
  map.Polygon get leftSolidAxleWheelPolygon => map.Polygon(
        points: wheelPoints(steering: false).map((e) => e.latLng).toList(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right solid axle wheel polygon.
  map.Polygon get rightSolidAxleWheelPolygon => map.Polygon(
        points: wheelPoints(left: false, steering: false)
            .map((e) => e.latLng)
            .toList(),
        isFilled: true,
        color: Colors.black,
      );

  /// Polygons for drawing the wheels of the vehicle.
  @override
  List<map.Polygon> get wheelPolygons => [
        leftSteeringWheelPolygon,
        rightSteeringWheelPolygon,
        leftSolidAxleWheelPolygon,
        rightSolidAxleWheelPolygon,
      ];

  /// The projected trajectory for the moving vehicle.
  ///
  /// Based on the current [steeringAngle], [velocity] and
  /// [currentTurningRadius].
  @override
  Path get trajectory {
    final points = <Geographic>[solidAxlePosition];

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
                true => bearing +
                    90 +
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
                // Forward
                false => bearing +
                    90 -
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
              },
            // Turning right
            false => switch (isReversing) {
                // Reversing
                true => bearing -
                    90 -
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
                // Forward
                false => bearing -
                    90 +
                    i / numberOfPoints * revolutionsOfTurningCircle * 360,
              },
          };

          points.add(
            turningRadiusCenter!.spherical.destinationPoint(
              distance: currentTurningRadius!,
              bearing: angle.wrap360(),
            ),
          );
        }
      }
    } else {
      points.add(
        solidAxlePosition.spherical.destinationPoint(
          distance: isReversing ? -30 : 5 + 30,
          bearing: bearing.wrap360(),
        ),
      );
    }

    return Path()..addAll(points.map((e) => e.latLng).toList());
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
  double get northWestAngle =>
      (asin((width / 2) / centerToCornerDistance) * 360 / (2 * pi)).wrap360();

  /// The angle to north-east point of the max extent/bounds of the vehicle
  /// when it points to the north (0 degrees).
  double get northEastAngle => (360 - northWestAngle).wrap360();

  /// The bearing for the front left corner of the max extent/bounds of the
  /// vehicle with regards to the [bearing].
  double get frontLeftBearing => (bearing - northWestAngle).wrap360();

  /// The bearing for the front right corner of the max extent/bounds of the
  /// vehicle with regards to the [bearing].
  double get frontRightBearing => (bearing - northEastAngle).wrap360();

  /// The bearing for the rear right corner of the max extent/bounds of the
  /// vehicle with regards to the [bearing].
  double get rearRightBearing => (bearing - (northWestAngle + 180)).wrap360();

  /// The bearing for the rear left corner of the max extent/bounds of the
  /// vehicle with regards to the [bearing].
  double get rearLeftBearing => (bearing - (northEastAngle + 180)).wrap360();

  /// The max extent/bounds points of the vehicle. The [bearing] is followed.
  List<Geographic> get points {
    final frontLeft = position.spherical.destinationPoint(
      distance: centerToCornerDistance,
      bearing: frontLeftBearing,
    );
    final frontRight = position.spherical.destinationPoint(
      distance: centerToCornerDistance,
      bearing: frontRightBearing,
    );
    final rearRight = position.spherical.destinationPoint(
      distance: centerToCornerDistance,
      bearing: rearRightBearing,
    );
    final rearLeft = position.spherical.destinationPoint(
      distance: centerToCornerDistance,
      bearing: rearLeftBearing,
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
  List<map.Polygon> get polygons => [
        map.Polygon(
          points: points.map((e) => e.latLng).toList(),
          isFilled: true,
          color: Colors.yellow.withOpacity(0.5),
        ),
      ];

  /// Returns a new [AxleSteeredVehicle] based on this one, but with
  /// parameters/variables altered.
  @override
  AxleSteeredVehicle copyWith({
    Geographic? position,
    double? antennaHeight,
    double? antennaLateralOffset,
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
    double? solidAxleToFrontHitchDistance,
    double? solidAxleToRearHitchDistance,
    double? solidAxleToRearTowbarDistance,
    bool? invertSteeringInput,
    PidParameters? pidParameters,
    StanleyParameters? stanleyParameters,
    double? velocity,
    double? bearing,
    double? steeringAngleInput,
    double? length,
    double? width,
    bool? isSimulated,
    bool? useIMUPitchAndRoll,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    String? name,
  });

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    map['dimensions'] = Map<String, dynamic>.from(map['dimensions'] as Map)
      ..addAll(
        {
          'wheel_base': wheelBase,
          'solid_axle_distance': solidAxleDistance,
          'wheels': {
            'steering_axle_wheel_diameter': steeringAxleWheelDiameter,
            'solid_axle_wheel_diameter': solidAxleWheelDiameter,
            'steering_axle_wheel_width': steeringAxleWheelWidth,
            'solid_axle_wheel_width': solidAxleWheelWidth,
          },
        },
      );

    map['steering'] = Map<String, dynamic>.from(map['steering'] as Map)
      ..addAll({'ackermann_steering_ratio': ackermannSteeringRatio});

    map['hitches'] = {
      'solid_axle_to_front_hitch_distance': solidAxleToFrontHitchDistance,
      'solid_axle_to_rear_hitch_distance': solidAxleToRearHitchDistance,
      'solid_axle_to_rear_towbar_distance': solidAxleToRearTowbarDistance,
    };

    return map;
  }
}
