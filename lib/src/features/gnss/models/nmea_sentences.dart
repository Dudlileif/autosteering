import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:nmea/nmea.dart';

/// An abstract implementation class for an interface to interchangeably use the
/// identical parts of [GGASentence] and [PANDASentence] objects.
abstract class GnssPositionCommonSentence extends CustomSentence {
  /// An abstract implementation class for an interface to interchangeably use
  /// the identical parts of [GGASentence] and [PANDASentence] objects.
  ///
  /// [raw] is the raw string of the sentence.
  /// [type] is what kind of NMEA sentence this is.
  GnssPositionCommonSentence({required super.identifier, required super.raw})
      : deviceReceiveTime = DateTime.now();

  /// The time this message was received by this device.
  final DateTime deviceReceiveTime;

  /// The creation time of the message.
  DateTime? get utc {
    if (fields.length > 1) {
      final string = fields[1];
      if (string.length >= 9) {
        final hour = int.tryParse(string.substring(0, 2));
        final minute = int.tryParse(string.substring(2, 4));
        final second = int.tryParse(string.substring(4, 6));
        var milliSecond = int.tryParse(string.substring(7, 9));
        if (milliSecond != null) {
          milliSecond *= 10;
        }
        final now = DateTime.timestamp();
        return DateTime.utc(
          now.year,
          now.month,
          now.day,
          hour ?? now.hour,
          minute ?? now.minute,
          second ?? now.second,
          milliSecond ?? now.millisecond,
        );
      }
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

  /// The time in seconds since the last differential update.
  double? get timeSinceLastDGPSUpdate;

  /// The time delta from the message was created to it was received by this
  /// device.
  Duration? get deviceReceiveDelay => switch (utc != null) {
        true => deviceReceiveTime.difference(utc!.toLocal()),
        false => null,
      };
}

/// An NMEA message for position data.
class GGASentence extends GnssPositionCommonSentence {
  /// An NMEA message for position data parsed from the [raw] string.
  ///
  /// Example message:
  /// ```$GNGGA,124816.90,6000.00000,N,01000.00000,E,1,12,0.83,91.7,M,
  /// 39.5,M,,*72```
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
  GGASentence({required super.raw}) : super(identifier: 'GNGGA');

  /// The separation between the geiod (MSL) and the ellipsoid (WGS-84).
  double? get geoidalSeparation =>
      fields.length > 11 ? double.tryParse(fields[11]) : null;

  /// The time in seconds since the last differential update.
  @override
  double? get timeSinceLastDGPSUpdate =>
      fields.length > 13 ? double.tryParse(fields[13]) : null;
}

/// An NMEA message for course over ground and ground velocity data.
class VTGSentence extends TalkerSentence {
  /// An NMEA message for course over ground and ground velocity data parsed
  /// from the [raw] string.
  ///
  /// Example message:
  /// ```$GNVTG,10.99,T,8.99,M,0.30,N,0.16,K,A*3A```
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
  VTGSentence({required super.raw});

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

/// An NMEA message for general text, which can be device information/configuration
/// or errors when something is wrong, i.e. undervoltage.
class TXTSentence extends TalkerSentence {
  /// An NMEA message for general text parsed from the [raw] string.
  /// The sentence can be device information/configuration or errors when
  /// something is wrong, i.e. undervoltage.
  ///
  /// Example message:
  ///
  /// ```$GNTXT,01,01,01,Reboot reason: V_IO supply undervoltage*59```
  ///
  /// Type: $GNTXT,
  /// Code 1: 01,
  /// Code 2, 01,
  /// Code 3: 01,  (varies depending on message category)
  /// Message: V_IO supply undervoltage,
  /// Checksum: *59
  TXTSentence({required super.raw});

  /// The code before the message.
  int? get code => fields.length > 3 ? int.tryParse(fields[3]) : null;

  /// The message of the TXT sentence.
  String? get message => fields.length > 4 ? fields[4] : null;
}

/// An AgOpenGPS compatible $PANDA sentence for a combined sentence with
/// position, velocity and IMU.
class PANDASentence extends GnssPositionCommonSentence {
  // ignore: lines_longer_than_80_chars
  /// An AgOpenGPS compatible $PANDA sentence for a combined sentence with
  /// position, velocity and IMU.
  ///
  /// Example message:
  /// ```$PANDA,144405.30,6000.00000,N,01000.00000,E,5,12,0.86,96.4,,0.129,3254
  /// ,-7,-23,0*70```
  ///
  /// Type: $PANDA,
  /// UTC (HHMMSS.SS): 124816.90,
  /// Latitude (DDMM.MMMMM): 6000.00000,
  /// N/S: N,
  /// Longitude (DDDMM.MMMMM): 01000.00000,
  /// E/W: E,
  /// Quality: 5,
  /// Num sats: 12,
  /// HDOP: 0.86,
  /// Altitude geoid: 96.4,
  /// Time since last DGPS update (seconds): ,,
  /// Speed (knots): 0.129
  /// IMU heading (degrees * 10): 3254,
  /// IMU roll (degrees * 10): -7,
  /// IMU pitch (degrees * 10): -23,
  /// Yaw rate (degres / second): 0,
  /// Checksum: *70
  PANDASentence({
    required super.raw,
  }) : super(identifier: 'PANDA');

  @override
  double? get timeSinceLastDGPSUpdate =>
      fields.length > 10 ? double.tryParse(fields[10]) : null;

  /// The GNSS calculated velocity in knots.
  double? get speedKnots =>
      fields.length > 11 ? double.tryParse(fields[11]) : null;

  /// The IMU heading in degrees.
  num? get imuHeading => fields.length > 12 ? num.tryParse(fields[12]) : null;

  /// The IMU roll angle in degrees.
  num? get imuRoll => fields.length > 13 ? num.tryParse(fields[13]) : null;

  /// The IMU pitch angle in degrees.
  num? get imuPitch => fields.length > 14 ? num.tryParse(fields[14]) : null;

  /// The IMU yaw rate in degrees/second.
  double? get imuYawRate =>
      fields.length > 15 ? double.tryParse(fields[15]) : null;
}
