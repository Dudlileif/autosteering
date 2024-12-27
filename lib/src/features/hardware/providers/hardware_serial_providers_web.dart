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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hardware_serial_providers_web.g.dart';

/// A provider for the available serial ports.
@riverpod
List<Object?> availableSerialPorts(Ref ref) => [];

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
    ref.watch(reloadAllSettingsProvider);
    listenSelf((previous, next) {
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
Stream<String?> hardwareSerialStream(Ref ref) {
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
    listenSelf((previous, next) {
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
