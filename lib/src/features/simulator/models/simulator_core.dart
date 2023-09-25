import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';
import 'package:udp/udp.dart';
import 'package:universal_io/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// A class for simulating how vehicles should move given their position,
/// bearing, steering angle and velocity.
class SimulatorCore {
  /// Targets 60 hz => 16666.66... micro seconds
  static const _targetPeriodMicroSeconds = 16667;

  /// Used on native platforms since they can easily be multithreaded.
  static Future<void> isolateWorker(SendPort sendPort) async {
    final commandPort = ReceivePort('Simcore');

    // Send a communication port in return.
    sendPort.send(commandPort.sendPort);

    log('Simulator Core isolate spawn confirmation');

    // Heartbeat signal to show that the simulator isolate is alive.
    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      sendPort.send('Heartbeat');
    });

    // The state of the simulation.
    final state = _SimulatorCoreState();

    DateTime? lastHardwareMessageTime;

    var prevHardwareIsConnected = false;

    // A timer for periodically updating the simulation.
    final timer = Timer.periodic(
        const Duration(microseconds: _targetPeriodMicroSeconds), (timer) {
      if (state.vehicle != null) {
        state.update();

        // Assume that hardware is connected if less than 500 ms since
        // last message.
        final hardwareIsConnected = DateTime.now()
                .difference(lastHardwareMessageTime ?? DateTime(0))
                .inMilliseconds <
            500;
        // If the state has changed we send the new state back to the
        // main/UI isolate.
        if (state.didChange || hardwareIsConnected != prevHardwareIsConnected) {
          prevHardwareIsConnected = hardwareIsConnected;
          sendPort.send(
            (
              vehicle: state.vehicle,
              velocity: state.gaugeVelocity,
              bearing: state.gaugeBearing,
              distance: state.distance,
              pathTracking: state.pathTracking,
              abTracking: state.abTracking,
              hardwareIsConnected: hardwareIsConnected,
            ),
          );
        }
      }
    });

    var serverEndPoint = Endpoint.unicast(
      InternetAddress('192.168.4.1'),
      port: const Port(6666),
    );

    var endPoint = Endpoint.any(
      port: const Port(3333),
    );

    var udp = await UDP.bind(endPoint);

    final udpSendStream = StreamController<String>();

    state.networkSendStream = udpSendStream;

    udpSendStream.stream.listen(
      (event) async => udp.send(utf8.encode(event), serverEndPoint),
    );

    unawaited(
      udp.send(
        utf8.encode('${Platform.operatingSystem}: Simulator started'),
        serverEndPoint,
      ),
    );

    var udpHeartbeatTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      udp.send(
        utf8.encode('${Platform.operatingSystem}: Heartbeat'),
        serverEndPoint,
      );
    });

    udp.asStream().listen(
      (datagram) {
        lastHardwareMessageTime = DateTime.now();
        _networkListener(datagram?.data, state);
      },
    );

    // Handle incoming messages from other dart isolates.
    await for (final message in commandPort) {
      // Update the udp ip adress for the hardware.
      if (message is ({
        String hardwareIPAdress,
        int hardwareUDPReceivePort,
        int hardwareUDPSendPort
      })) {
        udpHeartbeatTimer.cancel();

        serverEndPoint = Endpoint.unicast(
          InternetAddress(message.hardwareIPAdress),
          port: Port(message.hardwareUDPSendPort),
        );

        endPoint = Endpoint.any(port: Port(message.hardwareUDPReceivePort));

        udp.close();
        udp = await UDP.bind(endPoint);

        udp.asStream().listen(
          (datagram) {
            lastHardwareMessageTime = DateTime.now();
            _networkListener(datagram?.data, state);
          },
        );

        await udp.send(
          utf8.encode('Simulator started'),
          serverEndPoint,
        );

        udpHeartbeatTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          udp.send(
            utf8.encode('${Platform.operatingSystem}: Heartbeat'),
            serverEndPoint,
          );
        });
      }

      // Messages for the state.
      else if (message != null) {
        state.handleMessage(message);
      }
      // Shut down the isolate.
      else {
        timer.cancel();
        break;
      }
    }

    // Isolate shut down procedure
    await udp.send(
      utf8.encode('Simulator shut down'),
      serverEndPoint,
    );

    udp.close();

    log('Simulator Core isolate exited.');
    Isolate.exit();
  }

  static DateTime _networkListener(
    Uint8List? data,
    _SimulatorCoreState state,
  ) {
    if (data != null) {
      final str = String.fromCharCodes(data);
      if (str.startsWith('{')) {
        try {
          final data = Map<String, dynamic>.from(jsonDecode(str) as Map);
          final bearing = data['yaw'] as double?;
          final pitch = data['pitch'] as double?;
          final roll = data['roll'] as double?;

          if (state.useIMUBearing && bearing != null) {
            state.vehicle?.bearing =
                (-bearing - state.imuZero.bearingZero).wrap360();
            state.gaugeBearing =
                (-bearing - state.imuZero.bearingZero).wrap360();
          }
          if (pitch != null) {
            state.vehicle?.pitch = -pitch - state.imuZero.pitchZero;
          }
          if (roll != null) {
            state.vehicle?.roll = roll - state.imuZero.rollZero;
          }
          state.imuInputRaw = (
            bearing: bearing ?? state.imuInputRaw.bearing,
            pitch: pitch ?? state.imuInputRaw.pitch,
            roll: roll ?? state.imuInputRaw.roll
          );
        } catch (e) {
          log(e.toString());
        }
      }
    }
    return DateTime.now();
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
        PathTracking? pathTracking,
        ABTracking? abTracking,
        bool hardwareIsConnected,
      })> webWorker(
    Stream<dynamic> vehicleEvents,
  ) {
    log('Simulator Core worker spawned');

    // The state of the simulation.
    final state = _SimulatorCoreState();

    WebSocketChannel? socket;

    DateTime? lastHardwareMessageTime;

    // Handle the incoming messages.
    vehicleEvents.listen((message) async {
      if (message is ({String hardwareIPAdress, int hardwareWebSocketPort})) {
        await socket?.sink.close();
        final address = Uri.parse(
          [
            'ws://',
            message.hardwareIPAdress,
            ':',
            message.hardwareWebSocketPort.toString(),
            '/ws',
          ].join(),
        );
        socket = WebSocketChannel.connect(address);
        socket!.stream.listen(
          (event) {
            if (event is Uint8List) {
              lastHardwareMessageTime = DateTime.now();
              _networkListener(event, state);
            }
          },
        );
      } else {
        state.handleMessage(message);
      }
    });

    final streamController = StreamController<
        ({
          Vehicle? vehicle,
          num velocity,
          num bearing,
          num distance,
          PathTracking? pathTracking,
          ABTracking? abTracking,
          bool hardwareIsConnected,
        })>();

    var prevHardwareIsConnected = false;

    // A stream event generator that periodically updates the simulation and
    // sends the state.
    Timer.periodic(const Duration(microseconds: _targetPeriodMicroSeconds),
        (timer) {
      state.update();
      if (streamController.hasListener) {
        // Assume that hardware is connected if less than 500 ms since
        // last message.
        final hardwareIsConnected = DateTime.now()
                .difference(lastHardwareMessageTime ?? DateTime(0))
                .inMilliseconds <
            500;
        // If the state has changed we add the new state to the stream.
        if (state.didChange || hardwareIsConnected != prevHardwareIsConnected) {
          prevHardwareIsConnected = hardwareIsConnected;
          streamController.add(
            (
              vehicle: state.vehicle,
              velocity: state.gaugeVelocity,
              bearing: state.gaugeBearing,
              distance: state.distance,
              pathTracking: state.pathTracking,
              abTracking: state.abTracking,
              hardwareIsConnected: hardwareIsConnected,
            ),
          );
        }
      }
    });

    return streamController.stream;
  }
}

