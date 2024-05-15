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

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';

/// A class for holding and updating the state of the [SimulatorCore].
class SimulatorCoreState {
  /// A class for holding and updating the state of the [SimulatorCore].
  SimulatorCoreState(this.mainThreadSendStream);

  /// A stream controller for forwarding events to send over the network to the
  /// steering hardware.
  StreamController<Uint8List>? steeringHardwareSendStream;

  /// A stream controller for forwarding events to send over the network to the
  /// remote control hardware.
  StreamController<Uint8List>? remoteControlSendStream;

  /// A stream controller for sending messages to the main thread.
  StreamController<dynamic> mainThreadSendStream;

  /// Whether the simulation should accept incoming control input from
  /// keyboard, gamepad, sliders etc...
  bool allowManualSimInput = false;

  /// Whether the simulation should run between GNSS updates when hardware
  /// is connected.
  bool allowSimInterpolation = true;

  /// The current vehicle of the simulation.
  Vehicle? vehicle;

  /// The previous vehicle state of the simulation.
  Vehicle? prevVehicle;

  /// The distance from the previous vehicle state to the current vehicle state.
  double distance = 0;

  /// How many previous positions should be used to calculate gauge values.
  int gaugesAverageCount = 10;

  /// A list of the last [gaugesAverageCount] GNSS updates.
  List<({Geographic gnssPosition, DateTime time})> prevGnssUpdates = [];

  /// The current GNSS update position and time.
  ({Geographic gnssPosition, DateTime time})? gnssUpdate;

  /// The GNSS update position and time that was used for updating gauges
  /// (distance).
  ({Geographic gnssPosition, DateTime time})? prevDistanceCalcGnssUpdate;

  /// The quality of the last GNSS fix.
  GnssFixQuality gnssFixQuality = GnssFixQuality.notAvailable;

  /// The minimum distance between GNSS updates for updating the bearing
  /// gauge.
  double get minBearingUpdateDistance => switch (gnssFixQuality) {
        GnssFixQuality.fix => 5,
        GnssFixQuality.differentialFix => 3,
        GnssFixQuality.floatRTK => 2.5,
        GnssFixQuality.ppsFix => 2,
        GnssFixQuality.rtk => 0.5,
        _ => double.infinity,
      };

  /// The upper threshold for the standard deviation of the bearings from the
  /// [prevGnssUpdates] and the [gnssUpdate].
  ///
  /// If the deviation is lower than the threshold, the IMU bearing zero
  /// value will be set to the average of the bearings.
  double get bearingZeroDeviationMaxThreshold => switch (gnssFixQuality) {
        GnssFixQuality.fix => 0.03,
        GnssFixQuality.differentialFix => 0.02,
        GnssFixQuality.floatRTK => 0.01,
        GnssFixQuality.ppsFix => 0.01,
        GnssFixQuality.rtk => 0.006,
        _ => double.infinity,
      };

  /// The last time the IMU bearing was zeroed.
  DateTime? bearingZeroTime;

  /// Minimum number of seconds to wait before the next attempt at setting
  /// a new IMU bearing zero.
  int bearingZeroMinDuration = 10;

  /// The velocity of the current vehicle, as calculated from the [distance] and
  /// [period].
  double gaugeVelocity = 0;

  /// The bearing of the current vehicle, as calculated from the previous
  /// position to the current position.
  double gaugeBearing = 0;

  /// The sign for which direction the vehicle is driving.
  int drivingDirectionSign = 1;

  /// The target steering angle when guidance is active.
  double? steeringAngleTarget;

  /// The target WAS reading value.
  int? wasTarget;

  /// Whether the state changed in the last update.
  bool didChange = true;

  /// The recorded path tracking to drive after, if there is one.
  PathTracking? pathTracking;

  /// The AB-line or curve to drive after, if there is one.
  ABTracking? abTracking;

  /// A configuration for [abTracking] parameters.
  ABConfig? abConfig;

  /// Whether driving without
  /// [autosteeringState] = [AutosteeringState.enabled] should update path
  /// tracking paths.
  bool allowManualTrackingUpdates = true;

  /// A static turning circle center to keep while the steering angle is
  /// constant. We use this due to small errors when using the
  /// [vehicle].turningRadiusCenter as it would move around slightly as the
  /// vehicle is moving, and cause wrong calculations.
  Geographic? turningCircleCenter;

  /// Whether the simulator is receiving manual input.
  bool receivingManualInput = false;

  /// If this is not [SimInputChange.hold] then the [vehicle]'s velocity is
  /// manually changed due to input to the sim.
  SimInputChange velocityChange = SimInputChange.hold;

  /// If this is not [SimInputChange.hold] then the [vehicle]'s
  /// steeringAngleInput is manually changed due to input to the sim.
  SimInputChange steeringChange = SimInputChange.hold;

  /// Whether the vehicle should automatically slow down when no input is given.
  bool autoSlowDown = false;

  /// Whether the vehicle should automatically center the when no input is
  /// given.
  bool autoCenterSteering = false;

  /// Whehter the vehicle should automatically steer.
  AutosteeringState autosteeringState = AutosteeringState.disabled;

