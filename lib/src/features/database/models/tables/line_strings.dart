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

/// A table for line strings that describe a path that can be used in
/// [Polygons], [GuidancePatterns] and [Partfields].
class LineStrings extends Table with TableTimestamps {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// Which type of line string this is.
  late final Column<int> type = integer().map(
    const LineStringTypeConverter(),
  )();

  /// The name of this.
  late final Column<String> name = text().nullable()();

  /// Width of this in millimeters, typically used as the spacing for separating
  /// adjacent path in [GuidancePattern]s.
  late final Column<int> width = integer().nullable()();

  /// Length of this in millimeters.
  late final Column<int> length = integer().nullable()();
}

/// An enumerator for which type a [LineString] is.
enum LineStringType {
  /// The exterior of a [Polygon].
  polygonExterior(1, 'Polygon Exterior'),

  /// An interior of a [Polygon].
  polygonInterior(2, 'Polygon Interior'),

  /// A tramline in a field.
  tramline(3, 'Tramline'),

  /// A sampling route.
  samplingRoute(4, 'Sampling Route'),

  /// A guidance pattern.
  guidancePattern(5, 'Guidance Pattern'),

  /// A drainage indication line.
  drainage(6, 'Drainage'),

  /// A fence.
  fence(7, 'Fence'),

  /// A flag to show comments on positions.
  flag(8, 'Flag'),

  /// An obstacle to avoid.
  obstacle(9, 'Obstacle');

  const LineStringType(this.value, this.description);

  /// Integer value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An SQL enum converter for [LineStringType].
class LineStringTypeConverter extends TypeConverter<LineStringType, int> {
  /// An SQL enum converter for [LineStringType].
  const LineStringTypeConverter();

  @override
  LineStringType fromSql(int fromDb) => LineStringType.values.firstWhere(
    (value) => value.value == fromDb,
    orElse: () => .polygonExterior,
  );

  @override
  int toSql(LineStringType value) => value.value;
}

/// A [LineString] extended with all children/refs loaded.
class LineStringWithRefs extends LineString {
  /// A [LineString] extended with all children/refs loaded.
  factory LineStringWithRefs({
    required LineString lineString,
    List<Point>? points,
  }) => LineStringWithRefs._(
    id: lineString.id,
    type: lineString.type,
    name: lineString.name,
    width: lineString.width,
    length: lineString.length,
    createdAt: lineString.createdAt,
    lastUpdatedAt: lineString.lastUpdatedAt,
    points: points ?? [],
  );
  LineStringWithRefs._({
    required super.id,
    required super.type,
    required super.createdAt,
    super.name,
    super.width,
    super.length,
    super.lastUpdatedAt,
    this.points = const [],
  });

  /// The loaded points.
  final List<Point> points;
}
