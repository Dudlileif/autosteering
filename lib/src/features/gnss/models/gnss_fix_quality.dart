/// An enumerator for differentiating between the different qualities of
/// GNSS fix modes.
enum GnssFixQuality {
  /// No fix.
  notAvailable('Not available'),

  /// Normal GNSS fix.
  fix('Fix'),

  /// Differential GNSS fix,
  differentialFix('Differential fix'),

  /// Precise Position Service.
  ppsFix('PPS fix'),

  /// Real Time Kinematic fix, very precise.
  rtk('RTK'),

  /// Float RTK, less precise and not fixed yet.
  floatRTK('Float RTK'),

  /// Estimated, usually by dead reckoning
  estimated('Estimated (dead reckoning)'),

  /// Manual input mode.
  manualInput('Manual input mode'),

  /// Simulation mode.
  simulation('Simulation mode');

  const GnssFixQuality(this.name);

  /// The name for the value.
  final String name;

  /// The corresponding value for the quality in an NMEA sentence.
  int get nmeaValue => index;
}
