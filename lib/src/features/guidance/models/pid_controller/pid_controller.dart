import 'package:equatable/equatable.dart';

part 'pid_parameters.dart';

/// A controller for regulating how the output value should behave to acheive
/// a stable state with little to no error.
///
/// This is achieved by using a feedback loop where we combine a value
/// proportional to the current error, an integral for the past errors and a
/// derivative for the difference between the previous and the current value.
class PidController {
  double prevError = 0;
  double integral = 0;
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

    var output = 0.0;

    // P, proportional gain applied to the error.
    output = -gains.p * error;

    // I, add the new error value to the integral/average.
    integral =
        ((integral * integralSize) + timeDelta * error) / (integralSize + 1);

    output -= gains.i * integral;

    // D, the change since the last loop.
    final derivative = (error - prevError) / timeDelta;

    output -= gains.d * derivative;

    prevError = error;

    return output;
  }
}