import 'dart:async';
import 'dart:typed_data';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'hardware_network_providers.g.dart';

/// A provider for whether there is a connection with the hardware.
@Riverpod(keepAlive: true)
class HardwareNetworkAlive extends _$HardwareNetworkAlive {
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
            .firstWhereOrNull(
              (element) => element.name.toLowerCase().startsWith('w'),
            )
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
            .firstWhereOrNull(
              (element) => element.name.toLowerCase().startsWith('e'),
            )
            ?.addresses
            .first
            .address;
      }
      return null;
    });

/// A provider for the IP adress of the hardware we want to communicate with.
@Riverpod(keepAlive: true)
class HardwareAddress extends _$HardwareAddress {
  @override
  String build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareAdress, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getString(SettingsKey.hardwareAdress) ??
        'autosteering.local';
  }

  /// Update the [state] to [value] if it's a valid IP adress.
  void update(String value) => Future(() {
        state = value;
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
/// the hardware in [HardwareAddress].
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

/// A provider for the combined state of the [HardwareAddress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the
@Riverpod(keepAlive: true)
({String hardwareAddress, int hardwareUDPReceivePort, int hardwareUDPSendPort})
    hardwareCommunicationConfig(HardwareCommunicationConfigRef ref) {
  ref.listenSelf((previous, next) {
    if (next != previous) {
      ref.read(simInputProvider.notifier).send(next);
    }
  });

  return (
    hardwareAddress: ref.watch(hardwareAddressProvider),
    hardwareUDPReceivePort: ref.watch(hardwareUDPReceivePortProvider),
    hardwareUDPSendPort: ref.watch(hardwareUDPSendPortProvider)
  );
}

/// A provider for the UDP send port for the device to send messages to
/// the hardware in [HardwareAddress].
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

/// A provider for the combined state of the [HardwareAddress],
/// [HardwareWebSocketPort].
///
/// The updated state is automatically sent to the
@Riverpod(keepAlive: true)
({String hardwareAddress, int hardwareWebSocketPort})
    hardwareWebCommunicationConfig(HardwareWebCommunicationConfigRef ref) {
  ref.listenSelf((previous, next) {
    if (next != previous) {
      ref.read(simInputProvider.notifier).send(next);
    }
  });

  return (
    hardwareAddress: ref.watch(hardwareAddressProvider),
    hardwareWebSocketPort: ref.watch(hardwareWebSocketPortProvider),
  );
}

/// A provider for a TCP server for sending/receiving data via TCP.
@Riverpod(keepAlive: true)
class TcpServer extends _$TcpServer {
  Socket? _lastActiveSocket;
  Timer? _ntripRequestTimer;
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
Received from ${socket.remoteAddress}, port ${socket.remotePort}:
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

    return ServerSocket.bind('0.0.0.0', 9999, shared: true);
  }

  /// Sends [data] to the [_lastActiveSocket] if it's connected.
  ///
  /// It will send a message to the hardware to create a new connection.
  void send(Uint8List data) {
    // Send notification to hardware to use this device as Ntrip server.
    // We use a timer to avoid unnecessary spamming, as it would create
    // a bunch of sockets on the hardware attempting to connect.
    if (_lastActiveSocket == null &&
        _ntripRequestTimer == null &&
        ref.watch(hardwareNetworkAliveProvider)) {
      ref.read(simInputProvider.notifier).send(
        (
          useAsNtripServer:
              Uint8List.fromList('Use me as Ntrip server!'.codeUnits)
        ),
      );
      Logger.instance.i('Sent request to become NTRIP server.');
      _ntripRequestTimer =
          Timer(const Duration(seconds: 1), () => _ntripRequestTimer = null);
    }
    Future(() => _lastActiveSocket?.add(data));
  }
}

/// A provider for the current connection of the device.
@Riverpod(keepAlive: true)
Stream<ConnectivityResult> currentConnection(CurrentConnectionRef ref) {
  ref.listenSelf((previous, next) {
    next.when(
      data: (data) {
        if (data != previous?.value) {
          if (previous != next) {
            Logger.instance.i('Device connection: ${data.name}');
          }
        }
      },
      error: (error, stackTrace) => Logger.instance.e(
        'Error getting device connection.',
        error: error,
        stackTrace: stackTrace,
      ),
      loading: () {},
    );
  });
  return Connectivity().onConnectivityChanged;
}

/// A provider for whether a network connection can be made.
///
// TODO(dudlileif): VPN and mobile may not work though, have to test as the
// device can be connected to mobile with vpn while being a WiFi access point.
// Also bluetooth may be an option at some point.
@Riverpod(keepAlive: true)
bool networkAvailable(NetworkAvailableRef ref) {
  ref.listenSelf((previous, next) {
    if (previous != next) {
      Logger.instance.i('Network available: $next');
    }
  });

  return ref.watch(currentConnectionProvider).when(
        data: (data) => switch (data) {
          ConnectivityResult.ethernet ||
          ConnectivityResult.wifi ||
          ConnectivityResult.mobile ||
          ConnectivityResult.vpn =>
            true,
          _ => false,
        },
        error: (error, stackTrace) {
          Logger.instance.e(
            'Failed to find current connection type.',
            error: error,
            stackTrace: stackTrace,
          );
          return false;
        },
        loading: () => false,
      );
}
