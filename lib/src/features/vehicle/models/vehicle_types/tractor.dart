import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';

/// A conventional tractor with front wheel steering and a solid rear axle.
class Tractor extends AxleSteeredVehicle {
  const Tractor({
    required super.wheelBase,
    required super.solidAxleDistance,
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

  /// The position of the center of the rear axle.
  @override
  LatLng get solidAxlePosition => Vehicle.distance.offset(
        position,
        solidAxleDistance,
        normalizeBearing(heading - 180),
      );

  /// The position of the center of the front axle.
  @override
  LatLng get steeringAxlePosition => Vehicle.distance.offset(
        position,
        wheelBase - solidAxleDistance,
        normalizeBearing(heading),
      );

  /// The angle of the left steering wheel when using Ackermann steering.
  @override
  double get leftSteeringWheelAngle => ackermannSteering.leftAngle;

  /// The angle of the right steering wheel when using Ackermann steering.
  @override
  double get rightSteeringWheelAngle => ackermannSteering.rightAngle;

  /// Returns a new [Tractor] based on the this one, but with
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
    bool? invertSteeringInput,
    double? velocity,
    double? heading,
    double? steeringAngleInput,
    double? length,
    double? width,
    double? acceleration,
    bool? simulated,
  }) =>
      Tractor(
        position: position ?? this.position,
        antennaHeight: antennaHeight ?? this.antennaHeight,
        minTurningRadius: minTurningRadius ?? this.minTurningRadius,
        steeringAngleMax: steeringAngleMax ?? this.steeringAngleMax,
        trackWidth: trackWidth ?? this.trackWidth,
        wheelBase: wheelBase ?? this.wheelBase,
        solidAxleDistance: solidAxleDistance ?? this.solidAxleDistance,
        invertSteeringInput: invertSteeringInput ?? this.invertSteeringInput,
        velocity: velocity ?? this.velocity,
        heading: heading ?? this.heading,
        steeringAngleInput: steeringAngleInput ?? this.steeringAngleInput,
        length: length ?? this.length,
        width: width ?? this.width,
        acceleration: acceleration ?? this.acceleration,
        simulated: simulated ?? this.simulated,
      );
}
