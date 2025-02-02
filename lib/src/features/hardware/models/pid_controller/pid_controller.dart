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

import 'package:autosteering/src/features/hardware/models/pid_controller/pid_parameters.dart';

export 'pid_parameters.dart';

/// A controller for regulating how the output value should behave to acheive
/// a stable state with little to no error.
///
/// This is achieved by using a feedback loop where we combine a value
/// proportional to the current error, an integral for the past errors and a
/// derivative for the difference between the previous and the current value.
class PidController {
  /// The previous error/distance from the optimal state.
  double prevError = 0;

  /// The value of the integral/average.
  double integral = 0;

  /// The previous time to get a period/time delta from.
  DateTime prevTime = DateTime.now();

  /// The next output value for the controller.
  ///
  /// [error] is the current error from target state.
  /// [gains] is the [PidParameters] that describes how the controller should
  /// calculate the next step.
  /// [integralSize] is how many steps the integral should take into account.
  double nextValue(
    double error,
    PidParameters gains, {
    double integralSize = 1000,
  }) {
    // Update the time and time delta.
    final now = DateTime.now();
    final timeDelta = now.difference(prevTime).inMicroseconds / 1e6; // Seconds
    prevTime = now;

    // P, proportional gain applied to the error.
    var output = gains.p * error;

    // I, add the new error value to the integral/average.
    integral =
        ((integral * integralSize) + timeDelta * error) / (integralSize + 1);

    output += gains.i * integral;

    // D, the change since the last loop.
    final derivative = (error - prevError) / timeDelta;

    output += gains.d * derivative;

    prevError = error;

    return output;
  }
}
