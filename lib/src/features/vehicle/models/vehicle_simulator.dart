import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';

class VehicleSimulator {
  static const _targetPeriodMs = 10;
  static const _distance = Distance(roundResult: false);

  /// Used non-web systems since they can easily be multithreaded.
  static Future<void> isolateWorker(SendPort sendPort) async {
    final commandPort = ReceivePort('SimVehicle');

    sendPort.send(commandPort.sendPort);

    log('Sim vehicle isolate spawn confirmation');

    Vehicle? vehicle;
    Vehicle? prevVehicle;

    var calcVel = 0.0;
    var calcHeading = 0.0;

    var prevUpdate = DateTime.now();

    final timer =
        Timer.periodic(const Duration(milliseconds: _targetPeriodMs), (timer) {
      if (vehicle != null) {
        if (prevVehicle != null) {
          final now = DateTime.now();

          final period = now.difference(prevUpdate).inMicroseconds / 1e6;

          // Increase period when the vehicle is a simulated
          // articulated tractor, due to calculation error at low steering
          // angles.
          if (period < _targetPeriodMs * 2 / 1000 &&
              vehicle is ArticulatedTractor &&
              vehicle!.simulated) {
            prevVehicle = vehicle;
          } else if (period > 0) {
            prevUpdate = now;

            // Move the vehicle
            vehicle = _updatePosition(vehicle!, period);

            // If the vehicle has moved (changed)
            if (vehicle != prevVehicle) {
              // Velocity calculation
              final newCalcVel =
                  _distance.distance(vehicle!.position, prevVehicle!.position) /
                      period;

              if (newCalcVel.toStringAsFixed(1) != calcVel.toStringAsFixed(1)) {
                calcVel = newCalcVel;
              }

              // Heading calculation
              final newCalcHeading = _calcHeading(
                vehicle!,
                prevVehicle!,
                calcHeading,
              );

              if (newCalcHeading.toStringAsFixed(1) !=
                  calcHeading.toStringAsFixed(1)) {
                calcHeading = newCalcHeading;
              }

              sendPort.send(
                (
                  vehicle: vehicle,
                  velocity: calcVel,
                  heading: calcHeading,
                ),
              );

              prevVehicle = vehicle;
            }
          }
        } else {
          prevVehicle = vehicle;
        }
      }
    });

    await for (final message in commandPort) {
      if (message is Vehicle) {
        vehicle = message;
      }
      if (message is VehicleInput && vehicle != null) {
        vehicle = vehicle?.copyWith(
          position: message.position ?? vehicle!.position,
          velocity: message.velocity ?? vehicle!.velocity,
          steeringAngleInput: message.steeringAngle ?? vehicle!.steeringAngle,
        );
      }

      // Shut down the isolate.
      else if (message == null) {
        timer.cancel();
        break;
      }
    }
    log('Sim vehicle isolate exited.');
    Isolate.exit();
  }

