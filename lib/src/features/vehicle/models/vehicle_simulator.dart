import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';

class VehicleSimulator {
  /// Used non-web systems since they can easily be multithreaded.
  static Future<void> isolateWorker(SendPort sendPort) async {
    final commandPort = ReceivePort('SimVehicle');

    sendPort.send(commandPort.sendPort);

    log('Sim vehicle isolate spawn confirmation');

    Vehicle? vehicle;
    Vehicle? prevVehicle;

    const distance = Distance(roundResult: false);
    var calcVel = 0.0;
    var calcHeading = 0.0;

    var prevUpdate = DateTime.now();
    const targetPeroidMs = 1;

    final timer =
        Timer.periodic(const Duration(milliseconds: targetPeroidMs), (timer) {
      if (vehicle != null) {
        if (prevVehicle != null) {
          final now = DateTime.now();

          final period = now.difference(prevUpdate).inMicroseconds / 1e6;
          if (period > 0) {
            prevUpdate = now;

            vehicle = _updatePosition(vehicle!, period, distance);

            if (vehicle != prevVehicle) {
              sendPort.send(vehicle);

              // Velocity calculation
              final newCalcVel =
                  distance.distance(vehicle!.position, prevVehicle!.position) /
                      period;

              if (newCalcVel.toStringAsFixed(1) != calcVel.toStringAsFixed(1)) {
                calcVel = newCalcVel;
              }

              // Heading calculation
              final newCalcHeading = _calcHeading(
                vehicle!,
                calcHeading,
                distance,
                prevVehicle!,
              );

              if (newCalcHeading.toStringAsFixed(1) !=
                  calcHeading.toStringAsFixed(1)) {
                calcHeading = newCalcHeading;
              }

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
          wheelAngle: message.wheelAngle ?? vehicle!.wheelAngle,
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

  static double _calcHeading(
    Vehicle vehicle,
    double calcHeading,
    Distance distance,
    Vehicle prevVehicle,
  ) {
    final newCalcHeading = vehicle.velocity.abs() == 0
        ? calcHeading
        : normalizeBearing(
            vehicle.isReversing
                ? distance.bearing(
                    vehicle.position,
                    prevVehicle.position,
                  )
                : distance.bearing(
                    prevVehicle.position,
                    vehicle.position,
                  ),
          );
    return newCalcHeading;
  }

  static Vehicle? _updatePosition(
    Vehicle vehicle,
    double period,
    Distance distance,
  ) {
    final sign = vehicle.velocity.abs() == 0
        ? 0
        : vehicle.isReversing
            ? -1
            : 1;
    final heading = vehicle.heading + sign * vehicle.wheelAngle * period;

    final position = distance.offset(
      vehicle.position,
      vehicle.velocity * period,
      vehicle.heading,
    );

    return vehicle.copyWith(
      position: position,
      heading: heading,
    );
  }

  /// Used in web version since multithreading isn't possible.
  static Stream<Vehicle?> webWorker(Stream<dynamic> vehicleEvents) async* {
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
            wheelAngle: message.wheelAngle ?? vehicle!.wheelAngle,
          );
        }
      },
    );

    const distance = Distance(roundResult: false);
    var calcVel = 0.0;
    var calcHeading = 0.0;

    const targetPeroidMs = 10;

    var prevUpdate = DateTime.now();

    yield* Stream.periodic(const Duration(milliseconds: targetPeroidMs),
        (timer) {
      if (vehicle != null) {
        if (prevVehicle != null) {
          final now = DateTime.now();

          final period = now.difference(prevUpdate).inMicroseconds / 1e6;

          if (period > 0) {
            prevUpdate = now;

            vehicle = _updatePosition(vehicle!, period, distance);

            if (vehicle != prevVehicle) {
              // Velocity calculation
              final newCalcVel =
                  distance.distance(vehicle!.position, prevVehicle!.position) /
                      period;

              if (newCalcVel.toStringAsFixed(1) != calcVel.toStringAsFixed(1)) {
                calcVel = newCalcVel;
              }

              // Heading calculation
              final newCalcHeading = _calcHeading(
                vehicle!,
                calcHeading,
                distance,
                prevVehicle!,
              );

              if (newCalcHeading.toStringAsFixed(1) !=
                  calcHeading.toStringAsFixed(1)) {
                calcHeading = newCalcHeading;
              }

              prevVehicle = vehicle;

              return vehicle;
            }
          }
        } else {
          prevVehicle = vehicle;
        }
      }
      return vehicle;
    });
  }
}
