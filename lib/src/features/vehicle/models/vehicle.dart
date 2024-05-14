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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';

part 'vehicle_types/articulated_tractor.dart';
part 'vehicle_types/axle_steered_vehicle.dart';
part 'vehicle_types/harvester.dart';
part 'vehicle_types/tractor.dart';

// TODO (dudlileif): Add nudging by moving the path tracking point sideways by
// specified amount in the opposite direction

/// A base class for vehicles that handles all common parameters/variables
/// and methods.
sealed class Vehicle extends Hitchable with EquatableMixin {
  /// A base class for vehicles that handles all common parameters/variables
  /// and methods.
  Vehicle({
    required this.antennaHeight,
    required this.minTurningRadius,
    required this.steeringAngleMax,
    required this.trackWidth,
    this.manufacturerColors = ManufacturerColors.masseyFerguson,
    this.antennaLateralOffset = 0,
    this.steeringAngleInput = 0,
    this.length = 4,
    this.width = 2.5,
    int? numWheels,
    double? wheelSpacing,
    this.wheelsRolledDistance = 0,
    this.antennaPosition = const Geographic(lon: 0, lat: 0),
    this.pathTrackingMode = PathTrackingMode.purePursuit,
    this.autosteeringThresholdVelocity = 0.05,
    super.hitchFrontFixedChild,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    super.name,
    super.uuid,
    Imu? imu,
    Was? was,
    SteeringHardwareConfig? steeringHardwareConfig,
    PurePursuitParameters? purePursuitParameters,
    StanleyParameters? stanleyParameters,
    DateTime? lastUsed,
    double bearing = 0,
    double pitch = 0,
    double roll = 0,
    double velocity = 0,
    this.manualSimulationMode = false,
  })  : numWheels = numWheels ?? 1,
        wheelSpacing = wheelSpacing ?? 0.05,
        _bearing = bearing,
        _pitch = pitch,
        _roll = roll,
        _velocity = velocity,
        imu = imu ?? Imu(),
        was = was ?? Was(),
        steeringHardwareConfig =
            steeringHardwareConfig ?? const SteeringHardwareConfig(),
        stanleyParameters = stanleyParameters ?? const StanleyParameters(),
        purePursuitParameters =
            purePursuitParameters ?? const PurePursuitParameters(),
        lastUsed = lastUsed ?? DateTime.now();

