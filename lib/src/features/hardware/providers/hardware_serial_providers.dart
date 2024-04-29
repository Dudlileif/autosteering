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
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
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
        ref.invalidate(hardwareSerialAliveProvider);
        await Future(() {
          Logger.instance.i(
            'Closing serial port: ${state?.name ?? state?.address}',
          );
          config.dispose();
          state?.close();
          state?.dispose();
        });
      })
      ..listenSelf((previous, next) {
        if (previous != next) {
          previous?.close();
          previous?.dispose();
        }
        if (next != null) {
          next.openReadWrite();

          Logger.instance.i(
            '''Opening serial port: ${next.name ?? next.address} with baud rate: ${config.baudRate}''',
          );
        }
      });

    return null;
  }

  /// Updates [state] to [value].
  void update(SerialPort? value) => Future(() => state = value);

  /// Writes [bytes] to the [state] serial port.
  int? write(Uint8List bytes) => state?.write(bytes);
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

  final commonMessageHandler = CommonMessageHandler(ref);

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
              message is ({Geographic gnssPosition, DateTime time}) ||
              message is WasReading) {
            ref.read(simInputProvider.notifier).send(message);
          } else if (commonMessageHandler.attemptToHandleMessage(message)) {
          } else {
            Logger.instance.log(
              Level.warning,
              'Received unknown message from serial: $message',
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
      } else if (previous != null && previous != next) {
        Logger.instance.i('Hardware serial data not being received.');
      }
    });

    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}
