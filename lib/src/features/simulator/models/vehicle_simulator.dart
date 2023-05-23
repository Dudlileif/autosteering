import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';

/// A class for simulating how vehicles should move given their position,
/// heading, steering angle and velocity.
class VehicleSimulator {
  static const _targetPeriodMs = 10;
  static const _distance = Distance(roundResult: false);

  /// Used on native platforms since they can easily be multithreaded.
  static Future<void> isolateWorker(SendPort sendPort) async {
    final commandPort = ReceivePort('SimVehicle');

    sendPort.send(commandPort.sendPort);

    log('Sim vehicle isolate spawn confirmation');

    var autoSlowDown = false;
    var autoCenterSteering = false;

    Vehicle? vehicle;
    Vehicle? prevVehicle;

    // A static turning circle center to keep while the steering angle is
    // constant. We use this due to small errors when using the
    // vehicle.turningRadiusCenter as it would move around slightly as the
    // vehicle is moving, and cause wrong calculations.
    LatLng? turningCircleCenter;

    var calcVel = 0.0;
    var calcHeading = 0.0;

    var prevUpdate = DateTime.now();

    final timer =
        Timer.periodic(const Duration(milliseconds: _targetPeriodMs), (timer) {
      if (vehicle != null) {
        vehicle = vehicle?.copyWith(
          velocity: switch (autoSlowDown) {
            false => null,
            true => switch (vehicle!.velocity.abs() > 0.1) {
                true => vehicle!.velocity -
                    vehicle!.velocity / vehicle!.velocity.abs() * 0.0125,
                false => 0,
              }
          },
          steeringAngleInput: switch (
              vehicle!.steeringAngle.abs() > 0 && autoCenterSteering) {
            false => null,
            true => switch (vehicle!.steeringAngle.abs() < 1) {
                true => 0,
                false => vehicle!.steeringAngleInput -
                    vehicle!.steeringAngleInput.abs() /
                        vehicle!.steeringAngleInput *
                        0.4,
              }
          },
        );
        if (vehicle?.steeringAngle != prevVehicle?.steeringAngle) {
          turningCircleCenter = vehicle?.turningRadiusCenter;
        }
        if (prevVehicle != null) {
          final now = DateTime.now();

          final period = now.difference(prevUpdate).inMicroseconds / 1e6;

          if (period > 0) {
            prevUpdate = now;

            // Move the vehicle
            vehicle = _updatePosition(vehicle!, period, turningCircleCenter);

            // If the vehicle has moved (changed)
            if (vehicle != prevVehicle) {
              // Distance calculation
              final calcDistance =
                  _distance.distance(vehicle!.position, prevVehicle!.position);

              // Velocity calculation
              final newCalcVel = calcDistance / period;

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
                  distance: calcDistance,
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
      if (message is ({bool enableAutoSlowDown})) {
        autoSlowDown = message.enableAutoSlowDown;
      }
      if (message is ({bool enableAutoCenterSteering})) {
        autoCenterSteering = message.enableAutoCenterSteering;
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
    LatLng? turningCircleCenter,
  ) {
    if (vehicle is AxleSteeredVehicle) {
      if (vehicle.steeringAngle.abs() > 0 &&
          vehicle.velocity.abs() > 0 &&
          turningCircleCenter != null) {
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
          turningCircleCenter,
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

      final position = _distance.offset(
        vehicle.position,
        vehicle.velocity * period,
        vehicle.heading,
      );

      return vehicle.copyWith(
        position: position,
      );
    } else if (vehicle is ArticulatedTractor) {
      if (vehicle.steeringAngle.abs() > 0 &&
          vehicle.velocity.abs() > 0 &&
          turningCircleCenter != null) {
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
        final frontAxlePosition = _distance.offset(
          turningCircleCenter,
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
        final vehiclePosition = _distance.offset(
          frontAxlePosition,
          vehicle.pivotToFrontAxle - vehicle.pivotToAntennaDistance,
          frontBodyHeading - 180 + vehicle.steeringAngle / 2,
        );

        return vehicle.copyWith(
          position: vehiclePosition,
          heading: frontBodyHeading,
        );
      }

      final position = _distance.offset(
        vehicle.position,
        vehicle.velocity * period,
        vehicle.heading,
      );

      return vehicle.copyWith(
        position: position,
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
        num velocity,
        num heading,
        num distance,
      })> webWorker(
    Stream<dynamic> vehicleEvents,
  ) async* {
    log('Sim vehicle worker spawned');

    var autoSlowDown = false;
    var autoCenterSteering = false;

    Vehicle? vehicle;
    Vehicle? prevVehicle;

    // A static turning circle center to keep while the steering angle is
    // constant. We use this due to small errors when using the
    // vehicle.turningRadiusCenter as it would move around slightly as the
    // vehicle is moving, and cause wrong calculations.
    LatLng? turningCircleCenter;

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
        if (message is ({bool enableAutoSlowDown})) {
          autoSlowDown = message.enableAutoSlowDown;
        }
        if (message is ({bool enableAutoCenterSteering})) {
          autoCenterSteering = message.enableAutoCenterSteering;
        }
      },
    );

    var calcVel = 0.0;
    var calcHeading = 0.0;

    var prevUpdate = DateTime.now();

    yield* Stream.periodic(const Duration(milliseconds: _targetPeriodMs),
        (timer) {
      if (vehicle != null) {
        vehicle = vehicle?.copyWith(
          velocity: switch (autoSlowDown) {
            false => null,
            true => switch (vehicle!.velocity.abs() > 0.1) {
                true => vehicle!.velocity -
                    vehicle!.velocity / vehicle!.velocity.abs() * 0.0125,
                false => 0,
              }
          },
          steeringAngleInput: switch (
              vehicle!.steeringAngle.abs() > 0 && autoCenterSteering) {
            false => null,
            true => switch (vehicle!.steeringAngle.abs() < 1) {
                true => 0,
                false => vehicle!.steeringAngleInput -
                    vehicle!.steeringAngleInput.abs() /
                        vehicle!.steeringAngleInput *
                        0.4,
              }
          },
        );
        if (vehicle?.steeringAngle != prevVehicle?.steeringAngle) {
          turningCircleCenter = vehicle?.turningRadiusCenter;
        }
        if (prevVehicle != null) {
          final now = DateTime.now();

          final period = now.difference(prevUpdate).inMicroseconds / 1e6;

          if (period > 0) {
            prevUpdate = now;

            // Move the vehicle
            vehicle = _updatePosition(vehicle!, period, turningCircleCenter);

            if (vehicle != prevVehicle) {
              // Distance calculation
              final calcDistance =
                  _distance.distance(vehicle!.position, prevVehicle!.position);

              // Velocity calculation
              final newCalcVel = calcDistance / period;

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
                distance: calcDistance,
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
        distance: 0,
      );
    });
  }
}
