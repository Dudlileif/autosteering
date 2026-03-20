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

import 'package:autosteering/src/features/audio/audio.dart';
import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gnss_data_providers.g.dart';

/// A provider for the last GNSS position NMEA sentence.
@riverpod
class GnssCurrentSentence extends _$GnssCurrentSentence {
  Timer? _resetTimer;

  @override
  GnssPositionCommonSentence? build() {
    ref.onDispose(() {
      _resetTimer?.cancel();
    });
    listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(const Duration(milliseconds: 350), () {
        if (stateOrNull?.fixQuality == GnssFixQuality.rtk) {
          ref.read(audioQueueProvider.notifier).add(AudioAsset.rtkLostAlarm);
        }
        ref.invalidateSelf();
      });

      final logStrings = <String>[];

      if (previous?.quality != next?.quality) {
        logStrings.add(
          '''GNSS fix quality: ${next?.fixQuality}, NMEA GGA code: ${next?.quality}''',
        );
      }
      if (previous?.posMode != next?.posMode) {
        logStrings.add(
          '''GNSS fix quality: ${next?.fixQuality}, NMEA GNS flags: ${next?.posMode}''',
        );
      }
      if (previous?.ubxNavStatus != next?.ubxNavStatus) {
        logStrings.add(
          '''GNSS fix quality: ${next?.fixQuality}, PUBX nav status: ${next?.ubxNavStatus}''',
        );
      }
      if (previous?.fixQuality == GnssFixQuality.rtk &&
          next?.fixQuality != GnssFixQuality.rtk) {
        ref.read(audioQueueProvider.notifier).add(AudioAsset.rtkLostAlarm);
      }

      if (previous?.numSatellites != next?.numSatellites) {
        logStrings.add('GNSS satellite count: ${next?.numSatellites}');
      }
      if (logStrings.isNotEmpty) {
        Logger.instance.i(logStrings.join('\n'));
      }
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(GnssPositionCommonSentence? value) => Future(() => state = value);
}

/// A provider for the frequency of the GNSS updates.
@riverpod
class GnssCurrentFrequency extends _$GnssCurrentFrequency {
  Timer? _resetTimer;

  @override
  double? build() {
    ref.onDispose(() {
      _resetTimer?.cancel();
    });
    listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the time of the last GNSS update.
@riverpod
class GnssLastUpdateTime extends _$GnssLastUpdateTime {
  @override
  ({DateTime device, DateTime? receiver, Duration? delay})? build() => null;

  /// Updates [state] to [value].
  void update(
    ({DateTime device, DateTime? receiver, Duration? delay})? value,
  ) => Future(() => state = value);
}

/// A provider for the precision error of the last GNSS update.
@riverpod
class GnssPrecisionError extends _$GnssPrecisionError {
  Timer? _resetTimer;

  @override
  ({double? latitudeError, double? longitudeError, double? altitudeError})?
  build() {
    ref.onDispose(() {
      _resetTimer?.cancel();
    });
    listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(
    ({double? latitudeError, double? longitudeError, double? altitudeError})?
    value,
  ) => Future(() => state = value);
}

/// A provider for the last secondary GNSS position NMEA.
@riverpod
class GnssSecondaryCurrentSentence extends _$GnssSecondaryCurrentSentence {
  Timer? _resetTimer;

  @override
  GnssPositionCommonSentence? build() {
    ref.onDispose(() {
      _resetTimer?.cancel();
    });
    listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(GnssPositionCommonSentence? value) => Future(() => state = value);
}

/// A provider for sending the vehicle GNSS config to the hardware.
@riverpod
void sendGnssReceiverConfig(Ref ref, String config) {
  final configLines = config.replaceAll('\r', '').split('\n');

  final bytes = Uint8List.fromList([...configLines, ''].join('\r\n').codeUnits);
  final serial = ref.read(hardwareSerialProvider);
  if (serial != null) {
    serial.write(
      Uint8List.fromList([
        0xD0,
        bytes.length >> 8,
        bytes.length & 0xFF,
        ...bytes,
      ]),
      timeout: 1000,
    );
  }
  final tcp = ref.read(tcpServerProvider);
  if (tcp.hasValue) {
    tcp.value!.add([0xD0, bytes.length >> 8, bytes.length & 0xFF, ...bytes]);
  }
}
