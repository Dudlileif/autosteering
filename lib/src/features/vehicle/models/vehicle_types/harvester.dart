part of '../vehicle.dart';

/// A harvester with rear wheel steering and a solid front axle.
final class Harvester extends AxleSteeredVehicle {
  /// A harvester with rear wheel steering and a solid front axle.
  Harvester({
    required super.wheelBase,
    required super.solidAxleDistance,
    required super.antennaHeight,
    required super.minTurningRadius,
    required super.steeringAngleMax,
    required super.trackWidth,
    super.position,
    super.antennaLateralOffset,
    super.solidAxleToFrontHitchDistance = 2,
    super.solidAxleToRearHitchDistance,
    super.solidAxleToRearTowbarDistance = 6,
    super.ackermannSteeringRatio,
    super.ackermannPercentage,
    super.steeringAxleWheelDiameter,
    super.solidAxleWheelDiameter,
    super.steeringAxleWheelWidth,
    super.solidAxleWheelWidth,
    super.invertSteeringInput,
    super.imu,
    super.was,
    super.pathTrackingMode,
    super.pidParameters = const PidParameters(p: 20, i: 0, d: 2),
    super.purePursuitParameters,
    super.stanleyParameters,
    super.velocity,
    super.bearing,
    super.pitch,
    super.roll,
    super.steeringAngleInput,
    super.length = 4,
    super.width = 2.5,
    super.hitchFrontFixedChild,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    super.name,
    super.uuid,
    super.lastUsed,
  });

