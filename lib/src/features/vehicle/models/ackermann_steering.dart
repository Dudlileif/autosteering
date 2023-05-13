import 'dart:math';

import 'package:latlong2/latlong.dart';

/// A class used to simulate Ackermann steering geometry.
/// https://se.mathworks.com/help/vdynblks/ref/kinematicsteering.html
class AckermannSteering {
  const AckermannSteering({
    required this.steeringAngle,
    required this.wheelBase,
    required this.trackWidth,
    this.steeringRatio = 1.25,
  });

  /// The input steering angle.
  final double steeringAngle;

  /// The distance between the wheel axles.
  final double wheelBase;

  /// The distance between the wheels on the same axle.
  final double trackWidth;

  /// A modifier to increase/decrease how fast the steering turns.
  final double steeringRatio;

  /// Radians
  double get ackermannAngle => degToRadian(steeringAngle) / steeringRatio;

  /// Degrees
  double get ackermannAngleDegrees => radianToDeg(ackermannAngle);

  /// Degrees
  double get leftAngle => radianToDeg(
        atan(
          wheelBase *
              tan(ackermannAngle) /
              (wheelBase + 0.5 * trackWidth * tan(ackermannAngle)),
        ),
      );

  /// Degrees
  double get rightAngle => radianToDeg(
        atan(
          wheelBase *
              tan(ackermannAngle) /
              (wheelBase - 0.5 * trackWidth * tan(ackermannAngle)),
        ),
      );

  /// Meters
  double get turningRadius => tan(pi / 2 - ackermannAngle).abs() * wheelBase;

  /// Degrees
  double get innerAngle => ackermannAngle < 0 ? leftAngle : rightAngle;

  /// Degrees
  double get outerAngle => ackermannAngle < 0 ? rightAngle : leftAngle;

  @override
  String toString() => '''
  Ackermann steering:
  Steering angle: $steeringAngle  
  Ackermann angle: ${radianToDeg(ackermannAngle)}
  Left angle: $leftAngle
  Right angle: $rightAngle
  Turning radius: $turningRadius''';
}

/// A class used to find the angle of the opposite steering wheel with
/// Ackermann steering geometry.
class AckermannOppositeAngle {
  const AckermannOppositeAngle({
    required this.wheelAngle,
    required this.wheelBase,
    required this.trackWidth,
    this.steeringRatio = 1.25,
  });

  /// The angle of the known steering wheel.
  final double wheelAngle;

  /// The distance between the wheel axles.
  final double wheelBase;

  /// The distance between the wheels on the same axle.
  final double trackWidth;

  /// A modifier to increase/decrease how fast the steering turns.
  final double steeringRatio;

  /// Radians
  double get ackermannAngle => atan(
        (wheelBase * tan(degToRadian(wheelAngle))) /
            (wheelBase + 0.5 * trackWidth * tan(degToRadian(wheelAngle))),
      );

  /// Degrees
  double get oppositeAngle => radianToDeg(
        atan(
          wheelBase *
              tan(ackermannAngle) /
              (wheelBase + 0.5 * trackWidth * tan(ackermannAngle)),
        ),
      );
}
