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
