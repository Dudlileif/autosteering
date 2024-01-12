import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:collection/collection.dart';
import 'package:nmea/nmea.dart';

/// This is a mixin version of the [ChecksumSentence] class, so that it can be
/// used with [ProprietarySentence] objects.
mixin ChecksumMixin on NmeaSentence {
  bool? _valid;

  /// Whether or not this sentence is a valid NMEA0183 sentence, including a
  /// checksum check.
  ///
  /// This getter checks if the raw string source conforms to the general
  /// NMEA0183 requirements (starts with a "$" character) and also if the
  /// checksum is valid.
  @override
  bool get valid => _valid ??= super.valid && hasValidChecksum;

  bool? _hasChecksum;

  /// Whether or not this sentence contains the checksum separator.
  bool get hasChecksum => _hasChecksum ??= raw.contains(nmeaChecksumSeparator);

  String? _checksum;

  /// Reads the checksum contained in the raw string source. If the sentence
  /// does not contain a checksum, an empty string is returned.
  String get checksum => hasChecksum
      ? _checksum ??= raw.split(nmeaChecksumSeparator).last
      : ''; // MAYBE: uppercase the checksum even if it was not uppercase

  String? _actualChecksum;

  /// In contrast to the [checksum] property, this function calculates the
  /// actual checksum of the sentence, regardless of what checksum was
  /// originally sent along with it.
  /// The data used is provided by the [rawWithoutFixtures] property.
  String get actualChecksum =>
      _actualChecksum ??= NmeaUtils.xorChecksum(rawWithoutFixtures);

  /// Whether or not the actual checksum of the sentence matches the checksum
  /// contained in the raw string source.
  bool get hasValidChecksum => hasChecksum && checksum == actualChecksum;

  String? _rawWithoutFixtures;

  /// Returns the raw string source without [nmeaPrefix] ("$") and without
  /// checksum.
  ///
  /// This is the actual sentence, without any fixtures, which is used to
  /// calculate the checksum.
  @override
  String get rawWithoutFixtures => _rawWithoutFixtures ??= (hasChecksum
      ? super.rawWithoutFixtures.split(nmeaChecksumSeparator).first
      : super.rawWithoutFixtures); // remove the checksum + separator character
}

