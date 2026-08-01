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

import 'package:autosteering/src/features/database/models/database.dart';
import 'package:autosteering/src/features/database/models/tables/table_timestamps_mixin.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';

/// A table for storing a group of [GuidancePatterns], with an optional border
/// [Polygon].
class GuidanceGroups extends Table with TableTimestamps {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// The name of this.
  late final Column<String> name = text().nullable()();

  /// Reference to a border [Polygon], if there is one.
  @ReferenceName('guidanceGroupBorderPolygon')
  late final Column<int> borderPolygon = integer()
      .references(Polygons, #id)
      .nullable()();
}

/// A [GuidanceGroup] extended with all children/refs loaded.
class GuidanceGroupWithRefs extends GuidanceGroup {
  /// A [GuidanceGroup] extended with all children/refs loaded.
  factory GuidanceGroupWithRefs({
    required GuidanceGroup guidanceGroup,
    PolygonWithRefs? borderPolygonObj,
    List<GuidancePatternWithRefs>? guidancePatterns,
  }) => GuidanceGroupWithRefs._(
    id: guidanceGroup.id,
    name: guidanceGroup.name,
    createdAt: guidanceGroup.createdAt,
    lastUpdatedAt: guidanceGroup.lastUpdatedAt,
    borderPolygon: guidanceGroup.borderPolygon,
    borderPolygonObj: borderPolygonObj,
    guidancePatterns: guidancePatterns ?? [],
  );
  const GuidanceGroupWithRefs._({
    required super.id,
    required super.createdAt,
    super.name,
    super.lastUpdatedAt,
    super.borderPolygon,
    this.borderPolygonObj,
    this.guidancePatterns = const [],
  });

  /// The loaded optional border polygon.
  final PolygonWithRefs? borderPolygonObj;

  /// The loaded guidance patterns.
  final List<GuidancePatternWithRefs> guidancePatterns;
}
