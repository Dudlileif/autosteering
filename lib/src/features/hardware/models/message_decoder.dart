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

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';
import 'package:nmea/nmea.dart';
import 'package:path/path.dart' as path;
import 'package:universal_io/io.dart';

/// A message decoder for decoding [Uint8List] data received from connected
/// hardware.
class MessageDecoder {
  /// A message decoder for decoding [Uint8List] data received from
  /// connected hardware.
  ///
  ///[messagesToKeep] is how many messages to keep for the different list of
  /// previous messages. This will also set the count for how many updates
  /// to use for calculating [gnssFrequency] and [imuFrequency].

  MessageDecoder({this.messagesToKeep = 100, this.logDirectoryPath});

  /// How many messages to keep for the different list of previous messages.
  final int messagesToKeep;

  /// The NMEA message decoder.
  final nmeaDecoder = NmeaDecoder(
    onUnknownSentence: (line) {
      if (line.startsWith(r'$PANDA')) {
        return PANDASentence(raw: line);
      }
      return null;
    },
  )
    ..registerTalkerSentence('GGA', (line) => GGASentence(raw: line))
    ..registerTalkerSentence('GNS', (line) => GNSSentence(raw: line))
    ..registerTalkerSentence('GST', (line) => GSTSentence(raw: line))
    ..registerTalkerSentence('VTG', (line) => VTGSentence(raw: line))
    ..registerTalkerSentence('TXT', (line) => TXTSentence(raw: line))
    ..registerProprietarySentence('UBX', (line) => PUBXSentence(raw: line));

  /// Start time of the current NMEA_log, if there is one.
  DateTime? _gnssLogStartTime;

  /// Start time of the current IMU_log, if there is one.
  DateTime? _imuLogStartTime;

  /// Start time of the current WAS_log, if there is one.
  DateTime? _wasLogStartTime;

  /// Start time of the current combined_log, if there is one.
  DateTime? _combinedLogStartTime;

  /// Whether NMEA logging is active.
  bool _logGNSS = false;

  /// Whether IMU logging is active.
  bool _logIMU = false;

  /// Whether WAS logging is active.
  bool _logWAS = false;

  /// Whether combined logging is active.
  bool _logCombined = false;

  /// Path to the directory for saving logs.
  String? logDirectoryPath;

  /// A list of the previous [messagesToKeep] count of messages decoded.
  /// Primarily used while debugging.
  List<String> previousMessages = [];

  /// A list of the previous [messagesToKeep] count of
  /// [GnssPositionCommonSentence]s and [PUBXSentence]s decoded.
  /// Used for calculating the [gnssFrequency].
  List<GnssPositionCommonSentence> gnssSentences = [];

  /// A list of the previous [messagesToKeep] count of [GSTSentence]s decoded.
  List<GSTSentence> gstSentences = [];

  /// A list of the previous [messagesToKeep] count of [VTGSentence]s decoded.
  List<VTGSentence> vtgSentences = [];

  /// A list of the previous [messagesToKeep] count of [ImuReading]s decoded.
  List<ImuReading> imuReadings = [];

  /// A list of the previous [messagesToKeep] count of [WasReading]s decoded.
  List<WasReading> wasReadings = [];

  /// The frequency of valid GNSS updates being decoded in [decode].
  ///
  /// It will look for the [gnssSentences] first, and if that is empty it will
  /// look for [gnssSentences].
  double? get gnssFrequency => switch (gnssSentences.isNotEmpty) {
        true => gnssSentences.length /
            (DateTime.now()
                    .difference(gnssSentences.first.deviceReceiveTime)
                    .inMicroseconds /
                1e6),
        false => null,
      };

  /// The frequency of [ImuReading] updates being decoded in [decode].
  double? get imuFrequency => switch (imuReadings.isNotEmpty) {
        true => imuReadings.length /
            (DateTime.now()
                    .difference(imuReadings.first.receiveTime)
                    .inMicroseconds /
                1e6),
        false => null
      };

  /// The frequency of [WasReading] updates being decoded in [decode].
  double? get wasFrequency => switch (wasReadings.isNotEmpty) {
        true => wasReadings.length /
            (DateTime.now()
                    .difference(wasReadings.first.receiveTime)
                    .inMicroseconds /
                1e6),
        false => null
      };

