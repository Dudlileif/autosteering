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

import 'package:autosteering/src/features/database/models/models.dart';
import 'package:autosteering/src/features/database/models/tables/table_timestamps_mixin.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';

/// A table for elements that describes a pattern from [LineString] and a
/// boundary [Polygon] to use with nagivation guidance (steering).
class GuidancePatterns extends Table with TableTimestamps {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// A reference to a [LineString].
  @ReferenceName('guidancePatternLineString')
  late final Column<int> lineString = integer().references(
    LineStrings,
    #id,
  )();

  /// A reference to a border [Polygon].
  @ReferenceName('guidancePatternBorderPolygon')
  late final Column<int> borderPolygon = integer()
      .references(
        Polygons,
        #id,
      )
      .nullable()();

  /// Which type of guidance pattern this is.
  late final Column<int> type = integer().map(
    const GuidancePatternTypeConverter(),
  )();

  /// The name of this.
  late final Column<String> name = text().nullable()();

  /// Heading/bearing of the pattern.
  late final Column<double> heading = real().nullable()();

  /// Radius in millimeters for pivot guidance pattern.
  late final Column<int> radius = integer().nullable()();

  /// Options if [type] is [GuidancePatternType.pivot].
  late final Column<int> options = integer()
      .map(const GuidancePatternOptionsConverter())
      .nullable()();

  /// Which directions this pattern can propagate in.
  late final Column<int> propagationDirection = integer()
      .map(const GuidancePatternPropagationDirectionConverter())
      .nullable()();

  /// In which directions the pattern should extend past the A and B points.
  late final Column<int> extension = integer()
      .map(const GuidancePatternExtensionConverter())
      .nullable()();

  /// The number of swaths to the left of the linestring, as seen from the
  /// point A in the direction to the first next point or the [heading].
  late final Column<int> numberOfSwathsLeft = integer().nullable()();

  /// The number of swaths to the right of the linestring, as seen from the
  /// point A in the direction to the first next point or the [heading].
  late final Column<int> numberOfSwathsRight = integer().nullable()();
}

/// An enumeration for the type of [GuidancePattern].
enum GuidancePatternType {
  /// AB-line, straight from A to B.
  ab(1, 'AB'),

  /// A+ or A*, A with heading/bearing.
  aPlus(2, 'A+'),

  /// Curve, a curve from a start to an end point.
  curve(3, 'Curve'),

  /// Pivot, a circle around a center/pivot point.
  pivot(4, 'Pivot'),

  /// Spiral, a spiral out from a center point.
  spiral(5, 'Spiral');

  const GuidancePatternType(this.value, this.description);

  /// Enum integer value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumerator with pattern options for a [GuidancePattern] with type
/// [GuidancePatternType.pivot].
enum GuidancePatternOptions {
  /// Clockwise, for [GuidancePatternType.pivot] only.
  clockwise(1, 'Clocwise - for pivot'),

  /// Counter-clockwise, for [GuidancePatternType.pivot] only.
  counterClockwise(2, 'Counter-clockwise - for pivot'),

  /// Full circle, for [GuidancePatternType.pivot] only.
  fullCircle(3, 'Full Circle - for pivot');

  const GuidancePatternOptions(this.value, this.description);

  /// Enum integer value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumeration for which direction a [GuidancePattern] should propagate,
/// as seen from the direction from point A to the next point.
enum GuidancePatternPropagationDirection {
  /// In both directions from the reference pattern.
  both(1, 'Both diretions'),

  /// To the left of the reference pattern only, as seen from A to the next
  /// point.
  leftOnly(2, 'Left direction only'),

  /// To the right of the reference pattern only, as seen from A to the next
  /// point.
  rightOnly(3, 'Right direction only'),

  /// No propagation, i.e. only the reference line will be used.
  noPropagation(4, 'No propagation');

  const GuidancePatternPropagationDirection(this.value, this.description);

  /// Enum integer value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumeration for if the [GuidancePattern] should extend at the
/// start and end points.
enum GuidancePatternExtension {
  /// Extend from both start (A) and end (B) points.
  fromBoth(1, 'From both first and last points'),

  /// Extend from start point (A) only.
  fromAOnly(2, 'From first point (A) only'),

  /// Extend from end point (B) only.
  fromBOnly(3, 'From last point (B) only'),

