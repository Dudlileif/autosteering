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

/// A provider for the wireless IP address of the device.
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

/// A provider for the access point host IP address of the device.
@riverpod
FutureOr<String?> deviceIPAdressAP(DeviceIPAdressAPRef ref) =>
    NetworkInterface.list(type: InternetAddressType.IPv4).then((interfaces) {
      if (interfaces.isNotEmpty) {
        return interfaces
            .firstWhereOrNull(
              (element) => element.name.toLowerCase().contains('ap'),
            )
            ?.addresses
            .first
            .address;
      }
      return null;
    });

/// A provider for the ethernet IP address of the device.
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

/// A provider for a TCP server for sending/receiving data via TCP.
@Riverpod(keepAlive: true)
class TcpServer extends _$TcpServer {
  Socket? _socket;
  @override
  FutureOr<Socket?> build() async {
    ref
      ..listenSelf((previous, next) {
        next.when(
          data: (data) {
            if (data != null) {
              Logger.instance.i(
                '''TCP client socket connected to server at ${data.remoteAddress}:${data.remotePort}''',
              );
            }
            _socket = data;
            _socket?.listen(
              (event) {},
              onError: (Object? error, StackTrace? stackTrace) {
                Logger.instance.e(
                  'TCP client socket error',
                  error: error,
                  stackTrace: stackTrace,
                );
                ref.invalidateSelf();
              },
              onDone: () {
                Logger.instance.i('TCP client socket closed.');
                ref.invalidateSelf();
              },
            );
          },
          error: (error, stackTrace) => Logger.instance.e(
            'Failed to create TCP client socket.',
            error: error,
            stackTrace: stackTrace,
          ),
          loading: () {},
        );
      })
      ..onDispose(() async {
        await _socket?.close();
      });

    return Socket.connect(
      ref.watch(hardwareAddressProvider),
      9999,
      timeout: const Duration(seconds: 1),
    );
  }

  /// Sends [data] to the [_socket] if it's connected.
  ///
  /// It will send a message to the hardware to create a new connection.
  void send(Uint8List data) {
    Future(() => _socket?.add(data));
  }
}

/// A provider for the current connection of the device.
@Riverpod(keepAlive: true)
Stream<List<ConnectivityResult>> currentConnection(CurrentConnectionRef ref) {
  ref.listenSelf((previous, next) {
    next.when(
      data: (data) {
        if (data != previous?.value) {
          if (previous != next) {
            Logger.instance
                .i('Device connections: ${data.map((e) => e.name).toList()}');
            ref
              ..invalidate(deviceIPAdressWlanProvider)
              ..invalidate(deviceIPAdressAPProvider)
              ..invalidate(deviceIPAdressEthernetProvider);
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
/// If using VPN while being an access point, communication with hardware
/// is not possible.
@Riverpod(keepAlive: true)
bool networkAvailable(NetworkAvailableRef ref) {
  ref.listenSelf((previous, next) {
    if (previous != next) {
      Logger.instance.i('Network available: $next');
    }
  });

  return ref.watch(currentConnectionProvider).when(
        data: (data) => data.any(
          (element) => switch (element) {
            ConnectivityResult.ethernet ||
            ConnectivityResult.wifi ||
            ConnectivityResult.mobile =>
              true,
            _ => false,
          },
        ),
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
