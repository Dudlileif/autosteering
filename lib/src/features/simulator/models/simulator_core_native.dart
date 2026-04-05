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
import 'package:flutter_multicast_lock/flutter_multicast_lock.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:udp/udp.dart';

/// A class for simulating how vehicles should move given their position,
/// bearing, steering angle and velocity.
@pragma('vm:entry-point')
class SimulatorCore {
  /// The time in seconds between attempts to resolve the hardware host/IP
  /// address.
  static const addressLookupRetryPeriod = 5;

  /// Used on native platforms since they can easily be multithreaded.
  @pragma('vm:entry-point')
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
      try {
        if (state.vehicle != null) {
          state.update();

          // If the state has changed we send the new state back to the
          // main/UI isolate.
          if (state.didChange) {
            sendPort.send((
              vehicle: state.vehicle,
              velocity: state.gaugeVelocity,
              bearing: state.gaugeBearing,
              distance: state.distance,
              pathTracking: state.pathTracking,
              abTracking: state.abTracking,
              autosteeringState: state.autosteeringState,
            ));
          }
        }
      } on Exception catch (error, stackTrace) {
        sendPort.send(
          LogEvent(
            Level.error,
            'Sim core exception!',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    }

    // A timer for periodically updating the simulation.
    var simulationTimer = Timer.periodic(
      const Duration(
        microseconds: SimulatorCoreBase.defaultTargetPeriodMicroSeconds,
      ),
      (timer) => simulationStep(),
    );

    var networkAvailable = false;
    var udpReceivePort = 3333;
    var udpSendPort = 6666;
    final receiveMulticastAddress = InternetAddress('239.0.0.10');
    final steeringHardwareMulticastAddress = InternetAddress('239.0.0.20');
    final remoteControlMulticastAddress = InternetAddress('239.0.0.30');

    Endpoint? steeringHardwareEndPoint;
    Endpoint? remoteControlEndPoint;
    Endpoint? receiveEndPoint;
    Endpoint? sendEndPoint;
    UDP? receiveUdp;
    RawDatagramSocket? sendSocket;

    final steeringHardwareUdpSendStream = StreamController<Uint8List>();
    final remoteControlHardwareUdpSendStream = StreamController<Uint8List>();

    state
      ..steeringHardwareSendStream = steeringHardwareUdpSendStream
      ..remoteControlSendStream = remoteControlHardwareUdpSendStream;

    steeringHardwareUdpSendStream.stream.listen((event) async {
      if (sendSocket != null && steeringHardwareEndPoint != null) {
        try {
          sendSocket!.send(
            event,
            steeringHardwareEndPoint!.address!,
            steeringHardwareEndPoint!.port!.value,
          );
        } on Exception catch (error, stackTrace) {
          updateMainThreadStream.add(
            LogEvent(
              Level.error,
              'UDP steering hardware send error.',
              error: error,
              stackTrace: stackTrace,
            ),
          );
        }
      }
    });
    remoteControlHardwareUdpSendStream.stream.listen((event) async {
      if (sendSocket != null && remoteControlEndPoint != null) {
        try {
          sendSocket!.send(
            event,
            remoteControlEndPoint!.address!,
            remoteControlEndPoint!.port!.value,
          );
        } on Exception catch (error, stackTrace) {
          updateMainThreadStream.add(
            LogEvent(
              Level.error,
              'UDP remote control send error.',
              error: error,
              stackTrace: stackTrace,
            ),
          );
        }
      }
    });

    final heartbeatUDPMessage = Uint8List.fromList(
      utf8.encode('${Platform.operatingSystem}: Heartbeat'),
    );

    var udpHeartbeatTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      steeringHardwareUdpSendStream.add(heartbeatUDPMessage);
      remoteControlHardwareUdpSendStream.add(heartbeatUDPMessage);
    });

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
        if (string.startsWith('Steering hardware')) {
          updateMainThreadStream.add((
            steeringHardwareAddress: datagram.address,
          ));
        } else if (string.startsWith('Remote control')) {
          updateMainThreadStream
            ..add((
              remoteControlHardwareAddress: datagram.address,
            ))
            ..add((remoteControlHeartbeat: true));
        }
      }
    }

    Future<void> setupSendUdp() async {
      sendEndPoint = Endpoint.unicast(
        steeringHardwareMulticastAddress,
        port: Port(udpSendPort),
      );
      sendSocket?.close();

      updateMainThreadStream.add(
        LogEvent(Level.info, 'Closed current UDP send instance and sockets.'),
      );
      if (sendEndPoint != null) {
        sendSocket = await RawDatagramSocket.bind(
          steeringHardwareMulticastAddress,
          udpSendPort,
        );
        final interfaces = await NetworkInterface.list();
        final interface = interfaces.firstWhere(
          (i) =>
              i.name.toLowerCase().contains('ap') ||
              i.name.toLowerCase().contains('wlan2') ||
              i.name.toLowerCase().contains('swlan'),
          orElse: () => interfaces.first,
        );
        sendSocket?.joinMulticast(steeringHardwareMulticastAddress, interface);
        sendSocket?.joinMulticast(remoteControlMulticastAddress, interface);

        sendSocket?.setMulticastInterface(interface);
      }
      updateMainThreadStream.add(
        LogEvent(
          Level.info,
          '''Set up local UDP send endpoint on IP: ${sendSocket?.address}, port: ${sendSocket?.port}''',
        ),
      );
    }

    Future<void> setupReceiveUdp(int receivePort) async {
      if (!await FlutterMulticastLock().isMulticastLockHeld()) {
        await FlutterMulticastLock().acquireMulticastLock();
      }
      receiveEndPoint = Endpoint.unicast(
        receiveMulticastAddress,
        port: Port(receivePort),
      );
      receiveUdp?.close();

      updateMainThreadStream.add(
        LogEvent(
          Level.info,
          'Closed current UDP receive instance and sockets.',
        ),
      );
      if (receiveEndPoint != null) {
        receiveUdp = await UDP.bind(receiveEndPoint!);

        final interfaces = await NetworkInterface.list();
        final interface = interfaces.firstWhere(
          (i) =>
              i.name.toLowerCase().contains('ap') ||
              i.name.toLowerCase().contains('wlan2') ||
              i.name.toLowerCase().contains('swlan'),
          orElse: () => interfaces.first,
        );
        receiveUdp?.socket?.joinMulticast(receiveMulticastAddress, interface);
      }
      updateMainThreadStream.add(
        LogEvent(
          Level.info,
          '''Set up local UDP receive endpoint on IP: ${receiveUdp?.local.address}, port: ${receiveUdp?.local.port?.value}''',
        ),
      );

      receiveUdp?.asStream().listen(handleUdpData);
    }

    Timer? steeringAddressLookupRetryTimer;
    Timer? remoteControlAddressLookupRetryTimer;

    Future<void> setupSteeringSendUdp() async {
      try {
        udpHeartbeatTimer.cancel();

        steeringHardwareEndPoint = Endpoint.multicast(
          steeringHardwareMulticastAddress,
          port: Port(udpSendPort),
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

        udpHeartbeatTimer = Timer.periodic(const Duration(seconds: 1), (
          timer,
        ) {
          steeringHardwareUdpSendStream.add(heartbeatUDPMessage);
          remoteControlHardwareUdpSendStream.add(heartbeatUDPMessage);
        });
      } on Exception catch (_) {
        // Continue, as the error is the same as previously.
        steeringAddressLookupRetryTimer?.cancel();
        steeringAddressLookupRetryTimer = Timer(
          const Duration(seconds: addressLookupRetryPeriod),
          () async {
            await setupSteeringSendUdp();
          },
        );
      }
    }

    Future<void> setupRemoteControlSendUdp() async {
      try {
        udpHeartbeatTimer.cancel();

        remoteControlEndPoint = Endpoint.multicast(
          remoteControlMulticastAddress,
          port: Port(udpSendPort),
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

        udpHeartbeatTimer = Timer.periodic(const Duration(seconds: 1), (
          timer,
        ) {
          steeringHardwareUdpSendStream.add(heartbeatUDPMessage);
          remoteControlHardwareUdpSendStream.add(heartbeatUDPMessage);
        });
      } on Exception catch (_) {
        // Continue, as the error is the same as previously.
        remoteControlAddressLookupRetryTimer?.cancel();
        remoteControlAddressLookupRetryTimer = Timer(
          const Duration(seconds: addressLookupRetryPeriod),
          () async {
            await setupRemoteControlSendUdp();
          },
        );
      }
    }

    steeringAddressLookupRetryTimer = Timer(
      const Duration(seconds: addressLookupRetryPeriod),
      () async {
        await setupSteeringSendUdp();
      },
    );

    remoteControlAddressLookupRetryTimer = Timer(
      const Duration(seconds: addressLookupRetryPeriod),
      () async {
        await setupRemoteControlSendUdp();
      },
    );

    LogReplay? logReplay;
    StreamSubscription<LogReplayRecord>? replayListener;

    // Handle incoming messages from other dart isolates.
    await for (final message in commandPort) {
      try {
        // Ensure that the isolate messaging is ready.
        if (message is RootIsolateToken) {
          BackgroundIsolateBinaryMessenger.ensureInitialized(message);
          final logDirectoryPath = path.join(
            (await getApplicationDocumentsDirectory()).path,
            'Autosteering',
            'logs',
            'hardware',
          );
          messageDecoder = MessageDecoder(logDirectoryPath: logDirectoryPath);

          await setupReceiveUdp(udpReceivePort);
          await setupSendUdp();
        }
        // Close and remote UDP instances if no network is available, stops
        // isolate from crashing
        else if (message is ({bool networkAvailable})) {
          networkAvailable = message.networkAvailable;
          if (networkAvailable) {
            await setupSendUdp();
            await setupReceiveUdp(udpReceivePort);
          } else {
            sendSocket?.close();
            receiveUdp?.close();
            if (sendSocket != null || receiveUdp != null) {
              updateMainThreadStream.add(
                LogEvent(
                  Level.info,
                  'Closed current UDP receive instance and sockets.',
                ),
              );
            }
            receiveUdp = null;
            sendSocket = null;
          }
        }
        // Update the udp ip adress for the hardware.
        else if (message
            is ({
              int hardwareUDPReceivePort,
              int hardwareUDPSendPort,
            })) {
          udpReceivePort = message.hardwareUDPReceivePort;
          udpSendPort = message.hardwareUDPSendPort;
          udpHeartbeatTimer.cancel();
          steeringAddressLookupRetryTimer?.cancel();
          remoteControlAddressLookupRetryTimer?.cancel();

          if (receiveUdp?.local.port?.value != message.hardwareUDPReceivePort) {
            await setupReceiveUdp(message.hardwareUDPReceivePort);
          }

          // Start retrying every 5 seconds in case the hardware gets connected
          // to the network.
          steeringAddressLookupRetryTimer = Timer(
            const Duration(seconds: addressLookupRetryPeriod),
            () async {
              await setupSteeringSendUdp();
            },
          );
          remoteControlAddressLookupRetryTimer = Timer(
            const Duration(seconds: addressLookupRetryPeriod),
            () async {
              await setupRemoteControlSendUdp();
            },
          );
        } else if (message
            is ({
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
          replayListener = logReplay.replay.listen((record) {
            SimulatorCoreBase.replayListener(
              record.message,
              messageDecoder,
              state,
              updateMainThreadStream,
            );
            updateMainThreadStream.add((logReplayIndex: record.index));
          })..pause();
        } else if (message is ({bool replayPause})) {
          replayListener?.pause();
          logReplay?.stopTimer();
        } else if (message is ({bool replayResume})) {
          replayListener?.resume();
          logReplay?.startTimer();
        } else if (message is ({bool replayCancel})) {
          await replayListener?.cancel();
          logReplay?.stopTimer();
        } else if (message is ({bool replayRestart})) {
          await replayListener?.cancel();
          replayListener = logReplay?.replay.listen((record) {
            SimulatorCoreBase.replayListener(
              record.message,
              messageDecoder,
              state,
              updateMainThreadStream,
            );
            updateMainThreadStream.add((logReplayIndex: record.index));
          });
          logReplay?.startTimer();
        } else if (message is ({bool replayLoop})) {
          logReplay?.loop = message.replayLoop;
        } else if (message is ({int replayScrubIndex})) {
          final record = logReplay?.scrubToIndex(message.replayScrubIndex);
          if (record != null) {
            SimulatorCoreBase.replayListener(
              record.message,
              messageDecoder,
              state,
              updateMainThreadStream,
            );
            updateMainThreadStream.add((
              logReplayIndex: message.replayScrubIndex,
            ));
          }
        } else if (message is ({int simulationTargetHz})) {
          if (message.simulationTargetHz > 0) {
            simulationTimer.cancel();
            simulationTimer = Timer.periodic(
              Duration(
                microseconds: (1e6 / message.simulationTargetHz).round(),
              ),
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
              jsonEncode({
                'remote_states': message.remoteControlLedState,
              }).codeUnits,
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

        // Isolate shut down procedure
        steeringHardwareUdpSendStream.add(
          Uint8List.fromList(utf8.encode('Simulator shut down.')),
        ); // Isolate shut down procedure
        remoteControlHardwareUdpSendStream.add(
          Uint8List.fromList(utf8.encode('Simulator shut down.')),
        );
      } on Exception catch (error, stackTrace) {
        updateMainThreadStream.add(
          LogEvent(
            Level.error,
            'Simulator Core received message error: $message.',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    }
    receiveUdp?.close();
    sendSocket?.close();
    await FlutterMulticastLock().releaseMulticastLock();

    updateMainThreadStream.add(
      LogEvent(Level.info, 'Simulator Core isolate exited.'),
    );
    Isolate.exit();
  }
}
