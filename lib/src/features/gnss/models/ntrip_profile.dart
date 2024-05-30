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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ntrip_profile.freezed.dart';
part 'ntrip_profile.g.dart';

/// A class for storing an NTRIP data connection profile.
@freezed
class NtripProfile with _$NtripProfile {
  /// A class for storing an NTRIP data connection profile.
  const factory NtripProfile({
    /// The name of this profile.
    required String name,

    /// The host address for the NTRIP caster.
    required String hostAddress,

    /// The mount point to connect to.
    required String mountPoint,

    /// The port for connecting to the NTRIP caster.
    @Default(2101) int port,

    /// Username for connecting to the mount point.
    String? username,

    /// Password for connecting to the mount point.
    String? password,

    /// The interval in seconds for sending position back to the caster.
    int? ggaSendingInterval,
  }) = _NtripProfile;

  /// Creates an [NtripProfile] object from the [json] object.
  factory NtripProfile.fromJson(Map<String, Object?> json) =>
      _$NtripProfileFromJson(json);
}
