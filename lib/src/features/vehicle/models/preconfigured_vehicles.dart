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

import 'package:autosteering/src/features/vehicle/vehicle.dart';

/// A class with preconfigured vehicles to get some useful starting points
/// when configuring vehicles.
class PreconfiguredVehicles {
  /// MF 5713S -ish
  static Tractor get tractor => Tractor(
        antennaHeight: 2.822,
        length: 3.8,
        width: 2.360,
        wheelBase: 2.550,
        antennaToSolidAxleDistance: 1.2,
        trackWidth: 1.8,
        minTurningRadius: 4.25,
        steeringAngleMax: 31,
      );

  /// NH T9.700 -ish
  static ArticulatedTractor get articulatedTractor => ArticulatedTractor(
        antennaHeight: 3.8,
        length: 7.5,
        width: 3,
        antennaToPivotDistance: 1,
        pivotToFrontAxle: 1.6,
        pivotToRearAxle: 1.8,
        trackWidth: 2.75,
        wheelDiameter: 2.1,
        wheelWidth: 0.710,
        minTurningRadius: 5.7,
        steeringAngleMax: 38,
      );

  /// MF Activa 7345-ish
  static Harvester get harvester => Harvester(
        antennaHeight: 3.5,
        length: 9,
        width: 3.3,
        wheelBase: 3.7,
        antennaToSolidAxleDistance: -1.275,
        trackWidth: 2.2,
        solidAxleWheelWidth: 0.65,
        steeringAxleWheelWidth: 0.46,
        steeringAxleWheelDiameter: 1.25,
        minTurningRadius: 4.25,
        steeringAngleMax: 35,
      );
}
