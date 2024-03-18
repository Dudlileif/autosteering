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

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:geobase/geobase.dart';

part 'section_edge_position.dart';

/// A class for representing a physical section of an [Equipment].
class Section {
  /// A class for representing a physical section of an [Equipment].
  ///
  /// [index] is the positional index of this section, where 0 is the leftmost
  /// section.
  ///
  /// [width] is the width of the section in meters.
  ///
  /// [workingWidth] is the centered working width of the section.
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
    this.index = 0,
    this.width = 3,
    this.workingWidth = 3,
    this.active = false,
    this.automateActivation = false,
    this.color,
    this.workedPathColor,
  });

  /// Creates a [Section] from the [json] object.
  factory Section.fromJson(Map<String, dynamic> json) {
    final index = json['index'] as int?;
    final width = json['width'] as double?;
    final workingWidth = json['working_width'] as double?;
    final active = json['active'] as bool?;
    final automateActivation = json['automate_activation'] as bool?;
    final color = json['color'] != null
        ? Color(int.parse(json['color'] as String, radix: 16))
        : null;
    final workedPathColor = json['worked_path_color'] != null
        ? Color(int.parse(json['worked_path_color'] as String, radix: 16))
        : null;

    return Section(
      index: index ?? 0,
      width: width ?? 3,
      workingWidth: workingWidth ?? 3,
      active: active ?? false,
      automateActivation: automateActivation ?? false,
      color: color,
      workedPathColor: workedPathColor,
    );
  }

  ///The positional index of this section, where 0 is the leftmost section.
  final int index;

  /// The width of the section in meters.
  double width;

  /// The centered working width of the section in meters, defaults to
  /// the whole [width]
  double workingWidth;

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
    int? index,
    double? width,
    double? workingWidth,
    bool? active,
    bool? automateActivation,
    Color? color,
    Color? workedPathColor,
  }) =>
      Section(
        index: index ?? this.index,
        width: width ?? this.width,
        workingWidth: workingWidth ?? this.workingWidth,
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
    map['active'] = active;
    map['automate_activation'] = automateActivation;
    map['color'] = color?.value.toRadixString(16);
    map['worked_path_color'] = workedPathColor?.value.toRadixString(16);

    return map;
  }
}
