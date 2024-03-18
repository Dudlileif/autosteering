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

import 'dart:math';

import 'package:geobase/geobase.dart';

/// A class used to simulate Ackermann steering geometry.
/// https://se.mathworks.com/help/vdynblks/ref/kinematicsteering.html
class AckermannSteering {
  /// A class used to simulate Ackermann steering geometry.
  /// https://se.mathworks.com/help/vdynblks/ref/kinematicsteering.html
  ///
  /// [steeringAngle] is the input steering angle in degrees.
  ///
  /// [wheelBase] is the distance between the steering and the non-steering
  /// solid axle.
  ///
  /// [trackWidth] is the distance between the wheels on the same axle.
  ///
  /// [steeringRatio] is a ratio to change how fast the steering turns.
  ///
  /// [ackermannPercentage] is a modifier to adjust the outside wheel angle by
  /// ```outsideAngle = innerAngle -
  ///   ackermannPercentage*(innerAngle-ackermannAngle)```
  const AckermannSteering({
    required this.steeringAngle,
    required this.wheelBase,
    required this.trackWidth,
    this.steeringRatio = 1,
    this.ackermannPercentage = 100,
  });

  /// The input steering angle.
  final double steeringAngle;

  /// The distance between the wheel axles.
  final double wheelBase;

  /// The distance between the wheels on the same axle.
  final double trackWidth;

  /// A modifier to increase/decrease how fast the steering turns.
  final double steeringRatio;

  /// A modifier to adjust the outside wheel angle by
  /// ```outsideAngle = innerAngle -
  ///   ackermannPercentage*(innerAngle-ackermannAngle)```
  final double ackermannPercentage;

  /// Radians, the angle of an envisioned steering wheel at the center of the
  /// steering axle.
  double get ackermannAngle => steeringAngle.toRadians() / steeringRatio;

  /// Degrees
  double get ackermannAngleDegrees => ackermannAngle.toDegrees();

  /// Degrees
  double get idealLeftAngle => atan(
        wheelBase *
            tan(ackermannAngle) /
            (wheelBase + 0.5 * trackWidth * tan(ackermannAngle)),
      ).toDegrees();

  /// Degrees
  double get idealRightAngle => atan(
        wheelBase *
            tan(ackermannAngle) /
            (wheelBase - 0.5 * trackWidth * tan(ackermannAngle)),
      ).toDegrees();

  /// Meters
  double get turningRadius => tan(pi / 2 - ackermannAngle).abs() * wheelBase;

  /// Degrees
  double get innerAngle =>
      ackermannAngle < 0 ? idealLeftAngle : idealRightAngle;

  /// Degrees
  double get outerAngle =>
      innerAngle -
      (ackermannPercentage / 100) * (innerAngle - ackermannAngle.toDegrees());

  /// Degrees
  double get leftAngle => switch (ackermannAngle < 0) {
        true => innerAngle,
        false => outerAngle,
      };

  /// Degrees
  double get rightAngle => switch (ackermannAngle < 0) {
        true => outerAngle,
        false => innerAngle,
      };

  @override
  String toString() => '''
  Ackermann steering:
  Steering angle: $steeringAngle  
  Ackermann angle: ${ackermannAngle.toDegrees()}
  Ackermann ratio: $steeringRatio
  Ackermann percentage: $ackermannPercentage
  Ideal left angle -> left angle: $idealLeftAngle -> $leftAngle
  Ideal right angle -> right angle: $idealRightAngle -> $rightAngle
  Turning radius: $turningRadius''';
}

/// A class used to find the Ackermann angle and the angle of the opposite
/// steering wheel.
class WheelAngleToAckermann {
  /// A class used to find the Ackermann angle and the angle of the opposite
  /// steering wheel.
  ///
  /// [wheelAngle] is the steering angle of the measured wheel. This is assumed
  /// to be the angle of the inner wheel.
  ///
  /// [wheelBase] is the distance between the steering and the non-steering
  /// solid axle.
  ///
  /// [trackWidth] is the distance between the wheels on the same axle.

  /// [steeringRatio] is a ratio to change how fast the steering turns.
  ///
  /// [ackermannPercentage] is a modifier to adjust the outside wheel angle by
  /// ```outsideAngle = innerAngle -
  ///   ackermannPercentage*(innerAngle-ackermannAngle)```
  const WheelAngleToAckermann({
    required this.wheelAngle,
    required this.wheelBase,
    required this.trackWidth,
    this.steeringRatio = 1,
    this.ackermannPercentage = 100,
  });

  /// The angle of the known steering wheel.
  final double wheelAngle;

  /// The distance between the wheel axles.
  final double wheelBase;

  /// The distance between the wheels on the same axle.
  final double trackWidth;

  /// A modifier to increase/decrease how fast the steering turns.
  final double steeringRatio;

  /// A modifier to adjust the outside wheel angle by
  /// ```outsideAngle = innerAngle -
  ///   ackermannPercentage*(innerAngle-ackermannAngle)```
  final double ackermannPercentage;

  /// Radians, the angle of an envisioned steering wheel at the center of the
  /// steering axle.
  double get ackermannAngle => switch (wheelAngle < 0) {
        true => atan(
            (wheelBase * tan(wheelAngle.toRadians())) /
                (wheelBase - 0.5 * trackWidth * tan(wheelAngle.toRadians())),
          ),
        false => atan(
            (wheelBase * tan(wheelAngle.toRadians())) /
                (wheelBase + 0.5 * trackWidth * tan(wheelAngle.toRadians())),
          )
      };

  /// Degrees, angle of the outside wheel.
  double get oppositeAngle =>
      wheelAngle -
      (ackermannPercentage / 100) * (wheelAngle - ackermannAngle.toDegrees());
}
