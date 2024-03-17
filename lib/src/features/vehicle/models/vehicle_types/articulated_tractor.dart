part of '../vehicle.dart';

/// An articulated tractor with two bodies with solid axles that are joined
/// at a pivot point.
///
/// Geometry: https://eprints.qut.edu.au/21740/1/corke_00928568.pdf
final class ArticulatedTractor extends Vehicle {
  /// An articulated tractor with two bodies with solid axles that are joined
  /// at a pivot point.
  ArticulatedTractor({
    required this.antennaToPivotDistance,
    required this.pivotToFrontAxle,
    required this.pivotToRearAxle,
    required super.antennaHeight,
    /// The minimum turning radius of the front axle.
    required super.minTurningRadius,
    required super.steeringAngleMax,
    required super.trackWidth,
    this.frontAxleToHitchDistance,
    this.rearAxleToHitchDistance = 1.9,
    this.rearAxleToTowbarDistance = 1.6,
    this.wheelDiameter = 1.8,
    this.wheelWidth = 1.3,
    this.wheelSpacing = 0.15,
    this.numWheels = 2,
    this.frontAxleToFrontDistance = 1.5,
    this.rearAxleToEndDistance = 1,
    super.antennaLateralOffset,
    super.pathTrackingMode,
    super.imu,
    super.was,
    super.motorConfig,
    super.pidParameters,
    super.purePursuitParameters =
        const PurePursuitParameters(lookAheadDistance: 1),
    super.stanleyParameters,
    super.antennaPosition,
    super.velocity,
    super.bearing,
    super.pitch,
    super.roll,
    super.steeringAngleInput,
    super.length = 4,
    super.width = 2.5,
    super.wheelsRolledDistance,
    super.hitchFrontFixedChild,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    super.name,
    super.uuid,
    super.lastUsed,
    super.manufacturerColors,
  });

