import 'dart:async';

import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:geobase/geobase.dart';
import 'package:nmea/nmea.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gnss_serial_providers.g.dart';

/// A provider for the available serial ports
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

  final controller = StreamController<String?>();

  ref.onDispose(() {
    timer?.cancel();
    controller.close();
  });

  final serial = ref.watch(gnssSerialProvider);

  if (serial != null) {
    final decoder = NmeaDecoder()
      ..registerTalkerSentence('GGA', (line) => GNGGASentence(raw: line))
      ..registerTalkerSentence('VTG', (line) => GNVTGSentence(raw: line));

    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      final bytesSize = serial.bytesAvailable;
      if (bytesSize > 0) {
        final bytes = serial.read(bytesSize);
        final data = String.fromCharCodes(bytes);
        for (final message
            in data.split('\n').where((element) => element.isNotEmpty)) {
          controller.add(message);

          final nmea = decoder.decode(message);

          if (nmea is GNGGASentence) {
            if (nmea.quality != null) {
              ref
                  .read(gnssCurrentFixQualityProvider.notifier)
                  .updateByIndex(nmea.quality!);
            }
            if (nmea.longitude != null && nmea.latitude != null) {
              ref.read(simInputProvider.notifier).send(
                (
                  gnssPosition: Geographic(
                    lon: nmea.longitude!,
                    lat: nmea.latitude!,
                  ),
                  time: nmea.utc,
                ),
              );
            }
          }
        }
      }
    });
  }
  return controller.stream;
}
