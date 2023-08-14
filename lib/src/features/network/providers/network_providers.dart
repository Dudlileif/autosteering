import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'network_providers.g.dart';

/// A provider for the IP adress of the device.
@riverpod
Future<String?> deviceIPAdress(DeviceIPAdressRef ref) =>
    NetworkInfo().getWifiIP();

/// A provider for the IP adress of the hardware we want to communicate with.
@Riverpod(keepAlive: true)
class HardwareIPAdress extends _$HardwareIPAdress {
  @override
  String build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareIPAdress, next);

        ref.read(simInputProvider.notifier).send(
          (
            hardwareIPAdress: next,
            hardwareUDPReceivePort: ref.watch(hardwareUDPReceivePortProvider),
            hardwareUDPSendPort: ref.watch(hardwareUDPSendPortProvider)
          ),
        );
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.simAutoSlowDown)) {
      return ref
              .read(settingsProvider.notifier)
              .getString(SettingsKey.hardwareIPAdress) ??
          '192.168.4.1';
    }
    return '192.168.4.1';
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
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareUDPReceivePort, next);

        ref.read(simInputProvider.notifier).send(
          (
            hardwareIPAdress: ref.watch(hardwareIPAdressProvider),
            hardwareUDPReceivePort: next,
            hardwareUDPSendPort: ref.watch(hardwareUDPSendPortProvider)
          ),
        );
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.simAutoSlowDown)) {
      return ref
              .read(settingsProvider.notifier)
              .getInt(SettingsKey.hardwareUDPReceivePort) ??
          3333;
    }
    return 3333;
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
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareUDPSendPort, next);

        ref.read(simInputProvider.notifier).send(
          (
            hardwareIPAdress: ref.watch(hardwareIPAdressProvider),
            hardwareUDPReceivePort: ref.watch(hardwareUDPReceivePortProvider),
            hardwareUDPSendPort: next,
          ),
        );
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.simAutoSlowDown)) {
      return ref
              .read(settingsProvider.notifier)
              .getInt(SettingsKey.hardwareUDPSendPort) ??
          6666;
    }

    return 6666;
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
