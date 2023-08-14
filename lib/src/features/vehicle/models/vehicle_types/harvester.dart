part of '../vehicle.dart';

/// A harvester with rear wheel steering and a solid front axle.
final class Harvester extends AxleSteeredVehicle {
  /// A harvester with rear wheel steering and a solid front axle.
  Harvester({
    required super.wheelBase,
    required super.solidAxleDistance,
    required super.position,
    required super.antennaHeight,
    required super.minTurningRadius,
    required super.steeringAngleMax,
    required super.trackWidth,
    super.solidAxleToFrontHitchDistance = 2,
    super.solidAxleToRearTowbarDistance = 6,
    super.ackermannSteeringRatio,
    super.steeringAxleWheelDiameter,
    super.solidAxleWheelDiameter,
    super.steeringAxleWheelWidth,
    super.solidAxleWheelWidth,
    super.invertSteeringInput,
    super.pidParameters = const PidParameters(p: 20, i: 0, d: 2),
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
  });

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

  /// The position of the pursuit axle in the the vehicle direction. Used when
  /// calculating the pure pursuit values.
  ///
  /// The mirror position of the steering axle from the solid axle is used
  /// when the harvester is driving forward.
  @override
  Geographic get pursuitAxlePosition => switch (isReversing) {
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
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    double? wheelBase,
    double? solidAxleDistance,
    double? solidAxleToFrontHitchDistance,
    double? solidAxleToRearTowbarDistance,
    double? ackermannSteeringRatio,
    double? steeringAxleWheelDiameter,
    double? solidAxleWheelDiameter,
    double? steeringAxleWheelWidth,
    double? solidAxleWheelWidth,
    bool? invertSteeringInput,
    PidParameters? pidParameters,
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
      Harvester(
        position: position ?? this.position,
        antennaHeight: antennaHeight ?? this.antennaHeight,
        minTurningRadius: minTurningRadius ?? this.minTurningRadius,
        steeringAngleMax: steeringAngleMax ?? this.steeringAngleMax,
        trackWidth: trackWidth ?? this.trackWidth,
        wheelBase: wheelBase ?? this.wheelBase,
        solidAxleDistance: solidAxleDistance ?? this.solidAxleDistance,
        solidAxleToFrontHitchDistance:
            solidAxleToFrontHitchDistance ?? this.solidAxleToFrontHitchDistance,
        solidAxleToRearTowbarDistance:
            solidAxleToRearTowbarDistance ?? solidAxleToRearTowbarDistance,
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
}
