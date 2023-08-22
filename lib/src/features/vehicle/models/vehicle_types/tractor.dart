part of '../vehicle.dart';

/// A conventional tractor with front wheel steering and a solid rear axle.
final class Tractor extends AxleSteeredVehicle {
  /// A conventional tractor with front wheel steering and a solid rear axle.
  Tractor({
    required super.wheelBase,
    required super.solidAxleDistance,
    required super.antennaHeight,
    required super.minTurningRadius,
    required super.steeringAngleMax,
    required super.trackWidth,
    super.antennaLateralOffset,
    super.solidAxleToFrontHitchDistance = 3.5,
    super.solidAxleToRearHitchDistance = 0.9,
    super.solidAxleToRearTowbarDistance = 0.65,
    super.ackermannSteeringRatio,
    super.steeringAxleWheelDiameter,
    super.solidAxleWheelDiameter,
    super.steeringAxleWheelWidth,
    super.solidAxleWheelWidth,
    super.invertSteeringInput,
    super.position,
    super.pidParameters = const PidParameters(p: 30, i: 0, d: 2),
    super.stanleyParameters,
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

  /// Creates a [Tractor] from the [json] object.
  factory Tractor.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);

    final antenna = Map<String, dynamic>.from(json['antenna'] as Map);

    final dimensions = Map<String, dynamic>.from(json['dimensions'] as Map);

    final wheels = Map<String, dynamic>.from(dimensions['wheels'] as Map);

    final steering = Map<String, dynamic>.from(json['steering'] as Map);

    final pidParameters = json.containsKey('pid_parameters')
        ? PidParameters.fromJson(
            Map<String, dynamic>.from(json['pid_parameters'] as Map),
          )
        : null;

    final stanleyParameters = json.containsKey('stanley_parameters')
        ? StanleyParameters.fromJson(
            Map<String, dynamic>.from(json['stanley_parameters'] as Map),
          )
        : null;

    final hitches = Map<String, dynamic>.from(json['hitches'] as Map);

    return Tractor(
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
      steeringAxleWheelDiameter:
          wheels['steering_axle_wheel_diameter'] as double,
      solidAxleWheelDiameter: wheels['solid_axle_wheel_diameter'] as double,
      steeringAxleWheelWidth: wheels['steering_axle_wheel_width'] as double,
      solidAxleWheelWidth: wheels['solid_axle_wheel_width'] as double,
      pidParameters: pidParameters,
      stanleyParameters: stanleyParameters,
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
        bearing: (bearing - 180).wrap360(),
      );

  /// The position of the center of the front axle.
  @override
  Geographic get steeringAxlePosition => position.spherical.destinationPoint(
        distance: wheelBase - solidAxleDistance,
        bearing: bearing.wrap360(),
      );

  /// The position of the Stanley axle in the the vehicle direction. Used when
  /// calculating the Stanley pursuit values.
  ///
  /// The mirror position of the steering axle position from the is used
  /// when the tractor is reversing.
  @override
  Geographic get stanleyAxlePosition => switch (isReversing) {
        true => solidAxlePosition.spherical
            .destinationPoint(distance: wheelBase, bearing: bearing + 180),
        false => steeringAxlePosition,
      };

  /// The angle of the left steering wheel when using Ackermann steering.
  @override
  double get leftSteeringWheelAngle => ackermannSteering.leftAngle;

  /// The angle of the right steering wheel when using Ackermann steering.
  @override
  double get rightSteeringWheelAngle => ackermannSteering.rightAngle;

  /// Returns a new [Tractor] based on this one, but with
  /// parameters/variables altered.
  @override
  Tractor copyWith({
    Geographic? position,
    double? antennaHeight,
    double? antennaLateralOffset,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    double? wheelBase,
    double? solidAxleDistance,
    double? solidAxleToFrontHitchDistance,
    double? solidAxleToRearHitchDistance,
    double? solidAxleToRearTowbarDistance,
    double? ackermannSteeringRatio,
    double? steeringAxleWheelDiameter,
    double? solidAxleWheelDiameter,
    double? steeringAxleWheelWidth,
    double? solidAxleWheelWidth,
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
  }) =>
      Tractor(
        position: position ?? this.position,
        antennaHeight: antennaHeight ?? this.antennaHeight,
        antennaLateralOffset: antennaLateralOffset ?? this.antennaLateralOffset,
        minTurningRadius: minTurningRadius ?? this.minTurningRadius,
        steeringAngleMax: steeringAngleMax ?? this.steeringAngleMax,
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
        steeringAxleWheelDiameter:
            steeringAxleWheelDiameter ?? this.steeringAxleWheelDiameter,
        solidAxleWheelDiameter:
            solidAxleWheelDiameter ?? this.solidAxleWheelDiameter,
        steeringAxleWheelWidth:
            steeringAxleWheelWidth ?? this.steeringAxleWheelWidth,
        solidAxleWheelWidth: solidAxleWheelWidth ?? this.solidAxleWheelWidth,
        invertSteeringInput: invertSteeringInput ?? this.invertSteeringInput,
        pidParameters: pidParameters ?? this.pidParameters,
        stanleyParameters: stanleyParameters ?? this.stanleyParameters,
        velocity: velocity ?? this.velocity,
        bearing: bearing ?? this.bearing,
        steeringAngleInput: steeringAngleInput ?? this.steeringAngleInput,
        length: length ?? this.length,
        width: width ?? this.width,
        isSimulated: isSimulated ?? this.isSimulated,
        useIMUPitchAndRoll: useIMUPitchAndRoll ?? this.useIMUPitchAndRoll,
        hitchFrontFixedChild: hitchFrontFixedChild ?? this.hitchFrontFixedChild,
        hitchRearFixedChild: hitchRearFixedChild ?? this.hitchRearFixedChild,
        hitchRearTowbarChild: hitchRearTowbarChild ?? this.hitchRearTowbarChild,
        name: name ?? this.name,
      );

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    map['info'] = Map<String, dynamic>.from(map['info'] as Map)
      ..addAll({'type': 'Tractor'});

    return map;
  }
}