  /// Which mode the [pathTracking] should use to go from the last to the first
  /// waypoint.
  PathTrackingLoopMode pathTrackingLoopMode = PathTrackingLoopMode.straight;

  /// Which steering mode the [pathTracking] should use.
  PathTrackingMode pathTrackingMode = PathTrackingMode.purePursuit;

  /// The interpolation distance for points in the [pathTracking]
  double pathInterpolationDistance = 4;

  /// The previous time of when the simulation was updated.
  DateTime prevUpdateTime = DateTime.now();

  /// The time period between the last update and this current update.
  ///
  /// In seconds.
  double period = 0;

  /// Whether we should force update for the next update, i.e. send the state.
  bool forceChange = false;

  /// Whether motor calibration mode is active.
  bool motorCalibrationEnabled = false;

  /// Update the [prevUpdateTime] and the [period] for the next simulation.
  void updateTime() {
    final now = DateTime.now();
    period = now.difference(prevUpdateTime).inMicroseconds / 1e6;
    prevUpdateTime = now;
  }

  /// Change state parameters/values according to the incomming [message].
  void handleMessage(dynamic message) {
    // Force update to reflect changes in case we haven't moved.
    forceChange = true;
    // Set the vehicle to simulate.
    if (message is Vehicle) {
      vehicle = message.copyWith(
        velocity: vehicle?.velocity,
        bearing: vehicle?.bearing,
        steeringAngleInput: vehicle?.steeringAngleInput
            .clamp(-message.steeringAngleMax, message.steeringAngleMax),
        hitchFrontFixedChild:
            message.hitchFrontFixedChild ?? vehicle?.hitchFrontFixedChild,
        hitchRearFixedChild:
            message.hitchRearFixedChild ?? vehicle?.hitchRearFixedChild,
        hitchRearTowbarChild:
            message.hitchRearTowbarChild ?? vehicle?.hitchRearTowbarChild,
        manualSimulationMode: allowManualSimInput,
      );
      pathTrackingMode = message.pathTrackingMode;
    }
    // Update whether the simulation should accept manual controls.
    else if (message is ({bool allowManualSimInput})) {
      allowManualSimInput = message.allowManualSimInput;
      vehicle = vehicle?.copyWith(manualSimulationMode: allowManualSimInput);
    }
    // Update whether the simulation should interpolate between the GNSS
    // updates.
    else if (message is ({bool allowSimInterpolation})) {
      allowSimInterpolation = message.allowSimInterpolation;
    }
    // Update the IMU config of the vehicle.
    else if (message is ImuConfig) {
      vehicle?.imu.config = message;
    }

    // Update the vehicle position.
    else if (message is ({Geographic position})) {
      vehicle?.position = message.position;
    }
    // Update the vehicle position from GNSS.
    else if (message is ({Geographic gnssPosition, DateTime time})) {
      if (!allowManualSimInput) {
        gnssUpdate = message;
      }
    }
    // Update the vehicle GNSS fix quality.
    else if (message is ({int gnssFixQuality})) {
      gnssFixQuality = GnssFixQuality.values[message.gnssFixQuality];
    }
    // Update the vehicle velocity
    else if (message is ({num velocity})) {
      if (allowManualSimInput) {
        vehicle?.velocity = message.velocity.toDouble();
        velocityChange = SimInputChange.hold;
      }
    }
    // Updates the IMU reading of the vehicle
    else if (message is ImuReading) {
      vehicle?.imu.addReading(message);
    }

    // Update the WAS config of the vehicle.
    else if (message is WasConfig) {
      vehicle?.was.config = message;
    }
    // Update the motor config of the vehicle.
    else if (message is SteeringHardwareConfig) {
      vehicle?.steeringHardwareConfig = message;
    }

    // Update bearing
    else if (message is ({double bearing})) {
      vehicle?.bearing = message.bearing;
    }
    // Update pitch
    else if (message is ({double pitch})) {
      vehicle?.pitch = message.pitch;
    }
    // Update roll
    else if (message is ({double roll})) {
      vehicle?.roll = message.roll;
    }
    // Update the WAS reading of the vehicle.
    else if (message is WasReading) {
      if (vehicle != null) {
        vehicle!.was.reading = message;
        if (vehicle!.was.config.useWas) {
          vehicle!.setSteeringAngleByWasReading();
        }
      }
    }
    // Update number of updates to use for gauge averages.
    else if (message is ({int gaugesAverageCount})) {
      gaugesAverageCount = message.gaugesAverageCount;
    }
    // Set the zero points for the IMU pitch and roll.
    else if (message is ({bool setZeroIMUPitchAndRoll})) {
      if (vehicle != null) {
        if (message.setZeroIMUPitchAndRoll) {
          vehicle!.imu.setPitchAndRollZeroToCurrentReading();
        } else {
          vehicle!.imu.setPitchAndRollZeroTo(pitchZero: 0, rollZero: 0);
        }
      }
    }
    // Set the zero point for the IMU bearing.
    else if (message is ({bool setZeroIMUBearingToNorth})) {
      if (vehicle != null) {
        if (message.setZeroIMUBearingToNorth) {
          vehicle!.imu.setBearingZeroToCurrentReading();
        } else {
          vehicle!.imu.setBearingZeroTo(0);
        }
      }
    } // Set the zero point for the IMU bearing to the next GNSS bearing.
    else if (message is ({bool setZeroIMUBearingToNextGNSSBearing})) {
      if (message.setZeroIMUBearingToNextGNSSBearing && vehicle != null) {
        vehicle!.imu.bearingIsSet = false;
      }
    }
    // Update the vehicle velocity at a set rate.
    else if (message is ({SimInputChange velocityChange})) {
      if (allowManualSimInput) {
        velocityChange = message.velocityChange;
      }
    }
    // Update the vehicle steering angle at a set rate.
    else if (message is ({SimInputChange steeringChange})) {
      if (allowManualSimInput) {
        receivingManualInput = message.steeringChange != SimInputChange.hold;
        steeringChange = message.steeringChange;
      }
    }
    // Update the vehicle steering angle input.
    else if (message is ({num steeringAngle})) {
      if (allowManualSimInput) {
        vehicle?.steeringAngleInput = message.steeringAngle.toDouble();
        steeringChange = SimInputChange.hold;
      }
    }
    // Enable/disable auto steering.
    else if (message is ({bool enableAutoSteer})) {
      if (message.enableAutoSteer) {
        mainThreadSendStream.add(
          LogEvent(Level.warning, 'Attempting to activate Autosteer.'),
        );

        if (abTracking != null || pathTracking != null) {
          autosteeringState = AutosteeringState.enabled;
          mainThreadSendStream
              .add(LogEvent(Level.warning, 'Autosteer enabled!'));
        } else {
          autosteeringState = AutosteeringState.disabled;
          mainThreadSendStream.add(
            LogEvent(
              Level.warning,
              'Autosteer disabled! No guidance available to track after.',
            ),
          );
        }
      }
      // Disable autosteer and motor
      else if (autosteeringState != AutosteeringState.disabled) {
        autosteeringState = AutosteeringState.disabled;
        mainThreadSendStream.add(
          LogEvent(
            Level.warning,
            'Autosteer disabled!',
          ),
        );
      }
    } else if (message is ({bool enableAutoSteer, bool noCommand})) {
      if (message.noCommand && autosteeringState == AutosteeringState.enabled) {
        autosteeringState = AutosteeringState.disabled;
      }
    } else if (message is ({bool enableAutoSteer, bool stalled})) {
      if (message.stalled) {
        autosteeringState = AutosteeringState.disabled;
      }
    }
    // Set the path tracking model.
    else if (message is ({PathTracking? pathTracking})) {
      pathTracking = message.pathTracking;
      if (message.pathTracking != null) {
        abTracking = null;
      }
    }
    // Update vehicle nudge distance.
    else if (message is ({num nudgeDistance})) {
      vehicle?.nudgeDistance = message.nudgeDistance.toDouble();
    }
    // Incrementally update the vehicle nudge distance.
    else if (message is ({num nudgeIncrement})) {
      vehicle?.nudgeDistance += message.nudgeIncrement;
    }
    // Update whether to automatically slow down.
    else if (message is ({bool autoSlowDown})) {
      autoSlowDown = message.autoSlowDown;
    }
    // Update whether to automatically center the steering.
    else if (message is ({bool autoCenterSteering})) {
      autoCenterSteering = message.autoCenterSteering;
    }
    // Update pure pursuit parameters.
    else if (message is PurePursuitParameters) {
      vehicle?.purePursuitParameters = message;
    }
    // Update Stanley parameters.
    else if (message is StanleyParameters) {
      vehicle?.stanleyParameters = message;
    }

    // Change pure pursuit mode.
    else if (message is PathTrackingMode) {
      pathTrackingMode = message;
      vehicle?.pathTrackingMode = pathTrackingMode;
      if (pathTracking != null) {
        final index = pathTracking!.currentIndex;
        pathTracking = switch (pathTrackingMode) {
          PathTrackingMode.purePursuit => PurePursuitPathTracking(
              wayPoints: pathTracking!.wayPoints,
              interpolationDistance: pathInterpolationDistance,
              loopMode: pathTrackingLoopMode,
            ),
          PathTrackingMode.stanley => StanleyPathTracking(
              wayPoints: pathTracking!.wayPoints,
              interpolationDistance: pathInterpolationDistance,
              loopMode: pathTrackingLoopMode,
            ),
        }
          ..cumulativeIndex = index;
      }
    } else if (message is ({double pathInterpolationDistance})) {
      pathInterpolationDistance = message.pathInterpolationDistance;
      // Interpolate the path with new max distance.
      pathTracking?.interPolateWayPoints(
        newInterpolationDistance: pathInterpolationDistance,
        newLoopMode: pathTrackingLoopMode,
      );
      // Find the current index as the closest point since the path has updated.
      if (pathTracking != null && vehicle != null) {
        pathTracking!.cumulativeIndex = pathTracking!.closestIndex(vehicle!);
      }
    }
    // Change the pure pursuit loop mode, i.e. if/how to go from the last to
    // the first point.
    else if (message is ({PathTrackingLoopMode pathTrackingLoopMode})) {
      pathTrackingLoopMode = message.pathTrackingLoopMode;
      // Interpolate the path since we might have new points.
      pathTracking?.interPolateWayPoints(
        newInterpolationDistance: pathInterpolationDistance,
        newLoopMode: pathTrackingLoopMode,
      );
      // Find the current index as the closest point since the path has updated.
      if (pathTracking != null && vehicle != null) {
        pathTracking!.cumulativeIndex = pathTracking!.closestIndex(vehicle!);
      }
    }
    // Attach a new equipment. Detach by sending null as the equipment with
    // the same hitch position.
    else if (message is ({Equipment child, Hitch position})) {
      vehicle?.attachChild(message.child, message.position);
    }
    // Attach a new equipment. Detach by sending null as the equipment with
    // the same hitch position.
    else if (message is ({
      String parentUuid,
      Equipment child,
      Hitch position
    })) {
      vehicle?.attachChildTo(
        message.parentUuid,
        message.child,
        message.position,
      );
    }
    // Update an already attached equipment in the hierarchy.
    else if (message is ({Equipment updatedEquipment})) {
      vehicle?.updateChild(message.updatedEquipment);
    }
    // Detach an equipment in the hierarchy.
    else if (message is ({String detachUuid})) {
      vehicle?.detachChild(message.detachUuid);
    }
    // Detach all equipment in the hierarchy from the parent with the given
    // uuid.
    else if (message is ({String detachAllFromUuid})) {
      vehicle?.detachAllFrom(message.detachAllFromUuid);
    }
    // Apply the sent equipment setup to the chosen parent.
    else if (message is ({EquipmentSetup equipmentSetup, String parentUuid})) {
      final parent = vehicle?.findChildRecursive(message.parentUuid);
      if (parent != null) {
        message.equipmentSetup.attachChildrenTo(parent);
      }
    }
    // Update the active sections of the equipment with the given uuid.
    else if (message is ({String uuid, List<bool> activeSections})) {
      final equipment = vehicle?.findChildRecursive(message.uuid);
      if (equipment != null && equipment is Equipment) {
        message.activeSections.forEachIndexed((index, element) {
          equipment.sections[index].active = element;
        });
      }
    }
    // Update whether to automate section activation of the equipment with the
    // given uuid.
    else if (message is ({String uuid, List<bool> automateActiveSections})) {
      final equipment = vehicle?.findChildRecursive(message.uuid);
      if (equipment != null && equipment is Equipment) {
        message.automateActiveSections.forEachIndexed((index, element) {
          equipment.sections[index].automateActivation = element;
        });
      }
    }
    // Update the AB-line to follow
    else if (message is ({ABTracking? abTracking})) {
      abTracking = message.abTracking?..applyConfig(abConfig);
      if (message.abTracking != null) {
        pathTracking = null;
      }
      if (vehicle != null &&
          !const SetEquality<int>().equals(
            abTracking?.finishedOffsets,
            abTracking?.offsetsInsideBoundary,
          )) {
        abTracking?.setCurrentOffsetToClosest(vehicle!);
      }
    }
    // Update if the AB-tracking to the new config
    else if (message is ABConfig) {
      abConfig = message;
      abTracking?.applyConfig(message);
      if (vehicle != null && abTracking is ABCurve) {
        abTracking?.updateNextOffset(vehicle!);
        (abTracking! as ABCurve)
            .updateCurrentPathTracking(vehicle!, force: true);
      }
    }
    // Sets whether the AB-tracking should snap to the closest line.
    else if (message is ({bool abSnapToClosestLine})) {
      abTracking?.snapToClosestLine = message.abSnapToClosestLine;
    }
    // Move the AB-tracking offset by 1 to the left if negative or to the
    // right if positive.
    else if (message is ({int abMoveOffset})) {
      if (vehicle != null) {
        switch (message.abMoveOffset.isNegative) {
          case true:
            abTracking?.moveOffsetLeft(
              vehicle!,
              offset: message.abMoveOffset.abs(),
            );
          case false:
            abTracking?.moveOffsetRight(
              vehicle!,
              offset: message.abMoveOffset.abs(),
            );
        }
      }
    }
    // Reset AB tracking finished offsets (lines).
    else if (message is ({bool abTrackingClearFinishedOffsets})) {
      if (abTracking != null && message.abTrackingClearFinishedOffsets) {
        abTracking!.clearFinishedOffsets();
        mainThreadSendStream.add(
          LogEvent(
            Level.info,
            'Cleared ABTracking finished offsets.',
          ),
        );
      }
    }
    // Reset AB tracking finished offsets (lines).
    else if (message is ({bool abTrackingRecalculateLines})) {
      if (abTracking != null && message.abTrackingRecalculateLines) {
        mainThreadSendStream.add(
          LogEvent(
            Level.info,
            'Recalculating ABTracking lines...',
          ),
        );
        abTracking!.calculateLinesWithinBoundary();
        mainThreadSendStream.add(
          LogEvent(
            Level.info,
            'Recalculated ABTracking lines.',
          ),
        );
      }
    }
    // Update whether manual driving should update path tracking.
    else if (message is ({bool allowManualTrackingUpdates})) {
      allowManualTrackingUpdates = message.allowManualTrackingUpdates;
    }
    // Tell hardware to connect to this device as tcp ntrip server.
    else if (message is ({Uint8List useAsNtripServer})) {
      steeringHardwareSendStream?.add(message.useAsNtripServer);
    }
    // Enable/disable motor calibration.
    else if (message is ({bool enableMotorCalibration})) {
      motorCalibrationEnabled = message.enableMotorCalibration;
    }
    // Send a steering angle override target to the motor.
    else if (message is ({double? steeringAngleOverride})) {
      if (message.steeringAngleOverride != null && vehicle != null) {
        steeringHardwareSendStream?.add(
          const Utf8Encoder().convert(
            jsonEncode(
              {
                'was_target': vehicle!.wasTargetFromSteeringAngle(
                  message.steeringAngleOverride!,
                ),
                'enable_motor': true,
              },
            ),
          ),
        );
      } else {
        steeringHardwareSendStream?.add(
          const Utf8Encoder().convert(
            jsonEncode(
              {
                'enable_motor': false,
              },
            ),
          ),
        );
      }
    }
    // Unknown message, log it to figure out what it is.
    else {
      mainThreadSendStream.add(
        LogEvent(
          Level.warning,
          'Simulator Core received unknown message: $message',
        ),
      );
    }
  }