/// An enumerator used to signal how a value in the [_SimulatorCoreState]
/// should change.
enum SimInputChange {
  /// Increase the value.
  increase,

  /// Decrease the value.
  decrease,

  /// Keep the current value.
  hold,

  /// Resets the value to 0.
  reset,
}

/// A class for holding and updating the state of the [SimulatorCore].
class _SimulatorCoreState {
  /// A class for holding and updating the state of the [SimulatorCore].
  _SimulatorCoreState();

  /// A stream controller for forwarding events to send over the network.
  StreamController<String>? networkSendStream;

  /// Whether the simulation should accept incoming control input from
  /// keyboard, gamepad, sliders etc...
  bool allowManualSimInput = false;

  /// The current vehicle of the simulation.
  Vehicle? vehicle;

  /// The previous vehicle state of the simulation.
  Vehicle? prevVehicle;

  /// The distance from the previous vehicle state to the current vehicle state.
  double distance = 0;

  /// The previous GNSS update position and time.
  ({Geographic gnssPosition, DateTime time})? prevGnssUpdate;

  /// The current GNSS update position and time.
  ({Geographic gnssPosition, DateTime time})? gnssUpdate;

  /// The velocity of the current vehicle, as calculated from the [distance] and
  /// [period].
  double gaugeVelocity = 0;

