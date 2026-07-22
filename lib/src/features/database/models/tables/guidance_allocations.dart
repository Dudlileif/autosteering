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

/// A table for allocations of [GuidanceGroups] bindings in [Tasks].
class GuidanceAllocations extends Table {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// Reference to a [Task].
  @ReferenceName('guidanceAllocationTask')
  late final Column<int> task = integer().references(Tasks, #id)();

  /// Reference to a [GuidanceGroup].
  @ReferenceName('guidanceAllocationGuidanceGroup')
  late final Column<int> guidanceGroup = integer().references(
    GuidanceGroups,
    #id,
  )();

  /// When this was created.
  late final Column<DateTime> createdAt = dateTime().clientDefault(
    DateTime.now,
  )();

  /// When this was last updated.
  late final Column<DateTime> lastUpdatedAt = dateTime().nullable()();
}
