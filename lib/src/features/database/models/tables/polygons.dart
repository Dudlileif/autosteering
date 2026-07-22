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
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';

/// A table for elements that describes [Partfields] areas or [GuidancePatterns]
/// or [GuidanceShifts] borders by [LineStrings] of various types.
class Polygons extends Table {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// Which type of polygon this is.
  late final Column<int> type = integer().map(const PolygonTypeConverter())();

  /// The name of this.
  late final Column<String> name = text().nullable()();
}

/// An enumerator for which type a [Polygon] is.
enum PolygonType {
  /// Boundary of a [Partfield].
  partfieldBoundary(1, 'Partfield Boundary'),

  /// ISO 11783 TreatmentZone
  treatmentZone(2, 'Treatment Zone'),

  /// Water surface
  waterSurface(3, 'Water Surface'),

  /// Building
  building(4, 'Building'),

  /// Road
  road(5, 'Road'),

  /// An obstacle to avoid.
  obstacle(6, 'Obstacle'),

  /// Flag
  flag(7, 'Flag'),

  /// Other
  other(8, 'Other'),

  /// Mainfield
  mainfield(9, 'Mainfield'),

  /// Headland
  headland(10, 'Headland'),

  /// Buffer zone
  bufferZone(11, 'Buffer Zone'),

  /// Windbreak
  windbreak(12, 'Windbreak');

  const PolygonType(this.value, this.description);

  /// Enum integer value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An SQL enum converter for [PolygonType].
class PolygonTypeConverter extends TypeConverter<PolygonType, int> {
  /// An SQL enum converter for [PolygonType].
  const PolygonTypeConverter();

  @override
  PolygonType fromSql(int fromDb) => PolygonType.values.firstWhere(
    (value) => value.value == fromDb,
    orElse: () => .other,
  );

  @override
  int toSql(PolygonType value) => value.value;
}
