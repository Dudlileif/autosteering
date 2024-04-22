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
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/simulator/models/simulator_core_state.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:udp/udp.dart';

/// A class for simulating how vehicles should move given their position,
/// bearing, steering angle and velocity.
class SimulatorCore {
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
    final state = SimulatorCoreState(updateMainThreadStream);

    DateTime? lastHardwareMessageTime;

    var prevHardwareIsConnected = false;

    void simulationStep() {
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
    }

    // A timer for periodically updating the simulation.
    var simulationTimer = Timer.periodic(
      const Duration(
        microseconds: SimulatorCoreBase.defaultTargetPeriodMicroSeconds,
      ),
      (timer) => simulationStep(),
    );

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
      SimulatorCoreBase.networkListener(
        datagram?.data,
        messageDecoder,
        state,
        updateMainThreadStream,
      );

      if (datagram?.data != null) {
        final string = String.fromCharCodes(datagram!.data);
        if (string.startsWith('Steering hardware') &&
            datagram.address != serverEndPoint?.address) {
          updateMainThreadStream.add((hardwareAddress: datagram.address));
        }
      }
    }

    Future<void> setupReceiveUdp(int receivePort) async {
      endPoint = Endpoint.any(port: Port(receivePort));
      udp?.close();

      updateMainThreadStream.add(
        LogEvent(
          Level.info,
          'Closed current UDP receive instance and sockets.',
        ),
      );
      if (endPoint != null) {
        udp = await UDP.bind(endPoint!);
      }
      updateMainThreadStream.add(
        LogEvent(
          Level.info,
          '''Set up local UDP receive endpoint on IP: ${udp?.local.address}, port: ${udp?.local.port?.value}''',
        ),
      );

      udp?.asStream().listen(handleUdpData);
    }

    Timer? addressLookupRetryTimer;

    Future<void> setupSendUdp({
      required String host,
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
          updateMainThreadStream
            ..add(
            LogEvent(
              Level.info,
                'Closed current UDP send instance and sockets.',
            ),
            )
            ..add(
            LogEvent(
              Level.info,
                '''Hardware UDP endpoint IP: ${serverEndPoint?.address}, port: ${serverEndPoint?.port?.value}''',
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
          await setupSendUdp(
            host: host,
            sendPort: sendPort,
          );
        });
      }
    }

    addressLookupRetryTimer =
        Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
      await setupSendUdp(
        host: 'autosteering.local',
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
          '/Autosteering/logs/hardware',
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

        if (udp?.local.port?.value != message.hardwareUDPReceivePort) {
          await setupReceiveUdp(message.hardwareUDPReceivePort);
        }

        // Start retrying every 5 seconds in case the hardware gets connected
        // to the network.
        addressLookupRetryTimer =
            Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
          await setupSendUdp(
            host: message.hardwareAddress,
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
          (record) => SimulatorCoreBase.replayListener(
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
          (record) => SimulatorCoreBase.replayListener(
            record,
            messageDecoder,
            state,
            updateMainThreadStream,
          ),
        );
      } else if (message is ({int simulationTargetHz})) {
        if (message.simulationTargetHz > 0) {
          simulationTimer.cancel();
          simulationTimer = Timer.periodic(
            Duration(microseconds: (1e6 / message.simulationTargetHz).round()),
            (timer) => simulationStep(),
          );
          updateMainThreadStream.add(
            LogEvent(
              Level.warning,
              'Simulation frequency: ${message.simulationTargetHz} Hz',
            ),
          );
        }
      }
      // Shut down the isolate.
      else if (message == null) {
        break;
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
}
