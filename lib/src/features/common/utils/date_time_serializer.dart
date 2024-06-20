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

import 'package:json_annotation/json_annotation.dart';

/// A JSON serializer for [DateTime] to simplify the usage in freezed models.
class DateTimeSerializer implements JsonConverter<DateTime, String> {
  /// A JSON serializer for [DateTime] to simplify the usage in freezed models.
  const DateTimeSerializer();
  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
