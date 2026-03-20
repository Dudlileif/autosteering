// Copyright (C) 2026 Gaute Hagen
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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gnss_antenna_config.freezed.dart';
part 'gnss_antenna_config.g.dart';

/// A class for the dual antenna configuration of a vehicle.
@freezed
sealed class GnssAntennaConfig with _$GnssAntennaConfig {
  /// A class for the dual antenna configuration of a vehicle.
  ///
  /// [dualBaseline] is the distance in meters between the antennas.
  ///
  /// [dualRelativeAngle] is the relative angle in degrees from the main antenna
  /// to the secondary antenna, where 0° means that the secondary is ahead of
  /// the main antenna. Should typically be set to 90° when the left antenna is
  /// the main and the right antenna is the secondary.
  const factory GnssAntennaConfig({
    /// Longitudinal offset in meters from the main node of the vehicle,
    /// positive means in front of the node, and negative behind.
    @Default(0) double longitudinalOffset,

    /// Lateral offset in meters from the main node of the vehicle. Positive
    /// value means to the right of the node and negative value means to the
    /// left of the node.
    @Default(0) double lateralOffset,

    /// Antenna height in meters from the ground.
    @Default(2.8) double height,

    /// Whether a secondary antenna is available and to be used for heading.
    @Default(false) bool useDualHeading,

    /// Whether a secondary antenna is available and to be used for roll.
    @Default(false) bool useDualRoll,

    /// The distance in meters between the main antenna and the secondary
    /// antenna.
    @Default(1) double dualBaseline,

    /// The angle in degrees from the main antenna to the secondary antenna,
    /// where 0° means that the secondary antenna is straight ahead of the main
    /// antenna.
    ///
    /// Typically this value should be 90° when the main antenna is on the left
    /// side of the vehicle and the secondary antenna on the right side of the
    /// vehicle.
    @Default(90) double dualRelativeAngle,

    /// The gain to apply when using the dual antennas for roll.
    @Default(1) double dualRollGain,

    /// Configuration strings for configuring the GNSS receiver on startup.
    @Default(null) List<String>? receiverConfigs,
  }) = _GnssAntennaConfig;

  /// Creates a [GnssAntennaConfig] object from the [json] map.
  factory GnssAntennaConfig.fromJson(Map<String, Object?> json) =>
      _$GnssAntennaConfigFromJson(json);
}

// UM982 config:
// unlog
// config com1 460800
// config com2 460800
// config com3 460800
// config nmea0183 v411
// config heading tractor
// config heading reliability 3
// config ppp enable e6-has
// config ppp converge 15 20
// mode rover uav
// gpgga 0.05
// gphpr 0.05
// saveconfig
// config signalgroup 3 6
