import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:geobase/geobase.dart';
import 'package:path_provider/path_provider.dart';
import 'package:udp/udp.dart';
import 'package:universal_io/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// A class for simulating how vehicles should move given their position,
/// bearing, steering angle and velocity.
class SimulatorCore {
  /// Targets 60 hz => 16666.66... micro seconds
  static const _targetPeriodMicroSeconds = 16667;

  /// The time in seconds between attempts to resolve the hardware host/IP
  /// address.
  static const addressLookupRetryPeriod = 5;

  /// Used on native platforms since they can easily be multithreaded.
  static Future<void> isolateWorker(SendPort sendPort) async {
    DartPluginRegistrant.ensureInitialized();

    final commandPort = ReceivePort('Simulation Core receive port');

    // Send a communication port in return.
    sendPort.send(commandPort.sendPort);

    // A stream controller for sending messages to the main thread.
    final updateMainThreadStream = StreamController<dynamic>()
      ..stream.listen((event) {
        sendPort.send(event);
      })
      ..add(
        LogEvent(Level.info, 'Simulator Core isolate spawn confirmation'),
      );

    // Heartbeat signal to show that the simulator isolate is alive.
    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      sendPort.send('Heartbeat');
    });

    // The state of the simulation.
    final state = _SimulatorCoreState(updateMainThreadStream);

    DateTime? lastHardwareMessageTime;

    var prevHardwareIsConnected = false;

    // A timer for periodically updating the simulation.
    final simulationTimer = Timer.periodic(
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
              autosteeringState: state.autosteeringState,
              hardwareIsConnected: hardwareIsConnected,
            ),
          );
        }
      }
    });

    Endpoint? serverEndPoint;
    Endpoint? endPoint;
    UDP? udp;

    final udpSendStream = StreamController<Uint8List>();

    state.networkSendStream = udpSendStream;

    udpSendStream.stream.listen(
      (event) {
        if (udp != null && serverEndPoint != null) {
          udp!.send(event, serverEndPoint!);
        }
      },
    );

    final heartbeatUDPMessage = Uint8List.fromList(
      utf8.encode('${Platform.operatingSystem}: Heartbeat'),
    );

    var udpHeartbeatTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => udpSendStream.add(heartbeatUDPMessage),
    );

    late final MessageDecoder messageDecoder;

    void handleUdpData(Datagram? datagram) {
      lastHardwareMessageTime = DateTime.now();
      _networkListener(
        datagram?.data,
        messageDecoder,
        state,
        updateMainThreadStream,
      );
    }

    Timer? addressLookupRetryTimer;

    Future<void> setupUdp({
      required String host,
      required int receivePort,
      required int sendPort,
    }) async {
      try {
        final hardwareAddress =
            (await InternetAddress.lookup(host)).firstOrNull;
        if (hardwareAddress != null) {
          udpHeartbeatTimer.cancel();

          serverEndPoint = Endpoint.unicast(
            hardwareAddress,
            port: Port(sendPort),
          );

          endPoint = Endpoint.any(port: Port(receivePort));

          udp?.close();
          updateMainThreadStream.add(
            LogEvent(
              Level.info,
              'Closed current UDP instance and sockets.',
            ),
          );
          if (endPoint != null) {
            udp = await UDP.bind(endPoint!);
          }
          updateMainThreadStream.add(
            LogEvent(
              Level.info,
              '''Set up local UDP endpoint on IP: ${udp?.local.address}, port: ${udp?.local.port?.value}''',
            ),
          );

          udp?.asStream().listen(handleUdpData);

          updateMainThreadStream.add(
            LogEvent(
              Level.info,
              '''Listening to server UDP endpoint IP: ${serverEndPoint?.address}, port: ${serverEndPoint?.port?.value}''',
            ),
          );

          udpSendStream.add(
            Uint8List.fromList(utf8.encode('Simulator started')),
          );

          udpHeartbeatTimer = Timer.periodic(
            const Duration(seconds: 1),
            (timer) => udpSendStream.add(heartbeatUDPMessage),
          );
        }
      } catch (error) {
        // Continue, as the error is the same as previously.
        addressLookupRetryTimer?.cancel();
        addressLookupRetryTimer =
            Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
          await setupUdp(
            host: host,
            receivePort: receivePort,
            sendPort: sendPort,
          );
        });
      }
    }

    addressLookupRetryTimer =
        Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
      await setupUdp(
        host: 'autosteering.local',
        receivePort: 3333,
        sendPort: 6666,
      );
    });

    LogReplay? logReplay;
    StreamSubscription<String>? replayListener;

    // Handle incoming messages from other dart isolates.
    await for (final message in commandPort) {
      /// Ensure that the isolate messaging is ready.
      if (message is RootIsolateToken) {
        BackgroundIsolateBinaryMessenger.ensureInitialized(message);
        final logDirectoryPath = [
          (await getApplicationDocumentsDirectory()).path,
          '/Autosteering/logs',
        ].join();
        messageDecoder = MessageDecoder(logDirectoryPath: logDirectoryPath);
      }
      // Update the udp ip adress for the hardware.
      else if (message is ({
        String hardwareAddress,
        int hardwareUDPReceivePort,
        int hardwareUDPSendPort
      })) {
        udpHeartbeatTimer.cancel();
        addressLookupRetryTimer?.cancel();

        // Start retrying every 5 seconds in case the hardware gets connected
        // to the network.

        addressLookupRetryTimer =
            Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
          await setupUdp(
            host: message.hardwareAddress,
            receivePort: message.hardwareUDPReceivePort,
            sendPort: message.hardwareUDPSendPort,
          );
        });
      } else if (message is ({
        bool? logGNSS,
        bool? logIMU,
        bool? logWAS,
        bool? logCombined,
      })) {
        messageDecoder.enableLogging(
          gnss: message.logGNSS,
          imu: message.logIMU,
          was: message.logWAS,
          combined: message.logCombined,
        );
      } else if (message is LogReplay) {
        logReplay = message;
        replayListener = logReplay.replay.listen(
          (record) => _replayListener(
            record,
            messageDecoder,
            state,
            updateMainThreadStream,
          ),
        )..pause();
      } else if (message is ({bool replayPause})) {
        replayListener?.pause();
      } else if (message is ({bool replayResume})) {
        replayListener?.resume();
      } else if (message is ({bool replayCancel})) {
        await replayListener?.cancel();
      } else if (message is ({bool replayRestart})) {
        await replayListener?.cancel();
        replayListener = logReplay?.replay.listen(
          (record) => _replayListener(
            record,
            messageDecoder,
            state,
            updateMainThreadStream,
          ),
        );
      }
      // Messages for the state.
      else {
        state.handleMessage(message);
      }
    }

    // Isolate shut down procedure
    udpSendStream.add(
      Uint8List.fromList(
        utf8.encode('Simulator shut down.'),
      ),
    );

    udp?.close();

    updateMainThreadStream.add(
      LogEvent(Level.info, 'Simulator Core isolate exited.'),
    );
    Isolate.exit();
  }

  static void _networkListener(
    Uint8List? data,
    MessageDecoder decoder,
    _SimulatorCoreState state,
    StreamController<dynamic> updateMainThreadStream,
  ) {
    if (data != null) {
      final messages = decoder.decode(data);

      for (final message in messages) {
        if (message is ImuReading ||
            message is ({Geographic gnssPosition, DateTime time}) ||
            message is WasReading) {
          state.handleMessage(message);
        } else if (message != null) {
          updateMainThreadStream.add(message);
          if (message is GnssPositionCommonSentence) {
            state.handleMessage((gnssFixQuality: message.quality ?? 0));
          }
        }
      }
    }
  }

  static void _replayListener(
    String record,
    MessageDecoder decoder,
    _SimulatorCoreState state,
    StreamController<dynamic> updateMainThreadStream,
  ) {
    for (final message in decoder.parseString(record)) {
      if (message is ImuReading ||
          message is ({Geographic gnssPosition, DateTime time}) ||
          message is WasReading) {
        state.handleMessage(message);
      } else if (message != null) {
        updateMainThreadStream.add(message);
        if (message is GnssPositionCommonSentence) {
          state.handleMessage((gnssFixQuality: message.quality ?? 0));
        }
      }
    }
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
        AutosteeringState autosteeringState,
        bool hardwareIsConnected,
      })> webWorker(
    Stream<dynamic> vehicleEvents,
    StreamController<dynamic> updateMainStream,
  ) {
    updateMainStream.add(LogEvent(Level.info, 'Simulator Core worker spawned'));

    // The state of the simulation.
    final state = _SimulatorCoreState(updateMainStream);

    WebSocketChannel? socket;

    DateTime? lastHardwareMessageTime;

    final messageDecoder = MessageDecoder();

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
              _networkListener(event, messageDecoder, state, updateMainStream);
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
          AutosteeringState autosteeringState,
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
              autosteeringState: state.autosteeringState,
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
  _SimulatorCoreState(this.mainThreadSendStream);

  /// A stream controller for forwarding events to send over the network.
  StreamController<Uint8List>? networkSendStream;

  /// A stream controller for sending messages to the main thread.
  StreamController<dynamic> mainThreadSendStream;

  /// Whether the Simulator Core should send messages to the hardware.
  bool sendMessagesToHardware = false;

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
  /// If the deviation is lower that the threshold, the IMU bearing zero
  /// value will be set to the average of the bearings.
  double get bearingZeroDeviationMaxThreshold => switch (gnssFixQuality) {
        GnssFixQuality.fix => 0.03,
        GnssFixQuality.differentialFix => 0.02,
        GnssFixQuality.floatRTK => .015,
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

  /// The velocity threshold for activating auto steering, m/s.
  double autoSteerThresholdVelocity = 0.05;

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

  /// Whether the vehicle should use the [pathTracking] model to steer.
  bool enablePathTracking = false;

  /// Whehter the vehicle should automatically steer.
  AutosteeringState autosteeringState = AutosteeringState.disabled;

  /// Which mode the [pathTracking] should use to go from the last to the first
  /// waypoint.
  PathTrackingLoopMode pathTrackingLoopMode = PathTrackingLoopMode.none;

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
  ///
  /// This can be [Vehicle], [PathTrackingMode] or records for the vehicle's
  /// position, velocity(Delta), steeringAngle(Delta), [pathTracking],
  /// [autoSlowDown], [autoCenterSteering], [enablePathTracking] or
  /// [pathTrackingLoopMode].
  void handleMessage(dynamic message) {
    // Force update to reflect changes in case we haven't moved.
    forceChange = true;

    // Enable/disable sending messages to the hardware.
    if (message is ({bool sendMessagesToHardware})) {
      sendMessagesToHardware = message.sendMessagesToHardware;
    }
    // Set the vehicle to simulate.
    else if (message is Vehicle) {
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
    }
    // Update whether the simulation should accept manual controls.
    else if (message is ({bool allowManualSimInput})) {
      allowManualSimInput = message.allowManualSimInput;
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
    else if (message is MotorConfig) {
      vehicle?.motorConfig = message;
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
        mainThreadSendStream
            .add(LogEvent(Level.warning, 'Attempting to activate Autosteer.'));

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
    // Tell hardware to connect to this device as tcp ntrip server.
    else if (message is ({Uint8List useAsNtripServer})) {
      networkSendStream?.add(message.useAsNtripServer);
    }
    // Enable/disable motor calibration.
    else if (message is ({bool enableMotorCalibration})) {
      motorCalibrationEnabled = message.enableMotorCalibration;
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

      switch (steeringChange) {
        case SimInputChange.reset:
          vehicle!.steeringAngleInput = 0;
          steeringChange = SimInputChange.hold;

        case SimInputChange.increase:
          if (vehicle!.steeringAngleInput == 0) {
            vehicle!.steeringAngleInput = 0.01;
          }
          vehicle!.steeringAngleInput =
              (vehicle!.steeringAngleInput + period * steeringRate)
                  .clamp(-vehicle!.steeringAngleMax, vehicle!.steeringAngleMax);
        case SimInputChange.decrease:
          if (vehicle!.steeringAngleInput == 0) {
            vehicle!.steeringAngleInput = -0.01;
          }
          vehicle!.steeringAngleInput =
              (vehicle!.steeringAngleInput - period * steeringRate)
                  .clamp(-vehicle!.steeringAngleMax, vehicle!.steeringAngleMax);

        case SimInputChange.hold:
          receivingManualInput = false;
          if (autoCenterSteering &&
              autosteeringState == AutosteeringState.disabled) {
            // Centering rate deg/s, slow down to not overshoot the min steering
            // angle in the opposite direction
            final centeringRate = switch (vehicle!.steeringAngle.abs() < 0.5) {
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

      // Filter out very low angles as they make the simulation spazz out
      // because the  turning circles get very large.
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
          allowManualTrackingUpdates) {
        abTracking?.manualUpdate(vehicle!);
      }

      steeringAngleTarget = 0.0;
      if (abTracking != null) {
        steeringAngleTarget =
            abTracking!.nextSteeringAngle(vehicle!, mode: pathTrackingMode);
      } else if (pathTracking != null) {
        pathTracking!.tryChangeWayPoint(vehicle!);

        if (enablePathTracking) {
          steeringAngleTarget =
              pathTracking!.nextSteeringAngle(vehicle!, mode: pathTrackingMode);
        }
      }

      if (autosteeringState != AutosteeringState.disabled &&
          !receivingManualInput &&
          !motorCalibrationEnabled) {
        // Only allow steering if vehicle is moving to prevent jitter that
        // moves the vehicle when stationary.
        if (steeringAngleTarget == vehicle!.steeringAngleInput ||
            vehicle!.velocity == 0) {
          steeringChange = SimInputChange.hold;
        } else if (steeringAngleTarget! < vehicle!.steeringAngleInput) {
          steeringChange = SimInputChange.decrease;
        } else if (steeringAngleTarget! > vehicle!.steeringAngleInput) {
          steeringChange = SimInputChange.increase;
        }

        if (vehicle!.velocity.abs() > autoSteerThresholdVelocity) {
          wasTarget = vehicle!.wasTargetFromSteeringAngle(steeringAngleTarget!);
          networkSendStream?.add(
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
        }
      } else if (motorCalibrationEnabled) {
        networkSendStream?.add(
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
      }
      mainThreadSendStream
        ..add((steeringAngleTarget: steeringAngleTarget))
        ..add((wasTarget: wasTarget));
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
      if (gnssUpdate != null && prevGnssUpdates.lastOrNull != null
          // &&          !allowManualSimInput
          ) {
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

        distance = distances.last;

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
        // distance = prevVehicle!.position.rhumb.distanceTo(vehicle!.position);
        distance = 0;
      }
    } else if (allowManualSimInput) {
      _simGaugeUpdate();
    }
  }

  /// Update the simulation, i.e. simulate the next step.
  void update() {
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
        vehicle!.updateChildren();
      } else if (!allowManualSimInput && !allowSimInterpolation) {
        vehicle!.updateChildren();
      }
      // Update by simulation
      else if (allowManualSimInput || allowSimInterpolation) {
        vehicle!.updatePositionAndBearing(
          period,
          turningCircleCenter,
          // force: gaugeVelocity.abs() > 0,
        );
        // gnssUpdate = (gnssPosition: vehicle!.position, time: DateTime.now());
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
