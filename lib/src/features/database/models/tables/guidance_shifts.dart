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
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';

/// A table with elements for describing how [GuidancePatterns] or
/// [GuidanceGroups] can be shifted in [GuidanceAllocations].
///
/// These shifts can be used to move the baseline for creating the waylines,
/// but keep the same [GuidancePattern] as reference shape.
class GuidanceShifts extends Table {
  /// Reference to the parent [GuidanceAllocation].
  @ReferenceName('guidanceShiftGuidanceAllocation')
  late final Column<int> guidanceAllocation = integer().references(
    GuidanceAllocations,
    #id,
  )();

  /// Reference to a [GuidanceGroup].
  @ReferenceName('guidanceShiftGuidanceGroup')
  late final Column<int> guidanceGroup = integer()
      .references(
        GuidanceGroups,
        #id,
      )
      .nullable()();

  /// Reference to a [GuidancePattern].
  @ReferenceName('guidanceShiftGuidancePattern')
  late final Column<int> guidancePattern = integer()
      .references(
        GuidancePatterns,
        #id,
      )
      .nullable()();

  /// Offset distance in millimeters in the east direction from point A of the
  /// pattern.
  late final Column<int> eastShift = integer().nullable()();

  /// Offset distance in millimeters in the north direction from point A of the
  /// pattern.
  late final Column<int> northShift = integer().nullable()();

  /// Perpendicular offset millimeters from the direction of the pattern.
  ///
  /// Negative values shifts the pattern to the left and positive values
  /// shifts the pattern to the right.
  late final Column<int> propagationOffset = integer().nullable()();
}