  /// Creates the appropriate [Vehicle] subclass from the [json] object.
  ///
  /// The returned object is one of the following:
  ///
  /// [Tractor] or
  /// [Harvester] or
  /// [ArticulatedTractor]
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);
    final type = info['vehicle_type'];

    final vehicle = switch (type) {
      'Tractor' => Tractor.fromJson(json),
      'Harvester' => Harvester.fromJson(json),
      'Articulated tractor' => ArticulatedTractor.fromJson(json),
      _ => Tractor.fromJson(json),
    };

    final children = json['children'] != null
        ? Map<String, Map<String, dynamic>?>.from(
            json['children'] as Map,
          )
        : null;

    final hitchFrontFixedChild = children?['front_fixed'] != null
        ? Equipment.fromJson(
            Map<String, dynamic>.from(children!['front_fixed']!),
          )
        : null;
    final hitchRearFixedChild = children?['rear_fixed'] != null
        ? Equipment.fromJson(
            Map<String, dynamic>.from(children!['rear_fixed']!),
          )
        : null;
    final hitchRearTowbarChild = children?['rear_towbar'] != null
        ? Equipment.fromJson(
            Map<String, dynamic>.from(children!['rear_towbar']!),
          )
        : null;

    if (hitchFrontFixedChild != null) {
      vehicle.attachChild(hitchFrontFixedChild, Hitch.frontFixed);
    }
    if (hitchRearFixedChild != null) {
      vehicle.attachChild(hitchRearFixedChild);
    }
    if (hitchRearTowbarChild != null) {
      vehicle.attachChild(hitchRearTowbarChild, Hitch.rearTowbar);
    }

    final steering = Map<String, dynamic>.from(json['steering'] as Map);

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

    final manufacturerColors = json.containsKey('manufacturer_colors')
        ? ManufacturerColors.fromJson(
            Map<String, dynamic>.from(json['manufacturer_colors'] as Map),
          )
        : null;

    return vehicle.copyWith(
      imu: imu,
      was: was,
      autosteeringThresholdVelocity:
          steering['autosteering_threshold_velocity'] as double?,
      steeringHardwareConfig: steeringHardwareConfig,
      purePursuitParameters: purePursuitParameters,
      stanleyParameters: stanleyParameters,
      manufacturerColors: manufacturerColors,
    );
  }

  /// The last time this vehicle was used.
  DateTime lastUsed;

  /// The manufacturer color scheme of the vehicle.
  ManufacturerColors manufacturerColors;

  /// The height of the antenna above the ground, in meters.
  double antennaHeight;

  /// How much the antenna is offset from the center line of the vehicle
  /// in the forward direction, in meters.
  double antennaLateralOffset;

  /// The distance between the centers of the wheels on the solid axle.
  double trackWidth;

  /// The number of wheels, i.e. twin/triples etc...
  int numWheels;

  /// The distance between the twin/triple etc. wheels.
  double wheelSpacing;

  /// The best/minimum turning radius, in meters.
  double minTurningRadius;

  /// The maximum angle that the steering wheels/pivot can turn, in degrees.
  double steeringAngleMax;

  /// This is the Ackermann input angle or the angle of the articulation for an
  /// articulated tractor.
  double steeringAngleInput;

  /// A PID steering controller for use with autosteering.
  PidController pidController = PidController();

  /// The Wheel Angle Sensor object representation of this vehicle.
  Was was;

  /// The configuration for the steering wheel motor of the vehicle.
  SteeringHardwareConfig steeringHardwareConfig;

  /// Parameters for the [lookAheadDistance] when using a pure pursuit/look
  /// ahead steering mode.
  PurePursuitParameters purePursuitParameters;

  /// The Stanley gain coefficients for controlling the steering of this vehicle
  /// when using a Stanley path tracking steering mode.
  StanleyParameters stanleyParameters;

  /// Which steering mode the path tracking should use.
  PathTrackingMode pathTrackingMode;

  /// The minimum required velocity to engage autosteering.
  double autosteeringThresholdVelocity;

  /// The velocity of the vehicle as set from the outside.
  double _velocity;

  /// The length of the vehicle excluding wheels, in meters.
  double length;

  /// The width of the vehicle excluding wheels, in meters.
  double width;

  /// The pitch of the vehicle as degrees of inclination around the x-axis
  /// (across) the vehicle in the forward direction.
  double _pitch;

  /// The roll of the vehicle as degrees of roll around the y-axis (along) the
  /// vehicle in the forward direction.
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
  double get antennaRollLateralOffset => tan(roll.toRadians()) * antennaHeight;

  /// The longitudinal offset of the the antenna's true ground position to the
  /// mounted position.
  double get antennaPitchLongitudinalOffset =>
      tan(pitch.toRadians()) * antennaHeight;

  /// The corrected position of the antenna after accounting for the [pitch]
  /// and [roll], if enabled by the [imu] config setting
  /// [ImuConfig.usePitchAndRoll].
  /// Otherwise the [antennaPosition] is returned.
  Geographic get correctedAntennaPosition =>
      switch (imu.config.usePitchAndRoll) {
        false => antennaPosition,
        true => correctPositionForRollAndPitch(antennaPosition)
      };

  /// The projected ground position of the centered antenna of this vehicle
  /// accounting for [pitch] and [roll].
  @override
  Geographic get position => correctedAntennaPosition.rhumb.destinationPoint(
        distance: antennaLateralOffset,
        bearing: bearing - 90,
      );

  /// Updates the [antennaPosition] of the vehicle, as the ground [position] is
  /// derived from it.
  @override
  set position(Geographic value) => antennaPosition = value;

  /// Moves the input [position] to a position corrected for [pitch] and [roll]
  /// with [antennaPitchLongitudinalOffset] and [antennaRollLateralOffset].
  Geographic correctPositionForRollAndPitch(Geographic position) =>
      position.rhumb
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
    final unCentered = value.rhumb.destinationPoint(
      distance: antennaLateralOffset,
      bearing: bearing + 90,
    );

    antennaPosition = switch (imu.config.usePitchAndRoll) {
      false => unCentered,
      true => unCentered.rhumb
          .destinationPoint(
            distance: -antennaRollLateralOffset,
            bearing: bearing - 90,
          )
          .rhumb
          .destinationPoint(
            distance: -antennaPitchLongitudinalOffset,
            bearing: bearing,
          )
    };
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
            false => _bearing
          }
      };

  /// The raw outside set bearing of the vehicle, typically from
  /// GNSS point to point bearing.
  double get bearingRaw => _bearing;

  /// Update the bearing of the vehicle, [value] in degrees.
  @override
  set bearing(double value) => _bearing = value.wrap360();

  /// The pitch of the vehicle as degrees of inclination around the x-axis
  /// (across) the vehicle in the forward direction.
  double get pitch => switch (imu.config.usePitchAndRoll) {
        true => imu.pitch,
        false => _pitch
      };

  set pitch(double value) => _pitch = value;

  /// The roll of the vehicle as degrees of roll around the y-axis (along) the
  /// vehicle in the forward direction.
  double get roll =>
      switch (imu.config.usePitchAndRoll) { true => imu.roll, false => _roll };

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
    final normalized =
        switch (was.reading.value < steeringHardwareConfig.wasCenter) {
      true => (was.reading.value - steeringHardwareConfig.wasCenter) /
          (steeringHardwareConfig.wasCenter - steeringHardwareConfig.wasMin),
      false => (was.reading.value - steeringHardwareConfig.wasCenter) /
          (steeringHardwareConfig.wasMax - steeringHardwareConfig.wasCenter)
    };
    return switch (was.config.invertInput) {
      true => -normalized,
      false => normalized
    };
  }

  /// Sets the steering angle of the vehicle by the [was].reading.
  void setSteeringAngleByWasReading() {
    if (was.config.useWas) {
      steeringAngleInput = (wasReadingNormalizedInRange * steeringAngleMax)
          .clamp(-steeringAngleMax, steeringAngleMax);
    }
  }

  /// The distance between the wheel axles.
  double get wheelBase;

  /// Returns the WAS reading target for the given steering [angle].
  int wasTargetFromSteeringAngle(double angle) {
    if (angle < 0) {
      if (was.config.invertInput) {
        return (steeringHardwareConfig.wasCenter +
                ((steeringHardwareConfig.wasMax -
                            steeringHardwareConfig.wasCenter) *
                        angle.abs() /
                        steeringAngleMax)
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
                        steeringAngleMax)
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
                        steeringAngleMax)
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
                        steeringAngleMax)
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
  /// The distance is altered according to [purePursuitParameters].
  double get lookAheadDistance =>
      (velocity.abs() * purePursuitParameters.lookAheadSeconds)
          .clamp(purePursuitParameters.lookAheadMinDistance, double.infinity);

  /// A [WayPoint] for the vehicle in it's current state, i.e. position, bearing
  /// and velocity.
  WayPoint get wayPoint => WayPoint(
        position: position,
        bearing: bearing,
        velocity: velocity,
      );

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
    var value = (velocity / (2 * pi * currentTurningRadius!)) * 360;
    if (isTurningLeft) {
      value *= -1;
    }
    return value;
  }

  /// The projected trajectory for the moving vehicle.
  ///
  /// Based on the current [steeringAngle], [velocity] and
  /// [currentTurningRadius].
  Path get trajectory;

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
        final updated =
            updatedPositionAndBearingTurning(period, turningCircleCenter);
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
  Geographic updatedPositionStraight(double period) =>
      position.rhumb.destinationPoint(
        distance: velocity * period,
        bearing: bearing,
      );

  /// Calculates a motor velocity multiplier to reach [steeringAngleTarget] from
  /// [steeringAngleInput] by using the [pidController].
  ///
  /// [integralSize] is how many steps the integral should take into account.
  double simulatedMotorVelocityPid(
    double steeringAngleTarget, {
    double integralSize = 1000,
  }) {
    final normalizedTarget =
        (steeringAngleTarget + steeringAngleMax) / (2 * steeringAngleMax);
    final normalizedInput =
        (steeringAngleInput + steeringAngleMax) / (2 * steeringAngleMax);

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
      final newPoint = lookAheadStartPosition.rhumb
          .destinationPoint(distance: velocity * period, bearing: bearing);
      final newBearing = lookAheadStartPosition.rhumb.finalBearingTo(newPoint);
      return (
        position: newPoint,
        bearing: newBearing.isFinite ? newBearing : bearing
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
      final newPoint = stanleyAxlePosition.rhumb
          .destinationPoint(distance: velocity * period, bearing: bearing);

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

  /// Props used for checking for equality.
  @override
  List<Object> get props => [
        position,
        antennaHeight,
        minTurningRadius,
        steeringAngleMax,
        trackWidth,
        velocity,
        bearing,
        steeringAngleInput,
        length,
        width,
        was.config,
        imu.config,
        steeringHardwareConfig,
      ];

  /// Returns a new [Vehicle] based on this one, but with
  /// parameters/variables altered.
  @override
  Vehicle copyWith({
    Geographic? antennaPosition,
    double? antennaHeight,
    double? antennaLateralOffset,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    int? numWheels,
    double? wheelSpacing,
    Was? was,
    Imu? imu,
    double? autosteeringThresholdVelocity,
    SteeringHardwareConfig? steeringHardwareConfig,
    PathTrackingMode? pathTrackingMode,
    PurePursuitParameters? purePursuitParameters,
    StanleyParameters? stanleyParameters,
    double? velocity,
    double? bearing,
    double? pitch,
    double? roll,
    double? steeringAngleInput,
    double? length,
    double? width,
    double? wheelsRolledDistance,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    String? name,
    String? uuid,
    DateTime? lastUsed,
    ManufacturerColors? manufacturerColors,
    bool? manualSimulationMode,
  });

  /// Converts the object to a json compatible structure.
  @override
  Map<String, dynamic> toJson() {
    final map = SplayTreeMap<String, dynamic>();
    map['info'] = {
      'name': name,
      'uuid': uuid,
      'last_used': lastUsed.toIso8601String(),
    };
    map['antenna'] = {
      'height': antennaHeight,
      'lateral_offset': antennaLateralOffset,
    };
    map['dimensions'] = {
      'length': length,
      'width': width,
      'track_width': trackWidth,
    };

    map['imu_config'] = imu.config;

    map['steering'] = {
      'min_turning_radius': minTurningRadius,
      'path_tracking_mode': pathTrackingMode,
      'steering_angle_max': steeringAngleMax,
      'autosteering_threshold_velocity': autosteeringThresholdVelocity,
      'hardware_config': steeringHardwareConfig,
      'was_config': was.config,
      'pure_pursuit_parameters': purePursuitParameters,
      'stanley_parameters': stanleyParameters,
    };

    map['manufacturer_colors'] = manufacturerColors;

    return map;
  }
}