  /// Check if [autoSlowDown] or [autoCenterSteering] should decrease the
  /// parameters they control.
  void simUpdateVehicleVelocityAndSteering() {
    if (vehicle != null) {
      // The acceleration rate of the vehicle, m/s^2.
      const accelerationRate = 3;

      // The acceleration rate when braking, m/s^2.
      const brakingRate = 7;

      switch (velocityChange) {
        case SimInputChange.reset:
          vehicle!.velocity = 0;
          velocityChange = SimInputChange.hold;
        case SimInputChange.increase:
          vehicle!.velocity = (vehicle!.velocity +
                  period *
                      switch (vehicle!.velocity.isNegative) {
                        true => brakingRate,
                        false => accelerationRate,
                      })
              .clamp(-12.0, 12.0);
        case SimInputChange.decrease:
          vehicle!.velocity = (vehicle!.velocity -
                  period *
                      switch (vehicle!.velocity.isNegative) {
                        true => accelerationRate,
                        false => brakingRate,
                      })
              .clamp(-12.0, 12.0);

        case SimInputChange.hold:
          if (autoSlowDown) {
            // Slowing rate m/s^2
            const slowingRate = 2;

            vehicle!.velocity = switch (vehicle!.velocity.abs() > 0.1) {
              true => vehicle!.velocity -
                  period *
                      slowingRate *
                      vehicle!.velocity /
                      vehicle!.velocity.abs(),
              false => 0,
            };
          }
      }

      // The steering rate of the vehicle, deg/s
      const steeringRate = 30;

      if (!receivingManualInput &&
          steeringAngleTarget != null &&
          autosteeringState == AutosteeringState.enabled) {
        final pidVelocity =
            vehicle!.simulatedMotorVelocityPid(steeringAngleTarget!);
        vehicle!.steeringAngleInput = (vehicle!.steeringAngleInput +=
                ((pidVelocity * steeringRate)
                        .clamp(-steeringRate, steeringRate)) *
                    period)
            .clamp(-vehicle!.steeringAngleMax, vehicle!.steeringAngleMax);
      } else {
        switch (steeringChange) {
          case SimInputChange.reset:
            vehicle!.steeringAngleInput = 0;
            steeringChange = SimInputChange.hold;

          case SimInputChange.increase:
            if (vehicle!.steeringAngleInput == 0) {
              vehicle!.steeringAngleInput = 0.01;
            }
            vehicle!.steeringAngleInput = (vehicle!.steeringAngleInput +
                    period * steeringRate)
                .clamp(-vehicle!.steeringAngleMax, vehicle!.steeringAngleMax);
          case SimInputChange.decrease:
            if (vehicle!.steeringAngleInput == 0) {
              vehicle!.steeringAngleInput = -0.01;
            }
            vehicle!.steeringAngleInput = (vehicle!.steeringAngleInput -
                    period * steeringRate)
                .clamp(-vehicle!.steeringAngleMax, vehicle!.steeringAngleMax);

          case SimInputChange.hold:
            receivingManualInput = false;
            if (autoCenterSteering &&
                autosteeringState == AutosteeringState.disabled) {
              // Centering rate deg/s, slow down to not overshoot the min steering
              // angle in the opposite direction
              final centeringRate =
                  switch (vehicle!.steeringAngle.abs() < 0.5) {
                false => 25,
                true => 5,
              };

              vehicle!.steeringAngleInput = switch (
                  vehicle!.steeringAngle.abs() < Vehicle.minSteeringAngle) {
                true => 0,
                false => vehicle!.steeringAngleInput -
                    period *
                        centeringRate *
                        vehicle!.steeringAngleInput.abs() /
                        vehicle!.steeringAngleInput,
              };
            }
        }
      }
      // Filter out very low angles as they make the simulation spazz out
      // because the turning circles get very large.
      if (vehicle!.steeringAngleInput.abs() < Vehicle.minSteeringAngle) {
        vehicle!.steeringAngleInput = 0;
      }
    }
  }

