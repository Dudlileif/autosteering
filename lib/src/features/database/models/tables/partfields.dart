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

import 'package:autosteering/src/features/database/database.dart';
import 'package:autosteering/src/features/database/models/tables/table_timestamps_mixin.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';

/// A table for partfields, which consist of [LineStrings], [Polygons] and
/// [Points]. Optionally the partfield can have one parent partfield, given that
/// the parent does not have a parent itself, i.e. the recursion limit is 2.
/// The partield can also have [GuidanceGroups] linked to it.
class Partfields extends Table with TableTimestamps {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// Reference to an optional parent [Partfield].
  @ReferenceName('partfieldParentField')
  late final Column<int> parentField = integer()
      .references(Partfields, #id)
      .nullable()();

  /// The name of this.
  late final Column<String> name = text().nullable()();

  /// The area of this, in m².
  late final Column<double> area = real()();
}

/// A [Partfield] extended with all children/refs loaded.
class PartfieldWithRefs extends Partfield {
  /// A [Partfield] extended with all children/refs loaded.
  factory PartfieldWithRefs({
    required Partfield partfield,
    Partfield? parent,
    List<GuidanceGroupWithRefs>? guidanceGroups,
    List<PolygonWithRefs>? polygons,
    List<LineStringWithRefs>? lineStrings,
    List<Point>? points,
  }) => PartfieldWithRefs._(
    id: partfield.id,
    parentField: partfield.parentField,
    name: partfield.name,
    area: partfield.area,
    createdAt: partfield.createdAt,
    lastUpdatedAt: partfield.lastUpdatedAt,
    parent: parent,
    guidanceGroups: guidanceGroups ?? [],
    polygons: polygons ?? [],
    lineStrings: lineStrings ?? [],
    points: points ?? [],
  );

  const PartfieldWithRefs._({
    required super.id,
    required super.createdAt,
    super.parentField,
    super.name,
    super.area = 0,
    super.lastUpdatedAt,
    this.parent,
    this.guidanceGroups = const [],
    this.polygons = const [],
    this.lineStrings = const [],
    this.points = const [],
  });

  /// The loaded optional parent partfield.
  final Partfield? parent;

  /// The loaded guidance groups.
  final List<GuidanceGroupWithRefs> guidanceGroups;

  /// The loaded polygons.
  final List<PolygonWithRefs> polygons;

  /// The laoded line strings.
  final List<LineStringWithRefs> lineStrings;

  /// The loaded points.
  final List<Point> points;
}
