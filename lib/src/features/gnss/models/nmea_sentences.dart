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
  DateTime? get utc => DateTime.tryParse(fields[0]);

  /// The latitude of the position.
  double? get latitude => fields[1].length == 10
      ? DegreeConverter.decimalDegreesFromDegreeMinutes(fields[1]) *
          switch (fields[2]) {
            'S' => -1,
            _ => 1,
          }
      : null;

  /// The longitude of the position.
  double? get longitude => fields[3].length == 11
      ? DegreeConverter.decimalDegreesFromDegreeMinutes(fields[3]) *
          switch (fields[4]) {
            'W' => -1,
            _ => 1,
          }
      : null;

  /// The quality of the position fix.
  int? get quality => int.tryParse(fields[5]);

  /// The number of satellites used to calculate the position.
  int? get numSatellites => int.tryParse(fields[6]);

  /// Horizontal dilution of precision.
  double? get hdop => double.tryParse(fields[7]);

  /// Altitude (m) over the geoid (mean sea level).
  double? get altitudeGeoid => double.tryParse(fields[8]);

  /// The separation between the geiod (MSL) and the ellipsoid (WGS-84).
  double? get geoidalSeparation => double.tryParse(fields[10]);
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
  double? get trueCourseOverGround => double.tryParse(fields[0]);

  /// The magnetic bearing/heading/course over the ground.
  double? get magneticCourseOverGround => double.tryParse(fields[2]);

  /// The ground velocity in knots.
  double? get velocityKnots => double.tryParse(fields[4]);

  /// The ground velocity in km/h.
  double? get velocityKMH => double.tryParse(fields[6]);

  /// Mode indicator, should always be A.
  String? get mode => fields[8];
}