  /// The delay in micro seconds from the creation of the GNSS sentence to now.
  int get gnssDelayMicroseconds =>
      gnssSentences.lastOrNull?.deviceReceiveDelay?.inMicroseconds ?? 0;

  /// The [ImuReading] that is closest in time to the last [GGASentence] or
  /// [PANDASentence] when accounting for the [gnssDelayMicroseconds].
  ImuReading? get imuReadingMatchingGnssDelay {
    if (imuReadings.isEmpty) {
      return null;
    }
    final countToCheck = min(30, imuReadings.length);
    final startIndex = imuReadings.length - countToCheck;
    final closeReadings =
        imuReadings.getRange(startIndex, startIndex + countToCheck);

    final now = DateTime.now();

    final signedDeltas = closeReadings.map((reading) {
      return gnssDelayMicroseconds -
          now.difference(reading.receiveTime).inMicroseconds;
    });

    final deltas = signedDeltas.map((e) => e.abs()).toList();

    final indexOfClosest = deltas.indexOf(deltas.min);

    return closeReadings.elementAt(indexOfClosest);
  }

  /// Enable or disable_logging of the different hardware messages.
  void enableLogging({
    bool? gnss,
    bool? imu,
    bool? was,
    bool? combined,
  }) {
    if (gnss != null) {
      if (!_logGNSS && gnss) {
        _gnssLogStartTime = DateTime.now();
      } else if (_logGNSS && !gnss) {
        _gnssLogStartTime = null;
      }
      _logGNSS = gnss;
    }
    if (imu != null) {
      if (!_logIMU && imu) {
        _imuLogStartTime = DateTime.now();
      } else if (_logIMU && !imu) {
        _imuLogStartTime = null;
      }
      _logIMU = imu;
    }
    if (was != null) {
      if (!_logWAS && was) {
        _wasLogStartTime = DateTime.now();
      } else if (_logWAS && !was) {
        _wasLogStartTime = null;
      }
      _logWAS = was;
    }
    if (combined != null) {
      if (!_logCombined && combined) {
        _combinedLogStartTime = DateTime.now();
      } else if (_logCombined && !combined) {
        _combinedLogStartTime = null;
      }
      _logCombined = combined;
    }
  }

  /// The last unfinished message's characters.
  List<String> unfinishedMessage = [];

