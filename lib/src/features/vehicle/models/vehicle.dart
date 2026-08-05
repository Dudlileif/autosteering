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

import 'dart:collection';
import 'dart:math';
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';

part 'vehicle_types/articulated_tractor.dart';
part 'vehicle_types/axle_steered_vehicle.dart';
part 'vehicle_types/harvester.dart';
part 'vehicle_types/tractor.dart';

/// A base class for vehicles that handles all common parameters/variables
/// and methods.
sealed class Vehicle extends Hitchable {
  /// A base class for vehicles that handles all common parameters/variables
  /// and methods.
  Vehicle({
    required this.type,
    required this.geometry,
    super.connectors,
    super.childConnections,
    ManufacturerColors? manufacturerColors,
    this.steeringAngleInput = 0,
    this.wheelsRolledDistance = 0,
    this.antennaPosition = const Geographic(lon: 0, lat: 0),
    this.thresholds = const VehicleThresholds(),
    super.name,
    super.id,
    super.uuid,
    Imu? imu,
    Was? was,
    GnssAntennaConfig? gnssAntennaConfig,
    SteeringHardwareConfig? steeringHardwareConfig,
    PathTrackingParameters? pathTrackingParameters,
    super.createdAt,
    super.lastUpdatedAt,
    this._bearing = 0,
    this._pitch = 0,
    this._roll = 0,
    this._velocity = 0,
    this.nudgeDistance = 0,
    this.manualSimulationMode = false,
  }) : gnssAntennaConfig = gnssAntennaConfig ?? const GnssAntennaConfig(),
       manufacturerColors =
           manufacturerColors ?? ManufacturerColors.masseyFerguson,
       imu = imu ?? Imu(),
       was = was ?? Was(),
       steeringHardwareConfig =
           steeringHardwareConfig ?? const SteeringHardwareConfig(),
       pathTrackingParameters =
           pathTrackingParameters ?? const PathTrackingParameters();

