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

import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';

/// A class with preconfigured vehicles to get some useful starting points
/// when configuring vehicles.
class PreconfiguredVehicles {
  /// MF 5713S -ish
  static Tractor get tractor => Tractor(
    gnssAntennaConfig: const GnssAntennaConfig(
      longitudinalOffset: 1.2,
      height: 2.822,
    ),
    geometry: const AxleSteeredVehicleGeometry(
      length: 3.8,
      width: 2.360,
      wheelBase: 2.550,
      trackWidth: 1.8,
      minTurningRadius: 4.25,
      steeringAngleMax: 31,
      solidAxleToFrontHitchDistance: 3.5,
      solidAxleToRearHitchDistance: 0.9,
      solidAxleToRearDrawbarDistance: 0.65,
      solidAxleToFrontDistance: 3,
      steeringAxleWheelDiameter: 1.1,
      steeringAxleWheelWidth: 0.48,
      solidAxleWheelDiameter: 1.8,
      solidAxleWheelWidth: 0.6,
    ),
  );

  /// NH T9.700 -ish
  static ArticulatedTractor get articulatedTractor => ArticulatedTractor(
    gnssAntennaConfig: const GnssAntennaConfig(
      longitudinalOffset: 1,
      height: 3.8,
    ),
    geometry: const ArticulatedVehicleGeometry(
      length: 7.5,
      width: 3,
      pivotToFrontAxle: 1.6,
      pivotToRearAxle: 1.8,
      trackWidth: 2.75,
      minTurningRadius: 5.7,
      steeringAngleMax: 38,
      wheelDiameter: 2.1,
      wheelWidth: 0.71,
      rearAxleToHitchDistance: 1.9,
      rearAxleToDrawbarDistance: 1.6,
      frontAxleToFrontDistance: 1.5,
      rearAxleToEndDistance: 1,
    ),
  );

  /// MF Activa 7345 -ish
  static Harvester get harvester => Harvester(
    gnssAntennaConfig: const GnssAntennaConfig(
      height: 3.5,
      longitudinalOffset: 1.275,
    ),
    geometry: const AxleSteeredVehicleGeometry(
      length: 9,
      width: 3.3,
      wheelBase: 3.7,
      trackWidth: 2.2,
      minTurningRadius: 4.25,
      steeringAngleMax: 35,
      solidAxleToFrontHitchDistance: 2,
      solidAxleToRearDrawbarDistance: 6,
      solidAxleWheelDiameter: 1.8,
      solidAxleWheelWidth: 0.65,
      steeringAxleWheelWidth: 0.46,
      steeringAxleWheelDiameter: 1.25,
      solidAxleToFrontDistance: 1,
    ),
  );
}
