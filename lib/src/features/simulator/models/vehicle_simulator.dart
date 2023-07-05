import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';

/// A class for simulating how vehicles should move given their position,
/// heading, steering angle and velocity.
class VehicleSimulator {
  /// Targets 60 hz => 16666.66... micro seconds
  static const _targetPeriodMicroSeconds = 16667;

  /// Used on native platforms since they can easily be multithreaded.
  static Future<void> isolateWorker(SendPort sendPort) async {
    final commandPort = ReceivePort('SimVehicle');

    // Send a communication port in return.
    sendPort.send(commandPort.sendPort);

    log('Sim vehicle isolate spawn confirmation');

    // The state of the simulation.
    final state = _VehicleSimulatorState();

    // A timer for periodically updating the simulation.
    final timer = Timer.periodic(
        const Duration(microseconds: _targetPeriodMicroSeconds), (timer) {
      if (state.vehicle != null) {
        state.update();

        // If the vehicle has moved (changed) we send the new state back to the
        // main/UI isolate.
        if (state.didChange) {
          sendPort.send(
            (
              vehicle: state.vehicle,
              velocity: state.velocity,
              heading: state.heading,
              distance: state.distance,
              purePursuit: state.purePursuit,
            ),
          );
        }
      }
    });

    // Handle incoming messages.
    await for (final message in commandPort) {
      if (message != null) {
        state.handleMessage(message);
      }
      // Shut down the isolate.
      else {
        timer.cancel();
        break;
      }
    }
    log('Sim vehicle isolate exited.');
    Isolate.exit();
  }

  /// Used in web version since multithreading isn't possible.
  ///
  /// This takes in the stream [vehicleEvents] to get events/messages
  /// from the UI.
  static Stream<
      ({
        Vehicle? vehicle,
        num velocity,
        num heading,
        num distance,
        PurePursuit? purePursuit,
      })> webWorker(
    Stream<dynamic> vehicleEvents,
  ) async* {
    log('Sim vehicle worker spawned');

    // The state of the simulation.
    final state = _VehicleSimulatorState();

    // Handle the incoming messages.
    vehicleEvents.listen(state.handleMessage);

    // A stream generator that periodically updates the simulation and
    // sends the state.
    yield* Stream.periodic(
        const Duration(microseconds: _targetPeriodMicroSeconds), (timer) {
      if (state.vehicle != null) {
        state.update();
      }

      // The simulation data to send to the stream.
      final returnObject = (
        vehicle: state.vehicle,
        velocity: state.velocity,
        heading: state.heading,
        distance: state.distance,
        purePursuit: state.purePursuit,
      );

      return returnObject;
    });
  }
}

/// A class for holding and updating the state of the [VehicleSimulator].
class _VehicleSimulatorState {
  /// The current vehicle of the simulation.
  Vehicle? vehicle;

  /// The previous vehicle state of the simulation.
  Vehicle? prevVehicle;

  /// The distance from the previous vehicle state to the current vehicle state.
  double distance = 0;

  /// The velocity of the current vehicle, as calculated from the [distance] and
  /// [period].
  double velocity = 0;

  /// The heading of the current vehicle, as calculated from the previous
  /// position to the current position.
  double heading = 0;

  /// Whether the state changed in the last update.
  bool didChange = true;

  /// The pure pursuit to drive after, if there is one.
  PurePursuit? purePursuit;

  /// A static turning circle center to keep while the steering angle is
  /// constant. We use this due to small errors when using the
  /// [vehicle].turningRadiusCenter as it would move around slightly as the
  /// vehicle is moving, and cause wrong calculations.
  LatLng? turningCircleCenter;

  /// Whether the vehicle should automatically slow down when no input is given.
  bool autoSlowDown = false;

  /// Whether the vehicle should automatically center the when no input is
  /// given.
  bool autoCenterSteering = false;

  /// Whether the vehicle should use the [purePursuit] model to steer.
  bool enablePurePursuit = false;

  /// Which mode the [purePursuit] should use to go from the last to the first
  /// waypoint.
  PurePursuitLoopMode pursuitLoopMode = PurePursuitLoopMode.none;

  /// Which steering mode the [purePursuit] should use.
  PurePursuitMode pursuitMode = PurePursuitMode.pid;