/// An abstract implementation class for an interface to interchangeably use the
/// identical parts of [GGASentence], [GNSSentence] and [PANDASentence] objects.
mixin GnssPositionCommonSentence on NmeaSentence {
  /// An abstract implementation class for an interface to interchangeably use
  /// the identical parts of [GGASentence], [GNSSentence] and [PANDASentence]
  /// objects.
  ///

  /// The time this message was received by this device.
  late final DateTime deviceReceiveTime;

  /// Gets the int value at fields[field], if there is one.
  int? _intFromField(int field) =>
      fields.length > field ? int.tryParse(fields[field]) : null;

  /// Gets the double value at fields[field], if there is one.
  double? _doubleFromField(int field) =>
      fields.length > field ? double.tryParse(fields[field]) : null;

  /// Gets the num value at fields[field], if there is one.
  num? _numFromField(int field) =>
      fields.length > field ? num.tryParse(fields[field]) : null;

  /// Gets the GNSS receiver time of the message at fields[field] if
  /// there is one.
  DateTime? _utcFromField(int field) {
    if (fields.length > field) {
      final string = fields[field];
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

  /// Finds the latitude of fields[field] if it and the E/S flag exists at
  /// fields[field+1].
  double? _latitudeFromField(int field) =>
      fields.length > field + 1 && fields[field].length >= 10
          ? DegreeConverter.decimalDegreesFromDegreeMinutes(fields[field]) *
              switch (fields[field + 1]) {
                'S' => -1,
                _ => 1,
              }
          : null;

  /// Finds the longitude of fields[field] if it and the E/W flag exists at
  /// fields[field+1].
  double? _longitudeFromField(int field) =>
      fields.length > field + 1 && fields[field].length >= 11
          ? DegreeConverter.decimalDegreesFromDegreeMinutes(fields[field]) *
              switch (fields[field + 1]) {
                'W' => -1,
                _ => 1,
              }
          : null;

  /// The creation time of the message.
  DateTime? get utc => _utcFromField(1);

  /// The latitude of the position.
  double? get latitude => _latitudeFromField(2);

  /// The longitude of the position.
  double? get longitude => _longitudeFromField(4);

  /// The quality of the position fix in [GGASentence]s and [PANDASentence]s.
  int? get quality => null;

  /// The position (quality) mode of the receiver in [GNSSentence]s.
  String? get posMode => null;

  /// The navigation (quality) mode of the receiver in [PUBXSentence]s.
  String? get ubxNavStatus => null;

  /// The number of satellites used to calculate the position.
  int? get numSatellites => _intFromField(7);

  /// Horizontal dilution of precision.
  double? get hdop => _doubleFromField(8);

  /// Vertical dilution of precision.
  double? get vdop => null;

  /// Time dilution of precision.
  double? get tdop => null;

  /// The estimated horizontal accuracy, in meters.
  double? get horizontalAccuracy => null;

  /// The estimated vertial accuraty, in meters.
  double? get verticalAccuracy => null;

  /// Altitude (m) over the geoid (mean sea level).
  double? get altitudeMSL => _doubleFromField(9);

  /// Altitude (m) HAE,
  double? get altitudeRef => null;

  /// Geoid separation (m) from the ellipsoid.
  double? get geoidSeparation => null;

  /// The speed over ground in km/h.
  double? get speedOverGround => null;

  /// The course/heading over ground.
  double? get courseOverGround => null;

  /// The vertical velocity in m/s, positive means downward.
  double? get verticalVelocity => null;

  /// The time in seconds since the last differential update.
  double? get timeSinceLastDGPSUpdate;

  /// The time delta from the message was created to it was received by this
  /// device.
  Duration? get deviceReceiveDelay => switch (utc != null) {
        true => deviceReceiveTime.difference(utc!.toLocal()),
        false => null,
      };

  /// The interpreted GNSS fix quality of this sentence.
  GnssFixQuality? get fixQuality;
}

/// An NMEA message for GPS position data.
class GGASentence extends TalkerSentence with GnssPositionCommonSentence {
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
  GGASentence({required super.raw}) {
    super.deviceReceiveTime = DateTime.now();
  }
  @override
  int? get quality => _intFromField(6);

  @override
  double? get geoidSeparation => _doubleFromField(11);

  /// The time in seconds since the last differential update.
  @override
  double? get timeSinceLastDGPSUpdate => _doubleFromField(13);

  @override
  GnssFixQuality? get fixQuality => GnssFixQuality.values
      .firstWhereOrNull((element) => element.nmeaGGAQuality == quality);
}

/// An NMEA message for multi-GNSS position data.
class GNSSentence extends TalkerSentence with GnssPositionCommonSentence {
  /// An NMEA message for position data parsed from the [raw] string.
  ///
  /// Example message:
  /// ```$GNGNS,124816.90,6000.00000,N,01000.00000,E,1,12,0.83,91.7,
  /// 39.5,,A*72```
  ///
  /// Type: $GNGNS
  /// UTC (HHMMSS.SS): 124816.90,
  /// Latitude (DDMM.MMMMM): 6000.00000,
  /// N/S: N,
  /// Longitude (DDDMM.MMMMM): 01000.00000,
  /// E/W: E,
  /// Pos mode: RRNRNN, (GPS, GLONASS, Galileio, BeiDou, unknown, unknown)
  /// Num sats: 12,
  /// HDOP: 0.83,
  /// Altitude geoid: 91.7,
  /// Geodial separation: 39.5,
  /// Age of differential data: ,    *** Empty, we don't care about this one ***
  /// Nav status: A,
  /// Checksum: *72
  GNSSentence({required super.raw}) {
    super.deviceReceiveTime = DateTime.now();
  }

  @override
  String? get posMode => fields.elementAtOrNull(6);

  @override
  double? get geoidSeparation => _doubleFromField(10);

  /// The time in seconds since the last differential update.
  @override
  double? get timeSinceLastDGPSUpdate => _doubleFromField(11);

  /// The navigational status indicator, V means invalid, A means valid.
  String? get navStatus => fields.elementAtOrNull(13);

  @override
  GnssFixQuality? get fixQuality => (posMode?.split('') ?? [])
      .map(
        (e) => GnssFixQuality.values
            .firstWhereOrNull((element) => element.nmeaGNSPosMode == e),
      )
      .sortedByCompare(
        (element) => element?.index ?? 100,
        (a, b) => a < b ? -1 : 1,
      )
      .firstOrNull;
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
  /// Pos mode: A,
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

  /// The position (quality) mode.
  String? get posMode => fields.elementAtOrNull(9);
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
  String? get message => fields.elementAtOrNull(4);
}

/// An AgOpenGPS compatible $PANDA sentence for a combined sentence with
/// position, velocity and IMU.
class PANDASentence extends TalkerSentence with GnssPositionCommonSentence {
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
  PANDASentence({required super.raw}) {
    super.deviceReceiveTime = DateTime.now();
  }

  @override
  int? get quality => _intFromField(6);

  @override
  double? get timeSinceLastDGPSUpdate => _doubleFromField(10);

  /// The GNSS calculated velocity in knots.
  double? get speedKnots => _doubleFromField(11);

  /// The IMU heading in degrees.
  num? get imuHeading => _numFromField(12);

  /// The IMU roll angle in degrees.
  num? get imuRoll => _numFromField(13);

  /// The IMU pitch angle in degrees.
  num? get imuPitch => _numFromField(14);

  /// The IMU yaw rate in degrees/second.
  double? get imuYawRate => _doubleFromField(15);

  @override
  GnssFixQuality? get fixQuality => GnssFixQuality.values
      .firstWhereOrNull((element) => element.nmeaGGAQuality == quality);
}

/// A u-blox proprietary position and course NMEA message.
class PUBXSentence extends ProprietarySentence
    with ChecksumMixin, GnssPositionCommonSentence {
  /// A u-blox proprietary position and course NMEA message.
  ///
  /// [raw] is the raw string of the sentence.
  PUBXSentence({required super.raw, super.manufacturer = 'UBX'}) {
    deviceReceiveTime = DateTime.now();
  }

  @override
  String get rawWithoutFixtures => _rawWithoutFixtures ??=
      raw.replaceFirst(r'$', '').split(nmeaChecksumSeparator).first;

  /// An identifier for which type of message this is.
  String? get messageIdentifier => fields.elementAtOrNull(1);

  @override
  DateTime? get utc => _utcFromField(2);

  @override
  double? get latitude => _latitudeFromField(3);

  @override
  double? get longitude => _longitudeFromField(5);

  @override
  double? get altitudeRef => _doubleFromField(7);

  @override
  String? get ubxNavStatus => fields.elementAtOrNull(8);

  @override
  double? get horizontalAccuracy => _doubleFromField(9);

  @override
  double? get verticalAccuracy => _doubleFromField(10);

  @override
  double? get speedOverGround => _doubleFromField(11);

  @override
  double? get courseOverGround => _doubleFromField(12);

  @override
  double? get verticalVelocity => _doubleFromField(13);

  @override
  double? get timeSinceLastDGPSUpdate => _doubleFromField(14);

  @override
  double? get hdop => _doubleFromField(15);

  @override
  double? get vdop => _doubleFromField(16);

  @override
  double? get tdop => _doubleFromField(17);

  @override
  int? get numSatellites => _intFromField(18);

  @override
  GnssFixQuality? get fixQuality => GnssFixQuality.values
      .firstWhereOrNull((element) => element.ubxNavStatus == ubxNavStatus);

  @override
  double? get altitudeMSL => null;
}