  /// The bearing of the current vehicle, as calculated from the previous
  /// position to the current position.
  double gaugeBearing = 0;

  /// Whether the state changed in the last update.
  bool didChange = true;

  /// The recorded path tracking to drive after, if there is one.
  PathTracking? pathTracking;

  /// The AB-line or curve to drive after, if there is one.
  ABTracking? abTracking;

  /// A configuration for [abTracking] parameters.
  ABConfig? abConfig;

  /// Whether driving without [autoSteerEnabled] should update path
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

  /// Whether the vehicle should use the [pathTracking] model to steer.
  bool enablePathTracking = false;

  /// Whehter the vehicle should automatically steer.
  bool autoSteerEnabled = false;

  /// Which mode the [pathTracking] should use to go from the last to the first
  /// waypoint.
  PathTrackingLoopMode pathTrackingLoopMode = PathTrackingLoopMode.none;

  /// Which steering mode the [pathTracking] should use.
  PathTrackingMode pathTrackingMode = PathTrackingMode.purePursuit;

  /// A temporary steering mode for the [PathTracking], only used when the
  /// [pathTrackingMode] is [PathTrackingMode.pid] and the lateral distance to
  /// the path is larger than the vehicle's min turning radius.
  PathTrackingMode tempPathTrackingMode = PathTrackingMode.purePursuit;

  /// The interpolation distance for points in the [pathTracking]
  double pathInterpolationDistance = 4;

  /// Whether the bearing from the IMU input should be used.
  bool useIMUBearing = false;

  /// A record of the raw IMU input.
  ({double bearing, double pitch, double roll}) imuInputRaw =
      (bearing: 0, pitch: 0, roll: 0);

  /// A record with the zero values for the IMU. These can be updated to
  /// change what is perceived as zero for each axis.
  ({double bearingZero, double pitchZero, double rollZero}) imuZero =
      (bearingZero: 0, pitchZero: 0, rollZero: 0);

  /// The previous time of when the simulation was updated.
  DateTime prevUpdateTime = DateTime.now();

