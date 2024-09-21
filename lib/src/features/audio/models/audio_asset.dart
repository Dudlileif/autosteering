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

/// An enumerator for all the audio assets.
enum AudioAsset {
  /// Audio asset for autosteering disabled.
  autosteeringDisabled('autosteering_disabled'),

  /// Audio asset for autosteering enabled.
  autosteeringEnabled('autosteering_enabled'),

  /// Audio asset for autosteering standby.
  autosteeringStandby('autosteering_standby'),

  /// Audio asset for RTK lost alarm.
  rtkLostAlarm('rtk_lost_alarm');

  const AudioAsset(this.path);

  /// Create an AudioAsset from the string [s].
  factory AudioAsset.fromPath(String s) =>
      values.firstWhere((a) => a.path == s);

  /// The path/name of this.
  final String path;

  /// Create a JSON compatible representation of this.
  String toJson() => path;
}
