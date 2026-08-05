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

part of '../vehicle.dart';

/// A harvester with rear wheel steering and a solid front axle.
final class Harvester extends AxleSteeredVehicle {
  /// A harvester with rear wheel steering and a solid front axle.
  Harvester({
    required super.geometry,
    super.antennaPosition,
    super.imu,
    super.was,
    super.gnssAntennaConfig,
    super.thresholds,
    super.steeringHardwareConfig,
    super.pathTrackingParameters,
    super.velocity,
    super.bearing,
    super.pitch,
    super.roll,
    super.steeringAngleInput,
    super.nudgeDistance,
    super.wheelsRolledDistance,
    super.connectors,
    super.childConnections,
    super.name,
    super.id,
    super.uuid,
    super.createdAt,
    super.lastUpdatedAt,
    super.manufacturerColors,
    super.manualSimulationMode,
  }) : super(type: VehicleType.harvester);

  /// Creates a [Harvester] from the [json] object.
  factory Harvester.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);

    final dimensions = Map<String, dynamic>.from(json['dimensions'] as Map);

    final wheels = Map<String, dynamic>.from(dimensions['wheels'] as Map);

    final steering = Map<String, dynamic>.from(json['steering'] as Map);

    final hitches = Map<String, dynamic>.from(json['hitches'] as Map);

    return Harvester(
      name: info['name'] as String?,
      uuid: info['uuid'] as String?,
      geometry: AxleSteeredVehicleGeometry(
        length: dimensions['length'] as double,
        width: dimensions['width'] as double,
        minTurningRadius: steering['min_turning_radius'] as double,
        steeringAngleMax: steering['steering_angle_max'] as double,
        trackWidth: dimensions['track_width'] as double,
        wheelSpacing: wheels['wheel_spacing'] as double? ?? 0.05,
        numWheels: wheels['num_wheels'] as int? ?? 1,
        wheelBase: dimensions['wheel_base'] as double,
        steeringAxleWheelDiameter:
            wheels['steering_axle_wheel_diameter'] as double,
        solidAxleWheelDiameter: wheels['solid_axle_wheel_diameter'] as double,
        steeringAxleWheelWidth: wheels['steering_axle_wheel_width'] as double,
        solidAxleWheelWidth: wheels['solid_axle_wheel_width'] as double,
        solidAxleToFrontHitchDistance:
            hitches['solid_axle_to_front_hitch_distance'] as double?,
        solidAxleToRearHitchDistance:
            hitches['solid_axle_to_rear_hitch_distance'] as double?,
        solidAxleToRearDrawbarDistance:
            hitches['solid_axle_to_rear_drawbar_distance'] as double?,
        solidAxleToFrontDistance: 1,
      ),
    );
  }

  /// The position of the center of the rear axle.
  @override
  Geographic get steeringAxlePosition => position.rhumb.destinationPoint(
    distance: geometry.wheelBase - antennaToSolidAxleDistance,
    bearing: (bearing + 180).wrap360(),
  );

  /// The position of the Stanley axle in the the vehicle direction. Used when
  /// calculating the Stanley pursuit values.
  ///
  /// The mirror position of the steering axle around the solidx axle is used
  /// when the harvester is driving forward.
  @override
  Geographic get stanleyAxlePosition =>
      switch (isReversing) {
        true => steeringAxlePosition,
        false => solidAxlePosition.rhumb.destinationPoint(
          distance: geometry.wheelBase,
          bearing: bearing,
        ),
      }.rhumb.destinationPoint(
        distance: nudgeDistance,
        bearing: (bearing - 90).wrap360(),
      );

  /// The angle of the left steering wheel when using Ackermann steering.
  /// The angle is inverted because the vehicle is rear wheel steered.
  @override
  double get leftSteeringWheelAngle => -ackermannSteering.leftAngle;

  /// The angle of the right steering wheel when using Ackermann steering.
  /// The angle is inverted because the vehicle is rear wheel steered.
  @override
  double get rightSteeringWheelAngle => -ackermannSteering.rightAngle;

  /// Returns a new [Harvester] based on this one, but with
  /// parameters/variables altered.
  @override
  Harvester copyWith({
    VehicleGeometry? geometry,
    Geographic? antennaPosition,
    Imu? imu,
    Was? was,
    GnssAntennaConfig? gnssAntennaConfig,
    VehicleThresholds? thresholds,
    SteeringHardwareConfig? steeringHardwareConfig,
    PathTrackingParameters? pathTrackingParameters,
    double? velocity,
    double? bearing,
    double? pitch,
    double? roll,
    double? steeringAngleInput,
    double? nudgeDistance,
    double? wheelsRolledDistance,
    String? name,
    String? uuid,
    ManufacturerColors? manufacturerColors,
    bool? manualSimulationMode,
    List<Connector>? connectors,
    List<Connection>? childConnections,
    int? id,
  }) => Harvester(
    id: id ?? this.id,
    geometry: switch (geometry) {
      final AxleSteeredVehicleGeometry geometry => geometry,
      _ => this.geometry,
    },
    antennaPosition: antennaPosition ?? this.antennaPosition,
    imu: imu ?? this.imu,
    was: was ?? this.was,
    gnssAntennaConfig: gnssAntennaConfig ?? this.gnssAntennaConfig,
    thresholds: thresholds ?? this.thresholds,
    steeringHardwareConfig:
        steeringHardwareConfig ?? this.steeringHardwareConfig,
    pathTrackingParameters:
        pathTrackingParameters ?? this.pathTrackingParameters,
    velocity: velocity ?? this.velocity,
    bearing: bearing ?? _bearing,
    pitch: pitch ?? _pitch,
    roll: roll ?? _roll,
    steeringAngleInput: steeringAngleInput ?? this.steeringAngleInput,
    nudgeDistance: nudgeDistance ?? this.nudgeDistance,
    wheelsRolledDistance: wheelsRolledDistance ?? this.wheelsRolledDistance,
    name: name ?? this.name,
    uuid: uuid ?? this.uuid,
    manufacturerColors: manufacturerColors ?? this.manufacturerColors,
    manualSimulationMode: manualSimulationMode ?? this.manualSimulationMode,
    connectors: connectors ?? this.connectors,
    childConnections: childConnections ?? this.childConnections,
  )..wheelsRolledDistance = wheelsRolledDistance ?? 0;

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();

    map['info'] = Map<String, dynamic>.from(map['info'] as Map)
      ..addAll({'vehicle_type': 'Harvester'});

    return map;
  }
}