  /// The time period between the last update and this current update.
  ///
  /// In seconds.
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
  /// This can be [Vehicle], [PathTrackingMode] or records for the vehicle's
  /// position, velocity(Delta), steeringAngle(Delta), [pathTracking],
  /// [autoSlowDown], [autoCenterSteering], [enablePathTracking] or
  /// [pathTrackingLoopMode].
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
      );
      pathTrackingMode = message.pathTrackingMode;
    } else if (message is ({bool allowManualSimInput})) {
      allowManualSimInput = message.allowManualSimInput;
    }
    // Update whether the vehicle position should take the roll and pitch into
    // account when an IMU is connected.
    else if (message is ({bool useIMUPitchAndRoll})) {
      vehicle?.useIMUPitchAndRoll = message.useIMUPitchAndRoll;
    }
    // Update whether the vehicle bearing should be set by the IMU when it's
    // connected.
    else if (message is ({bool useIMUBearing})) {
      useIMUBearing = message.useIMUBearing;
    }
    // Update the vehicle position.
    else if (message is ({Geographic position})) {
      vehicle?.position = message.position;
    }
    // Update the vehicle position from GNSS.
    else if (message is ({Geographic gnssPosition, DateTime time})) {
      gnssUpdate = message;
    }
    // Update the vehicle velocity
    else if (message is ({num velocity})) {
      if (allowManualSimInput) {
        vehicle?.velocity = message.velocity.toDouble();
        velocityChange = SimInputChange.hold;
      }
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
    // Set the zero points for the IMU
    else if (message is ({bool setZeroIMU})) {
      if (message.setZeroIMU) {
        imuZero = (
          bearingZero: 0,
          pitchZero: imuInputRaw.pitch,
          rollZero: imuInputRaw.roll,
        );
      } else {
        imuZero = (bearingZero: 0, pitchZero: 0, rollZero: 0);
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
    else if (message is ({bool autoSteerEnabled})) {
      autoSteerEnabled = message.autoSteerEnabled;
      networkSendStream
          ?.add(jsonEncode({'autoSteerEnabled': autoSteerEnabled}));
    }
    // Set the path tracking model.
    else if (message is ({PathTracking? pathTracking})) {
      pathTracking = message.pathTracking;
    }
    // Update whether to automatically slow down.
    else if (message is ({bool autoSlowDown})) {
      autoSlowDown = message.autoSlowDown;
    }
    // Update whether to automatically center the steering.
    else if (message is ({bool autoCenterSteering})) {
      autoCenterSteering = message.autoCenterSteering;
    }
    // Enable/disable path tracking.
    else if (message is ({bool enablePathTracking})) {
      enablePathTracking = message.enablePathTracking;
      if (vehicle != null && pathTracking != null) {
        pathTracking?.cumulativeIndex = pathTracking!.closestIndex(vehicle!);
      }
    }
    // Update pid parameters.
    else if (message is PidParameters) {
      vehicle?.pidParameters = message;
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
      tempPathTrackingMode = pathTrackingMode;
      vehicle?.pathTrackingMode = pathTrackingMode;
      if (pathTracking != null) {
        final index = pathTracking!.currentIndex;
        pathTracking = switch (pathTrackingMode) {
          PathTrackingMode.pid ||
          PathTrackingMode.purePursuit =>
            PurePursuitPathTracking(
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
    // Set new look ahead distance.
    else if (message is ({num lookAheadDistance})) {
      if (vehicle != null) {
        vehicle!.purePursuitParameters = vehicle!.purePursuitParameters
            .copyWith(lookAheadDistance: message.lookAheadDistance.toDouble());
      }
    }
    // Set the look ahead distance velocity gain.
    else if (message is ({double lookAheadVelocityGain})) {
      if (vehicle != null) {
        vehicle!.purePursuitParameters = vehicle!.purePursuitParameters
            .copyWith(lookAheadVelocityGain: message.lookAheadVelocityGain);
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
        equipment.activeSections = message.activeSections;
      }
    }
    // Update the AB-line to follow
    else if (message is ({ABTracking? abTracking})) {
      abTracking = message.abTracking?..applyConfig(abConfig);
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
    // Update whether manual driving should update path tracking.
    else if (message is ({bool allowManualTrackingUpdates})) {
      allowManualTrackingUpdates = message.allowManualTrackingUpdates;
    }
    // Pipe through NTRIP messages to the hardware.
    else if (message is ({Uint8List ntrip})) {
      networkSendStream?.add(message.ntrip.toString());
    }
    // Unknown message, log it to figure out what it is.
    else {
      log(message.toString());
    }
  }

  /// Check if [autoSlowDown] or [autoCenterSteering] should decrease the
  /// parameters they control.
  void updateVehicleVelocityAndSteering() {
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

      switch (steeringChange) {
        case SimInputChange.reset:
          vehicle!.steeringAngleInput = 0;
          steeringChange = SimInputChange.hold;

        case SimInputChange.increase:
          if (vehicle!.steeringAngleInput == 0) {
            vehicle!.steeringAngleInput = 0.5;
          }
          vehicle!.steeringAngleInput =
              (vehicle!.steeringAngleInput + period * steeringRate)
                  .clamp(-vehicle!.steeringAngleMax, vehicle!.steeringAngleMax);
        case SimInputChange.decrease:
          if (vehicle!.steeringAngleInput == 0) {
            vehicle!.steeringAngleInput = -0.5;
          }
          vehicle!.steeringAngleInput =
              (vehicle!.steeringAngleInput - period * steeringRate)
                  .clamp(-vehicle!.steeringAngleMax, vehicle!.steeringAngleMax);

        case SimInputChange.hold:
          receivingManualInput = false;
          if (autoCenterSteering && !autoSteerEnabled) {
            // Centering rate deg/s
            const centeringRate = 25;

            vehicle!.steeringAngleInput =
                switch (vehicle!.steeringAngle.abs() < 0.5) {
              true => 0,
              false => vehicle!.steeringAngleInput -
                  period *
                      centeringRate *
                      vehicle!.steeringAngleInput.abs() /
                      vehicle!.steeringAngleInput,
            };
          }
      }

      // Filter out low angles as they make the simulation spazz out because the
      // turning circles get very large.
      if (vehicle!.steeringAngleInput.abs() < 0.5) {
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

  /// Check and update the guidance, autosteering etc..
  ///
  /// Checks and updates the [abTracking] and [pathTracking].
  /// If [autoSteerEnabled] the steering will
  void checkGuidance() {
    if (vehicle != null) {
      abTracking?.checkAutoOffsetSnap(vehicle!);
      if (!autoSteerEnabled && allowManualTrackingUpdates) {
        abTracking?.manualUpdate(vehicle!);
      }
      if (autoSteerEnabled && !receivingManualInput) {
        var steeringAngle = 0.0;
        if (abTracking != null) {
          checkIfPidModeIsValid(
            abTracking!
                .signedPerpendicularDistanceToCurrentLine(vehicle!)
                .abs(),
          );

          steeringAngle = abTracking!
              .nextSteeringAngle(vehicle!, mode: tempPathTrackingMode);
        } else if (pathTracking != null) {
          pathTracking!.tryChangeWayPoint(vehicle!);

          if (enablePathTracking) {
            checkIfPidModeIsValid(
              pathTracking!.perpendicularDistance(vehicle!).abs(),
            );
            steeringAngle = pathTracking!
                .nextSteeringAngle(vehicle!, mode: tempPathTrackingMode);
          }
        }

        // Only allow steering if vehicle is moving to prevent jitter that moves
        // the vehicle when stationary.
        if (steeringAngle == vehicle!.steeringAngleInput ||
            vehicle!.velocity == 0) {
          steeringChange = SimInputChange.hold;
        } else if (steeringAngle < vehicle!.steeringAngleInput) {
          steeringChange = SimInputChange.decrease;
        } else if (steeringAngle > vehicle!.steeringAngleInput) {
          steeringChange = SimInputChange.increase;
        }
      }
    }
  }

  void checkIfPidModeIsValid(double lateralDistance) {
    // Swap to look ahead if the distance is farther than the vehicle's
    // min turning radius, as we'd be doing circles otherwise.
    if (pathTrackingMode == PathTrackingMode.pid) {
      // Switch if the distance is larger than 0.7 times the turning
      // radius, this value is experimental to find a smoother transition
      // to swap mode.
      if (lateralDistance > 0.7 * vehicle!.minTurningRadius &&
          tempPathTrackingMode != PathTrackingMode.purePursuit) {
        tempPathTrackingMode = PathTrackingMode.purePursuit;
      }
      // Swap back to the pid mode when we're within the turning circle
      // radius of the path.
      else if (pathTrackingMode == PathTrackingMode.pid &&
          lateralDistance < vehicle!.minTurningRadius) {
        tempPathTrackingMode = pathTrackingMode;
      }
    }
  }

  /// Updates the calculated gauges for the vehicle state only by the
  /// simulation and possibly IMU.
  void _simGaugeUpdate() {
    // Distance
    if (vehicle != null && prevVehicle != null) {
      final movedDistance =
          vehicle!.position.spherical.distanceTo(prevVehicle!.position);

      // Filter out too large distances
      if (movedDistance < 5) {
        distance = movedDistance;
      }
    } else {
      distance = 0;
    }
    if (!useIMUBearing) {
      // Bearing, only updated if we're moving to keep bearing while stationary.
      if (vehicle != null &&
          prevVehicle != null &&
          (vehicle?.velocity.abs() ?? 0) > 0.3) {
        // Discard bearing changes over 10 degrees for one simulation step.
        if (bearingDifference(prevVehicle!.bearing, vehicle!.bearing) < 10) {
          final bearing = prevVehicle!.position.spherical.finalBearingTo(
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
          bearingDifference(vehicle?.bearing ?? 0, gaugeBearing) > 120) {
        true => -1,
        false => 1,
      };
      gaugeVelocity = directionSign * distance / period;
    } else {
      gaugeVelocity = 0;
    }
  }

  /// Updates the calculated gauges for the vehicle state.
  void updateGauges() {
    // Update based on the last GNSS updates, if we've received one this tick.
    if (gnssUpdate != null && prevGnssUpdate != null) {
      distance = gnssUpdate!.gnssPosition.spherical
          .distanceTo(prevGnssUpdate!.gnssPosition);

      // Only use update points that are more than 5 cm apart to update bearing.
      if (distance > 0.05) {
        final bearing = prevGnssUpdate!.gnssPosition.spherical
            .finalBearingTo(gnssUpdate!.gnssPosition);

        if (!bearing.isNaN) {
          // Negative if reversing, positive otherwise.
          final directionSign =
              switch (bearingDifference(vehicle?.bearing ?? 0, bearing) > 120) {
            true => -1,
            false => 1,
          };

          final period =
              gnssUpdate!.time.difference(prevGnssUpdate!.time).inMicroseconds /
                  1e6;
          gaugeVelocity = directionSign * distance / period;

          if (!useIMUBearing) {
            gaugeBearing = (bearing +
                    switch (directionSign.isNegative) {
                      true => 180,
                      false => 0
                    })
                .wrap360();
          }
        }
        prevGnssUpdate = gnssUpdate;
        gnssUpdate = null;
        return;
      }
    }
    _simGaugeUpdate();
  }

  /// Update the simulation, i.e. simulate the next step.
  void update() {
    checkGuidance();
    updateVehicleVelocityAndSteering();
    checkTurningCircle();
    updateTime();
    if (gnssUpdate != null) {
      vehicle?.position = gnssUpdate!.gnssPosition;
      vehicle?.updateChildren();
    } else {
      vehicle?.updatePositionAndBearing(
        period,
        turningCircleCenter,
      );
    }
    updateGauges();

    if (!allowManualSimInput) {
      vehicle
        ?..velocity = gaugeVelocity
        ..bearing = gaugeBearing;
    }

    didChange = forceChange || prevVehicle != vehicle;

    prevVehicle = vehicle?.copyWith();
    forceChange = false;
  }
}