  /// Creates an [ArticulatedTractor] from the [json] object.
  factory ArticulatedTractor.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);

    final antenna = Map<String, dynamic>.from(json['antenna'] as Map);

    final dimensions = Map<String, dynamic>.from(json['dimensions'] as Map);

    final wheels = Map<String, dynamic>.from(dimensions['wheels'] as Map);

    final steering = Map<String, dynamic>.from(json['steering'] as Map);

    final hitches = Map<String, dynamic>.from(json['hitches'] as Map);

    return ArticulatedTractor(
      name: info['name'] as String?,
      uuid: info['uuid'] as String?,
      lastUsed: DateTime.tryParse(info['last_used'] as String),
      antennaHeight: antenna['height'] as double,
      antennaLateralOffset: antenna['lateral_offset'] as double,
      antennaToPivotDistance: antenna['pivot_distance'] as double,
      width: dimensions['width'] as double,
      length: dimensions['length'] as double,
      trackWidth: dimensions['track_width'] as double,
      pivotToFrontAxle: dimensions['pivot_to_front_axle'] as double,
      pivotToRearAxle: dimensions['pivot_to_rear_axle'] as double,
      minTurningRadius: steering['min_turning_radius'] as double,
      steeringAngleMax: steering['steering_angle_max'] as double,
      numWheels: wheels['num_wheels'] as int,
      wheelDiameter: wheels['wheel_diameter'] as double,
      wheelWidth: wheels['wheel_width'] as double,
      wheelSpacing: wheels['wheel_spacing'] as double,
      pathTrackingMode: steering.containsKey('path_tracking_mode')
          ? PathTrackingMode.fromJson(steering['path_tracking_mode'] as String)
          : PathTrackingMode.purePursuit,
      frontAxleToHitchDistance:
          hitches['front_axle_to_front_hitch_distance'] as double?,
      rearAxleToHitchDistance:
          hitches['rear_axle_to_hitch_distance'] as double?,
      rearAxleToTowbarDistance:
          hitches['rear_axle_to_towbar_distance'] as double?,
    );
  }

  /// The distance from the vehicle articulation pivot point to the antenna
  /// [position].
  double antennaToPivotDistance;

  /// The distance from the vehicle articulation pivot point to the front
  /// axle center position.
  double pivotToFrontAxle;

  /// The distance from the vehicle articulation pivot point to the rear
  /// axle center position.
  double pivotToRearAxle;

  /// The distance from the front axle to the front fixed hitch point.
  double? frontAxleToHitchDistance;

  /// The distance from the rear axle to the rear fixed hitch point.
  double? rearAxleToHitchDistance;

  /// The distance from the rear axle to the rear towbar hitch point.
  double? rearAxleToTowbarDistance;

  /// The diameter of the wheels.
  double wheelDiameter;

  /// The width of the wheels.
  double wheelWidth;

  /// The distance between the twin/triple etc. wheels.
  double wheelSpacing;

  /// The number of wheels, i.e. twin/triples etc...
  int numWheels;

  /// The distance from the [frontAxlePosition] to the frontmost part of the
  /// vehicle, typically the bonnet or the frame.
  double frontAxleToFrontDistance;

  /// The distance from the [rearAxlePosition] to the rearmost part of the
  /// vehicle, excluding hitches, typically wheel fenders.
  double rearAxleToEndDistance;

  @override
  double get wheelBase => pivotToFrontAxle + pivotToRearAxle;

  /// The position of the vehicle articulation pivot point.
  Geographic get pivotPosition => position.rhumb.destinationPoint(
        distance: antennaToPivotDistance,
        bearing: (bearing - 180 + steeringAngle / 2).wrap360(),
      );

  /// Where the look ahead distance calculation should start.
  @override
  Geographic get lookAheadStartPosition => pivotPosition;

  /// The angle from the pivot point to the front axle.
  double get frontAxleAngle => (bearing + steeringAngle / 2).wrap360();

  /// The position of the front axle center point.
  Geographic get frontAxlePosition => pivotPosition.rhumb.destinationPoint(
        distance: pivotToFrontAxle,
        bearing: frontAxleAngle,
      );

  /// The angle from the pivot point to the rear axle.
  double get rearAxleAngle => (bearing + 180 - steeringAngle / 2).wrap360();

  /// The position of the front axle center point.
  Geographic get rearAxlePosition => pivotPosition.rhumb.destinationPoint(
        distance: pivotToRearAxle,
        bearing: rearAxleAngle,
      );

  @override
  Geographic? get hitchFrontFixedPoint =>
      switch (frontAxleToHitchDistance != null) {
        true => frontAxlePosition.rhumb.destinationPoint(
            distance: frontAxleToHitchDistance!,
            bearing: frontAxleAngle,
          ),
        false => null,
      };

  @override
  Geographic? get hitchRearFixedPoint =>
      switch (rearAxleToHitchDistance != null) {
        true => rearAxlePosition.rhumb.destinationPoint(
            distance: rearAxleToHitchDistance!,
            bearing: rearAxleAngle,
          ),
        false => null,
      };

  @override
  Geographic? get hitchRearTowbarPoint =>
      switch (rearAxleToTowbarDistance != null) {
        true => rearAxlePosition.rhumb.destinationPoint(
            distance: rearAxleToTowbarDistance!,
            bearing: rearAxleAngle,
          ),
        false => null,
      };

  /// The position of the Stanley axle in the the vehicle direction. Used when
  /// calculating the Stanley pursuit values.
  @override
  Geographic get stanleyAxlePosition => switch (isReversing) {
        true => rearAxlePosition,
        false => frontAxlePosition,
      };

  @override
  ({Geographic position, double bearing}) updatedPositionAndBearingTurning(
    double period,
    Geographic turningCircleCenter,
  ) {
    // How many degrees of the turning circle the current angular
    // velocity
    // during the period amounts to. Relative to the current position,
    // is negative when reversing.
    var turningCircleAngle = angularVelocity! * period;
    if (isTurningLeft) {
      turningCircleAngle *= -1;
    }
    // The current angle from the turning radius center to the
    // front axle center.
    final turningCenterToFrontAxleAngle = switch (isTurningLeft) {
      // Turning left
      true => frontAxleAngle + 90,
      // Turning right
      false => frontAxleAngle - 90,
    }
        .wrap360();

    // The angle from the turning circle center to the projected front
    // axle position.
    final projectedFrontAxleAngle = switch (isTurningLeft) {
      // Turning left
      true => turningCenterToFrontAxleAngle - turningCircleAngle,
      // Turning right
      false => turningCenterToFrontAxleAngle + turningCircleAngle,
    };

    // Projected vehicle front axle position from the turning radius
    // center.
    final frontAxlePosition = turningCircleCenter.rhumb.destinationPoint(
      distance: currentTurningRadius!,
      bearing: projectedFrontAxleAngle,
    );

    // The bearing of the front body of the vehicle at the projected
    // position.
    final frontBodyBearing = switch (isTurningLeft) {
      true => projectedFrontAxleAngle - 90 - steeringAngle / 2,
      false => projectedFrontAxleAngle + 90 - steeringAngle / 2,
    };

    // The vehicle antenna position, projected from the front axle
    // position.
    final vehiclePosition = frontAxlePosition.rhumb.destinationPoint(
      distance: pivotToFrontAxle - antennaToPivotDistance,
      bearing: frontBodyBearing - 180 + steeringAngle / 2,
    );

    return (position: vehiclePosition, bearing: frontBodyBearing);
  }

  @override
  ({Geographic position, double bearing}) predictedLookAheadPositionTurning(
    double period,
    double steeringAngle,
  ) {
    final currentTurningRadius =
        (pivotToFrontAxle * cos(degToRadian(steeringAngle.abs())) +
                pivotToRearAxle) /
            sin(degToRadian(steeringAngle.abs()));

    final turningRadiusCenter =
        this.frontAxlePosition.rhumb.destinationPoint(
              distance: currentTurningRadius,
              bearing: switch (isTurningLeft) {
                true => frontAxleAngle - 90,
                false => frontAxleAngle + 90,
              }
                  .wrap360(),
            );

    final angularVelocity = (velocity / (2 * pi * currentTurningRadius)) * 360;

    // How many degrees of the turning circle the current angular
    // velocity
    // during the period amounts to. Relative to the current position,
    // is negative when reversing.
    final turningCircleAngle = angularVelocity * period;

    // The current angle from the turning radius center to the
    // front axle center.
    final turningCenterToFrontAxleAngle = switch (isTurningLeft) {
      // Turning left
      true => frontAxleAngle + 90,
      // Turning right
      false => frontAxleAngle - 90,
    }
        .wrap360();

    // The angle from the turning circle center to the projected front
    // axle position.
    final projectedFrontAxleAngle = switch (isTurningLeft) {
      // Turning left
      true => turningCenterToFrontAxleAngle - turningCircleAngle,
      // Turning right
      false => turningCenterToFrontAxleAngle + turningCircleAngle,
    };
    // Projected vehicle front axle position from the turning radius
    // center.
    final frontAxlePosition = turningRadiusCenter.rhumb.destinationPoint(
      distance: currentTurningRadius,
      bearing: projectedFrontAxleAngle,
    );

    // The bearing of the front body of the vehicle at the projected
    // position.
    final frontBodyBearing = switch (isTurningLeft) {
      true => projectedFrontAxleAngle - 90 - steeringAngle / 2,
      false => projectedFrontAxleAngle + 90 - steeringAngle / 2,
    };

    // The vehicle antenna position, projected from the front axle
    // position.
    final pivotPosition = frontAxlePosition.rhumb.destinationPoint(
      distance: pivotToFrontAxle,
      bearing: frontBodyBearing - 180 + steeringAngle / 2,
    );

    return (position: pivotPosition, bearing: frontBodyBearing);
  }

  @override
  ({Geographic position, double bearing}) predictedStanleyPositionTurning(
    double period,
    double steeringAngle,
  ) {
    final currentTurningRadius =
        (pivotToFrontAxle * cos(degToRadian(steeringAngle.abs())) +
                pivotToRearAxle) /
            sin(degToRadian(steeringAngle.abs()));

    final turningRadiusCenter =
        this.frontAxlePosition.rhumb.destinationPoint(
              distance: currentTurningRadius,
              bearing: switch (isTurningLeft) {
                true => frontAxleAngle - 90,
                false => frontAxleAngle + 90,
              }
                  .wrap360(),
            );

    final angularVelocity = (velocity / (2 * pi * currentTurningRadius)) * 360;

    // How many degrees of the turning circle the current angular
    // velocity
    // during the period amounts to. Relative to the current position,
    // is negative when reversing.
    final turningCircleAngle = angularVelocity * period;

    // The current angle from the turning radius center to the
    // front axle center.
    final turningCenterToFrontAxleAngle = switch (isTurningLeft) {
      // Turning left
      true => frontAxleAngle + 90,
      // Turning right
      false => frontAxleAngle - 90,
    }
        .wrap360();

    // The angle from the turning circle center to the projected front
    // axle position.
    final projectedFrontAxleAngle = switch (isTurningLeft) {
      // Turning left
      true => turningCenterToFrontAxleAngle - turningCircleAngle,
      // Turning right
      false => turningCenterToFrontAxleAngle + turningCircleAngle,
    };
    // Projected vehicle front axle position from the turning radius
    // center.
    final frontAxlePosition = turningRadiusCenter.rhumb.destinationPoint(
      distance: currentTurningRadius,
      bearing: projectedFrontAxleAngle,
    );

    // The bearing of the front body of the vehicle at the projected
    // position.
    final frontBodyBearing = switch (isTurningLeft) {
      true => projectedFrontAxleAngle - 90 - steeringAngle / 2,
      false => projectedFrontAxleAngle + 90 - steeringAngle / 2,
    };

    // The vehicle antenna position, projected from the front axle
    // position.
    final pivotPosition = frontAxlePosition.rhumb.destinationPoint(
      distance: pivotToFrontAxle,
      bearing: frontBodyBearing - 180 + steeringAngle / 2,
    );

    if (!isReversing) {
      return (position: frontAxlePosition, bearing: frontBodyBearing);
    }

    // The angle from the pivot point to the rear axle.
    final rearAxleAngle =
        (frontBodyBearing + 180 - steeringAngle / 2).wrap360();

    // The position of the front axle center point.
    final rearAxlePosition = pivotPosition.rhumb.destinationPoint(
      distance: pivotToRearAxle,
      bearing: rearAxleAngle,
    );

    return (position: rearAxlePosition, bearing: frontBodyBearing);
  }

  /// Basic circle markers for showing the vehicle's steering related
  /// points.
  @override
  List<map.CircleMarker> get steeringDebugMarkers => [
        map.CircleMarker(
          point: position.latLng,
          radius: 10,
        ),
        map.CircleMarker(
          point: rearAxlePosition.latLng,
          radius: 10,
          color: Colors.red,
        ),
        map.CircleMarker(
          point: frontAxlePosition.latLng,
          radius: 10,
          color: Colors.blue,
        ),
        map.CircleMarker(
          point: pivotPosition.latLng,
          radius: 10,
          color: Colors.black,
        ),
      ];

  /// Basic polylines for showing the vehicle's steering related
  /// points.
  @override
  List<map.Polyline> get steeringDebugLines => [
        map.Polyline(
          points: [
            rearAxlePosition.latLng,
            turningRadiusCenter!.latLng,
          ],
          color: Colors.red,
        ),
        map.Polyline(
          points: [
            frontAxlePosition.latLng,
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
        map.Polyline(
          points: [
            pivotPosition.latLng,
            turningRadiusCenter!.latLng,
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
  Geographic? get turningRadiusCenter => currentTurningRadius != null
      ? frontAxlePosition.rhumb.destinationPoint(
          distance: currentTurningRadius!,
          bearing: switch (isTurningLeft) {
            true => frontAxleAngle - 90,
            false => frontAxleAngle + 90,
          }
              .wrap360(),
        )
      : null;

  @override
  Geographic get topLeftPosition => frontAxlePosition.rhumb
      .destinationPoint(distance: frontAxleToFrontDistance, bearing: bearing)
      .rhumb
      .destinationPoint(distance: width / 2, bearing: bearing - 90);

  /// The furthest behind and left most position of the vehicle's rear body
  /// bounding box.
  ///
  /// Useful for drawing the vehicle on the map.
  Geographic get rearBottomLeftPosition => rearAxlePosition.rhumb
      .destinationPoint(distance: rearAxleToEndDistance, bearing: bearing + 180)
      .rhumb
      .destinationPoint(distance: width / 2, bearing: bearing - 90);

  /// The left front wheel polygon.
  map.Polygon get leftFrontWheelPolygon => map.Polygon(
        points: wheelPoints().map((e) => e.latLng).toList(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right front wheel polygon.
  map.Polygon get rightFrontWheelPolygon => map.Polygon(
        points: wheelPoints(left: false).map((e) => e.latLng).toList(),
        isFilled: true,
        color: Colors.black,
      );

  /// The bounds of any of the specified wheels of the tractor.
  ///
  /// [left] is used to choose left (default, true) or right side (false).
  /// [rear] is used to choose front (default, false) or rear (true).
  List<Geographic> wheelPoints({bool left = true, bool rear = false}) {
    final sign = left ? 1 : -1;

    final axleToCenterAngle = switch (rear) {
      true => (rearAxleAngle + 90 * sign).wrap360(),
      false => (frontAxleAngle - 90 * sign).wrap360()
    };

    final innerCenterToInnerRearAngle =
        (axleToCenterAngle - 90 * sign).wrap360();

    final rearInnerToRearOuterAngle =
        (innerCenterToInnerRearAngle + 90 * sign).wrap360();

    final rearOuterToFrontOuterAngle =
        (rearInnerToRearOuterAngle + 90 * sign).wrap360();

    final frontOuterToFrontInnerAngle =
        (rearOuterToFrontOuterAngle + 90 * sign).wrap360();

    final wheelInnerCenter = switch (rear) {
      true => rearAxlePosition,
      false => frontAxlePosition,
    }
        .rhumb
        .destinationPoint(
          distance: trackWidth / 2 -
              (wheelWidth * numWheels + (numWheels - 1) * wheelSpacing) / 2,
          bearing: axleToCenterAngle,
        );

    final wheelInnerRear = wheelInnerCenter.rhumb.destinationPoint(
      distance: wheelDiameter / 2,
      bearing: innerCenterToInnerRearAngle,
    );
    final wheelOuterRear = wheelInnerRear.rhumb.destinationPoint(
      distance: wheelWidth * numWheels + (numWheels - 1) * wheelSpacing,
      bearing: rearInnerToRearOuterAngle,
    );
    final wheelOuterFront = wheelOuterRear.rhumb.destinationPoint(
      distance: wheelDiameter,
      bearing: rearOuterToFrontOuterAngle,
    );
    final wheelInnerFront = wheelOuterFront.rhumb.destinationPoint(
      distance: wheelWidth * numWheels + (numWheels - 1) * wheelSpacing,
      bearing: frontOuterToFrontInnerAngle,
    );

    return [
      wheelInnerRear,
      wheelOuterRear,
      wheelOuterFront,
      wheelInnerFront,
    ];
  }

  /// The left rear wheel polygon.
  map.Polygon get leftRearWheelPolygon => map.Polygon(
        points: wheelPoints(rear: true).map((e) => e.latLng).toList(),
        isFilled: true,
        color: Colors.black,
      );

  /// The right rear wheel polygon.
  map.Polygon get rightRearWheelPolygon => map.Polygon(
        points:
            wheelPoints(left: false, rear: true).map((e) => e.latLng).toList(),
        isFilled: true,
        color: Colors.black,
      );

  /// Polygons for drawing the wheels of the vehicle.
  @override
  List<map.Polygon> get wheelPolygons => [
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
  Path get trajectory {
    final points = <Geographic>[frontAxlePosition];

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
            turningRadiusCenter!.rhumb.destinationPoint(
              distance: currentTurningRadius!,
              bearing: angle.wrap360(),
            ),
          );
        }
      }
    } else {
      points.add(
        position.rhumb.destinationPoint(
          distance: isReversing ? -30 : 5 + 30,
          bearing: bearing.wrap360(),
        ),
      );
    }

    return Path()..addAll(points.map((e) => e.latLng).toList());
  }

  /// Polygons for visualizing the extent of the vehicle.
  @override
  List<map.Polygon> get polygons {
    final rearLeftCornerAngle = (rearAxleAngle + 90).wrap360();
    final rearLeftCenter = rearAxlePosition.rhumb.destinationPoint(
      distance: 1,
      bearing: rearLeftCornerAngle,
    );
    final rearLeftSide = [
      rearLeftCenter.rhumb.destinationPoint(
        distance: 1,
        bearing: (rearLeftCornerAngle - 90).wrap360(),
      ),
      rearLeftCenter.rhumb.destinationPoint(
        distance: 1,
        bearing: (rearLeftCornerAngle + 90).wrap360(),
      ),
    ];

    final rearRightCornerAngle = (rearAxleAngle - 90).wrap360();
    final rearRightCenter = rearAxlePosition.rhumb.destinationPoint(
      distance: 1,
      bearing: rearRightCornerAngle,
    );
    final rearRightSide = [
      rearRightCenter.rhumb.destinationPoint(
        distance: 1,
        bearing: (rearRightCornerAngle - 90).wrap360(),
      ),
      rearRightCenter.rhumb.destinationPoint(
        distance: 1,
        bearing: (rearRightCornerAngle + 90).wrap360(),
      ),
    ];

    final frontLeftCornerAngle = (frontAxleAngle - 90).wrap360();
    final frontLeftCenter = frontAxlePosition.rhumb.destinationPoint(
      distance: 1,
      bearing: frontLeftCornerAngle,
    );
    final frontLeftSide = [
      frontLeftCenter.rhumb.destinationPoint(
        distance: 1,
        bearing: (frontLeftCornerAngle - 90).wrap360(),
      ),
      frontLeftCenter.rhumb.destinationPoint(
        distance: 1,
        bearing: (frontLeftCornerAngle + 90).wrap360(),
      ),
    ];

    final frontRightCornerAngle = (frontAxleAngle + 90).wrap360();
    final frontRightCenter = frontAxlePosition.rhumb.destinationPoint(
      distance: 1,
      bearing: frontRightCornerAngle,
    );
    final frontRightSide = [
      frontRightCenter.rhumb.destinationPoint(
        distance: 1,
        bearing: (frontRightCornerAngle - 90).wrap360(),
      ),
      frontRightCenter.rhumb.destinationPoint(
        distance: 1,
        bearing: (frontRightCornerAngle + 90).wrap360(),
      ),
    ];

    return [
      map.Polygon(
        points: [
          pivotPosition.latLng,
          ...frontLeftSide.map((e) => e.latLng),
          ...frontRightSide.map((e) => e.latLng),
        ],
        isFilled: true,
        color: Colors.yellow.withOpacity(0.5),
      ),
      map.Polygon(
        points: [
          pivotPosition.latLng,
          ...rearRightSide.map((e) => e.latLng),
          ...rearLeftSide.map((e) => e.latLng),
        ],
        isFilled: true,
        color: Colors.yellow.withOpacity(0.5),
      ),
    ];
  }

  /// Returns a new [ArticulatedTractor] based on the this one, but with
  /// parameters/variables altered.
  @override
  ArticulatedTractor copyWith({
    double? antennaToPivotDistance,
    double? pivotToFrontAxle,
    double? pivotToRearAxle,
    double? frontAxleToHitchDistance,
    double? rearAxleToHitchDistance,
    double? rearAxleToTowbarDistance,
    Geographic? antennaPosition,
    double? antennaHeight,
    double? antennaLateralOffset,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    double? wheelDiameter,
    double? wheelWidth,
    double? wheelSpacing,
    int? numWheels,
    Imu? imu,
    Was? was,
    MotorConfig? motorConfig,
    PathTrackingMode? pathTrackingMode,
    PidParameters? pidParameters,
    StanleyParameters? stanleyParameters,
    PurePursuitParameters? purePursuitParameters,
    double? velocity,
    double? bearing,
    double? pitch,
    double? roll,
    double? steeringAngleInput,
    double? length,
    double? width,
    double? wheelsRolledDistance,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    String? name,
    String? uuid,
    ManufacturerColors? manufacturerColors,

  }) =>
      ArticulatedTractor(
        antennaPosition: antennaPosition ?? this.antennaPosition,
        antennaHeight: antennaHeight ?? this.antennaHeight,
        antennaLateralOffset: antennaLateralOffset ?? this.antennaLateralOffset,
        minTurningRadius: minTurningRadius ?? this.minTurningRadius,
        steeringAngleMax: steeringAngleMax ?? this.steeringAngleMax,
        trackWidth: trackWidth ?? this.trackWidth,
        wheelDiameter: wheelDiameter ?? this.wheelDiameter,
        wheelWidth: wheelWidth ?? this.wheelWidth,
        wheelSpacing: wheelSpacing ?? this.wheelSpacing,
        numWheels: numWheels ?? this.numWheels,
        antennaToPivotDistance:
            antennaToPivotDistance ?? this.antennaToPivotDistance,
        pivotToFrontAxle: pivotToFrontAxle ?? this.pivotToFrontAxle,
        pivotToRearAxle: pivotToRearAxle ?? this.pivotToRearAxle,
        frontAxleToHitchDistance:
            frontAxleToHitchDistance ?? this.frontAxleToHitchDistance,
        rearAxleToHitchDistance:
            rearAxleToHitchDistance ?? this.rearAxleToHitchDistance,
        rearAxleToTowbarDistance:
            rearAxleToTowbarDistance ?? this.rearAxleToTowbarDistance,
        imu: imu ?? this.imu,
        was: was ?? this.was,
        motorConfig: motorConfig ?? this.motorConfig,
        pathTrackingMode: pathTrackingMode ?? this.pathTrackingMode,
        pidParameters: pidParameters ?? this.pidParameters,
        purePursuitParameters:
            purePursuitParameters ?? this.purePursuitParameters,
        stanleyParameters: stanleyParameters ?? this.stanleyParameters,
        velocity: velocity ?? this.velocity,
        bearing: bearing ?? _bearing,
        pitch: pitch ?? _pitch,
        roll: roll ?? _roll,
        steeringAngleInput: steeringAngleInput ?? this.steeringAngleInput,
        length: length ?? this.length,
        width: width ?? this.width,
        wheelsRolledDistance: wheelsRolledDistance ?? this.wheelsRolledDistance,
        hitchFrontFixedChild: hitchFrontFixedChild ?? this.hitchFrontFixedChild,
        hitchRearFixedChild: hitchRearFixedChild ?? this.hitchRearFixedChild,
        hitchRearTowbarChild: hitchRearTowbarChild ?? this.hitchRearTowbarChild,
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
        manufacturerColors: manufacturerColors ?? this.manufacturerColors,
      )..wheelsRolledDistance = wheelsRolledDistance ?? 0;

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    map['antenna'] = Map<String, dynamic>.from(map['antenna'] as Map)
      ..update(
        'pivot_distance',
        (value) => antennaToPivotDistance,
        ifAbsent: () => antennaToPivotDistance,
      );

    map['info'] = Map<String, dynamic>.from(map['info'] as Map)
      ..addAll({'vehicle_type': 'Articulated tractor'});

    map['dimensions'] = Map<String, dynamic>.from(map['dimensions'] as Map)
      ..addAll({
        'pivot_to_front_axle': pivotToFrontAxle,
        'pivot_to_rear_axle': pivotToRearAxle,
        'wheels': {
          'num_wheels': numWheels,
          'wheel_diameter': wheelDiameter,
          'wheel_width': wheelWidth,
          'wheel_spacing': wheelSpacing,
        },
      });
    map['hitches'] = {
      'front_axle_to_front_hitch_distance': frontAxleToHitchDistance,
      'rear_axle_to_hitch_distance': rearAxleToHitchDistance,
      'rear_axle_to_towbar_distance': rearAxleToTowbarDistance,
    };

    return map;
  }
}