  /// Creates a [Harvester] from the [json] object.
  factory Harvester.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);

    final antenna = Map<String, dynamic>.from(json['antenna'] as Map);

    final dimensions = Map<String, dynamic>.from(json['dimensions'] as Map);

    final wheels = Map<String, dynamic>.from(dimensions['wheels'] as Map);

    final steering = Map<String, dynamic>.from(json['steering'] as Map);

    final hitches = Map<String, dynamic>.from(json['hitches'] as Map);

    return Harvester(
      name: info['name'] as String?,
      uuid: info['uuid'] as String?,
      lastUsed: DateTime.tryParse(info['last_used'] as String),
      antennaHeight: antenna['height'] as double,
      antennaLateralOffset: antenna['lateral_offset'] as double,
      width: dimensions['width'] as double,
      length: dimensions['length'] as double,
      wheelBase: dimensions['wheel_base'] as double,
      trackWidth: dimensions['track_width'] as double,
      solidAxleDistance: dimensions['solid_axle_distance'] as double,
      minTurningRadius: steering['min_turning_radius'] as double,
      steeringAngleMax: steering['steering_angle_max'] as double,
      invertSteeringInput: steering['invert_steering_input'] as bool,
      ackermannSteeringRatio: steering['ackermann_steering_ratio'] as double,
      ackermannPercentage: steering['ackermann_percentage'] as double? ?? 100,
      steeringAxleWheelDiameter:
          wheels['steering_axle_wheel_diameter'] as double,
      solidAxleWheelDiameter: wheels['solid_axle_wheel_diameter'] as double,
      steeringAxleWheelWidth: wheels['steering_axle_wheel_width'] as double,
      solidAxleWheelWidth: wheels['solid_axle_wheel_width'] as double,
      pathTrackingMode: PathTrackingMode.values.firstWhere(
        (element) => element.name == steering['path_tracking_mode'] as String,
      ),
      solidAxleToFrontHitchDistance:
          hitches['solid_axle_to_front_hitch_distance'] as double?,
      solidAxleToRearHitchDistance:
          hitches['solid_axle_to_rear_hitch_distance'] as double?,
      solidAxleToRearTowbarDistance:
          hitches['solid_axle_to_rear_towbar_distance'] as double?,
    );
  }

  /// The position of the center of the rear axle.
  @override
  Geographic get solidAxlePosition => position.spherical.destinationPoint(
        distance: solidAxleDistance,
        bearing: bearing.wrap360(),
      );

  /// The position of the center of the front axle.
  @override
  Geographic get steeringAxlePosition => position.spherical.destinationPoint(
        distance: solidAxleDistance - wheelBase,
        bearing: bearing.wrap360(),
      );

  /// The position of the Stanley axle in the the vehicle direction. Used when
  /// calculating the Stanley pursuit values.
  ///
  /// The mirror position of the steering axle position from the is used
  /// when the harvester is driving forward.
  @override
  Geographic get stanleyAxlePosition => switch (isReversing) {
        true => steeringAxlePosition,
        false => solidAxlePosition.spherical
            .destinationPoint(distance: wheelBase, bearing: bearing),
      };

  /// The angle of the left steering wheel when using Ackermann steering.
  /// The angle is inverted because the vehicle is rear wheel steered.
  @override
  double get leftSteeringWheelAngle => -ackermannSteering.leftAngle;

  /// The angle of the right steering wheel when using Ackermann steering.
  /// The angle is inverted because the vehicle is rear wheel steered.
  @override
  double get rightSteeringWheelAngle => -ackermannSteering.rightAngle;

  /// Returns a new [Harvester] based on this one, but with
  /// parameters/variables altered.
  @override
  Harvester copyWith({
    Geographic? position,
    double? antennaHeight,
    double? antennaLateralOffset,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    double? wheelBase,
    double? solidAxleDistance,
    double? solidAxleToFrontHitchDistance,
    double? solidAxleToRearTowbarDistance,
    double? solidAxleToRearHitchDistance,
    double? ackermannSteeringRatio,
    double? ackermannPercentage,
    double? steeringAxleWheelDiameter,
    double? solidAxleWheelDiameter,
    double? steeringAxleWheelWidth,
    double? solidAxleWheelWidth,
    bool? invertSteeringInput,
    Imu? imu,
    Was? was,
    PathTrackingMode? pathTrackingMode,
    PidParameters? pidParameters,
    PurePursuitParameters? purePursuitParameters,
    StanleyParameters? stanleyParameters,
    double? velocity,
    double? bearing,
    double? pitch,
    double? roll,
    double? steeringAngleInput,
    double? length,
    double? width,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    String? name,
    String? uuid,
  }) =>
      Harvester(
        position: position ?? this.position,
        antennaHeight: antennaHeight ?? this.antennaHeight,
        antennaLateralOffset: antennaLateralOffset ?? this.antennaLateralOffset,
        minTurningRadius: minTurningRadius ?? this.minTurningRadius,
        steeringAngleMax: steeringAngleMax ?? _steeringAngleMaxRaw,
        trackWidth: trackWidth ?? this.trackWidth,
        wheelBase: wheelBase ?? this.wheelBase,
        solidAxleDistance: solidAxleDistance ?? this.solidAxleDistance,
        solidAxleToFrontHitchDistance:
            solidAxleToFrontHitchDistance ?? this.solidAxleToFrontHitchDistance,
        solidAxleToRearHitchDistance:
            solidAxleToRearHitchDistance ?? this.solidAxleToRearHitchDistance,
        solidAxleToRearTowbarDistance:
            solidAxleToRearTowbarDistance ?? this.solidAxleToRearTowbarDistance,
        ackermannSteeringRatio:
            ackermannSteeringRatio ?? this.ackermannSteeringRatio,
        ackermannPercentage: ackermannPercentage ?? this.ackermannPercentage,
        steeringAxleWheelDiameter:
            steeringAxleWheelDiameter ?? this.steeringAxleWheelDiameter,
        solidAxleWheelDiameter:
            solidAxleWheelDiameter ?? this.solidAxleWheelDiameter,
        steeringAxleWheelWidth:
            steeringAxleWheelWidth ?? this.steeringAxleWheelWidth,
        solidAxleWheelWidth: solidAxleWheelWidth ?? this.solidAxleWheelWidth,
        invertSteeringInput: invertSteeringInput ?? this.invertSteeringInput,
        imu: imu ?? this.imu,
        was: was ?? this.was,
        pathTrackingMode: pathTrackingMode ?? this.pathTrackingMode,
        pidParameters: pidParameters ?? this.pidParameters,
        purePursuitParameters:
            purePursuitParameters ?? this.purePursuitParameters,
        stanleyParameters: stanleyParameters ?? this.stanleyParameters,
        velocity: velocity ?? this.velocity,
        bearing:
            bearing ?? _bearing,
        pitch: pitch ?? _pitch,
        roll: roll ?? _roll,
        steeringAngleInput: steeringAngleInput ?? this.steeringAngleInput,
        length: length ?? this.length,
        width: width ?? this.width,
        hitchFrontFixedChild: hitchFrontFixedChild ?? this.hitchFrontFixedChild,
        hitchRearFixedChild: hitchRearFixedChild ?? this.hitchRearFixedChild,
        hitchRearTowbarChild: hitchRearTowbarChild ?? this.hitchRearTowbarChild,
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
      );

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    map['info'] = Map<String, dynamic>.from(map['info'] as Map)
      ..addAll({'vehicle_type': 'Harvester'});

    return map;
  }
}
