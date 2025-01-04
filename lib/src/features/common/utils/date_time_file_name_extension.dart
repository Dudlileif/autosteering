// Copyright (C) 2025 Gaute Hagen
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

/// An extension for converting [DateTime] objects to and from path safe strings
/// that represents the ISO 8601 format, but with the colons (:) changed for a
/// path safe character, default is underscore (_).
extension DateTimeFileNameExtension on DateTime {
  /// Returns an ISO 8601 compatible string, but with colons replaced with
  /// [colonReplacement].
  String toIso8601StringFileName({String colonReplacement = '_'}) =>
      toIso8601String().replaceAll(':', colonReplacement);

  /// Attemtps to parse a [DateTime] object from the [value]. Expects an
  /// ISO 8601, but where colons are replaced with [colonReplacement].
  static DateTime? tryParseIso8601Filename(
    String value, {
    String colonReplacement = '_',
  }) =>
      DateTime.tryParse(value.replaceAll(colonReplacement, ':'));

  /// Parses a [DateTime] object from the [value]. Expects an
  /// ISO 8601, but where colons are replaced with [colonReplacement].
  static DateTime parseIso8601Filename(
    String value, {
    String colonReplacement = '_',
  }) =>
      DateTime.parse(value.replaceAll(colonReplacement, ':'));
}
