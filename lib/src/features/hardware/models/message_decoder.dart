import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';
import 'package:nmea/nmea.dart';

/// A message decoder for decoding [Uint8List] data received from connected
/// hardware.
class MessageDecoder {
  /// A message decoder for decoding [Uint8List] data received from
  /// connected hardware.
  ///
  ///[messagesToKeep] is how many messages to keep for the different list of
  /// previous messages. This will also set the count for how many updates
  /// to use for calculating [gnssFrequency] and [imuFrequency].

  MessageDecoder({this.messagesToKeep = 100});

  /// How many messages to keep for the different list of previous messages.
  final int messagesToKeep;

  /// A list of the previous [messagesToKeep] count of messages decoded.
  /// Primarily used while debugging.
  List<String> previousMessages = [];

  /// A list of the previous [messagesToKeep] count of [GGASentence]s and
  /// [PANDASentence]s decoded.
  /// Used for calculating the [gnssFrequency].
  List<GnssPositionCommonSentence> gnssSentences = [];

  /// A list of the previous [messagesToKeep] count of [VTGSentence]s decoded.
  List<VTGSentence> vtgSentences = [];

  /// A list of the previous [messagesToKeep] count of [ImuReading]s decoded.
  List<ImuReading> imuReadings = [];

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

  /// Decodes the [data] by getting the strings from [rawStrings] and then
  /// handles the objects that are parsed from the strings.
  List<dynamic> decode(Uint8List data) {
    final messages = <dynamic>[];

    try {
      final strings = rawStrings(data);

      for (final str in strings.where((element) => element.isNotEmpty)) {
        if (str.startsWith('{')) {
          if (str.contains('}')) {
            try {
              final data = Map<String, dynamic>.from(jsonDecode(str) as Map);
              final reading = ImuReading(
                yawFromStartup: data['yaw'] as num,
                pitch: data['pitch'] as num,
                roll: data['roll'] as num,
                receiveTime: DateTime.now(),
              );
              imuReadings.add(reading);
              while (imuReadings.length > messagesToKeep) {
                imuReadings.removeAt(0);
              }
              messages.addAll([
                imuReadingMatchingGnssDelay,
                (imuCurrentFrequency: imuFrequency),
                (imuLatestRaw: reading),
              ]);
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
          final decoder = NmeaDecoder(
            onUnknownSentence: (line) => PANDASentence(raw: line),
          )
            ..registerCustomSentence(
              'GGA',
              (line) => GGASentence(raw: line),
            )
            ..registerTalkerSentence(
              'VTG',
              (line) => VTGSentence(raw: line),
            )
            ..registerTalkerSentence(
              'TXT',
              (line) => TXTSentence(raw: line),
            )
            ..registerCustomSentence(
              'PANDA',
              (line) => PANDASentence(raw: line),
            );
          final nmea = decoder.decode(str);
          if (nmea is VTGSentence) {
            vtgSentences.add(nmea);
            while (vtgSentences.length > messagesToKeep) {
              vtgSentences.removeAt(0);
            }
            messages.add(null);
          } else if (nmea is TXTSentence) {
            messages.add(
              LogEvent(
                Level.warning,
                'TXT message from GNSS hardware: ${nmea.raw}',
              ),
            );
          } else if (nmea is GnssPositionCommonSentence) {
            if (nmea.quality != null) {
              messages.add((gnssFixQuality: nmea.quality!));
            }
            if (nmea.numSatellites != null) {
              messages.add((numSatellites: nmea.numSatellites));
            }
            if (nmea.longitude != null && nmea.latitude != null) {
              messages.add(
                (
                  gnssPosition: Geographic(
                    lon: nmea.longitude!,
                    lat: nmea.latitude!,
                  ),
                  time: nmea.utc ?? DateTime.now(),
                ),
              );
            }
            if (nmea.hdop != null) {
              messages.add((gnssHdop: nmea.hdop!));
            }
            if (nmea.altitudeGeoid != null) {
              messages.add((gnssAltitude: nmea.altitudeGeoid!));
            }

            messages.add(
              (
                gnssUpdateTimeDevice: nmea.deviceReceiveTime,
                gnssUpdateTimeReceiver: nmea.utc?.toLocal(),
                gnssUpdateDelay: nmea.deviceReceiveDelay,
              ),
            );

            if (nmea.valid) {
              gnssSentences.add(nmea);
            }
            while (gnssSentences.length > messagesToKeep) {
              gnssSentences.removeAt(0);
            }
            messages.add((gnssCurrentFrequency: gnssFrequency));

            if (nmea is PANDASentence) {
              if (nmea.imuHeading != null &&
                  nmea.imuPitch != null &&
                  nmea.imuRoll != null) {
                final reading = ImuReading(
                  receiveTime: nmea.deviceReceiveTime,
                  yawFromStartup: nmea.imuHeading! / 10,
                  pitch: nmea.imuPitch! / 10,
                  roll: nmea.imuRoll! / 10,
                );
                imuReadings.add(reading);
                while (imuReadings.length > messagesToKeep) {
                  imuReadings.removeAt(0);
                }
                messages.addAll([
                  imuReadingMatchingGnssDelay,
                  (imuCurrentFrequency: imuFrequency),
                  (imuLatestRaw: reading),
                ]);
              }
            }
          }
        } else if (str.startsWith('Message unfinished')) {
          messages.add(LogEvent(Level.trace, str));
        } else {
          messages.add(
            LogEvent(Level.warning, 'Unknown message received: $str'),
          );
        }
      }
      if (messages.isEmpty) {
        messages.add(
          LogEvent(
            Level.warning,
            'Garbled message: ${String.fromCharCodes(data)}',
          ),
        );
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
