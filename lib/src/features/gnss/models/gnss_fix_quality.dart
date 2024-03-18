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