  /// Check if we should update the turning circle center. We only do this
  /// if the steering angle has changed.
  void checkTurningCircle() {
    if (vehicle?.steeringAngle != prevVehicle?.steeringAngle ||
        vehicle.runtimeType != prevVehicle.runtimeType) {
      turningCircleCenter = vehicle?.turningRadiusCenter;
    }
  }

  /// Check and update the guidance, autosteering etc...
  ///
  /// Checks and updates the [abTracking] and [pathTracking].
  void checkGuidance() {
    if (vehicle != null) {
      abTracking?.checkAutoOffsetSnap(vehicle!);
      if (autosteeringState == AutosteeringState.disabled &&
          allowManualTrackingUpdates &&
          vehicle!.velocity.abs() > 0) {
        if (abTracking != null) {
          if (abTracking!.isCompleted) {
            abTracking!.currentPathTracking = null;
          } else {
            abTracking!.manualUpdate(vehicle!);
          }
        }
        if (pathTracking != null) {
          pathTracking!.cumulativeIndex = pathTracking!.closestIndex(vehicle!);
        }
      }

      steeringAngleTarget = 0.0;
      if (abTracking != null) {
        if (abTracking!.isCompleted &&
            autosteeringState != AutosteeringState.disabled) {
          autosteeringState = AutosteeringState.disabled;
          abTracking!.currentPathTracking = null;
          mainThreadSendStream
            ..add(LogEvent(Level.info, 'ABTracking finished.'))
            ..add(LogEvent(Level.warning, 'Autosteer disabled!'));
        } else {
          steeringAngleTarget =
              abTracking!.nextSteeringAngle(vehicle!, mode: pathTrackingMode) ??
                  0;
        }
      } else if (pathTracking != null) {
        if (pathTracking!.isCompleted &&
            pathTrackingLoopMode == PathTrackingLoopMode.none &&
            autosteeringState != AutosteeringState.disabled) {
          autosteeringState = AutosteeringState.disabled;
          mainThreadSendStream
            ..add(LogEvent(Level.info, 'PathTracking finished.'))
            ..add(LogEvent(Level.warning, 'Autosteer disabled!'));
        } else {
          pathTracking!.tryChangeWayPoint(vehicle!);
          steeringAngleTarget = pathTracking!.nextSteeringAngle(vehicle!);
        }
      }

      if (autosteeringState != AutosteeringState.disabled &&
          !receivingManualInput &&
          !motorCalibrationEnabled) {
        if (vehicle!.velocity.abs() > vehicle!.autosteeringThresholdVelocity) {
          wasTarget = vehicle!.wasTargetFromSteeringAngle(steeringAngleTarget!);
          steeringHardwareSendStream?.add(
            const Utf8Encoder().convert(
              jsonEncode(
                {
                  'was_target': wasTarget,
                  'enable_motor': true,
                },
              ),
            ),
          );
          autosteeringState = AutosteeringState.enabled;
        } else {
          autosteeringState = AutosteeringState.standby;
          wasTarget = null;
          steeringHardwareSendStream?.add(
            const Utf8Encoder().convert(
              jsonEncode(
                {
                  'enable_motor': false,
                },
              ),
            ),
          );
        }
      } else if (motorCalibrationEnabled) {
        steeringHardwareSendStream?.add(
          const Utf8Encoder().convert(
            jsonEncode(
              {
                'motor_en_cal': motorCalibrationEnabled,
                'enable_motor': motorCalibrationEnabled,
              },
            ),
          ),
        );
        wasTarget = null;
      } else {
        wasTarget = null;
        steeringHardwareSendStream?.add(
          const Utf8Encoder().convert(
            jsonEncode(
              {
                'enable_motor': false,
              },
            ),
          ),
        );
      }
      mainThreadSendStream
        ..add((steeringAngleTarget: steeringAngleTarget))
        ..add((wasTarget: wasTarget));
    }
    if (abTracking == null &&
        pathTracking == null &&
        autosteeringState != AutosteeringState.disabled) {
      autosteeringState = AutosteeringState.disabled;
      mainThreadSendStream
        ..add(LogEvent(Level.info, 'No guidance available.'))
        ..add(LogEvent(Level.warning, 'Autosteer disabled!'));
    }
  }

