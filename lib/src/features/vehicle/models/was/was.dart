import 'dart:math';

import 'package:agopengps_flutter/src/features/vehicle/models/was/was_config.dart';
import 'package:agopengps_flutter/src/features/vehicle/models/was/was_reading.dart';

export 'was_config.dart';
export 'was_reading.dart';

/// An object representing the Wheel Angle Sensor of a vehicle.
///
/// It contains a [WasConfig] for configuring the usage of it and the latest
/// [reading] from the hardware sensor.
class Was {
  /// An object representing the Wheel Angle Sensor of a vehicle.
  ///
  /// [config] is a configuration for limits and resolution of the sensor.
  Was({
    WasConfig? config,
  })  : config = config ?? const WasConfig(),
        reading = WasReading(receiveTime: DateTime.now());

  /// The configuration for how to read the output from the sensor.
  WasConfig config;

  /// The current sensor reading from the WAS.
  WasReading reading;

  /// The [reading] corrected for [config].invertInput if we want the mirrored
  /// reading of the sensor.
  int get inversionCorrectedReading => switch (config.invertInput) {
        true => pow(2, config.bits).round() - 1 - reading.value,
        false => reading.value,
      };

  /// Normalizes the discrete [reading] into a range from -1 to 1, where each
  /// part -1 -> 0 and 0 -> 1 are individually normalized depending on
  /// [config].min, [config].center and [config].max.
  double get readingNormalizedInRange {
    if (inversionCorrectedReading < config.center) {
      return (inversionCorrectedReading - config.center) /
          (config.center - config.min);
    }

    return (inversionCorrectedReading - config.center) /
        (config.max - config.center);
  }
}
