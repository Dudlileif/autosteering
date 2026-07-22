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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:geobase/geobase.dart';

part 'section_edge_position.dart';

/// A class for representing a physical section of an [Equipment].
class Section {
  /// A class for representing a physical section of an [Equipment].
  ///
  /// []
  ///
  /// [index] is the positional index of this section, where 0 is the leftmost
  /// section.
  ///
  /// [longitudinalOffset] is the longitudinal offset from the reference
  /// [Equipment.position] in meters.
  ///
  /// [lateralOffset] is the lateral offset from the reference
  /// [Equipment.position] in meters.
  ///
  /// [width] is the width of the section in meters.
  ///
  /// [workingWidth] is the centered working width of the section.
  ///
  /// [length] is the length of the section in meters.
  ///
  /// [active] is whether the section is active and should paint on the map.
  ///
  /// [automateActivation] is whether the section should automatically turn on
  /// and off when overlapping with already covered areas.
  ///
  /// [color] is an override color to use when drawing the section of the
  /// equipment.
  ///
  /// [workedPathColor] is an override color to use when painting the worked
  /// paths on the map.
  Section({
    required this.longitudinalOffset,
    required this.lateralOffset,
    this.index = 0,
    this.width = 3,
    this.workingWidth = 3,
    this.length = 1,
    this.active = false,
    this.automateActivation = false,
    this.color,
    this.workedPathColor,
    this.id,
    this.implementId,
  });

  /// Factory for creating a [Section] from the database.
  factory Section.fromDatabase({
    required double longitudinalOffset,
    required double lateralOffset,
    int index = 0,
    double width = 3,
    double workingWidth = 3,
    double length = 1,
    bool active = false,
    bool automateActivation = false,
    Color? color,
    Color? workedPathColor,
    int? id,
    int? implement,
  }) => Section(
    longitudinalOffset: longitudinalOffset,
    lateralOffset: lateralOffset,
    index: index,
    width: width,
    workingWidth: workingWidth,
    length: length,
    active: active,
    automateActivation: automateActivation,
    color: color,
    workedPathColor: workedPathColor,
    id: id,
    implementId: implement,
  );

  /// Creates a [Section] from the [json] object.
  factory Section.fromJson(Map<String, dynamic> json) {
    final index = json['index'] as int? ?? 0;
    final width = json['width'] as double? ?? 3;
    final workingWidth = json['working_width'] as double? ?? 3;
    final active = json['active'] as bool?;
    final automateActivation = json['automate_activation'] as bool?;
    final sectionCount = json['section_count'] as int? ?? 1;
    final precedingWidth = json['preceding_width'] as double? ?? 0;
    final length = json['length'] as double? ?? 1;
    final longitudinalOffset = -(json['longitudinal_offset'] as double? ?? 1);
    final lateralOffset = json['lateral_offset'] as double? ?? 0;

    return Section(
      lateralOffset: switch ((sectionCount, precedingWidth)) {
        (1, 0) => 0,
        _ => precedingWidth + width / 2,
      },
      length: length,
      longitudinalOffset: longitudinalOffset,
      index: index,
      width: width,
      workingWidth: workingWidth,
      active: active ?? false,
      automateActivation: automateActivation ?? false,
      color: const ColorSerializerNullable().fromJson(
        (json['color'] as String?) ?? '',
      ),
      workedPathColor: const ColorSerializerNullable().fromJson(
        (json['worked_path_color'] as String?) ?? '',
      ),
    );
  }

  ///The positional index of this section, where 0 is the leftmost section.
  final int index;

  /// The local id in the database.
  int? id;

  /// The UUID the parent equipment, references [Equipment.id].
  int? implementId;

  /// Longitudinal offset in meters from the parent [Equipment.position] to the
  /// frontmost point of the section.
  double longitudinalOffset;

  /// Lateral offset in meters from the parent [Equipment.position] to the
  /// center of the section, with half the [width] on either side.
  double lateralOffset;

  /// The width of the section in meters.
  double width;

  /// The centered working width of the section in meters, defaults to
  /// the whole [width]
  double workingWidth;

  /// The length of the section in meters.
  double length;

  /// Whether the section is active and should paint on the map.
  bool active;

  /// Whether the section should automatically turn on and off when with
  /// overlapping already covered areas.
  bool automateActivation;

  /// The override color to use when drawing the section of the equipment.
  Color? color;

  /// The override color to use when painting the worked paths on the map.
  Color? workedPathColor;

  /// Returns a new [Section] based on this one, but with
  /// parameters/variables altered.
  Section copyWith({
    int? id,
    int? index,
    int? implementId,
    double? longitudinalOffset,
    double? lateralOffset,
    double? width,
    double? workingWidth,
    double? length,
    bool? active,
    bool? automateActivation,
    Color? color,
    Color? workedPathColor,
  }) => Section(
    id: id ?? this.id,
    index: index ?? this.index,
    implementId: implementId ?? this.implementId,
    longitudinalOffset: longitudinalOffset ?? this.longitudinalOffset,
    lateralOffset: lateralOffset ?? this.lateralOffset,
    width: width ?? this.width,
    workingWidth: workingWidth ?? this.workingWidth,
    length: length ?? this.length,
    active: active ?? this.active,
    automateActivation: automateActivation ?? this.automateActivation,
    color: color ?? this.color,
    workedPathColor: workedPathColor ?? this.workedPathColor,
  );

  /// Converts the object to a json compatible structure.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['index'] = index;
    map['width'] = width;
    map['working_width'] = workingWidth;
    // map['active'] = active;
    map['automate_activation'] = automateActivation;
    map['color'] = const ColorSerializerNullable().toJson(color);
    map['worked_path_color'] = const ColorSerializerNullable().toJson(
      workedPathColor,
    );

    return map;
  }
}
