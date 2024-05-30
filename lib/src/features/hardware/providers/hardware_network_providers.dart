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
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'hardware_network_providers.g.dart';

/// A provider for whether there is a connection with the steering hardware.
@Riverpod(keepAlive: true)
class SteeringHardwareNetworkAlive extends _$SteeringHardwareNetworkAlive {
  Timer? _resetTimer;

  @override
  bool build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for whether there is a connection with the remote control
/// hardware.
@Riverpod(keepAlive: true)
class RemoteControlHardwareNetworkAlive
    extends _$RemoteControlHardwareNetworkAlive {
  Timer? _resetTimer;

  @override
  bool build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(seconds: 2),
        ref.invalidateSelf,
      );
    });

    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for all the
@Riverpod(keepAlive: true)
class NetworkInterfaces extends _$NetworkInterfaces {
  @override
  List<NetworkInterface> build() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      state = await NetworkInterface.list();
    });
    return [];
  }

  @override
  bool updateShouldNotify(
    List<NetworkInterface> previous,
    List<NetworkInterface> next,
  ) =>
      !const DeepCollectionEquality.unordered().equals(previous, next);
}

/// A provider for the wireless IP address of the device.
@Riverpod(keepAlive: true)
String? deviceIPAdressWlan(DeviceIPAdressWlanRef ref) {
  ref.listenSelf((previous, next) {
    if (next != previous) {
      if (next == null) {
        Logger.instance.i('Lost WLAN connection IP.');
      } else {
        Logger.instance.i('Acquired WLAN connection IP: $next');
      }
    }
  });
  return ref
      .watch(networkInterfacesProvider)
      .firstWhereOrNull(
        (element) =>
            element.name.toLowerCase().startsWith('wlan0') ||
            element.name
                .toLowerCase()
                // Regex for wlp2s0 and similar
                .contains(RegExp(r'wlp\d{1,}s\d{1,}')),
      )
      ?.addresses
      .first
      .address;
}

/// A provider for the access point host IP address of the device.
@Riverpod(keepAlive: true)
String? deviceIPAdressAP(DeviceIPAdressAPRef ref) {
  ref.listenSelf((previous, next) {
    if (next != previous) {
      if (next == null) {
        Logger.instance.i('Lost AP connection IP.');
      } else {
        Logger.instance.i('Acquired AP connection IP: $next');
      }
    }
  });
  return ref
      .watch(networkInterfacesProvider)
      .firstWhereOrNull(
        (element) =>
            element.name.toLowerCase().contains('ap') ||
            element.name.toLowerCase().contains('wlan2') ||
            element.name.toLowerCase().contains('swlan'),
      )
      ?.addresses
      .first
      .address;
}

/// A provider for the ethernet IP address of the device.
@Riverpod(keepAlive: true)
String? deviceIPAdressEthernet(
  DeviceIPAdressEthernetRef ref,
) {
  ref.listenSelf((previous, next) {
    if (next != previous) {
      if (next == null) {
        Logger.instance.i('Lost Ethernet connection IP.');
      } else {
        Logger.instance.i('Acquired Ethernet connection IP: $next');
      }
    }
  });
  return ref
      .watch(networkInterfacesProvider)
      .firstWhereOrNull(
        (element) => element.name.toLowerCase().startsWith('e'),
      )
      ?.addresses
      .first
      .address;
}

/// A provider for the IP adress of the steering hardware we want to communicate
/// with.
@Riverpod(keepAlive: true)
class SteeringHardwareAddress extends _$SteeringHardwareAddress {
  @override
  String build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
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

/// A provider for the IP adress of the remote control hardware we want to
/// communicate with.
@Riverpod(keepAlive: true)
class RemoteControlHardwareAddress extends _$RemoteControlHardwareAddress {
  @override
  String build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.remoteControlAddress, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getString(SettingsKey.remoteControlAddress) ??
        'autosteering-remote-control.local';
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
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
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
/// the hardware in [SteeringHardwareAddress].
@Riverpod(keepAlive: true)
class HardwareUDPSendPort extends _$HardwareUDPSendPort {
  @override
  int build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
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

/// A provider for the combined state of the [SteeringHardwareAddress],
/// [HardwareUDPReceivePort] and [HardwareUDPSendPort].
///
/// The updated state is automatically sent to the
@Riverpod(keepAlive: true)
({
  String steeringHardwareAddress,
  String remoteControlHardwareAddress,
  int hardwareUDPReceivePort,
  int hardwareUDPSendPort
}) hardwareCommunicationConfig(HardwareCommunicationConfigRef ref) {
  ref.listenSelf((previous, next) {
    if (next != previous) {
      ref.read(simInputProvider.notifier).send(next);
    }
  });

  return (
    steeringHardwareAddress: ref.watch(steeringHardwareAddressProvider),
    remoteControlHardwareAddress:
        ref.watch(remoteControlHardwareAddressProvider),
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
      ref.watch(steeringHardwareAddressProvider),
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

/// A provider for whether a network connection can be made.
///
/// If using VPN while being an access point, communication with hardware
/// is only possible if the subnet of the access point is disallowed throught
/// the VPN.
/// For WireGuard the allowed IPs to put in the client can be calculated
/// here:
/// https://www.procustodibus.com/blog/2021/03/wireguard-allowedips-calculator/.
/// If the access point host has IP 192.168.38.49, then input
/// Allowed IPs: 0.0.0.0/0,::/0
/// Disallowed IPs: 192.168.38.0/24
/// Copy the resulting Allowed IPs to the WireGuard client.
/// On Android the subnet might change every time the device reboots, so more
/// subnets should be added to Disallowed IPs.
@Riverpod(keepAlive: true)
bool networkAvailable(NetworkAvailableRef ref) {
  ref.listenSelf((previous, next) {
    if (previous != next) {
      ref.read(simInputProvider.notifier).send((networkAvailable: next));
    }
  });

  return ref.watch(deviceIPAdressWlanProvider) != null ||
      ref.watch(deviceIPAdressAPProvider) != null ||
      ref.watch(deviceIPAdressEthernetProvider) != null;
}