  /// Updates the calculated gauges for the vehicle state only by the
  /// simulation and possibly IMU.
  void _simGaugeUpdate() {
    if (vehicle != null && allowManualSimInput) {
      // Distance
      if (prevVehicle != null) {
        final movedDistance =
            vehicle!.position.rhumb.distanceTo(prevVehicle!.position);

        // Filter out too large distances
        if (movedDistance < 5) {
          distance = movedDistance;
        }
      } else {
        distance = 0;
      }
      // If IMU bearing not in use.
      if (!vehicle!.imu.config.useYaw || allowManualSimInput) {
        // Bearing, only updated if we're moving to keep bearing while
        // stationary.
        if (prevVehicle != null && (vehicle!.velocity.abs()) > 0.1) {
          // Discard bearing changes over 10 degrees for one simulation step.
          if (bearingDifference(prevVehicle!.bearing, vehicle!.bearing) < 10) {
            final bearing = prevVehicle!.position.rhumb.finalBearingTo(
              vehicle!.position,
            );
            if (!bearing.isNaN) {
              gaugeBearing = bearing;
            }
          }
        }
      }

      // Velocity
      if (period > 0 && allowManualSimInput) {
        // If the position change bearing is more than 120 deg from the
        // vehicle's bearing, assume we're in reverse.
        final directionSign = switch (
            bearingDifference(vehicle!.bearingRaw, gaugeBearing) > 120) {
          true => -1,
          false => 1,
        };
        gaugeVelocity = directionSign * distance / period;
        if (directionSign == -1) {
          gaugeBearing = (gaugeBearing + 180).wrap360();
        }
      } else {
        gaugeVelocity = 0;
      }
    }
  }

