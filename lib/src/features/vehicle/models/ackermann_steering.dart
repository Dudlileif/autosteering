import 'dart:math';

import 'package:latlong2/latlong.dart';

/// https://se.mathworks.com/help/vdynblks/ref/kinematicsteering.html
class AckermannSteering {
  const AckermannSteering({
    required this.steeringAngle,
    required this.wheelBase,
    required this.trackWidth,
    this.steeringRatio = 1.25,
  });

  /// The input wheel angle
  final double steeringAngle;

  /// The distance between the wheel axles
  final double wheelBase;
  final double trackWidth;
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

class AckermannOppositeAngle {
  const AckermannOppositeAngle({
    required this.wheelAngleMax,
    required this.wheelBase,
    required this.trackWidth,
    this.steeringRatio = 1.25,
  });

  final double wheelAngleMax;
  final double wheelBase;
  final double trackWidth;
  final double steeringRatio;

  /// Radians
  double get ackermannAngle => atan(
        (wheelBase * tan(degToRadian(wheelAngleMax))) /
            (wheelBase + 0.5 * trackWidth * tan(degToRadian(wheelAngleMax))),
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
