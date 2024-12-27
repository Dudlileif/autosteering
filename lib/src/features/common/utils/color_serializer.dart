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

import 'package:json_annotation/json_annotation.dart';

/// A JSON serializer for [Color] to simplify the usage in freezed models.
class ColorSerializer implements JsonConverter<Color, String> {
  /// A JSON serializer for [Color] to simplify the usage in freezed models.
  const ColorSerializer();
  @override
  Color fromJson(String json) {
    final parsed = int.tryParse(json);
    if (parsed != null) {
      return Color(parsed);
    }
    return const Color(0x00000000);
  }

  @override
  String toJson(Color object) {
    final value = ((object.a * 255).round() << 24) +
        ((object.r * 255).round() << 16) +
        ((object.g * 255).round() << 8) +
        (object.b * 255).round();
    return '0x${value.toRadixString(16).toUpperCase().padLeft(8, '0')}';
  }
}

/// A JSON serializer for nullable [Color] to simplify the usage in freezed
/// models.
class ColorSerializerNullable implements JsonConverter<Color?, String> {
  /// A JSON serializer for nullable [Color] to simplify the usage in freezed
  /// models.
  const ColorSerializerNullable();
  @override
  Color? fromJson(String json) {
    final parsed = int.tryParse(json);
    if (parsed != null) {
      return Color(parsed);
    }
    return null;
  }

  @override
  String toJson(Color? object) {
    if (object == null) {
      return 'null';
    }
    final value = ((object.a * 255).round() << 24) +
        ((object.r * 255).round() << 16) +
        ((object.g * 255).round() << 8) +
        (object.b * 255).round();
    return '0x${value.toRadixString(16).toUpperCase().padLeft(8, '0')}';
  }
}
