import 'dart:typed_data';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'network_providers.g.dart';

/// A provider for whether there is a connection with the hardware.
@Riverpod(keepAlive: true)
class HardwareIsConnected extends _$HardwareIsConnected {
  @override
  bool build() => false;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for the wireless IP adress of the device.
@riverpod
FutureOr<String?> deviceIPAdressWlan(DeviceIPAdressWlanRef ref) =>
    NetworkInterface.list(type: InternetAddressType.IPv4).then((interfaces) {
      if (interfaces.isNotEmpty) {
        return interfaces
            .firstWhereOrNull((element) => element.name.startsWith('w'))
            ?.addresses
            .first
            .address;
      }
      return null;
    });

/// A provider for the wireless IP adress of the device.
@riverpod
FutureOr<String?> deviceIPAdressEthernet(
  DeviceIPAdressEthernetRef ref,
) =>
    NetworkInterface.list(type: InternetAddressType.IPv4).then((interfaces) {
      if (interfaces.isNotEmpty) {
        return interfaces
            .firstWhereOrNull((element) => element.name.startsWith('e'))
            ?.addresses
            .first
            .address;
      }
      return null;
    });

/// A provider for the IP adress of the hardware we want to communicate with.
@Riverpod(keepAlive: true)
class HardwareIPAdress extends _$HardwareIPAdress {
  @override
  String build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareIPAdress, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getString(SettingsKey.hardwareIPAdress) ??
        '192.168.4.1';
  }

  /// Update the [state] to [value] if it's a valid IP adress.
  void update(String value) => Future(() {
        if (InternetAddress.tryParse(value) != null) {
          state = value;
        }
      });
}

/// A provider for the UDP receive port for the device.
@Riverpod(keepAlive: true)
class HardwareUDPReceivePort extends _$HardwareUDPReceivePort {
  @override
  int build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareUDPReceivePort, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getInt(SettingsKey.hardwareUDPReceivePort) ??
        3333;
  }

  /// Update the [state] to [value].
  void update(int value) => Future(() => state = value);

  /// Update the [state] to [value] if it's a valid integer.
  void updateFromString(String value) => Future(() {
        final port = int.tryParse(value);
        if (port != null) {
          if (port >= 1000 && port <= 65535) {
            state = port;
          }
        }
      });
}

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [HardwareIPAdress].
@Riverpod(keepAlive: true)
class HardwareUDPSendPort extends _$HardwareUDPSendPort {
  @override
  int build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareUDPSendPort, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getInt(SettingsKey.hardwareUDPSendPort) ??
        6666;
  }

  /// Update the [state] to [value].
  void update(int value) => Future(() => state = value);

  /// Update the [state] to [value] if it's a valid integer.
  void updateFromString(String value) => Future(() {
        final port = int.tryParse(value);
        if (port != null) {
          if (port >= 1000 && port <= 65535) {
            state = port;
          }
        }
      });
}

/// A provider for the combined state of the [HardwareIPAdress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the
@Riverpod(keepAlive: true)
({String hardwareIPAdress, int hardwareUDPReceivePort, int hardwareUDPSendPort})
    hardwareCommunicationConfig(HardwareCommunicationConfigRef ref) {
  ref.listenSelf((previous, next) {
    if (next != previous) {
      ref.read(simInputProvider.notifier).send(next);
    }
  });

  return (
    hardwareIPAdress: ref.watch(hardwareIPAdressProvider),
    hardwareUDPReceivePort: ref.watch(hardwareUDPReceivePortProvider),
    hardwareUDPSendPort: ref.watch(hardwareUDPSendPortProvider)
  );
}

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [HardwareIPAdress].
@Riverpod(keepAlive: true)
class HardwareWebSocketPort extends _$HardwareWebSocketPort {
  @override
  int build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareWebSocketPort, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getInt(SettingsKey.hardwareWebSocketPort) ??
        80;
  }

  /// Update the [state] to [value].
  void update(int value) => Future(() => state = value);

  /// Update the [state] to [value] if it's a valid integer.
  void updateFromString(String value) => Future(() {
        final port = int.tryParse(value);
        if (port != null) {
          if (port >= 1 && port <= 65535) {
            state = port;
          }
        }
      });
}

/// A provider for the combined state of the [HardwareIPAdress],
/// [HardwareWebSocketPort].
///
/// The updated state is automatically sent to the
@Riverpod(keepAlive: true)
({String hardwareIPAdress, int hardwareWebSocketPort})
    hardwareWebCommunicationConfig(HardwareWebCommunicationConfigRef ref) {
  ref.listenSelf((previous, next) {
    if (next != previous) {
      ref.read(simInputProvider.notifier).send(next);
    }
  });

  return (
    hardwareIPAdress: ref.watch(hardwareIPAdressProvider),
    hardwareWebSocketPort: ref.watch(hardwareWebSocketPortProvider),
  );
}

/// A provider for a TCP server for sending/receiving data via TCP.
@Riverpod(keepAlive: true)
class TcpServer extends _$TcpServer {
  Socket? _lastActiveSocket;
  @override
  Future<ServerSocket> build() async {
    ref.listenSelf((previous, next) {
      next.when(
        data: (data) {
          data.listen((socket) {
            _lastActiveSocket?.close();
            _lastActiveSocket?.destroy();
            _lastActiveSocket = socket
              ..listen(
                (event) {
                  Logger.instance.i(
                    '''
Received from  ${socket.remoteAddress}:${socket.remotePort}:
${String.fromCharCodes(event)}
''',
                  );
                },
                onDone: () {
                  socket
                    ..close()
                    ..destroy();
                  _lastActiveSocket = null;
                },
                onError: (error, stackTrace) {
                  socket
                    ..close()
                    ..destroy();
                  _lastActiveSocket = null;
                },
              );
          });
        },
        error: (error, stackTrace) => Logger.instance.e(
          'Failed to create ServerSocket.',
          error: error,
          stackTrace: stackTrace,
        ),
        loading: () {},
      );
    });

    return ServerSocket.bind('0.0.0.0', 9999);
  }

  /// Sends [data] to the [_lastActiveSocket] if it's connected.
  ///
  /// It will send a message to the hardware to create a new connection.
  void send(Uint8List data) {
    // Send notification to hardware to use this device as Ntrip server.
    if (_lastActiveSocket == null) {
      ref.read(simInputProvider.notifier).send(
        (
          useAsNtripServer:
              Uint8List.fromList('Use me as Ntrip server!'.codeUnits)
        ),
      );
      Logger.instance.i('Sent request to become NTRIP server.');
    }
    Future(() => _lastActiveSocket?.add(data));
  }
}
