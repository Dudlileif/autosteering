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

    void simulationStep() {
      if (state.vehicle != null) {
        state.update();

        // If the state has changed we send the new state back to the
        // main/UI isolate.
        if (state.didChange) {
          sendPort.send(
            (
              vehicle: state.vehicle,
              velocity: state.gaugeVelocity,
              bearing: state.gaugeBearing,
              distance: state.distance,
              pathTracking: state.pathTracking,
              abTracking: state.abTracking,
              autosteeringState: state.autosteeringState,
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

    var steeringHardwareAddress = 'autosteering.local';
    var remoteControlHardwareAddress = 'autosteering-remote-control.local';

    Endpoint? steeringHardwareEndPoint;
    Endpoint? remoteControlEndPoint;
    Endpoint? endPoint;
    UDP? udp;

    final steeringHardwareUdpSendStream = StreamController<Uint8List>();
    final remoteControlHardwareUdpSendStream = StreamController<Uint8List>();

    state
      ..steeringHardwareSendStream = steeringHardwareUdpSendStream
      ..remoteControlSendStream = remoteControlHardwareUdpSendStream;

    steeringHardwareUdpSendStream.stream.listen(
      (event) {
        if (udp != null && steeringHardwareEndPoint != null) {
          udp!.send(event, steeringHardwareEndPoint!);
        }
      },
    );
    remoteControlHardwareUdpSendStream.stream.listen(
      (event) {
        if (udp != null && remoteControlEndPoint != null) {
          udp!.send(event, remoteControlEndPoint!);
        }
      },
    );

    final heartbeatUDPMessage = Uint8List.fromList(
      utf8.encode('${Platform.operatingSystem}: Heartbeat'),
    );

    var udpHeartbeatTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        steeringHardwareUdpSendStream.add(heartbeatUDPMessage);
        remoteControlHardwareUdpSendStream.add(heartbeatUDPMessage);
      },
    );

    late final MessageDecoder messageDecoder;
    void handleUdpData(Datagram? datagram) {
      SimulatorCoreBase.networkListener(
        datagram?.data,
        messageDecoder,
        state,
        updateMainThreadStream,
      );

      if (datagram?.data != null) {
        final string = String.fromCharCodes(datagram!.data);
        if (string.startsWith('Steering hardware') &&
            datagram.address != steeringHardwareEndPoint?.address) {
          updateMainThreadStream
              .add((steeringHardwareAddress: datagram.address));
        } else if (string.startsWith('Remote control')) {
          if (datagram.address != remoteControlEndPoint?.address) {
            updateMainThreadStream
                .add((remoteControlHardwareAddress: datagram.address));
          } else {
            updateMainThreadStream.add((remoteControlHeartbeat: true));
          }
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

    Timer? steeringAddressLookupRetryTimer;
    Timer? remoteControlAddressLookupRetryTimer;

    Future<void> setupSteeringSendUdp({
      required String host,
      required int sendPort,
    }) async {
      try {
        final steeringHardwareAddress =
            (await InternetAddress.lookup(host)).firstOrNull;
        if (steeringHardwareAddress != null) {
          udpHeartbeatTimer.cancel();

          steeringHardwareEndPoint = Endpoint.unicast(
            steeringHardwareAddress,
            port: Port(sendPort),
          );
          updateMainThreadStream
            ..add(
              LogEvent(
                Level.info,
                '''Closed current steering hardware UDP send instance and sockets.''',
              ),
            )
            ..add(
              LogEvent(
                Level.info,
                '''Steering hardware UDP endpoint IP: ${steeringHardwareEndPoint?.address}, port: ${steeringHardwareEndPoint?.port?.value}''',
              ),
            );

          steeringHardwareUdpSendStream.add(
            Uint8List.fromList(utf8.encode('Simulator started')),
          );

          udpHeartbeatTimer = Timer.periodic(
            const Duration(seconds: 1),
            (timer) {
              steeringHardwareUdpSendStream.add(heartbeatUDPMessage);
              remoteControlHardwareUdpSendStream.add(heartbeatUDPMessage);
            },
          );
        }
      } catch (error) {
        // Continue, as the error is the same as previously.
        steeringAddressLookupRetryTimer?.cancel();
        steeringAddressLookupRetryTimer =
            Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
          await setupSteeringSendUdp(
            host: host,
            sendPort: sendPort,
          );
        });
      }
    }

    Future<void> setupRemoteControlSendUdp({
      required String host,
      required int sendPort,
    }) async {
      try {
        final remoteControlHardwareAddress =
            (await InternetAddress.lookup(host)).firstOrNull;
        if (remoteControlHardwareAddress != null) {
          udpHeartbeatTimer.cancel();

          remoteControlEndPoint = Endpoint.unicast(
            remoteControlHardwareAddress,
            port: Port(sendPort),
          );
          updateMainThreadStream
            ..add(
              LogEvent(
                Level.info,
                '''Closed current remote control hardware UDP send instance and sockets.''',
              ),
            )
            ..add(
              LogEvent(
                Level.info,
                '''Remote control hardware UDP endpoint IP: ${remoteControlEndPoint?.address}, port: ${remoteControlEndPoint?.port?.value}''',
              ),
            );

          remoteControlHardwareUdpSendStream.add(
            Uint8List.fromList(utf8.encode('Simulator started')),
          );

          udpHeartbeatTimer = Timer.periodic(
            const Duration(seconds: 1),
            (timer) {
              steeringHardwareUdpSendStream.add(heartbeatUDPMessage);
              remoteControlHardwareUdpSendStream.add(heartbeatUDPMessage);
            },
          );
        }
      } catch (error) {
        // Continue, as the error is the same as previously.
        remoteControlAddressLookupRetryTimer?.cancel();
        remoteControlAddressLookupRetryTimer =
            Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
          await setupRemoteControlSendUdp(
            host: host,
            sendPort: sendPort,
          );
        });
      }
    }

    steeringAddressLookupRetryTimer =
        Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
      await setupSteeringSendUdp(
        host: steeringHardwareAddress,
        sendPort: 6666,
      );
    });

    remoteControlAddressLookupRetryTimer =
        Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
      await setupRemoteControlSendUdp(
        host: remoteControlHardwareAddress,
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
        String steeringHardwareAddress,
        String remoteControlHardwareAddress,
        int hardwareUDPReceivePort,
        int hardwareUDPSendPort
      })) {
        steeringHardwareAddress = message.steeringHardwareAddress;
        remoteControlHardwareAddress = message.remoteControlHardwareAddress;
        udpHeartbeatTimer.cancel();
        steeringAddressLookupRetryTimer?.cancel();
        remoteControlAddressLookupRetryTimer?.cancel();

        if (udp?.local.port?.value != message.hardwareUDPReceivePort) {
          await setupReceiveUdp(message.hardwareUDPReceivePort);
        }

        // Start retrying every 5 seconds in case the hardware gets connected
        // to the network.
        steeringAddressLookupRetryTimer =
            Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
          await setupSteeringSendUdp(
            host: message.steeringHardwareAddress,
            sendPort: message.hardwareUDPSendPort,
          );
        });
        remoteControlAddressLookupRetryTimer =
            Timer(const Duration(seconds: addressLookupRetryPeriod), () async {
          await setupRemoteControlSendUdp(
            host: message.remoteControlHardwareAddress,
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
      } else if (message is ({List<int> remoteControlLedState})) {
        remoteControlHardwareUdpSendStream.add(
          Uint8List.fromList(
            jsonEncode({'remote_states': message.remoteControlLedState})
                .codeUnits,
          ),
        );
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
    steeringHardwareUdpSendStream.add(
      Uint8List.fromList(
        utf8.encode('Simulator shut down.'),
      ),
    ); // Isolate shut down procedure
    remoteControlHardwareUdpSendStream.add(
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
