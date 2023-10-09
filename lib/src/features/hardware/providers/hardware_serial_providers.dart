import 'dart:async';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/hardware/hardware.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hardware_serial_providers.g.dart';

/// A provider for the available serial ports.
@riverpod
List<SerialPort> availableSerialPorts(AvailableSerialPortsRef ref) =>
    SerialPort.availablePorts.map(SerialPort.new).toList();

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
  SerialPort? build() {
    final config = SerialPortConfig()
      ..baudRate = ref.watch(hardwareSerialBaudRateProvider);

    ref
      ..onDispose(() async {
        await Future(() {
          config.dispose();
          state?.close();
          state?.dispose();
        });
        ref.invalidate(hardwareSerialAliveProvider);
      })
      ..listenSelf((previous, next) {
        if (previous != next) {
          previous?.close();
        }
        state?.openReadWrite();
        // ?..config = config
      });

    return null;
  }

  /// Updates [state] to [value].
  void update(SerialPort? value) => Future(() => state = value);
}

/// A stream of the incoming serial data from the connected hardware.
@Riverpod(keepAlive: true)
Stream<String?> hardwareSerialStream(HardwareSerialStreamRef ref) {
  Timer? timer;

  final controller = StreamController<String?>();

  ref.onDispose(() {
    timer?.cancel();
    controller.close();
  });

  final serial = ref.watch(hardwareSerialProvider);

  final decoder = MessageDecoder();

  if (serial != null) {
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      final bytesSize = serial.bytesAvailable;
      if (bytesSize > 0) {
        ref.read(hardwareSerialAliveProvider.notifier).update(value: true);

        final bytes = serial.read(bytesSize);
        final messages = decoder.decode(bytes);

        for (final message in messages) {
          if (message is ImuReading ||
              message is ({Geographic gnssPosition, DateTime time})) {
            ref.read(simInputProvider.notifier).send(message);
          } else if (message is ({int gnssFixQuality})) {
            ref
                .read(gnssCurrentFixQualityProvider.notifier)
                .updateByIndex(message.gnssFixQuality);
            ref.read(simInputProvider.notifier).send(message);
          } else if (message is ({int? numSatellites})) {
            ref
                .read(gnssCurrentNumSatellitesProvider.notifier)
                .update(message.numSatellites);
          } else if (message is ({double gnssHdop})) {
            ref.read(gnssCurrentHdopProvider.notifier).update(message.gnssHdop);
          } else if (message is ({double gnssAltitude})) {
            ref
                .read(gnssCurrentAltitudeProvider.notifier)
                .update(message.gnssAltitude);
          } else if (message is ({
            DateTime gnssUpdateTimeDevice,
            DateTime? gnssUpdateTimeReceiver,
            Duration? gnssUpdateDelay,
          })) {
            ref.read(gnssLastUpdateTimeProvider.notifier).update(
              (
                device: message.gnssUpdateTimeDevice,
                receiver: message.gnssUpdateTimeReceiver,
                delay: message.gnssUpdateDelay,
              ),
            );
          } else if (message is ({double? gnssCurrentFrequency})) {
            ref
                .read(gnssCurrentFrequencyProvider.notifier)
                .update(message.gnssCurrentFrequency);
          } else if (message is ({ImuReading? imuLatestRaw})) {
            ref
                .read(imuCurrentReadingProvider.notifier)
                .update(message.imuLatestRaw);
          } else if (message is ({double? imuCurrentFrequency})) {
            ref
                .read(imuCurrentFrequencyProvider.notifier)
                .update(message.imuCurrentFrequency);
          } else if (message is LogEvent) {
            Logger.instance.log(
              message.level,
              message.message,
              error: message.error,
              time: message.time,
              stackTrace: message.stackTrace,
            );
          }
        }
      }
    });
  }
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
      } else {
        Logger.instance.i('Hardware serial data not being received.');
      }
    });

    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}
