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

part of 'section.dart';

/// A class with positions for the [left] and [right] edge of a [Section], and
/// optionally a [time]stamp.
class SectionEdgePositions {
  /// A class with positions for the [left] and [right] edge of a [Section], and
  /// optionally a [time]stamp.
  const SectionEdgePositions({
    required this.left,
    required this.right,
    this.time,
  });

  /// Creates a [SectionEdgePositions] with [DateTime.now] as [time].
  factory SectionEdgePositions.now({
    required Geographic left,
    required Geographic right,
  }) =>
      SectionEdgePositions(
        left: left,
        right: right,
        time: DateTime.now(),
      );

  /// Creates a [SectionEdgePositions] object from the [json] object.
  factory SectionEdgePositions.fromJson(Map<String, dynamic> json) {
    DateTime? time;
    if (json['time'] is String) {
      time = DateTime.tryParse(json['time'] as String);
    }
    return SectionEdgePositions(
      left: Geographic.parse(json['left'] as String),
      right: Geographic.parse(json['right'] as String),
      time: time,
    );
  }

  /// The left edge position of the parent section.
  final Geographic left;

  /// The right edge of the parent section.
  final Geographic right;

  /// The timestamp of this.
  final DateTime? time;

  /// Converts the objet to a json compatible structure.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'left': left.toText(),
      'right': right.toText(),
    };
    if (time != null) {
      map['time'] = time?.toIso8601String();
    }
    return map;
  }
}