  /// Updates the calculated gauges for the vehicle state.
  void updateGauges() {
    // Update based on the last GNSS updates, if we've received one this tick.
    if (gnssUpdate != null) {
      if (gnssUpdate != null && prevGnssUpdates.lastOrNull != null) {
        // Correct for roll and pitch if IMU bearing is set.
        if (vehicle!.imu.bearingIsSet && vehicle!.imu.config.usePitchAndRoll) {
          gnssUpdate = (
            gnssPosition: vehicle!
                .correctPositionForRollAndPitch(gnssUpdate!.gnssPosition),
            time: gnssUpdate!.time
          );
        }

        var distances = prevGnssUpdates
            .map(
              (e) => e.gnssPosition.rhumb.distanceTo(gnssUpdate!.gnssPosition),
            )
            .toList();

        final distanceToLastGaugePoint = prevDistanceCalcGnssUpdate != null
            ? gnssUpdate!.gnssPosition.rhumb
                .distanceTo(prevDistanceCalcGnssUpdate!.gnssPosition)
            : 0.0;
        if (distanceToLastGaugePoint > minBearingUpdateDistance / 5) {
          distance = distanceToLastGaugePoint;
          prevDistanceCalcGnssUpdate = gnssUpdate;
        } else {
          distance = 0;
        }
        prevDistanceCalcGnssUpdate ??= gnssUpdate;

        var velocities = prevGnssUpdates.mapIndexed(
          (index, element) =>
              distances.elementAt(index) /
              ((gnssUpdate!.time.difference(element.time).inMicroseconds) /
                  1e6),
        );
        var velocityAvg = velocities.average;

        CheckIfUpdateIsUsable:
        // We only set the initial bearing for the IMU if we have a velocity
        // > 0.5 m/s.
        if (velocityAvg.abs() < 0.5 && !vehicle!.imu.bearingIsSet) {
          gaugeVelocity = velocityAvg * vehicle!.velocity.sign;
        }
        // Set the initial bearing for the IMU.  The direction travelled will
        // be set as forward.
        else if (!vehicle!.imu.bearingIsSet) {
          // We need a few previous points to get a good bearing.
          if (prevGnssUpdates.length < 2) {
            gaugeVelocity = velocityAvg * vehicle!.velocity.sign;
            break CheckIfUpdateIsUsable;
          }

          final bearing = prevGnssUpdates[prevGnssUpdates.length - 2]
              .gnssPosition
              .rhumb
              .finalBearingTo(gnssUpdate!.gnssPosition);

          if (!bearing.isFinite) {
            gaugeVelocity = velocityAvg * vehicle!.velocity.sign;
            break CheckIfUpdateIsUsable;
          }

          vehicle!.imu
            ..config = vehicle!.imu.config.copyWith(
              zeroValues: vehicle!.imu.config.zeroValues.copyWith(
                bearingZero: (vehicle!.imu.reading.yaw - bearing).wrap360(),
              ),
            )
            ..bearingIsSet = true;

          // Update the already recorded positions to correct for the
          // vehicle pitch and roll.
          if (vehicle!.imu.config.usePitchAndRoll) {
            gnssUpdate = (
              gnssPosition: vehicle!
                  .correctPositionForRollAndPitch(gnssUpdate!.gnssPosition),
              time: gnssUpdate!.time
            );
            prevGnssUpdates = prevGnssUpdates
                .map(
                  (e) => (
                    gnssPosition:
                        vehicle!.correctPositionForRollAndPitch(e.gnssPosition),
                    time: e.time
                  ),
                )
                .toList();

            // Update the distances and velocities based on the corrected
            // positions.
            distances = prevGnssUpdates
                .map(
                  (e) =>
                      e.gnssPosition.rhumb.distanceTo(gnssUpdate!.gnssPosition),
                )
                .toList();

            velocities = prevGnssUpdates.mapIndexed(
              (index, element) =>
                  distances.elementAt(index) /
                  ((gnssUpdate!.time.difference(element.time).inMicroseconds) /
                      1e6),
            );

            velocityAvg = velocities.average;

            gaugeVelocity = velocityAvg;
            gaugeBearing = bearing;
          }
        } else {
          // Only update bearing if distance to a previous position is larger
          // than [minBearingUpdateDistance].
          final prevPositionIndex = distances
              .lastIndexWhere((element) => element > minBearingUpdateDistance);

          double? bearing;
          if (prevPositionIndex > -1) {
            bearing = prevGnssUpdates
                .elementAt(prevPositionIndex)
                .gnssPosition
                .rhumb
                .finalBearingTo(gnssUpdate!.gnssPosition);
          }
          if (bearing == null) {
            gaugeVelocity = velocityAvg * vehicle!.velocity.sign;
            if (vehicle!.imu.bearingIsSet && vehicle!.imu.bearing != null) {
              gaugeBearing = vehicle!.imu.bearing!;
            }
            break CheckIfUpdateIsUsable;
          }

          final bearingReference = switch (allowManualSimInput) {
            true => vehicle!.bearingRaw,
            false => vehicle!.imu.bearing ?? vehicle!.bearingRaw,
          };

          drivingDirectionSign =
              switch (bearingDifference(bearing, bearingReference) > 90) {
            true => -1,
            false => 1,
          };

          final directionCorrectedBearing = switch (
              drivingDirectionSign.isNegative) {
            true => (bearing + 180).wrap360(),
            false => bearing
          };

          if (bearingZeroTime == null ||
              DateTime.now()
                      .difference(bearingZeroTime ?? DateTime.now())
                      .inSeconds >
                  bearingZeroMinDuration) {
            final bearings = prevGnssUpdates.map(
              (e) {
                final bearing = e.gnssPosition.rhumb
                    .finalBearingTo(gnssUpdate!.gnssPosition);

                return switch (drivingDirectionSign.isNegative) {
                  true => (bearing + 180).wrap360(),
                  false => bearing
                };
              },
            );

            final bearingAvg = bearingAverage(bearings);
            final bearingStdDev = bearingStandardDeviation(bearings);
            // If the variance is very low, we can assume a straight line and
            // set the IMU bearing zero value to the average bearing.
            if (bearingStdDev < bearingZeroDeviationMaxThreshold) {
              vehicle!.imu
                ..config = vehicle!.imu.config.copyWith(
                  zeroValues: vehicle!.imu.config.zeroValues.copyWith(
                    bearingZero:
                        (vehicle!.imu.reading.yaw - bearingAvg).wrap360(),
                  ),
                )
                ..bearingIsSet = true;
              mainThreadSendStream.add(
                LogEvent(
                  Level.info,
                  '''Straight line detected, IMU bearing zero updated: ${(vehicle!.imu.reading.yaw - bearingAvg).wrap360()}°, measures avg: $bearingAvg°, std.dev: $bearingStdDev''',
                ),
              );
              bearingZeroTime = DateTime.now();
            }
          }

          gaugeBearing = directionCorrectedBearing;
          gaugeVelocity = drivingDirectionSign * velocityAvg;
        }

        prevGnssUpdates.add(gnssUpdate!);

        // Remove the oldest updates if there are more than [gaugesAverageCount]
        // in the current list.
        while (prevGnssUpdates.length > gaugesAverageCount) {
          prevGnssUpdates.removeAt(0);
        }

        return;
      }
      prevGnssUpdates.add(gnssUpdate!);

      // Remove the oldest updates if there are more than [gaugesAverageCount]
      // in the current list.
      while (prevGnssUpdates.length > gaugesAverageCount) {
        prevGnssUpdates.removeAt(0);
      }
    } else if (gnssUpdate == null && !allowManualSimInput) {
      gaugeBearing = vehicle!.bearing;
      if (prevVehicle != null && vehicle != null) {
        distance = 0;
      }
    } else if (allowManualSimInput) {
      _simGaugeUpdate();
    }
  }

