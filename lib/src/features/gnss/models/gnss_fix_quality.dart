/// An enumerator for differentiating between the different qualities of
/// GNSS fix modes.
enum GnssFixQuality {
  /// Real Time Kinematic fix, very precise.
  rtk('RTK', 4, 'R', 'D3'),

  /// Float RTK, less precise and not fixed yet.
  floatRTK('Float RTK', 5, 'F', 'D2'),

  /// Differential GNSS fix,
  differentialFix('Differential fix', 2, 'D', 'D2'),

  /// Precise Position Service.
  ppsFix('PPS fix', 3, 'P', 'D2'),

  /// Normal GNSS fix.
  fix('Fix', 1, 'A', 'G3'),

  /// Estimated, usually by dead reckoning
  estimated('Estimated (dead reckoning)', 6, 'E', 'DR'),

  /// Manual input mode.
  manualInput('Manual input mode', 7, 'M', null),

  /// Simulation mode.
  simulation('Simulation mode', 8, 'S', null),

  /// No fix.
  notAvailable('Not available', 0, 'N', 'NF');

  const GnssFixQuality(
    this.name,
    this.nmeaGGAQuality,
    this.nmeaGNSPosMode,
    this.ubxNavStatus,
  );

  /// The name for the value.
  final String name;

  /// The NMEA GGA quality mode flag code.
  final int nmeaGGAQuality;

  /// The NMEA GNS positiom mode flag code.
  final String? nmeaGNSPosMode;

  /// The PUBX navigation status code.
  final String? ubxNavStatus;
}
