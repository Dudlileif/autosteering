import 'dart:async';
import 'dart:typed_data';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hardware_serial_providers_web.g.dart';

/// A provider for the available serial ports.
@riverpod
List<Object?> availableSerialPorts(AvailableSerialPortsRef ref) => [];

/// A provider for the baud rate for the [HardwareSerial] connection.
@Riverpod(keepAlive: true)
class HardwareSerialBaudRate extends _$HardwareSerialBaudRate {
  /// The available baud rates.
  static const rates = [
    38400,
    57600,
    115200,
    230400,
    460800,
    921600,
  ];

  @override
  int build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareSerialBaudRate, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getInt(SettingsKey.hardwareSerialBaudRate) ??
        115200;
  }

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for the hardware serial connection.
@Riverpod(keepAlive: true)
class HardwareSerial extends _$HardwareSerial {
  @override
  Object? build() {
    return null;
  }

  /// Updates [state] to [value].
  void update(Object? value) => Future(() => state = value);

  /// Writes [bytes] to the [state] serial port.
  int? write(Uint8List bytes) => null;
}

/// A stream of the incoming serial data from the connected hardware.
@Riverpod(keepAlive: true)
Stream<String?> hardwareSerialStream(HardwareSerialStreamRef ref) {

  final controller = StreamController<String?>();

  ref.onDispose(controller.close);


  return controller.stream;
}

/// A provider for telling whether the [HardwareSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.
@Riverpod(keepAlive: true)
class HardwareSerialAlive extends _$HardwareSerialAlive {
  Timer? _resetTimer;

  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next) {
        _resetTimer?.cancel();
        _resetTimer = Timer(
          const Duration(seconds: 1),
          ref.invalidateSelf,
        );
      } else if (previous != null && previous != next) {
        Logger.instance.i('Hardware serial data not being received.');
      }
    });

    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}
