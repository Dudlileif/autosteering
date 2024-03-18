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

import 'dart:ui';

/// An extension for converting [Offset]s to and from JSON compatible
/// map structures.
extension OffsetJsonExtension on Offset {
  /// Creates an [Offset] from the [json] object.
  static Offset fromJson(Map<String, dynamic> json) =>
      Offset(json['dx'] as double, json['dy'] as double);

  /// Returns a JSON compatible structure of this.
  Map<String, dynamic> toJson() => {'dx': dx, 'dy': dy};
}
