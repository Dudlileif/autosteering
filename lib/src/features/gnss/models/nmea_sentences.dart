import 'package:agopengps_flutter/src/features/gnss/models/degree_converter.dart';
import 'package:nmea/nmea.dart';

/// An NMEA message for position data.
class GNGGASentence extends TalkerSentence {
  /// An NMEA message for position data parsed from the [raw] string.
  ///
  /// Example message:
  /// $GNGGA,124816.90,6000.00000,N,01000.00000,E,1,12,0.83,91.7,M,39.5,M,,*72
  ///
  /// Type: $GNGGA,
  /// UTC (HHMMSS.SS): 124816.90,
  /// Latitude (DDMM.MMMMM): 6000.00000,
  /// N/S: N,
  /// Longitude (DDDMM.MMMMM): 01000.00000,
  /// E/W: E,
  /// Quality: 1,
  /// Num sats: 12,
  /// HDOP: 0.83,
  /// Altitude geoid: 91.7,
  /// Altitude unit: M,
  /// Geodial separation: 39.5,
  /// Altitude unit: M,
  /// Age of differential data: ,    *** Empty, we don't care about this one ***
  /// Checksum: *72
  GNGGASentence({required super.raw});

  /// The time of the message.
  DateTime? get utc {
    if (fields.length > 1) {
      final string = fields[1];

      final hour = int.tryParse(string.substring(0, 2));
      final minute = int.tryParse(string.substring(2, 4));
      final second = int.tryParse(string.substring(4, 6));
      var milliSecond = int.tryParse(string.substring(7, 9));
      if (milliSecond != null) {
        milliSecond *= 10;
      }
      final now = DateTime.timestamp();
      return DateTime(
        now.year,
        now.month,
        now.day,
        hour ?? now.hour,
        minute ?? now.minute,
        second ?? now.second,
        milliSecond ?? now.millisecond,
      );
    }

    return null;
  }

  /// The latitude of the position.
  double? get latitude => fields.length > 3 && fields[2].length == 10
      ? DegreeConverter.decimalDegreesFromDegreeMinutes(fields[2]) *
          switch (fields[3]) {
            'S' => -1,
            _ => 1,
          }
      : null;

  /// The longitude of the position.
  double? get longitude => fields.length > 5 && fields[4].length == 11
      ? DegreeConverter.decimalDegreesFromDegreeMinutes(fields[4]) *
          switch (fields[5]) {
            'W' => -1,
            _ => 1,
          }
      : null;

  /// The quality of the position fix.
  int? get quality => fields.length > 6 ? int.tryParse(fields[6]) : null;

  /// The number of satellites used to calculate the position.
  int? get numSatellites => fields.length > 7 ? int.tryParse(fields[7]) : null;

  /// Horizontal dilution of precision.
  double? get hdop => fields.length > 8 ? double.tryParse(fields[8]) : null;

  /// Altitude (m) over the geoid (mean sea level).
  double? get altitudeGeoid =>
      fields.length > 9 ? double.tryParse(fields[9]) : null;

  /// The separation between the geiod (MSL) and the ellipsoid (WGS-84).
  double? get geoidalSeparation =>
      fields.length > 11 ? double.tryParse(fields[11]) : null;
}

/// An NMEA message for course over ground and ground velocity data.
class GNVTGSentence extends TalkerSentence {
  /// An NMEA message for course over ground and ground velocity data parsed
  /// from the [raw] string.
  ///
  /// Example message:
  /// $GNVTG,10.99,T,8.99,M,0.30,N,0.16,K,A*3A
  ///
  /// Type: $GNVTG,
  /// True course over ground: 10.99,
  /// True course: T,
  /// Magnetic course over ground: 8.99,
  /// Magnetic course: M,
  /// Velocity over ground in knots: 0.30,
  /// Knots unit: N
  /// Velocity over ground in km/h: 0.16,
  /// Km/h unit: K
  /// Mode indicator: A,
  /// Checksum: *3A

  GNVTGSentence({required super.raw});

  /// The true bearing/heading/course over the ground.
  double? get trueCourseOverGround =>
      fields.length > 1 ? double.tryParse(fields[1]) : null;

  /// The magnetic bearing/heading/course over the ground.
  double? get magneticCourseOverGround =>
      fields.length > 3 ? double.tryParse(fields[3]) : null;

  /// The ground velocity in knots.
  double? get velocityKnots =>
      fields.length > 5 ? double.tryParse(fields[5]) : null;

  /// The ground velocity in km/h.
  double? get velocityKMH =>
      fields.length > 7 ? double.tryParse(fields[7]) : null;

  /// Mode indicator, should always be A.
  String? get mode => fields.length > 9 ? fields[9] : null;
}