  /// Creates the appropriate [Vehicle] subclass from the [json] object.
  ///
  /// The returned object is one of the following:
  ///
  /// [Tractor] or
  /// [Harvester] or
  /// [ArticulatedTractor]
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);
    final type = VehicleType.fromString(info['vehicle_type'] as String);

    final vehicle = switch (type) {
      VehicleType.tractor => Tractor.fromJson(json),
      VehicleType.harvester => Harvester.fromJson(json),
      VehicleType.articulatedTractor => ArticulatedTractor.fromJson(json),
    };

    // final children = json['children'] != null
    //     ? Map<String, Map<String, dynamic>?>.from(json['children'] as Map)
    //     : null;
    //
    // final hitchFrontFixedChild = children?['front_fixed'] != null
    //     ? Equipment.fromJson(
    //         Map<String, dynamic>.from(children!['front_fixed']!),
    //       )
    //     : null;
    // final hitchRearFixedChild = children?['rear_fixed'] != null
    //     ? Equipment.fromJson(
    //         Map<String, dynamic>.from(children!['rear_fixed']!),
    //       )
    //     : null;
    // final hitchRearDrawbarChild = children?['rear_drawbar'] != null
    //     ? Equipment.fromJson(
    //         Map<String, dynamic>.from(children!['rear_drawbar']!),
    //       )
    //     : null;

    // if (hitchFrontFixedChild != null) {
    //   vehicle.attachChild(hitchFrontFixedChild, Hitch.frontFixed);
    // }
    // if (hitchRearFixedChild != null) {
    //   vehicle.attachChild(hitchRearFixedChild);
    // }
    // if (hitchRearDrawbarChild != null) {
    //   vehicle.attachChild(hitchRearDrawbarChild, Hitch.rearDrawbar);
    // }

    final steering = Map<String, dynamic>.from(json['steering'] as Map);

    final gnssAntennaConfig = json.containsKey('gnss_antenna_config')
        ? GnssAntennaConfig.fromJson(
            Map<String, dynamic>.from(json['gnss_antenna_config'] as Map),
          )
        : const GnssAntennaConfig();

    final imu = json.containsKey('imu_config')
        ? Imu(
            config: ImuConfig.fromJson(
              Map<String, dynamic>.from(json['imu_config'] as Map),
            ),
          )
        : Imu();

    final was = steering.containsKey('was_config')
        ? Was(
            config: WasConfig.fromJson(
              Map<String, dynamic>.from(steering['was_config'] as Map),
            ),
          )
        : Was();

    final steeringHardwareConfig = steering.containsKey('hardware_config')
        ? SteeringHardwareConfig.fromJson(
            Map<String, dynamic>.from(steering['hardware_config'] as Map),
          )
        : const SteeringHardwareConfig();

    final thresholds = steering.containsKey('thresold_velocities')
        ? VehicleThresholds.fromJson(
            Map<String, dynamic>.from(steering['thresold_velocities'] as Map),
          )
        : const VehicleThresholds();

    final purePursuitParameters =
        steering.containsKey('pure_pursuit_parameters')
        ? PurePursuitParameters.fromJson(
            Map<String, dynamic>.from(
              steering['pure_pursuit_parameters'] as Map,
            ),
          )
        : null;

    final stanleyParameters = steering.containsKey('stanley_parameters')
        ? StanleyParameters.fromJson(
            Map<String, dynamic>.from(steering['stanley_parameters'] as Map),
          )
        : null;

    final pathTrackingMode = steering.containsKey('path_tracking_mode')
        ? PathTrackingMode.fromJson(
            steering['path_tracking_mode'] as String,
          )
        : PathTrackingMode.purePursuit;

    final manufacturerColors = json.containsKey('manufacturer_colors')
        ? ManufacturerColors.fromJson(
            Map<String, dynamic>.from(json['manufacturer_colors'] as Map),
          )
        : null;

    final connectors = <Connector>[];
    if ((json['hitches'] as Map?)?['solid_axle_to_front_hitch_distance']
        case final double solidAxleToFrontHitch) {
      connectors.add(
        Connector(
          longitudinalOffsetFromRef: solidAxleToFrontHitch,
          lateralOffsetFromRef: 0,
          relation: .parent,
          type: .fixed,
        ),
      );
    }
    if ((json['hitches'] as Map?)?['solid_axle_to_rear_hitch_distance']
        case final double solidAxleToRearHitch) {
      connectors.add(
        Connector(
          longitudinalOffsetFromRef: -solidAxleToRearHitch,
          lateralOffsetFromRef: 0,
          angle: 180,
          relation: .parent,
          type: .fixed,
        ),
      );
    }
    if ((json['hitches'] as Map?)?['solid_axle_to_rear_drawbar_distance'] ??
            (json['hitches'] as Map?)?['solid_axle_to_rear_towbar_distance']
        case final double solidAxleToRearDrawbar) {
      connectors.add(
        Connector(
          longitudinalOffsetFromRef: -solidAxleToRearDrawbar,
          lateralOffsetFromRef: 0,
          angle: 180,
          relation: .parent,
          type: .drawbar,
        ),
      );
    }
    if ((json['hitches'] as Map?)?['front_axle_to_front_hitch_distance']
        case final double frontAxleToFrontHitch) {
      connectors.add(
        Connector(
          longitudinalOffsetFromRef: frontAxleToFrontHitch,
          lateralOffsetFromRef: 0,
          relation: .parent,
          type: .fixed,
        ),
      );
    }
    if ((json['hitches'] as Map?)?['rear_axle_to_hitch_distance']
        case final double rearAxleToHitch) {
      connectors.add(
        Connector(
          longitudinalOffsetFromRef: -rearAxleToHitch,
          lateralOffsetFromRef: 0,
          angle: 180,
          relation: .parent,
          type: .fixed,
        ),
      );
    }
    if ((json['hitches'] as Map?)?['rear_axle_to_drawbar_distance'] ??
            (json['hitches'] as Map?)?['rear_axle_to_towbar_distance']
        case final double rearAxleToDrawbar) {
      connectors.add(
        Connector(
          longitudinalOffsetFromRef: -rearAxleToDrawbar,
          lateralOffsetFromRef: 0,
          angle: 180,
          relation: .parent,
          type: .drawbar,
        ),
      );
    }

    return vehicle.copyWith(
      imu: imu,
      was: was,
      connectors: connectors,
      gnssAntennaConfig: gnssAntennaConfig,
      steeringHardwareConfig: steeringHardwareConfig,
      thresholds: thresholds,
      pathTrackingParameters: switch ((
        purePursuitParameters,
        stanleyParameters,
      )) {
        (final purePursuit?, final stanley?) => PathTrackingParameters(
          purePursuit: purePursuit,
          stanley: stanley,
          mode: pathTrackingMode,
        ),
        (final purePursuit?, _) => PathTrackingParameters(
          purePursuit: purePursuit,
          mode: pathTrackingMode,
        ),
        (_, final stanley?) => PathTrackingParameters(
          stanley: stanley,
          mode: pathTrackingMode,
        ),
        _ => PathTrackingParameters(mode: pathTrackingMode),
      },
      manufacturerColors: manufacturerColors,
    );
  }

  /// Constructor for use with the local database.
  factory Vehicle.fromDatabase({
    required int id,
    required VehicleType type,
    required VehicleGeometry geometry,
    String? name,
    GnssAntennaConfig? gnssAntennaConfig,
    ImuConfig? imuConfig,
    SteeringHardwareConfig? steeringHardwareConfig,
    WasConfig? wasConfig,
    PathTrackingParameters? pathTrackingParameters,
    ManufacturerColors? colorScheme,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
  }) {
    return switch (type) {
      .tractor => Tractor(
        id: id,
        name: name,
        geometry: geometry as AxleSteeredVehicleGeometry,
        gnssAntennaConfig: gnssAntennaConfig,
        imu: switch (imuConfig) {
          final imuConfig? => Imu(config: imuConfig),
          _ => null,
        },
        was: switch (wasConfig) {
          final wasConfig? => Was(config: wasConfig),
          _ => null,
        },
        steeringHardwareConfig: switch (steeringHardwareConfig) {
          final steeringHardwareConfig? => steeringHardwareConfig,
          _ => null,
        },
        pathTrackingParameters: pathTrackingParameters,
        manufacturerColors: colorScheme,
        createdAt: createdAt,
        lastUpdatedAt: lastUpdatedAt,
      ),
      .articulatedTractor => ArticulatedTractor(
        id: id,
        name: name,
        geometry: geometry as ArticulatedVehicleGeometry,
        gnssAntennaConfig: gnssAntennaConfig,
        imu: switch (imuConfig) {
          final imuConfig? => Imu(config: imuConfig),
          _ => null,
        },
        was: switch (wasConfig) {
          final wasConfig? => Was(config: wasConfig),
          _ => null,
        },
        steeringHardwareConfig: switch (steeringHardwareConfig) {
          final steeringHardwareConfig? => steeringHardwareConfig,
          _ => null,
        },
        pathTrackingParameters: pathTrackingParameters,
        manufacturerColors: colorScheme,
        createdAt: createdAt,
        lastUpdatedAt: lastUpdatedAt,
      ),
      .harvester => Harvester(
        id: id,
        name: name,
        geometry: geometry as AxleSteeredVehicleGeometry,
        gnssAntennaConfig: gnssAntennaConfig,
        imu: switch (imuConfig) {
          final imuConfig? => Imu(config: imuConfig),
          _ => null,
        },
        was: switch (wasConfig) {
          final wasConfig? => Was(config: wasConfig),
          _ => null,
        },
        steeringHardwareConfig: switch (steeringHardwareConfig) {
          final steeringHardwareConfig? => steeringHardwareConfig,
          _ => null,
        },
        pathTrackingParameters: pathTrackingParameters,
        manufacturerColors: colorScheme,
        createdAt: createdAt,
        lastUpdatedAt: lastUpdatedAt,
      ),
    };
  }

  /// Which type of vehicle this is.
  final VehicleType type;

  /// The manufacturer color scheme of the vehicle.
  ManufacturerColors manufacturerColors;

  /// The GNSS antenna config of the vehicle.
  ///
  /// This contains values for the relative position of the antenna and if dual
  /// antennas are in use.
  GnssAntennaConfig gnssAntennaConfig;

  /// The geometry paramters of this.
  VehicleGeometry geometry;

  /// The path tracking parameters for Pure pursuit and Stanley modes.
  PathTrackingParameters pathTrackingParameters;

  /// The distance between the front and rear axle.
  double get wheelBase;

  /// The maximum angle that the steering wheels/pivot can turn, in degrees.
  double get steeringAngleMax;

  /// This is the Ackermann input angle or the angle of the articulation for an
  /// articulated tractor.
  double steeringAngleInput;

  /// A PID steering controller for use with autosteering.
  PidController pidController = PidController();

  /// The Wheel Angle Sensor object representation of this vehicle.
  Was was;

  /// The configuration for the steering wheel motor of the vehicle.
  SteeringHardwareConfig steeringHardwareConfig;

  /// The threshold velocities for using autosteering with this vehicle.
  VehicleThresholds thresholds;

  /// The sideways distance to nudge the vehicle from the path tracking line.
  /// Positive means to the right in the driving direction.
  double nudgeDistance;

  /// The velocity of the vehicle as set from the outside.
  double _velocity;

  /// The manually set pitch of the vehicle as degrees of inclination around
  /// the x-axis (across) the vehicle in the forward direction.
  double _pitch;

  /// The manually set roll of the vehicle as degrees of roll around the y-axis
  /// (along) the vehicle in the forward direction.
  double _roll;

  /// Bearing as set from the outside.
  double _bearing = 0;

  /// Whether manual simulation mode is used.
  bool manualSimulationMode = false;

  /// The IMU (inertial measurement unit) for this vehicle.
  Imu imu;

  /// Antenna position of the vehicle.
  Geographic antennaPosition;

  /// The distance the wheels has rolled since the start.
  ///
  /// Reversing will subtract from this value.
  /// Used to draw rolling wheels.
  double wheelsRolledDistance;

  /// The PID parameters for controlling the steering of this vehicle
  /// when using a PID controller mode.
  PidParameters get pidParameters => steeringHardwareConfig.pidParameters;

  /// The lateral offset of the the antenna's true ground position to the
  /// mounted position.
  ///
  /// The result is multiplied by the [ImuConfig.rollGain], or the
  /// [ImuConfig.asymmetricRollGainLeft] if enabled and rolled to the left.
  double get antennaRollLateralOffset =>
      tan(roll.toRadians()) *
      gnssAntennaConfig.height *
      switch ((
        gnssAntennaConfig,
        roll,
        imu.config.asymmetricRollGainLeft != null,
      )) {
        (GnssAntennaConfig(useDualRoll: true, :final dualRollGain), _, _) =>
          dualRollGain,
        (_, < 0, true) => imu.config.asymmetricRollGainLeft!,
        _ => imu.config.rollGain,
      };

  /// The longitudinal offset of the the antenna's true ground position to the
  /// mounted position.
  ///
  /// The result is multiplied by the [ImuConfig.pitchGain].
  double get antennaPitchLongitudinalOffset =>
      tan(pitch.toRadians()) * gnssAntennaConfig.height * imu.config.pitchGain;

  /// The corrected position of the antenna after accounting for the [pitch]
  /// and [roll].
  Geographic get correctedAntennaPosition =>
      correctPositionForRollAndPitch(antennaPosition);

  /// The projected ground position of the centered antenna of this vehicle
  /// accounting for [pitch] and [roll].
  @override
  Geographic get position => correctedAntennaPosition.rhumb.destinationPoint(
    distance: gnssAntennaConfig.lateralOffset,
    bearing: bearing - 90,
  );

  /// Updates the [antennaPosition] of the vehicle, as the ground [position] is
  /// derived from it.
  @override
  set position(Geographic value) => antennaPosition = value;

  /// The corrected position of the secondary antenna, if it is in use.
  Geographic? get secondaryAntennaPosition => switch (gnssAntennaConfig) {
    GnssAntennaConfig(
      :final useDualHeading,
      :final useDualRoll,
      :final dualBaseline,
      :final dualRelativeAngle,
    )
        when useDualHeading || useDualRoll =>
      correctedAntennaPosition.rhumb.destinationPoint(
        distance: dualBaseline,
        bearing: bearing + dualRelativeAngle,
      ),
    _ => null,
  };

  /// Moves the input [position] to a position corrected for [pitch] and [roll]
  /// with [antennaPitchLongitudinalOffset] and [antennaRollLateralOffset].
  Geographic correctPositionForRollAndPitch(Geographic position) => position
      .rhumb
      .destinationPoint(
        distance: antennaRollLateralOffset,
        bearing: bearing - 90,
      )
      .rhumb
      .destinationPoint(
        distance: antennaPitchLongitudinalOffset,
        bearing: bearing,
      );

  /// A method for setting the [position] correctly when not directly
  /// inputting the [antennaPosition] from hardware. The [value] is the new
  /// proposed ground [position] for the vehicle.
  ///
  /// Essentially we move the position opposite of the getter for [position],
  /// to end at the correct [antennaPosition].
  void setPositionSim(Geographic value) {
    antennaPosition = value.rhumb
        .destinationPoint(
          distance:
              -(antennaRollLateralOffset + gnssAntennaConfig.lateralOffset),
          bearing: bearing - 90,
        )
        .rhumb
        .destinationPoint(
          distance: -antennaPitchLongitudinalOffset,
          bearing: bearing,
        );
  }

  /// The velocity of the vehicle, in m/s, meters per second, in the bearing
  /// direction.
  @override
  double get velocity => _velocity;

  /// Update the velocity of the vehicle.
  @override
  set velocity(double value) => _velocity = value;

  /// The bearing of the vehicle, in degrees.
  @override
  double get bearing => switch (manualSimulationMode) {
    true => _bearing,
    false => switch (imu.config.useYaw) {
      true => imu.bearing ?? 0,
      false => _bearing,
    },
  }.wrap360();

  /// The raw outside set bearing of the vehicle, typically from
  /// GNSS point to point bearing.
  double get bearingRaw => _bearing;

  /// Update the bearing of the vehicle, [value] in degrees.
  @override
  set bearing(double value) => _bearing = value.wrap360();

  /// The pitch of the vehicle as degrees of inclination around the x-axis
  /// (across) the vehicle in the forward direction.
  double get pitch => switch (imu.config.usePitch) {
    true => imu.pitch,
    false => _pitch,
  };

  set pitch(double value) => _pitch = value;

  /// The roll of the vehicle as degrees of roll around the y-axis (along) the
  /// vehicle in the forward direction.
  double get roll =>
      switch ((gnssAntennaConfig.useDualRoll, imu.config.useRoll)) {
        (false, true) => imu.roll,
        _ => _roll,
      };

  set roll(double value) => _roll = value;

  /// The distance from the ground position to the antenna position.
  double get groundPositionToAntennaDistance =>
      position.rhumb.distanceTo(antennaPosition);

  /// The bearing from the ground position to the antenna position.
  double get groundPositionToAntennaBearing =>
      position.rhumb.initialBearingTo(antennaPosition);

  /// Normalizes the discrete [WasReading] into a range from -1 to 1, where
  /// each part -1 -> 0 and 0 -> 1 are individually normalized depending on
  /// [SteeringHardwareConfig.wasMin], [SteeringHardwareConfig.wasCenter] and
  /// [SteeringHardwareConfig.wasMax].
  double get wasReadingNormalizedInRange {
    final normalized = switch (was.reading.value <
        steeringHardwareConfig.wasCenter) {
      true =>
        (was.reading.value - steeringHardwareConfig.wasCenter) /
            (steeringHardwareConfig.wasCenter - steeringHardwareConfig.wasMin),
      false =>
        (was.reading.value - steeringHardwareConfig.wasCenter) /
            (steeringHardwareConfig.wasMax - steeringHardwareConfig.wasCenter),
    };
    return switch (was.config.invertInput) {
      true => -normalized,
      false => normalized,
    };
  }

  /// Sets the steering angle of the vehicle by the [was].reading.
  void setSteeringAngleByWasReading() {
    if (was.config.useWas) {
      steeringAngleInput = clampDouble(
        wasReadingNormalizedInRange * geometry.steeringAngleMax,
        -geometry.steeringAngleMax,
        geometry.steeringAngleMax,
      );
    }
  }

  /// Returns the WAS reading target for the given steering [angle].
  int wasTargetFromSteeringAngle(double angle) {
    if (angle < 0) {
      if (was.config.invertInput) {
        return (steeringHardwareConfig.wasCenter +
                ((steeringHardwareConfig.wasMax -
                            steeringHardwareConfig.wasCenter) *
                        angle.abs() /
                        geometry.steeringAngleMax)
                    .round())
            .clamp(
              steeringHardwareConfig.wasCenter,
              steeringHardwareConfig.wasMax,
            );
      } else {
        return (steeringHardwareConfig.wasCenter -
                ((steeringHardwareConfig.wasCenter -
                            steeringHardwareConfig.wasMin) *
                        angle.abs() /
                        geometry.steeringAngleMax)
                    .round())
            .clamp(
              steeringHardwareConfig.wasMin,
              steeringHardwareConfig.wasCenter,
            );
      }
    } else {
      if (was.config.invertInput) {
        return (steeringHardwareConfig.wasCenter -
                ((steeringHardwareConfig.wasCenter -
                            steeringHardwareConfig.wasMin) *
                        angle.abs() /
                        geometry.steeringAngleMax)
                    .round())
            .clamp(
              steeringHardwareConfig.wasMin,
              steeringHardwareConfig.wasCenter,
            );
      } else {
        return (steeringHardwareConfig.wasCenter +
                ((steeringHardwareConfig.wasMax -
                            steeringHardwareConfig.wasCenter) *
                        angle.abs() /
                        geometry.steeringAngleMax)
                    .round())
            .clamp(
              steeringHardwareConfig.wasCenter,
              steeringHardwareConfig.wasMax,
            );
      }
    }
  }

  /// Where the look ahead distance calculation should start.
  Geographic get lookAheadStartPosition;

  /// The effective look ahead distance for the vehicle.
  ///
  /// The distance is altered according to [pathTrackingParameters].purePursuit.
  double get lookAheadDistance => clampDouble(
    velocity.abs() * pathTrackingParameters.purePursuit.lookAheadSeconds,
    pathTrackingParameters.purePursuit.lookAheadMinDistance,
    double.infinity,
  );

  /// A [WayPoint] for the vehicle in its current state, i.e. position, bearing
  /// and velocity.
  WayPoint get wayPoint =>
      WayPoint(position: position, bearing: bearing, velocity: velocity);

  /// Reqiure wheel angle above 0.01 deg.
  static const double minSteeringAngle = 0.01;

  /// The [steeringAngleInput] accounted for [minSteeringAngle].
  double get steeringAngle =>
      switch (steeringAngleInput.abs() > minSteeringAngle) {
        true => steeringAngleInput,
        false => 0,
      };

  /// The position of the Stanley axle in the vehicle direction. Used when
  /// calculating Stanley path tracking values.
  Geographic get stanleyAxlePosition;

  /// Finds the point position corresponding to the
  /// [pathTrackingParameters].mode.
  Geographic get pathTrackingPoint => switch (pathTrackingParameters.mode) {
    PathTrackingMode.purePursuit => lookAheadStartPosition,
    PathTrackingMode.stanley => stanleyAxlePosition,
  };

  /// Basic circle markers for showing the vehicle's steering related
  /// points.
  List<map.CircleMarker> get steeringDebugMarkers;

  /// Basic polylines for showing the vehicle's steering related
  /// points.
  List<map.Polyline> get steeringDebugLines;

  /// Polygons for drawing the wheels of the vehicle.
  List<map.Polygon> get wheelPolygons;

  /// The angular velocity of the vehicle, if it is turning.
  /// Unit is degrees/s.
  double? get angularVelocity {
    if (currentTurningRadius == null) {
      return null;
    }
    var value = (velocity / (pi * currentTurningRadius!)) * 180;
    if (isTurningLeft) {
      value *= -1;
    }
    return value;
  }

  /// Helper method to get the steering angle for a given angular velocity
  /// with the current [velocity].
  double steeringAngleFromAngularVelocity(
    double angularVelocity,
  );

  /// The projected trajectory for the moving vehicle.
  ///
  /// [seconds] can be set to change the prediction time from the default 10
  /// seconds, and [minLength] can force a minimum length of the trajectory
  /// line.
  ///
  /// Based on the current [steeringAngle], [velocity] and
  /// [currentTurningRadius].
  LineString trajectory({double? seconds, double? minLength});

  /// Whether the vehicle is reversing or not.
  @override
  bool get isReversing => velocity < 0;

  /// Whether the vehicle is turning to the left,
  /// otherwise assumed turning to the right.
  bool get isTurningLeft => steeringAngle < 0;

  /// The furthest ahead and left most position of the vehicle's bounding box.
  ///
  /// Useful for drawing the vehicle on the map.
  Geographic get topLeftPosition;

  /// Polygons for visualizing the extent of the vehicle.
  List<map.Polygon> get polygons;

  /// Updates the [position] and [bearing] according to the current [velocity],
  /// [bearing], [steeringAngle] for the next [period] seconds.
  ///
  /// The attached hitch children are then updated with [updateChildren]
  /// afterwards.
  void updatePositionAndBearing(
    double period,
    Geographic? turningCircleCenter, {
    bool force = false,
  }) {
    if (period > 0) {
      if (angularVelocity != null && turningCircleCenter != null) {
        final updated = updatedPositionAndBearingTurning(
          period,
          turningCircleCenter,
        );
        setPositionSim(updated.position);
        bearing = updated.bearing;
      } else if (velocity.abs() > 0 || force) {
        setPositionSim(updatedPositionStraight(period));
      }
      updateChildren(period);
    }
  }

  /// Updates the [position] and [bearing] for the next [period] seconds when
  /// turning around [turningCircleCenter], i.e. with a constant
  /// [steeringAngle].
  ({Geographic position, double bearing}) updatedPositionAndBearingTurning(
    double period,
    Geographic turningCircleCenter,
  );

  /// Updates the [position] for the next [period] seconds when going straight.
  Geographic updatedPositionStraight(double period) => position.rhumb
      .destinationPoint(distance: velocity * period, bearing: bearing);

  /// Calculates a motor velocity multiplier to reach [steeringAngleTarget] from
  /// [steeringAngleInput] by using the [pidController].
  ///
  /// [integralSize] is how many steps the integral should take into account.
  double simulatedMotorVelocityPid(
    double steeringAngleTarget, {
    double integralSize = 1000,
  }) {
    final normalizedTarget =
        (steeringAngleTarget + geometry.steeringAngleMax) /
        (2 * geometry.steeringAngleMax);
    final normalizedInput =
        (steeringAngleInput + geometry.steeringAngleMax) /
        (2 * geometry.steeringAngleMax);

    return pidController.nextValue(
      normalizedTarget - normalizedInput,
      pidParameters,
      integralSize: integralSize,
    );
  }

  /// The predicted look ahead axle position and bearing when continuing the
  /// vehicle's movement with [steeringAngle] for a time [period] in seconds.
  ({Geographic position, double bearing}) predictedLookAheadPosition(
    double period,
    double steeringAngle,
  ) {
    if (velocity.abs() > 0) {
      // Turning
      if (steeringAngle.abs() > 0) {
        return predictedLookAheadPositionTurning(period, steeringAngle);
      }

      // Straight
      final newPoint = lookAheadStartPosition.rhumb.destinationPoint(
        distance: velocity * period,
        bearing: bearing,
      );
      final newBearing = lookAheadStartPosition.rhumb.finalBearingTo(newPoint);
      return (
        position: newPoint,
        bearing: newBearing.isFinite ? newBearing : bearing,
      );
    }
    return (position: lookAheadStartPosition, bearing: bearing);
  }

  /// The predicted look ahead axle position and bearing when continuing the
  /// vehicle's movement while turning with [steeringAngle] for a time
  /// [period] in seconds.
  ({Geographic position, double bearing}) predictedLookAheadPositionTurning(
    double period,
    double steeringAngle,
  );

  /// The predicted Stanley axle position and bearing when continuing the
  /// vehicle's movement with [steeringAngle] for a time [period] in seconds.
  ({Geographic position, double bearing}) predictedStanleyPosition(
    double period,
    double steeringAngle,
  ) {
    if (velocity.abs() > 0) {
      // Turning
      if (steeringAngle.abs() > 0) {
        return predictedStanleyPositionTurning(period, steeringAngle);
      }
      // Straight
      final newPoint = stanleyAxlePosition.rhumb.destinationPoint(
        distance: velocity * period,
        bearing: bearing,
      );
      return (position: newPoint, bearing: bearing);
    }
    return (position: stanleyAxlePosition, bearing: bearing);
  }

  /// The predicted Stanley axle position and bearing when continuing the
  /// vehicle's movement while turning with [steeringAngle] for a time
  /// [period] in seconds.
  ({Geographic position, double bearing}) predictedStanleyPositionTurning(
    double period,
    double steeringAngle,
  );

  /// Returns a new [Vehicle] based on this one, but with
  /// parameters/variables altered.
  @override
  Vehicle copyWith({
    VehicleGeometry? geometry,
    Geographic? antennaPosition,
    GnssAntennaConfig? gnssAntennaConfig,
    Was? was,
    Imu? imu,
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
  });

  /// Converts the object to a json compatible structure.
  @override
  Map<String, dynamic> toJson() {
    final map = SplayTreeMap<String, dynamic>();
    map['info'] = {
      'name': name,
      'uuid': uuid,
    };
    map['gnss_antenna_config'] = gnssAntennaConfig;

    map['dimensions'] = {
      'length': geometry.length,
      'width': geometry.width,
      'track_width': geometry.trackWidth,
    };

    map['imu_config'] = imu.config;

    map['steering'] = {
      'min_turning_radius': geometry.minTurningRadius,
      'path_tracking_mode': pathTrackingParameters.mode,
      'steering_angle_max': geometry.steeringAngleMax,
      'threshold_velocities': thresholds.toJson(),
      'hardware_config': steeringHardwareConfig,
      'was_config': was.config,
      'pure_pursuit_parameters': pathTrackingParameters.purePursuit,
      'stanley_parameters': pathTrackingParameters.stanley,
    };

    map['manufacturer_colors'] = manufacturerColors;

    return map;
  }
}

/// An enumerator for the supported types of vehicles.
enum VehicleType {
  /// Tractor or vehicle with front axle steering.
  tractor('Tractor'),

  /// Articulated tractor
  articulatedTractor('Articulated tractor'),

  /// Harvester or vehicle with rear axle steering.
  harvester('Harvester');

  const VehicleType(this.name);

  /// The name of this.
  final String name;

  /// Parse a [VehicleType] from [name].
  static VehicleType fromString(String name) =>
      values.firstWhere((value) => value.name == name);
}