  /// A temporary steering mode for the [purePursuit], only used when the
  /// [pursuitMode] is [PurePursuitMode.pid] and the lateral distance to
  /// the path is larger than the vehicle's min turning radius.
  PurePursuitMode tempPursuitMode = PurePursuitMode.pid;

  /// The distance ahead of the vehicle the [purePursuit] should look for the
  /// path when in look ahead mode.
  double lookAheadDistance = 4;

  /// The previous time of when the simulation was updated.
  DateTime prevUpdateTime = DateTime.now();

  /// The time period between the last update and this current update.
  double period = 0;

  /// Whether we should force update for the next update, i.e. send the state.
  bool forceChange = false;

  /// Update the [prevUpdateTime] and the [period] for the next simulation.
  void updateTime() {
    final now = DateTime.now();
    period = now.difference(prevUpdateTime).inMicroseconds / 1e6;
    prevUpdateTime = now;
  }

  /// Change state parameters/values according to the incomming [message].
  ///
  /// This can be [Vehicle], [VehicleInput], [PurePursuitMode] or records for
  /// [purePursuit], [autoSlowDown], [autoCenterSteering], [enablePurePursuit],
  /// [lookAheadDistance] or [pursuitLoopMode].
  void handleMessage(dynamic message) {
    // Set the vehicle to simulate.
    if (message is Vehicle) {
      vehicle = message.copyWith(
        velocity: vehicle?.velocity,
        heading: vehicle?.heading,
        steeringAngleInput: vehicle?.steeringAngleInput
            .clamp(-message.steeringAngleMax, message.steeringAngleMax),
      );
    }
    // Update the vehicle with new inputs.
    else if (message is VehicleInput && vehicle != null) {
      if (message.position != null) {
        vehicle?.position = message.position!;
      }
      if (message.velocity != null) {
        vehicle?.velocity = message.velocity!;
      } else if (message.velocityDelta != null) {
        vehicle?.velocity = (vehicle!.velocity +
                (autoSlowDown ? 1.2 : 1) * message.velocityDelta!)
            .clamp(-12.0, 12.0);
      }
      if (message.steeringAngle != null) {
        vehicle?.steeringAngleInput = message.steeringAngle!;
      } else if (message.steeringAngleDelta != null) {
        vehicle?.steeringAngleInput = (vehicle!.steeringAngleInput +
                (autoCenterSteering ? 2 : 1) * message.steeringAngleDelta!)
            .clamp(-vehicle!.steeringAngleMax, vehicle!.steeringAngleMax);
      }
    }
    // Set the pure pursuit model.
    else if (message is ({PurePursuit? purePursuit})) {
      purePursuit = message.purePursuit;
    }
    // Update whether to automatically slow down.
    else if (message is ({bool autoSlowDown})) {
      autoSlowDown = message.autoSlowDown;
    }
    // Update whether to automatically center the steering.
    else if (message is ({bool autoCenterSteering})) {
      autoCenterSteering = message.autoCenterSteering;
    }
    // Enable/disable pure pursuit.
    else if (message is ({bool enablePurePursuit})) {
      enablePurePursuit = message.enablePurePursuit;
      if (vehicle != null && purePursuit != null) {
        purePursuit?.currentIndex = purePursuit!.closestIndex(vehicle!);
      }
    }
    // Change pure pursuit mode.
    else if (message is PurePursuitMode) {
      pursuitMode = message;
      tempPursuitMode = pursuitMode;
    }
    // Set new look ahead distance.
    else if (message is ({double lookAheadDistance})) {
      lookAheadDistance = message.lookAheadDistance;
      // Interpolate the path with new max distance.
      purePursuit?.interPolateWayPoints(
        maxDistance: lookAheadDistance,
        loopMode: pursuitLoopMode,
      );
      // Find the current index as the closest point since the path has updated.
      if (purePursuit != null && vehicle != null) {
        purePursuit!.currentIndex = purePursuit!.closestIndex(vehicle!);
      }
    }
    // Change the pure pursuit loop mode, i.e. if/how to go from the last to
    // the first point.
    else if (message is ({PurePursuitLoopMode pursuitLoopMode})) {
      pursuitLoopMode = message.pursuitLoopMode;
      // Interpolate the path since we might have new points.
      purePursuit?.interPolateWayPoints(
        maxDistance: lookAheadDistance,
        loopMode: pursuitLoopMode,
      );
      // Find the current index as the closest point since the path has updated.
      if (purePursuit != null && vehicle != null) {
        purePursuit!.currentIndex = purePursuit!.closestIndex(vehicle!);
      }
    } else if (message is ({String uuid, List<bool> activeSegments})) {
      final equipment = vehicle?.findChildRecursive(message.uuid);
      if (equipment != null && equipment is Equipment) {
        equipment.activeSegments = message.activeSegments;
      }
    }
    // Force update to reflect changes in case we haven't moved.
    forceChange = true;
  }

