import 'dart:ui';

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:geobase/geobase.dart';

part 'section_edge_position.dart';

/// A class for representing a [Section] of an [Equipment].
class Section {
  /// A class for representing a [Section] of an [Equipment].
  ///
  /// [index] is the positional index of this section, where 0 is the leftmost
  /// section.
  ///
  /// [width] is the width of the section in meters.
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
    required this.index,
    required this.width,
    this.active = false,
    this.automateActivation = false,
    this.color,
    this.workedPathColor,
  });

  /// Creates a [Section] from the [json] object.
  factory Section.fromJson(Map<String, dynamic> json) {
    final index = json['index'] as int?;
    final width = json['width'] as double?;
    final active = json['active'] as bool?;
    final automateActivation = json['automate_activation'] as bool?;
    final color = json['color'] != null ? Color(json['color'] as int) : null;
    final workedPathColor = json['worked_path_color'] != null
        ? Color(json['worked_path_color'] as int)
        : null;

    return Section(
      index: index ?? 0,
      width: width ?? 3,
      active: active ?? false,
      automateActivation: automateActivation ?? false,
      color: color,
      workedPathColor: workedPathColor,
    );
  }

  ///The positional index of this section, where 0 is the leftmost section.
  final int index;

  /// The width of the section in meters.
  final double width;

  /// Whether the section is active and should paint on the map.
  bool active;

  /// Whether the section should automatically turn on and off when with
  /// overlapping already covered areas.
  bool automateActivation;

  /// The override color to use when drawing the section of the equipment.
  Color? color;

  /// The override color to use when painting the worked paths on the map.
  Color? workedPathColor;

  /// Converts the object to a json compatible structure.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['index'] = index;
    map['width'] = width;
    map['active'] = active;
    map['automate_activation'] = automateActivation;
    map['color'] = color?.value;
    map['worked_path_color'] = workedPathColor?.value;

    return map;
  }
}
