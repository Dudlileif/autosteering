import 'dart:async';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:geobase/geobase.dart';
import 'package:nmea/nmea.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gnss_serial_providers.g.dart';

/// A provider for the available serial ports.
@riverpod
List<SerialPort> availableSerialPorts(AvailableSerialPortsRef ref) =>
    SerialPort.availablePorts.map(SerialPort.new).toList();

/// A provider for the baud rate for the [GnssSerial] connection.
@Riverpod(keepAlive: true)
class GnssSerialBaudRate extends _$GnssSerialBaudRate {
  /// The available baud rates.
  static const rates = [
    1200,
    2400,
    4800,
    9600,
    19200,
    38400,
    57600,
    115200,
    230400,
    460800,
    921600,
  ];

  @override
  int build() {
    return 460800;
  }

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// A provider for which port [GnssSerial] should use.
@Riverpod(keepAlive: true)
class GnssSerial extends _$GnssSerial {
  @override
  SerialPort? build() {
    final config = SerialPortConfig()
      ..baudRate = ref.watch(gnssSerialBaudRateProvider);

    ref
      ..onDispose(() async {
        await Future(() {
          config.dispose();
          state?.close();
          state?.dispose();
        });
        ref.invalidate(gnssSerialAliveProvider);
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

/// A stream of the incoming serial data from the GNSS serial hardware.
@Riverpod(keepAlive: true)
Stream<String?> gnssSerialStream(GnssSerialStreamRef ref) {
  Timer? timer;

  String? prevMessage;

  final controller = StreamController<String?>();

  ref.onDispose(() {
    timer?.cancel();
    controller.close();
  });

  final serial = ref.watch(gnssSerialProvider);

  if (serial != null) {
    final decoder = NmeaDecoder()
      ..registerTalkerSentence('GGA', (line) => GGASentence(raw: line))
      ..registerTalkerSentence('VTG', (line) => VTGSentence(raw: line))
      ..registerProprietarySentence('ANDA', (line) => PANDASentence(raw: line));

    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      final bytesSize = serial.bytesAvailable;
      if (bytesSize > 0) {
        final bytes = serial.read(bytesSize);
        var data = String.fromCharCodes(bytes);
        final startsCorrectly = data.startsWith(r'$');
        final endsCorrectly = data.endsWith('\r\n');

        if (startsCorrectly && !endsCorrectly) {
          prevMessage = data;
          return;
        } else if (!startsCorrectly && endsCorrectly && prevMessage != null) {
          data = prevMessage! + data;
          prevMessage = null;
        }
        for (final message
            in data.split('\n').where((element) => element.isNotEmpty)) {
          controller.add(message);

          final nmea = decoder.decode(message);
          if (nmea is NmeaSentence) {
            ref.read(gnssSerialAliveProvider.notifier).update(value: true);

            if (nmea is GGASentence) {
              if (nmea.quality != null) {
                ref
                    .read(gnssCurrentFixQualityProvider.notifier)
                    .updateByIndex(nmea.quality!);
              }
              if (nmea.numSatellites != null) {
                ref
                    .read(gnssCurrentNumSatellitesProvider.notifier)
                    .update(nmea.numSatellites);
              }
              if (nmea.longitude != null && nmea.latitude != null) {
                ref.read(simInputProvider.notifier).send(
                  (
                    gnssPosition: Geographic(
                      lon: nmea.longitude!,
                      lat: nmea.latitude!,
                    ),
                    time: nmea.utc ?? DateTime.now(),
                  ),
                );
              }
            } else if (nmea is PANDASentence) {
              if (nmea.quality != null) {
                ref
                    .read(gnssCurrentFixQualityProvider.notifier)
                    .updateByIndex(nmea.quality!);
              }
              if (nmea.numSatellites != null) {
                ref
                    .read(gnssCurrentNumSatellitesProvider.notifier)
                    .update(nmea.numSatellites);
              }
              if (nmea.longitude != null && nmea.latitude != null) {
                ref.read(simInputProvider.notifier).send(
                  (
                    gnssPosition: Geographic(
                      lon: nmea.longitude!,
                      lat: nmea.latitude!,
                    ),
                    time: nmea.utc ?? DateTime.now(),
                  ),
                );
              }
              if (nmea.imuHeading != null &&
                  nmea.imuPitch != null &&
                  nmea.imuRoll != null) {
                final reading = ImuReading(
                  receiveTime: nmea.deviceReceiveTime,
                  yawFromStartup: nmea.imuHeading! / 10,
                  pitch: nmea.imuPitch! / 10,
                  roll: nmea.imuRoll! / 10,
                );
                ref.read(simInputProvider.notifier).send(reading);
                ref.read(imuCurrentReadingProvider.notifier).update(reading);
                ref
                    .read(imuSerialFrequencyProvider().notifier)
                    .update(nmea.deviceReceiveTime);
              }
              if (nmea.hdop != null) {
                ref.read(gnssCurrentHdopProvider.notifier).update(nmea.hdop);
              }
              if (nmea.altitudeGeoid != null) {
                ref
                    .read(gnssCurrentAltitudeProvider.notifier)
                    .update(nmea.altitudeGeoid);
              }
              if (nmea.deviceReceiveDelay != null && nmea.utc != null) {
                ref.read(gnssLastUpdateTimeProvider.notifier).update(
                  (
                    device: nmea.deviceReceiveTime,
                    receiver: nmea.utc?.toLocal(),
                    delay: nmea.deviceReceiveDelay,
                  ),
                );
              }

              ref
                  .read(gnssSerialFrequencyProvider().notifier)
                  .update(nmea.deviceReceiveTime);
            }
          }
        }
      }
    });
  }
  return controller.stream;
}

/// A provider for telling whether the [GnssSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.
@Riverpod(keepAlive: true)
class GnssSerialAlive extends _$GnssSerialAlive {
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
        Logger.instance.i('GNSS Serial data not being received.');
      }
    });

    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for the current frequency of GNSS updates over serial.
@riverpod
class GnssSerialFrequency extends _$GnssSerialFrequency {
  final List<DateTime> _times = [];

  @override
  double? build({int count = 20}) {
    ref.listenSelf(
      (previous, next) =>
          ref.read(gnssCurrentFrequencyProvider.notifier).update(next),
    );

    return null;
  }

  /// Updates the [state] by finding the new frequency from [_times] and
  /// [count].
  void update(DateTime time) {
    _times.add(time);
    while (_times.length > count) {
      _times.removeAt(0);
    }
    final freq =
        _times.length / (time.difference(_times.first).inMicroseconds / 1e6);

    Future(() => state = freq);
  }
}
