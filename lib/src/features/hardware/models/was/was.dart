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

import 'package:autosteering/src/features/hardware/models/was/was_config.dart';
import 'package:autosteering/src/features/hardware/models/was/was_reading.dart';

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
}