  /// Update the simulation, i.e. simulate the next step.
  void update() {
    didChange = false;
    if (gnssUpdate != null ||
        allowSimInterpolation ||
        allowManualSimInput ||
        forceChange) {
      checkGuidance();

      if (allowManualSimInput) {
        simUpdateVehicleVelocityAndSteering();
      }
      checkTurningCircle();
      updateTime();

      final oldGaugeVelocity = gaugeVelocity;

      if (vehicle != null) {
        // Update by GNSS
        if (gnssUpdate != null && !allowManualSimInput) {
          vehicle!.position = gnssUpdate!.gnssPosition;
          turningCircleCenter = vehicle?.turningRadiusCenter;
          vehicle!.updateChildren(period);
        } else if (!allowManualSimInput && !allowSimInterpolation) {
          vehicle!.updateChildren(period);
        }
        // Update by simulation
        else if (allowManualSimInput || allowSimInterpolation) {
          vehicle!.updatePositionAndBearing(
            period,
            turningCircleCenter,
          );
          if (allowManualSimInput && gaugeVelocity.sign < 0) {
            gaugeBearing = (gaugeBearing + 180).wrap360();
          }
        }
        updateGauges();
        if (gnssUpdate != null && !allowManualSimInput) {
          vehicle!.bearing = gaugeBearing;
          vehicle!.velocity = gaugeVelocity;
        }
        gnssUpdate = null;
        vehicle!.wheelsRolledDistance += distance *
            switch (vehicle!.velocity < 0) {
              true => -1,
              false => 1,
            };
      }
      didChange = forceChange ||
          prevVehicle != vehicle ||
          oldGaugeVelocity != gaugeVelocity;
      prevVehicle = vehicle?.copyWith();
      forceChange = false;
    }
  }
}