  /// No extension from any points.
  noExtensions(4, 'No extensions');

  const GuidancePatternExtension(this.value, this.description);

  /// Enum integer value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An SQL enum converter for [GuidancePatternType].
class GuidancePatternTypeConverter
    extends TypeConverter<GuidancePatternType, int> {
  /// An SQL enum converter for [GuidancePatternType].
  const GuidancePatternTypeConverter();

  @override
  GuidancePatternType fromSql(int fromDb) =>
      GuidancePatternType.values.firstWhere(
        (value) => value.value == fromDb,
        orElse: () => .ab,
      );

  @override
  int toSql(GuidancePatternType value) => value.value;
}

/// An SQL enum converter for [GuidancePatternOptions].
class GuidancePatternOptionsConverter
    extends TypeConverter<GuidancePatternOptions, int> {
  /// An SQL enum converter for [GuidancePatternOptions].
  const GuidancePatternOptionsConverter();

  @override
  GuidancePatternOptions fromSql(int fromDb) =>
      GuidancePatternOptions.values.firstWhere(
        (value) => value.value == fromDb,
        orElse: () => .fullCircle,
      );

  @override
  int toSql(GuidancePatternOptions value) => value.value;
}

/// An SQL enum converter for [GuidancePatternPropagationDirection].
class GuidancePatternPropagationDirectionConverter
    extends TypeConverter<GuidancePatternPropagationDirection, int> {
  /// An SQL enum converter for [GuidancePatternPropagationDirection].
  const GuidancePatternPropagationDirectionConverter();

  @override
  GuidancePatternPropagationDirection fromSql(int fromDb) =>
      GuidancePatternPropagationDirection.values.firstWhere(
        (value) => value.value == fromDb,
        orElse: () => .noPropagation,
      );

  @override
  int toSql(GuidancePatternPropagationDirection value) => value.value;
}

/// An SQL enum converter for [GuidancePatternExtension].
class GuidancePatternExtensionConverter
    extends TypeConverter<GuidancePatternExtension, int> {
  /// An SQL enum converter for [GuidancePatternExtension].
  const GuidancePatternExtensionConverter();

  @override
  GuidancePatternExtension fromSql(int fromDb) =>
      GuidancePatternExtension.values.firstWhere(
        (value) => value.value == fromDb,
        orElse: () => .fromBoth,
      );

  @override
  int toSql(GuidancePatternExtension value) => value.value;
}

/// A [GuidancePattern] extended with all children/refs loaded.
class GuidancePatternWithRefs extends GuidancePattern {
  /// A [GuidancePattern] extended with all children/refs loaded.
  factory GuidancePatternWithRefs({
    required GuidancePattern guidancePattern,
    required LineStringWithRefs lineStringObj,
    PolygonWithRefs? borderPolygonObj,
  }) => GuidancePatternWithRefs._(
    id: guidancePattern.id,
    lineString: guidancePattern.lineString,
    borderPolygon: guidancePattern.borderPolygon,
    type: guidancePattern.type,
    name: guidancePattern.name,
    heading: guidancePattern.heading,
    radius: guidancePattern.radius,
    options: guidancePattern.options,
    propagationDirection: guidancePattern.propagationDirection,
    extension: guidancePattern.extension,
    numberOfSwathsLeft: guidancePattern.numberOfSwathsLeft,
    numberOfSwathsRight: guidancePattern.numberOfSwathsRight,
    createdAt: guidancePattern.createdAt,
    lastUpdatedAt: guidancePattern.lastUpdatedAt,
    borderPolygonObj: borderPolygonObj,
    lineStringObj: lineStringObj,
  );
  GuidancePatternWithRefs._({
    required super.id,
    required super.lineString,
    required super.type,
    required super.createdAt,
    required this.lineStringObj,
    super.borderPolygon,
    super.name,
    super.heading,
    super.radius,
    super.options,
    super.propagationDirection,
    super.extension,
    super.numberOfSwathsLeft,
    super.numberOfSwathsRight,
    super.lastUpdatedAt,
    this.borderPolygonObj,
  });

  /// The loaded optional border polygon.
  final PolygonWithRefs? borderPolygonObj;

  /// The loaded line string.
  final LineStringWithRefs lineStringObj;
}