  /// Check if [autoSlowDown] or [autoCenterSteering] should decrease the
  /// parameters they control.
  void checkAutoSlowDownOrCentering() {
    if (vehicle != null) {
      if (autoSlowDown) {
        vehicle!.velocity = switch (vehicle!.velocity.abs() > 0.1) {
          true => vehicle!.velocity -
              vehicle!.velocity / vehicle!.velocity.abs() * 0.0125,
          false => 0,
        };
      }
      if (autoCenterSteering) {
        vehicle!.steeringAngleInput =
            switch (vehicle!.steeringAngle.abs() < 1) {
          true => 0,
          false => vehicle!.steeringAngleInput -
              vehicle!.steeringAngleInput.abs() /
                  vehicle!.steeringAngleInput *
                  0.4,
        };
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

  /// Check and update the steering of the vehicle if pure pursuit is available
  /// and activated.
  void checkPurePursuit() {
    if (purePursuit != null) {
      purePursuit!.tryChangeWayPoint(vehicle!);

      if (enablePurePursuit && vehicle != null) {
        // Swap to look ahead if the distance is farther than the vehicle's
        // min turning radius, as we'd be doing circles otherwise.
        if (pursuitMode == PurePursuitMode.pid) {
          final lateralDistance =
              purePursuit!.perpendicularDistance(vehicle!).abs();

          // Switch if the distance is larger than 0.7 times the turning radius,
          // this value is experimental to find a smoother transition to swap
          // mode
          if (lateralDistance > 0.7 * vehicle!.minTurningRadius &&
              tempPursuitMode != PurePursuitMode.lookAhead) {
            tempPursuitMode = PurePursuitMode.lookAhead;
          }
          // Swap back to the pid mode when we're within the turning circle
          // radius of the path.
          else if (pursuitMode == PurePursuitMode.pid &&
              lateralDistance < vehicle!.minTurningRadius) {
            tempPursuitMode = pursuitMode;
          }
        }

        final steeringAngleCalc = switch (tempPursuitMode) {
          PurePursuitMode.pid => purePursuit!.nextSteeringAnglePid(vehicle!),
          PurePursuitMode.lookAhead => purePursuit!.nextSteeringAngleLookAhead(
              vehicle!,
              lookAheadDistance,
            )
        };

        // Filter out steering angle less than 0.5 degrees.
        final steeringAngle = switch (steeringAngleCalc.abs() < 0.5) {
          true => 0.0,
          false => steeringAngleCalc,
        };

        vehicle?.steeringAngleInput = steeringAngle;
      }
    }
  }

  /// Calculate the next position and heading of the vehicle and then
  /// updates the state.
  void updatePosition() {
    if (vehicle != null && period > 0) {
      // Turning
      if (vehicle!.angularVelocity != null && turningCircleCenter != null) {
        if (vehicle is AxleSteeredVehicle) {
          // A local vehicle variable to simplify null safe syntax.
          final vehicle = this.vehicle! as AxleSteeredVehicle;

          // How many degrees of the turning circle the current angular velocity
          // during the period amounts to. Relative to the current position, is
          // negative when reversing.
          final turningCircleAngle = vehicle.angularVelocity! * period;

          // The angle from the turning circle center to the projected
          // position.
          final angle = switch (vehicle.isTurningLeft) {
            // Turning left
            true => vehicle.heading + 90 - turningCircleAngle,
            // Turning right
            false => vehicle.heading - 90 + turningCircleAngle,
          };
          // Projected solid axle position from the turning radius
          // center.
          final solidAxlePositon = turningCircleCenter!.offset(
            vehicle.currentTurningRadius!,
            normalizeBearing(angle),
          );

          // The heading of the vehicle at the projected position.
          final heading = normalizeBearing(
            switch (vehicle.isTurningLeft) {
              true => vehicle.heading - turningCircleAngle,
              false => vehicle.heading + turningCircleAngle,
            },
          );

          // The vehicle center position, which is offset from the solid
          // axle position.
          final vehiclePosition = solidAxlePositon.offset(
            vehicle.solidAxleDistance,
            switch (vehicle is Tractor) {
              true => heading,
              false => heading + 180,
            },
          );

          // Update the vehicle state.
          this.vehicle
            ?..position = vehiclePosition
            ..heading = heading;
        } else if (vehicle is ArticulatedTractor) {
          // A local vehicle variable to simplify null safe syntax.
          final vehicle = this.vehicle! as ArticulatedTractor;

          // How many degrees of the turning circle the current angular velocity
          // during the period amounts to. Relative to the current position, is
          // negative when reversing.
          final turningCircleAngle = vehicle.angularVelocity! * period;

          // The current angle from the turning radius center to the
          // front axle center.
          final turningCenterToFrontAxleAngle = normalizeBearing(
            switch (vehicle.isTurningLeft) {
              // Turning left
              true => vehicle.frontAxleAngle + 90,
              // Turning right
              false => vehicle.frontAxleAngle - 90,
            },
          );

          // The angle from the turning circle center to the projected front
          // axle position.
          final projectedFrontAxleAngle = switch (vehicle.isTurningLeft) {
            // Turning left
            true => turningCenterToFrontAxleAngle - turningCircleAngle,
            // Turning right
            false => turningCenterToFrontAxleAngle + turningCircleAngle,
          };

          // Projected vehicle front axle position from the turning radius
          // center.
          final frontAxlePosition = turningCircleCenter!.offset(
            vehicle.currentTurningRadius!,
            projectedFrontAxleAngle,
          );

          // The heading of the front body of the vehicle at the projected
          // position.
          final frontBodyHeading = switch (vehicle.isTurningLeft) {
            true => projectedFrontAxleAngle - 90 - vehicle.steeringAngle / 2,
            false => projectedFrontAxleAngle + 90 - vehicle.steeringAngle / 2,
          };

          // The vehicle antenna position, projected from the front axle
          // position.
          final vehiclePosition = frontAxlePosition.offset(
            vehicle.pivotToFrontAxle - vehicle.pivotToAntennaDistance,
            frontBodyHeading - 180 + vehicle.steeringAngle / 2,
          );

          // Update the vehicle state.
          this.vehicle
            ?..position = vehiclePosition
            ..heading = frontBodyHeading;
        }
      }
      // Going straight.
      else {
        final position = vehicle!.position.offset(
          vehicle!.velocity * period,
          vehicle!.heading,
        );

        // Update the vehicle state.
        vehicle?.position = position;
      }
      // Update the connected equipment.
      vehicle?.updateChildren();
    }
  }

  /// Updates the calculated gauges for the vehicle state.
  void updateGauges() {
    // Distance
    if (vehicle != null && prevVehicle != null) {
      distance = vehicle!.position.distanceTo(prevVehicle!.position);
    } else {
      distance = 0;
    }

    // Velocity
    if (period > 0) {
      velocity = distance / period;
    } else {
      velocity = 0;
    }

    // Heading, only updated if we're moving to keep heading while stationary.
    if (vehicle != null && prevVehicle != null && velocity.abs() > 0) {
      heading = normalizeBearing(
        switch (vehicle!.isReversing) {
          true => vehicle!.position.bearingTo(
              prevVehicle!.position,
            ),
          false => prevVehicle!.position.bearingTo(
              vehicle!.position,
            ),
        },
      );
    }
  }

  /// Update the simulation, i.e. simulate the next step.
  void update() {
    checkPurePursuit();
    checkAutoSlowDownOrCentering();
    checkTurningCircle();
    updateTime();
    updatePosition();
    updateGauges();

    didChange = forceChange || prevVehicle != vehicle;

    prevVehicle = vehicle?.copyWith();
    forceChange = false;
  }
}
