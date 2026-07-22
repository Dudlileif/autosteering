// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

part of '../vehicle.dart';

/// An articulated tractor with two bodies with solid axles that are joined
/// at a pivot point.
///
/// Geometry: https://eprints.qut.edu.au/21740/1/corke_00928568.pdf
final class ArticulatedTractor extends Vehicle {
  /// An articulated tractor with two bodies with solid axles that are joined
  /// at a pivot point.
  ArticulatedTractor({
    required ArticulatedVehicleGeometry geometry,
    super.imu,
    super.was,
    super.gnssAntennaConfig,
    super.thresholds,
    super.steeringHardwareConfig,
    super.pathTrackingParameters,
    super.antennaPosition,
    super.velocity,
    super.bearing,
    super.pitch,
    super.roll,
    super.steeringAngleInput,
    super.nudgeDistance,
    super.wheelsRolledDistance,
    super.connectors,
    super.childConnections,
    super.name,
    super.uuid,
    super.id,
    super.lastUsedAt,
    super.createdAt,
    super.lastUpdatedAt,
    super.manufacturerColors,
    super.manualSimulationMode,
  }) : super(type: VehicleType.articulatedTractor, geometry: geometry);

  /// Creates an [ArticulatedTractor] from the [json] object.
  factory ArticulatedTractor.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);

    final dimensions = Map<String, dynamic>.from(json['dimensions'] as Map);

    final wheels = Map<String, dynamic>.from(dimensions['wheels'] as Map);

    final steering = Map<String, dynamic>.from(json['steering'] as Map);

    final hitches = Map<String, dynamic>.from(json['hitches'] as Map);

    return ArticulatedTractor(
      name: info['name'] as String?,
      uuid: info['uuid'] as String?,
      lastUsedAt: DateTime.tryParse(info['last_used'] as String),
      geometry: ArticulatedVehicleGeometry(
        length: dimensions['length'] as double,
        width: dimensions['width'] as double,
        minTurningRadius: steering['min_turning_radius'] as double,
        steeringAngleMax: steering['steering_angle_max'] as double,
        trackWidth: dimensions['track_width'] as double,
        wheelSpacing: wheels['wheel_spacing'] as double? ?? 0.05,
        numWheels: wheels['num_wheels'] as int? ?? 1,
        wheelWidth: wheels['wheel_width'] as double,
        wheelDiameter: wheels['wheel_diameter'] as double,
        pivotToFrontAxle: dimensions['pivot_to_front_axle'] as double,
        pivotToRearAxle: dimensions['pivot_to_rear_axle'] as double,
        frontAxleToFrontDistance: 1.5,
        rearAxleToEndDistance: 1,
        frontAxleToHitchDistance:
            hitches['front_axle_to_front_hitch_distance'] as double?,
        rearAxleToHitchDistance:
            hitches['rear_axle_to_hitch_distance'] as double? ?? 1.9,
        rearAxleToDrawbarDistance:
            hitches['rear_axle_to_drawbar_distance'] as double? ?? 1.6,
      ),
    );
  }

  @override
  ArticulatedVehicleGeometry get geometry =>
      super.geometry as ArticulatedVehicleGeometry;

  @override
  double get steeringAngleMax => geometry.steeringAngleMax;

  /// The distance from the vehicle articulation pivot point to the antenna
  /// [position].
  double get antennaToPivotDistance => -gnssAntennaConfig.longitudinalOffset;

  /// The distance between the front and rear axle.
  @override
  double get wheelBase => geometry.pivotToFrontAxle + geometry.pivotToRearAxle;

  /// The position of the vehicle articulation pivot point.
  Geographic get pivotPosition => position.rhumb.destinationPoint(
    distance: antennaToPivotDistance,
    bearing: (bearing - 180 + steeringAngle / 2).wrap360(),
  );

  /// Where the look ahead distance calculation should start.
  @override
  Geographic get lookAheadStartPosition => pivotPosition.rhumb.destinationPoint(
    distance: nudgeDistance,
    bearing: (bearing - 90).wrap360(),
  );

  /// The angle from the pivot point to the front axle.
  double get frontAxleAngle => (bearing + steeringAngle / 2).wrap360();

  /// The position of the front axle center point.
  Geographic get frontAxlePosition => pivotPosition.rhumb.destinationPoint(
    distance: geometry.pivotToFrontAxle,
    bearing: frontAxleAngle,
  );

  /// The angle from the pivot point to the rear axle.
  double get rearAxleAngle => (bearing + 180 - steeringAngle / 2).wrap360();

  /// The position of the front axle center point.
  Geographic get rearAxlePosition => pivotPosition.rhumb.destinationPoint(
    distance: geometry.pivotToRearAxle,
    bearing: rearAxleAngle,
  );

  /// The position of the Stanley axle in the the vehicle direction. Used when
  /// calculating the Stanley pursuit values.
  @override
  Geographic get stanleyAxlePosition =>
      switch (isReversing) {
        true => rearAxlePosition,
        false => frontAxlePosition,
      }.rhumb.destinationPoint(
        distance: nudgeDistance,
        bearing: (bearing - 90).wrap360(),
      );

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
    }.wrap360();

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
      distance: geometry.pivotToFrontAxle - antennaToPivotDistance,
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
        (geometry.pivotToFrontAxle * cos(degToRadian(steeringAngle.abs())) +
            geometry.pivotToRearAxle) /
        sin(degToRadian(steeringAngle.abs()));

    final turningRadiusCenter = this.frontAxlePosition.rhumb.destinationPoint(
      distance: currentTurningRadius,
      bearing: switch (isTurningLeft) {
        true => frontAxleAngle - 90,
        false => frontAxleAngle + 90,
      }.wrap360(),
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
    }.wrap360();

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
      distance: geometry.pivotToFrontAxle,
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
        (geometry.pivotToFrontAxle * cos(degToRadian(steeringAngle.abs())) +
            geometry.pivotToRearAxle) /
        sin(degToRadian(steeringAngle.abs()));

    final turningRadiusCenter = this.frontAxlePosition.rhumb.destinationPoint(
      distance: currentTurningRadius,
      bearing: switch (isTurningLeft) {
        true => frontAxleAngle - 90,
        false => frontAxleAngle + 90,
      }.wrap360(),
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
    }.wrap360();

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
      distance: geometry.pivotToFrontAxle,
      bearing: frontBodyBearing - 180 + steeringAngle / 2,
    );

    if (!isReversing) {
      return (position: frontAxlePosition, bearing: frontBodyBearing);
    }

    // The angle from the pivot point to the rear axle.
    final rearAxleAngle = (frontBodyBearing + 180 - steeringAngle / 2)
        .wrap360();

    // The position of the front axle center point.
    final rearAxlePosition = pivotPosition.rhumb.destinationPoint(
      distance: geometry.pivotToRearAxle,
      bearing: rearAxleAngle,
    );

    return (position: rearAxlePosition, bearing: frontBodyBearing);
  }

  /// Basic circle markers for showing the vehicle's steering related
  /// points.
  @override
  List<map.CircleMarker> get steeringDebugMarkers => [
    map.CircleMarker(point: position.latLng, radius: 10),
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
      points: [rearAxlePosition.latLng, turningRadiusCenter!.latLng],
      color: Colors.red,
    ),
    map.Polyline(
      points: [frontAxlePosition.latLng, turningRadiusCenter!.latLng],
      color: Colors.blue,
    ),
    map.Polyline(
      points: [position.latLng, turningRadiusCenter!.latLng],
      color: Colors.green,
    ),
    map.Polyline(
      points: [pivotPosition.latLng, turningRadiusCenter!.latLng],
      color: Colors.black,
    ),
  ];

  /// The turning radius of the front axle corresponding to the current
  /// [steeringAngle].
  ///
  /// https://eprints.qut.edu.au/21740/1/corke_00928568.pdf
  @override
  double? get currentTurningRadius =>
      steeringAngle.abs() <= geometry.steeringAngleMax &&
          steeringAngle.abs() > 0
      ? (geometry.pivotToFrontAxle * cos(degToRadian(steeringAngle.abs())) +
                geometry.pivotToRearAxle) /
            sin(degToRadian(steeringAngle.abs()))
      : null;

  /// The turning radius of the rear axle corresponding to the current
  /// [steeringAngle].
  ///
  /// https://eprints.qut.edu.au/21740/1/corke_00928568.pdf
  double? get currentRearTurningRadius =>
      steeringAngle.abs() <= geometry.steeringAngleMax &&
          steeringAngle.abs() > 0
      ? (geometry.pivotToRearAxle * cos(degToRadian(steeringAngle.abs())) +
                geometry.pivotToFrontAxle) /
            sin(degToRadian(steeringAngle.abs()))
      : null;

  // NOTE: Rough approximation with bicyle model for now.
  @override
  double steeringAngleFromAngularVelocity(double angularVelocity) {
    if (angularVelocity == 0 || velocity == 0) {
      return 0;
    }
    final turningRadius = velocity.abs() / (angularVelocity.abs() * pi) * 180;

    final steeringAngle = (atan(turningRadius / wheelBase) - pi / 2)
        .abs()
        .toDegrees();

    return steeringAngle;
  }

  /// The center point of which the [currentTurningRadius] revolves around.
  @override
  Geographic? get turningRadiusCenter => currentTurningRadius != null
      ? frontAxlePosition.rhumb.destinationPoint(
          distance: currentTurningRadius!,
          bearing: switch (isTurningLeft) {
            true => frontAxleAngle - 90,
            false => frontAxleAngle + 90,
          }.wrap360(),
        )
      : null;

  @override
  Geographic get topLeftPosition => frontAxlePosition.rhumb
      .destinationPoint(
        distance: geometry.frontAxleToFrontDistance,
        bearing: bearing,
      )
      .rhumb
      .destinationPoint(distance: geometry.width / 2, bearing: bearing - 90);

  /// The furthest behind and left most position of the vehicle's rear body
  /// bounding box.
  ///
  /// Useful for drawing the vehicle on the map.
  Geographic get rearBottomLeftPosition => rearAxlePosition.rhumb
      .destinationPoint(
        distance: geometry.rearAxleToEndDistance,
        bearing: bearing + 180,
      )
      .rhumb
      .destinationPoint(distance: geometry.width / 2, bearing: bearing - 90);

  /// The left front wheel polygon.
  map.Polygon get leftFrontWheelPolygon => map.Polygon(
    points: wheelPoints().map((e) => e.latLng).toList(),
    color: Colors.black,
  );

  /// The right front wheel polygon.
  map.Polygon get rightFrontWheelPolygon => map.Polygon(
    points: wheelPoints(left: false).map((e) => e.latLng).toList(),
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
      false => (frontAxleAngle - 90 * sign).wrap360(),
    };

    final innerCenterToInnerRearAngle = (axleToCenterAngle - 90 * sign)
        .wrap360();

    final rearInnerToRearOuterAngle = (innerCenterToInnerRearAngle + 90 * sign)
        .wrap360();

    final rearOuterToFrontOuterAngle = (rearInnerToRearOuterAngle + 90 * sign)
        .wrap360();

    final frontOuterToFrontInnerAngle = (rearOuterToFrontOuterAngle + 90 * sign)
        .wrap360();

    final wheelInnerCenter =
        switch (rear) {
          true => rearAxlePosition,
          false => frontAxlePosition,
        }.rhumb.destinationPoint(
          distance:
              geometry.trackWidth / 2 -
              (geometry.wheelWidth * geometry.numWheels +
                      (geometry.numWheels - 1) * geometry.wheelSpacing) /
                  2,
          bearing: axleToCenterAngle,
        );

    final wheelInnerRear = wheelInnerCenter.rhumb.destinationPoint(
      distance: geometry.wheelDiameter / 2,
      bearing: innerCenterToInnerRearAngle,
    );
    final wheelOuterRear = wheelInnerRear.rhumb.destinationPoint(
      distance:
          geometry.wheelWidth * geometry.numWheels +
          (geometry.numWheels - 1) * geometry.wheelSpacing,
      bearing: rearInnerToRearOuterAngle,
    );
    final wheelOuterFront = wheelOuterRear.rhumb.destinationPoint(
      distance: geometry.wheelDiameter,
      bearing: rearOuterToFrontOuterAngle,
    );
    final wheelInnerFront = wheelOuterFront.rhumb.destinationPoint(
      distance:
          geometry.wheelWidth * geometry.numWheels +
          (geometry.numWheels - 1) * geometry.wheelSpacing,
      bearing: frontOuterToFrontInnerAngle,
    );

    return [wheelInnerRear, wheelOuterRear, wheelOuterFront, wheelInnerFront];
  }

  /// The left rear wheel polygon.
  map.Polygon get leftRearWheelPolygon => map.Polygon(
    points: wheelPoints(rear: true).map((e) => e.latLng).toList(),
    color: Colors.black,
  );

  /// The right rear wheel polygon.
  map.Polygon get rightRearWheelPolygon => map.Polygon(
    points: wheelPoints(left: false, rear: true).map((e) => e.latLng).toList(),
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
  LineString trajectory({double? seconds, double? minLength}) {
    final time = seconds ?? 10;
    final points = <Geographic>[frontAxlePosition];

    if (currentTurningRadius != null) {
      var arcDegrees = clampDouble(time * angularVelocity!.abs(), 0, 360);
      if (minLength != null) {
        if (arcDegrees.toRadians() * currentTurningRadius! < minLength) {
          arcDegrees = (minLength / currentTurningRadius!).toDegrees();
        }
      }

      const numberOfPoints = 36;
      for (var i = 0; i < numberOfPoints + 1; i++) {
        {
          // The angle from the turning circle center to the projected
          // position.
          final angle = switch (isTurningLeft) {
            // Turning left
            true => switch (isReversing) {
              // Reversing
              true => frontAxleAngle + 90 + i / numberOfPoints * arcDegrees,
              // Forward
              false => frontAxleAngle + 90 - i / numberOfPoints * arcDegrees,
            },
            // Turning right
            false => switch (isReversing) {
              // Reversing
              true => frontAxleAngle - 90 - i / numberOfPoints * arcDegrees,
              // Forward
              false => frontAxleAngle - 90 + i / numberOfPoints * arcDegrees,
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
      var distance = time * velocity;
      if (minLength != null && distance.abs() < minLength) {
        distance =
            minLength *
            switch (velocity.isNegative) {
              true => -1,
              false => 1,
            };
      }
      points.add(
        position.rhumb.destinationPoint(
          distance: distance,
          bearing: bearing.wrap360(),
        ),
      );
    }

    return LineString.from(points);
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
        color: Colors.yellow.withValues(alpha: 0.5),
      ),
      map.Polygon(
        points: [
          pivotPosition.latLng,
          ...rearRightSide.map((e) => e.latLng),
          ...rearLeftSide.map((e) => e.latLng),
        ],
        color: Colors.yellow.withValues(alpha: 0.5),
      ),
    ];
  }

  /// Returns a new [ArticulatedTractor] based on the this one, but with
  /// parameters/variables altered.
  @override
  ArticulatedTractor copyWith({
    VehicleGeometry? geometry,
    Geographic? antennaPosition,
    Imu? imu,
    Was? was,
    GnssAntennaConfig? gnssAntennaConfig,
    VehicleThresholds? thresholds,
    SteeringHardwareConfig? steeringHardwareConfig,
    PathTrackingParameters? pathTrackingParameters,
    double? velocity,
    double? bearing,
    double? pitch,
    double? roll,
    double? steeringAngleInput,
    double? nudgeDistance,
    double? wheelsRolledDistance,
    List<Connector>? connectors,
    List<Connection>? childConnections,
    String? name,
    String? uuid,
    DateTime? lastUsedAt,
    ManufacturerColors? manufacturerColors,
    bool? manualSimulationMode,
    int? id,
  }) => ArticulatedTractor(
    id: id ?? this.id,
    geometry: switch (geometry) {
      final ArticulatedVehicleGeometry geometry => geometry,
      _ => this.geometry,
    },
    antennaPosition: antennaPosition ?? this.antennaPosition,
    imu: imu ?? this.imu,
    was: was ?? this.was,
    gnssAntennaConfig: gnssAntennaConfig ?? this.gnssAntennaConfig,
    thresholds: thresholds ?? this.thresholds,
    steeringHardwareConfig:
        steeringHardwareConfig ?? this.steeringHardwareConfig,
    pathTrackingParameters:
        pathTrackingParameters ?? this.pathTrackingParameters,
    velocity: velocity ?? this.velocity,
    bearing: bearing ?? _bearing,
    pitch: pitch ?? _pitch,
    roll: roll ?? _roll,
    steeringAngleInput: steeringAngleInput ?? this.steeringAngleInput,
    nudgeDistance: nudgeDistance ?? this.nudgeDistance,
    wheelsRolledDistance: wheelsRolledDistance ?? this.wheelsRolledDistance,
    connectors: connectors ?? this.connectors,
    childConnections: childConnections ?? this.childConnections,
    name: name ?? this.name,
    uuid: uuid ?? this.uuid,
    lastUsedAt: lastUsedAt ?? this.lastUsedAt,
    manufacturerColors: manufacturerColors ?? this.manufacturerColors,
    manualSimulationMode: manualSimulationMode ?? this.manualSimulationMode,
  )..wheelsRolledDistance = wheelsRolledDistance ?? 0;

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    map['info'] = Map<String, dynamic>.from(map['info'] as Map)
      ..addAll({'vehicle_type': 'Articulated tractor'});

    map['dimensions'] = Map<String, dynamic>.from(map['dimensions'] as Map)
      ..addAll({
        'pivot_to_front_axle': geometry.pivotToFrontAxle,
        'pivot_to_rear_axle': geometry.pivotToRearAxle,
        'wheels': {
          'num_wheels': geometry.numWheels,
          'wheel_diameter': geometry.wheelDiameter,
          'wheel_width': geometry.wheelWidth,
          'wheel_spacing': geometry.wheelSpacing,
        },
      });
    map['hitches'] = {
      'front_axle_to_front_hitch_distance': geometry.frontAxleToHitchDistance,
      'rear_axle_to_hitch_distance': geometry.rearAxleToHitchDistance,
      'rear_axle_to_drawbar_distance': geometry.rearAxleToDrawbarDistance,
    };

    return map;
  }
}