  static Vehicle? _updatePosition(
    Vehicle vehicle,
    double period,
  ) {
    if (vehicle is AxleSteeredVehicle) {
      if (vehicle.steeringAngle.abs() > 0) {
        if (vehicle.velocity.abs() > 0) {
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
          final solidAxlePositon = _distance.offset(
            vehicle.turningRadiusCenter!,
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
          final vehiclePosition = _distance.offset(
            solidAxlePositon,
            vehicle.solidAxleDistance,
            switch (vehicle is Tractor) {
              true => heading,
              false => heading + 180,
            },
          );

          return vehicle.copyWith(
            position: vehiclePosition,
            heading: heading,
          );
        }
      }
      final sign = switch (vehicle.velocity.abs()) {
        0 => 0,
        _ => switch (vehicle.isReversing) {
            true => -1,
            false => 1,
          }
      };
      final heading = vehicle.heading +
          sign * vehicle.ackermannSteering.ackermannAngleDegrees * period;

      final position = _distance.offset(
        vehicle.position,
        vehicle.velocity * period,
        vehicle.heading,
      );

      return vehicle.copyWith(
        position: position,
        heading: heading,
      );
    } else if (vehicle is ArticulatedTractor) {
      if (vehicle.steeringAngle.abs() > 0) {
        if (vehicle.velocity.abs() > 0) {
          // How many degrees of the turning circle the current angular velocity
          // during the period amounts to. Relative to the current position, is
          // negative when reversing.
          final turningCircleAngle = vehicle.angularVelocity! * period;

          // The current angle from the turning radius center to the
          // front axle center.
          final turningCenterToFrontAxleAngle = normalizeBearing(
            _distance.bearing(
              vehicle.turningRadiusCenter!,
              vehicle.frontAxlePosition,
            ),
          );

          // The angle from the turning circle center to the projected front
          // axle position.
          final projectedFrontAxleAngle = normalizeBearing(
            switch (vehicle.isTurningLeft) {
              // Turning left
              true => turningCenterToFrontAxleAngle - turningCircleAngle,
              // Turning right
              false => turningCenterToFrontAxleAngle + turningCircleAngle,
            },
          );

          // Projected vehicle front axle position from the turning radius
          // center.
          final frontAxlePosition = _distance.offset(
            vehicle.turningRadiusCenter!,
            vehicle.currentTurningRadius!,
            normalizeBearing(projectedFrontAxleAngle),
          );

          // The heading of the front body of the vehicle at the projected
          // position.
          final frontBodyHeading = normalizeBearing(
            switch (vehicle.isTurningLeft) {
              true => vehicle.heading - turningCircleAngle,
              false => vehicle.heading + turningCircleAngle,
            },
          );

          // The vehicle antenna position, projected from the front axle
          // position.
          final vehiclePosition = _distance.offset(
            frontAxlePosition,
            vehicle.pivotToFrontAxle - vehicle.pivotToAntennaDistance,
            normalizeBearing(frontBodyHeading + 180 + vehicle.steeringAngle),
          );

          return vehicle.copyWith(
            position: vehiclePosition,
            heading: frontBodyHeading,
          );
        }
      }
      final sign = switch (vehicle.velocity.abs()) {
        0 => 0,
        _ => switch (vehicle.isReversing) {
            true => -1,
            false => 1,
          }
      };
      final heading = vehicle.heading + sign * vehicle.steeringAngle * period;

      final position = _distance.offset(
        vehicle.position,
        vehicle.velocity * period,
        vehicle.heading,
      );

      return vehicle.copyWith(
        position: position,
        heading: heading,
      );
    }
    return vehicle;
  }

  static double _calcHeading(
    Vehicle vehicle,
    Vehicle prevVehicle,
    double calcHeading,
  ) {
    final newCalcHeading = vehicle.velocity.abs() == 0
        ? calcHeading
        : normalizeBearing(
            switch (vehicle.isReversing) {
              true => _distance.bearing(
                  vehicle.position,
                  prevVehicle.position,
                ),
              false => _distance.bearing(
                  prevVehicle.position,
                  vehicle.position,
                ),
            },
          );
    return newCalcHeading;
  }

  /// Used in web version since multithreading isn't possible.
  static Stream<
      ({
        Vehicle? vehicle,
        double velocity,
        double heading,
      })> webWorker(
    Stream<dynamic> vehicleEvents,
  ) async* {
    log('Sim vehicle worker spawned');

    Vehicle? vehicle;
    Vehicle? prevVehicle;

    vehicleEvents.listen(
      (message) {
        if (message is Vehicle) {
          vehicle = message;
        }
        if (message is VehicleInput && vehicle != null) {
          vehicle = vehicle?.copyWith(
            position: message.position ?? vehicle!.position,
            velocity: message.velocity ?? vehicle!.velocity,
            steeringAngleInput: message.steeringAngle ?? vehicle!.steeringAngle,
          );
        }
      },
    );

    var calcVel = 0.0;
    var calcHeading = 0.0;

    var prevUpdate = DateTime.now();

    yield* Stream.periodic(const Duration(milliseconds: _targetPeriodMs),
        (timer) {
      if (vehicle != null) {
        if (prevVehicle != null) {
          final now = DateTime.now();

          final period = now.difference(prevUpdate).inMicroseconds / 1e6;

          if (period > 0) {
            prevUpdate = now;

            // Move the vehicle
            vehicle = _updatePosition(vehicle!, period);

            if (vehicle != prevVehicle) {
              // Velocity calculation
              final newCalcVel =
                  _distance.distance(vehicle!.position, prevVehicle!.position) /
                      period;

              if (newCalcVel.toStringAsFixed(1) != calcVel.toStringAsFixed(1)) {
                calcVel = newCalcVel;
              }

              // Heading calculation
              final newCalcHeading = _calcHeading(
                vehicle!,
                prevVehicle!,
                calcHeading,
              );

              if (newCalcHeading.toStringAsFixed(1) !=
                  calcHeading.toStringAsFixed(1)) {
                calcHeading = newCalcHeading;
              }

              prevVehicle = vehicle;

              return (
                vehicle: vehicle,
                velocity: calcVel,
                heading: calcHeading,
              );
            }
          }
        } else {
          prevVehicle = vehicle;
        }
      }
      return (
        vehicle: vehicle,
        velocity: calcVel,
        heading: calcHeading,
      );
    });
  }
}