  /// Decodes the [data] to raw strings ready to be parsed in [decode].
  List<String> rawStrings(Uint8List data) {
    final decoded =
        String.fromCharCodes(data).replaceAll('\n', '').replaceAll('\r', '');

    final characters = <String>[...unfinishedMessage, ...decoded.split('')];

    final jsonStartIndices = <int>[];
    final jsonEndIndices = <int>[];

    final nmeaStartIndices = <int>[];

    final nmeaEndIndices = <int>[];

    characters.forEachIndexed((index, element) {
      if (element == r'$') {
        nmeaStartIndices.add(index);
      } else if (element == '*' && characters.length > index + 2) {
        nmeaEndIndices.add(index + 2);
      }
    });

    final nmeaMessages = <({int start, int end})>[];

    final jsonMessages = <({int start, int end})>[];

    final messages = <String>[];

    if (nmeaStartIndices.isNotEmpty) {
      for (var i = 0; i < nmeaStartIndices.length; i++) {
        for (var j = 0; j < nmeaEndIndices.length; j++) {
          // If we have enough ends.
          if (nmeaEndIndices.length - 1 >= j) {
            // If there are more starts.
            if (nmeaStartIndices.length > i + 1) {
              // If the end is before than the next start.
              if (nmeaEndIndices.elementAt(j) <
                  nmeaStartIndices.elementAt(i + 1)) {
                // Add message start and end.
                nmeaMessages.add(
                  (start: nmeaStartIndices[i], end: nmeaEndIndices[j]),
                );
                nmeaEndIndices.removeAt(j);
                break;
              }
            }
            // Not more starts, the end has to match.
            else {
              nmeaMessages.add(
                (start: nmeaStartIndices[i], end: nmeaEndIndices[j]),
              );
              nmeaEndIndices.removeAt(j);
              break;
            }
          }
        }
      }
      for (final pair in nmeaMessages) {
        // Discard unfinished message data if an illegal pair is found.
        if (pair.end < pair.start) {
          unfinishedMessage.clear();
          return [];
        }
        messages.add(characters.getRange(pair.start, pair.end + 1).join());
        characters.replaceRange(
          pair.start,
          pair.end + 1,
          List.generate(pair.end + 1 - pair.start, (index) => '~'),
        );
      }
      characters.removeWhere((element) => element == '~');
    }

    characters.forEachIndexed((index, element) {
      if (element == '{') {
        jsonStartIndices.add(index);
      } else if (element == '}') {
        jsonEndIndices.add(index);
      }
    });

    if (jsonStartIndices.isNotEmpty) {
      for (var i = 0; i < jsonStartIndices.length; i++) {
        for (var j = 0; j < jsonEndIndices.length; j++) {
          // If we have enough ends.
          if (jsonEndIndices.length - 1 >= j) {
            // If there are more starts.
            if (jsonStartIndices.length > i + 1) {
              // If the end is before the next start.
              if (jsonEndIndices.elementAt(j) <
                  jsonStartIndices.elementAt(i + 1)) {
                // Add message start and end.
                jsonMessages.add(
                  (start: jsonStartIndices[i], end: jsonEndIndices[j]),
                );
                jsonEndIndices.removeAt(j);
                break;
              }
            }
            // Not more starts, the end has to match.
            else {
              jsonMessages.add(
                (start: jsonStartIndices[i], end: jsonEndIndices[j]),
              );
              jsonEndIndices.removeAt(j);
              break;
            }
          }
        }
      }
      for (final pair in jsonMessages) {
        // Discard unfinished message data if an illegal pair is found.
        if (pair.end < pair.start) {
          unfinishedMessage.clear();
          return [];
        }
        // Skip json message if there is an unfinished NMEA message inside it.
        if (nmeaStartIndices.any(
          (nmeaStart) =>
              nmeaStart > pair.start &&
              nmeaStart < pair.end &&
              nmeaMessages.none((message) => message.start == nmeaStart),
        )) {
          continue;
        } else {
          messages.add(characters.getRange(pair.start, pair.end + 1).join());
          characters.replaceRange(
            pair.start,
            pair.end + 1,
            List.generate(pair.end + 1 - pair.start, (index) => '~'),
          );
        }
      }
      characters.removeWhere((element) => element == '~');
    }

    // Set the unfinished message if we're missing an end, and the message
    // is different than the previous one, otherwise clear the unfinished
    // message.
    if (jsonStartIndices.length != jsonMessages.length ||
        nmeaStartIndices.length != nmeaMessages.length &&
            !const DeepCollectionEquality()
                .equals(unfinishedMessage, characters)) {
      unfinishedMessage = characters;
      if (messages.isEmpty) {
        messages.add('Message unfinished: ${characters.join()}');
      }
    } else {
      unfinishedMessage.clear();
    }

    previousMessages.add(decoded);

    while (previousMessages.length > messagesToKeep) {
      previousMessages.removeAt(0);
    }

    return messages;
  }

