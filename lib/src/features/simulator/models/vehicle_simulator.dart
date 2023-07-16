import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';

/// A class for simulating how vehicles should move given their position,
/// bearing, steering angle and velocity.
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

        // If the vehicle has moved or changed we send the new state back to the
        // main/UI isolate.
        if (state.didChange) {
          sendPort.send(
            (
              vehicle: state.vehicle,
              velocity: state.velocity,
              bearing: state.bearing,
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
        num bearing,
        num distance,
        PurePursuit? purePursuit,
      })> webWorker(
    Stream<dynamic> vehicleEvents,
  ) {
    log('Sim vehicle worker spawned');

    // The state of the simulation.
    final state = _VehicleSimulatorState();

    // Handle the incoming messages.
    vehicleEvents.listen(state.handleMessage);

    final streamController = StreamController<
        ({
          Vehicle? vehicle,
          num velocity,
          num bearing,
          num distance,
          PurePursuit? purePursuit,
        })>();

    // A stream event generator that periodically updates the simulation and
    // sends the state.
    Timer.periodic(const Duration(microseconds: _targetPeriodMicroSeconds),
        (timer) {
      state.update();

      if (state.didChange && streamController.hasListener) {
        streamController.add(
          (
            vehicle: state.vehicle,
            velocity: state.velocity,
            bearing: state.bearing,
            distance: state.distance,
            purePursuit: state.purePursuit,
          ),
        );
      }
    });

    return streamController.stream;
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

  /// The bearing of the current vehicle, as calculated from the previous
  /// position to the current position.
  double bearing = 0;

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
  /// This can be [Vehicle], [PurePursuitMode] or records for the vehicle's
  /// position, velocity(Delta), steeringAngle(Delta), [purePursuit],
  /// [autoSlowDown], [autoCenterSteering], [enablePurePursuit],
  /// [lookAheadDistance] or [pursuitLoopMode].
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
      );
    }
    // Update the vehicle position.
    else if (message is ({LatLng position})) {
      vehicle?.position = message.position;
    }
    // Update the vehicle velocity
    else if (message is ({num velocity})) {
      vehicle?.velocity = message.velocity.toDouble();
    }
    // Update the vehicle velocity by delta
    else if (message is ({num velocityDelta})) {
      vehicle?.velocity =
          (vehicle!.velocity + (autoSlowDown ? 1.2 : 1) * message.velocityDelta)
              .clamp(-12.0, 12.0);
    }
    // Update the vehicle steering angle input.
    else if (message is ({num steeringAngle})) {
      vehicle?.steeringAngleInput = message.steeringAngle.toDouble();
    }
    // Update the vehicle steering angle input by delta.
    else if (message is ({num steeringAngleDelta})) {
      vehicle?.steeringAngleInput = (vehicle!.steeringAngleInput +
              (autoCenterSteering ? 2 : 1) * message.steeringAngleDelta)
          .clamp(-vehicle!.steeringAngleMax, vehicle!.steeringAngleMax);
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
    else if (message is ({num lookAheadDistance})) {
      lookAheadDistance = message.lookAheadDistance.toDouble();
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
    }
    // Attach a new equipment. Detach by sending null as the equipment with
    // the same hitch position.
    else if (message is ({Equipment? child, Hitch position})) {
      vehicle?.attachChild(message.child, message.position);
    }
    // Update the active segments of the equipment with the given uuid.
    else if (message is ({String uuid, List<bool> activeSegments})) {
      final equipment = vehicle?.findChildRecursive(message.uuid);
      if (equipment != null && equipment is Equipment) {
        equipment.activeSegments = message.activeSegments;
      }
    }
    // Detach the equipment with the given uuid.
    else if (message is ({String detachUuid})) {
      final equipment = vehicle?.findChildRecursive(message.detachUuid);
      if (equipment != null) {
        final parent = equipment.hitchParent;
        if (parent != null) {}
      }
    }
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

  /// Calculate the next position and bearing of the vehicle and then
  /// updates the state.
  void updatePosition() {
    if (vehicle != null && period > 0) {
      // Turning
      if (vehicle!.angularVelocity != null && turningCircleCenter != null) {
        switch (vehicle!) {
          case AxleSteeredVehicle():
            {
              // A local vehicle variable to simplify null safe syntax.
              final vehicle = this.vehicle! as AxleSteeredVehicle;

              // How many degrees of the turning circle the current angular
              // velocity during the period amounts to. Relative to the current
              // position, is negative when reversing.
              final turningCircleAngle = vehicle.angularVelocity! * period;

              // The angle from the turning circle center to the projected
              // position.
              final angle = switch (vehicle.isTurningLeft) {
                // Turning left
                true => vehicle.bearing + 90 - turningCircleAngle,
                // Turning right
                false => vehicle.bearing - 90 + turningCircleAngle,
              };
              // Projected solid axle position from the turning radius
              // center.
              final solidAxlePositon = turningCircleCenter!.offset(
                vehicle.currentTurningRadius!,
                normalizeBearing(angle),
              );

              // The bearing of the vehicle at the projected position.
              final bearing = normalizeBearing(
                switch (vehicle.isTurningLeft) {
                  true => vehicle.bearing - turningCircleAngle,
                  false => vehicle.bearing + turningCircleAngle,
                },
              );

              // The vehicle center position, which is offset from the solid
              // axle position.
              final vehiclePosition = solidAxlePositon.offset(
                vehicle.solidAxleDistance,
                switch (vehicle) {
                  Tractor() => bearing,
                  Harvester() => bearing + 180,
                },
              );

              // Update the vehicle state.
              this.vehicle
                ?..position = vehiclePosition
                ..bearing = bearing;
            }
          case ArticulatedTractor():
            {
              // A local vehicle variable to simplify null safe syntax.
              final vehicle = this.vehicle! as ArticulatedTractor;

              // How many degrees of the turning circle the current angular
              // velocity
              // during the period amounts to. Relative to the current position,
              // is negative when reversing.
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

              // The bearing of the front body of the vehicle at the projected
              // position.
              final frontBodyBearing = switch (vehicle.isTurningLeft) {
                true =>
                  projectedFrontAxleAngle - 90 - vehicle.steeringAngle / 2,
                false =>
                  projectedFrontAxleAngle + 90 - vehicle.steeringAngle / 2,
              };

              // The vehicle antenna position, projected from the front axle
              // position.
              final vehiclePosition = frontAxlePosition.offset(
                vehicle.pivotToFrontAxle - vehicle.pivotToAntennaDistance,
                frontBodyBearing - 180 + vehicle.steeringAngle / 2,
              );

              // Update the vehicle state.
              this.vehicle
                ?..position = vehiclePosition
                ..bearing = frontBodyBearing;
            }
        }
      }

      // Going straight.
      else {
        final position = vehicle!.position.offset(
          vehicle!.velocity * period,
          vehicle!.bearing,
        );

        // Update the vehicle state.
        vehicle?.position = position;
      }
      // Update the connected equipment/children.
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

    // Bearing, only updated if we're moving to keep bearing while stationary.
    if (vehicle != null && prevVehicle != null && velocity.abs() > 0) {
      bearing = normalizeBearing(
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
