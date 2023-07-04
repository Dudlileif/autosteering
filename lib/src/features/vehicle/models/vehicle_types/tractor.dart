import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';

/// A conventional tractor with front wheel steering and a solid rear axle.
class Tractor extends AxleSteeredVehicle {
  Tractor({
    required super.wheelBase,
    required super.solidAxleDistance,
    required super.position,
    required super.antennaHeight,
    required super.minTurningRadius,
    required super.steeringAngleMax,
    required super.trackWidth,
    super.solidAxleToFrontHitchDistance = 3.25,
    super.solidAxleToRearHitchDistance = 0.9,
    super.solidAxleToRearTowbarDistance = 0.65,
    super.ackermannSteeringRatio,
    super.steeringAxleWheelDiameter,
    super.solidAxleWheelDiameter,
    super.steeringAxleWheelWidth,
    super.solidAxleWheelWidth,
    super.invertSteeringInput = false,
    super.pidParameters = const PidParameters(p: 30, i: 0, d: 2),
    super.velocity = 0,
    super.heading = 0,
    super.steeringAngleInput = 0,
    super.length = 4,
    super.width = 2.5,
    super.simulated = false,
    super.hitchFrontFixedChild,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    super.name,
  });

  /// The position of the center of the rear axle.
  @override
  LatLng get solidAxlePosition => position.offset(
        solidAxleDistance,
        normalizeBearing(heading - 180),
      );

  /// The position of the center of the front axle.
  @override
  LatLng get steeringAxlePosition => position.offset(
        wheelBase - solidAxleDistance,
        normalizeBearing(heading),
      );

  /// The position of the pursuit axle in the the vehicle direction. Used when
  /// calculating the pure pursuit values.
  ///
  /// The mirror position of the steering axle from the solid axle is used
  /// when the tractor is reversing.
  @override
  LatLng get pursuitAxlePosition => switch (isReversing) {
        true => solidAxlePosition.offset(wheelBase, heading + 180),
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
    LatLng? position,
    double? antennaHeight,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    double? wheelBase,
    double? solidAxleDistance,
    double? solidAxleToFrontHitchDistance,
    double? solidAxleToRearHitchDistance,
    double? solidAxleToRearTowbarHitchDistance,
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
    String? name,
  }) =>
      Tractor(
        position: position ?? this.position,
        antennaHeight: antennaHeight ?? this.antennaHeight,
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
        heading: heading ?? this.heading,
        steeringAngleInput: steeringAngleInput ?? this.steeringAngleInput,
        length: length ?? this.length,
        width: width ?? this.width,
        simulated: simulated ?? this.simulated,
        hitchFrontFixedChild: hitchFrontFixedChild ?? this.hitchFrontFixedChild,
        hitchRearFixedChild: hitchRearFixedChild ?? this.hitchRearFixedChild,
        hitchRearTowbarChild: hitchRearTowbarChild ?? this.hitchRearTowbarChild,
        name: name ?? this.name,
      );
}
