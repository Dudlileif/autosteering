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

import 'dart:io';

/// An extension with a convenience method for setting the multicast network
/// interface on a [RawDatagramSocket].
extension RawDatagramSocketExtensions on RawDatagramSocket {
  /// Helper function to set the multicast interface with calls to
  /// [setRawOption].
  ///
  /// Throws an [OSError] on failure.
  void setMulticastInterface(NetworkInterface interface) {
    final level = switch (address.type) {
      .IPv6 => RawSocketOption.levelIPv6,
      _ => RawSocketOption.levelIPv4,
    };

    final option = switch (address.type) {
      .IPv6 => RawSocketOption.IPv6MulticastInterface,
      _ => RawSocketOption.IPv4MulticastInterface,
    };

    for (final address in interface.addresses.where(
      (addr) => addr.type == address.type,
    )) {
      setRawOption(RawSocketOption(level, option, address.rawAddress));
    }
  }
}