  /// Parses the [str] to several or one of [ImuReading], [WasReading] or
  /// [GnssPositionCommonSentence]s and additional records with info about
  /// frequency and time.
  ///
  /// [LogEvent]s are also returned if any errors occur during the parsing.
  List<dynamic> parseString(String str) {
    final messages = <dynamic>[];
    if (str.startsWith('{')) {
      if (str.contains('}')) {
        try {
          final data = Map<String, dynamic>.from(jsonDecode(str) as Map);
          // IMU sensor
          if (data['yaw'] is num &&
              data['pitch'] is num &&
              data['roll'] is num) {
            final reading = ImuReading(
              yaw: data['yaw'] as num,
              pitch: data['pitch'] as num,
              roll: data['roll'] as num,
              accelerationX: data['acc_x'] is num ? data['acc_x'] as num : 0,
              accelerationY: data['acc_y'] is num ? data['acc_y'] as num : 0,
              accelerationZ: data['acc_z'] is num ? data['acc_z'] as num : 0,
              receiveTime: DateTime.now(),
            );
            imuReadings.add(reading);
            while (imuReadings.length > messagesToKeep) {
              imuReadings.removeAt(0);
            }
            messages.addAll([
              reading,
              (imuCurrentFrequency: imuFrequency),
              (imuLatestRaw: reading),
            ]);

            if (Device.isNative) {
              if (_logIMU && logDirectoryPath != null) {
                _imuLogStartTime ??= DateTime.now();
                final file = File(
                  path.join(
                    logDirectoryPath!,
                    'imu',
                    '${_imuLogStartTime!.toIso8601String()}.log',
                  ),
                );
                if (!file.existsSync()) {
                  file.createSync(recursive: true);
                }
                file.writeAsStringSync(
                  [
                    reading,
                    Platform.lineTerminator,
                  ].join(),
                  mode: FileMode.append,
                );
              }
            }
          }

          // WAS sensor
          if (data['was'] is int) {
            final reading = WasReading(
              value: data['was'] as int,
              receiveTime: DateTime.now(),
            );

            wasReadings.add(reading);
            while (wasReadings.length > messagesToKeep) {
              wasReadings.removeAt(0);
            }
            messages.addAll([
              reading,
              (wasCurrentFrequency: wasFrequency),
              (wasLatestRaw: reading),
            ]);
            if (Device.isNative) {
              if (_logWAS && logDirectoryPath != null) {
                _wasLogStartTime ??= DateTime.now();
                final file = File(
                  path.join(
                    logDirectoryPath!,
                    'was',
                    '${_wasLogStartTime!.toIso8601String()}.log',
                  ),
                );
                if (!file.existsSync()) {
                  file.createSync(recursive: true);
                }
                file.writeAsStringSync(
                  [
                    reading,
                    Platform.lineTerminator,
                  ].join(),
                  mode: FileMode.append,
                );
              }
            }
          }

          if (data['steps_min_center'] is double) {
            messages.add(
              (stepsPerWasIncrementMinToCenter: data['steps_min_center']),
            );
          }

          if (data['steps_center_max'] is double) {
            messages.add(
              (stepsPerWasIncrementCenterToMax: data['steps_center_max']),
            );
          }

          // Motor info
          if (data['motor_enabled'] is bool) {
            messages.add((motorEnabled: data['motor_enabled'] as bool));
          }
          if (data['motor_rpm'] is double) {
            messages.add((motorActualRPM: data['motor_rpm'] as double));
          }
          if (data['motor_stalled'] is bool) {
            messages.add((motorStalled: data['motor_stalled'] as bool));
          }
          if (data['motor_no_command'] is bool) {
            messages.add((motorNoCommand: data['motor_no_command'] as bool));
          }
          if (data['motor_cs'] is int) {
            messages.add((motorCurrentScale: data['motor_cs'] as int));
          }
          if (data['motor_sg'] is int) {
            messages.add((motorStallguard: data['motor_sg'] as int));
          }
          if (data['motor_pos'] is double) {
            messages.add((motorRotation: data['motor_pos'] as double));
          }
          if (data['motor_target'] is double) {
            messages.add((motorTargetRotation: data['motor_target'] as double));
          }
          if (data['button_states'] is List) {
            messages.add(
              (buttonStates: List<bool>.from(data['button_states'] as List)),
            );
          }
        } catch (e) {
          messages.add(
            LogEvent(
              Level.error,
              '''Failed to decode string starting with "{" and containing "}": $str''',
              error: e,
            ),
          );
        }
      } else {
        messages.add(
          LogEvent(
            Level.warning,
            'Message starting with "{" does NOT contain "}": $str',
          ),
        );
      }
    } else if (str.startsWith(r'$')) {
      final nmea = nmeaDecoder.decode(str);

      if (nmea is VTGSentence) {
        vtgSentences.add(nmea);
        while (vtgSentences.length > messagesToKeep) {
          vtgSentences.removeAt(0);
        }
        messages.add(null);
      } else if (nmea is GSTSentence) {
        messages.add(
          (
            latitudeError: nmea.stdLat,
            longitudeError: nmea.stdLon,
            altitudeError: nmea.stdAltitude
          ),
        );
        gstSentences.add(nmea);
        while (gstSentences.length > messagesToKeep) {
          gstSentences.removeAt(0);
        }
        messages.add(null);
      } else if (nmea is TXTSentence) {
        messages.add(
          LogEvent(
            Level.warning,
            'TXT message from GNSS hardware: ${nmea.raw}',
          ),
        );
      } else if (nmea is GnssPositionCommonSentence && nmea.valid) {
        if (nmea.longitude != null && nmea.latitude != null) {
          messages.add(
            (
              gnssPosition: Geographic(
                lon: nmea.longitude!,
                lat: nmea.latitude!,
                elev: nmea.altitudeMSL,
              ),
              time: nmea.utc ?? DateTime.now(),
            ),
          );
        }
        messages
          ..add(
            (
              gnssUpdateTimeDevice: nmea.deviceReceiveTime,
              gnssUpdateTimeReceiver: nmea.utc?.toLocal(),
              gnssUpdateDelay: nmea.deviceReceiveDelay,
            ),
          )
          ..add(nmea);
        gnssSentences.add(nmea);

        if (nmea is PANDASentence) {
          if (nmea.imuHeading != null &&
              nmea.imuPitch != null &&
              nmea.imuRoll != null) {
            final reading = ImuReading(
              receiveTime: nmea.deviceReceiveTime,
              yaw: nmea.imuHeading! / 10,
              pitch: nmea.imuPitch! / 10,
              roll: nmea.imuRoll! / 10,
            );
            imuReadings.add(reading);
            while (imuReadings.length > messagesToKeep) {
              imuReadings.removeAt(0);
            }
            messages.addAll([
              reading,
              (imuCurrentFrequency: imuFrequency),
              (imuLatestRaw: reading),
            ]);
          }
        }

        while (gnssSentences.length > messagesToKeep) {
          gnssSentences.removeAt(0);
        }
        messages.add((gnssCurrentFrequency: gnssFrequency));
      } else if (nmea != null) {
        messages.add(
          LogEvent(Level.warning, 'Invalid NMEA message: ${nmea.raw}'),
        );
      } else if (str.startsWith('Message unfinished')) {
        messages.add(LogEvent(Level.trace, str));
      } else {
        messages.add(
          LogEvent(Level.warning, 'Unknown message received: $str'),
        );
      }

      if (Device.isNative) {
        if (_logGNSS && logDirectoryPath != null) {
          _gnssLogStartTime ??= DateTime.now();
          final file = File(
            path.join(
              logDirectoryPath!,
              'gnss',
              '${_gnssLogStartTime!.toIso8601String()}.log',
            ),
          );
          if (!file.existsSync()) {
            file.createSync(recursive: true);
          }
          file.writeAsStringSync(
            [
              '${DateTime.now().toIso8601String()}: ${nmea?.raw}',
              Platform.lineTerminator,
            ].join(),
            mode: FileMode.append,
          );
        }
      }
    }
    if (messages.isEmpty) {
      messages.add(
        LogEvent(
          Level.warning,
          'Garbled message: $str',
        ),
      );
    }
    if (Device.isNative) {
      if (_logCombined && logDirectoryPath != null) {
        _combinedLogStartTime ??= DateTime.now();
        final file = File(
          path.join(
            logDirectoryPath!,
            'combined',
            '${_combinedLogStartTime!.toIso8601String()}.log',
          ),
        );
        if (!file.existsSync()) {
          file.createSync(recursive: true);
        }
        file.writeAsStringSync(
          path.join(
            '${DateTime.now().toIso8601String()}: $str',
            Platform.lineTerminator,
          ),
          mode: FileMode.append,
        );
      }
    }
    return messages;
  }

  /// Decodes the [data] by getting the strings from [rawStrings] and then
  /// handles the objects that are parsed from the strings from [parseString].
  List<dynamic> decode(Uint8List data) {
    final messages = <dynamic>[];

    try {
      final strings = rawStrings(data);

      for (final str in strings.where((element) => element.isNotEmpty)) {
        messages.addAll(parseString(str));
      }
    } catch (error) {
      messages.add(
        LogEvent(
          Level.error,
          'Failed to decode data: $data\n${String.fromCharCodes(data)}',
          error: error,
        ),
      );
    }
    return messages;
  }
}
