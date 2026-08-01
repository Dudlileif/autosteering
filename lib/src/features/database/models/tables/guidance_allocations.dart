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

/// A table for allocations of [GuidanceGroups] bindings in [Tasks].
class GuidanceAllocations extends Table with TableTimestamps {
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
}

/// A [GuidanceAllocation] extended with all children/refs loaded.
class GuidanceAllocationWithRefs extends GuidanceAllocation {
  /// A [GuidanceAllocation] extended with all children/refs loaded.
  factory GuidanceAllocationWithRefs({
    required GuidanceAllocation guidanceAllocation,
    required GuidanceGroupWithRefs guidanceGroupObj,
    required Task taskObj,
  }) => GuidanceAllocationWithRefs._(
    id: guidanceAllocation.id,
    task: guidanceAllocation.task,
    guidanceGroup: guidanceAllocation.guidanceGroup,
    createdAt: guidanceAllocation.createdAt,
    lastUpdatedAt: guidanceAllocation.lastUpdatedAt,
    guidanceGroupObj: guidanceGroupObj,
    taskObj: taskObj,
  );

  const GuidanceAllocationWithRefs._({
    required super.id,
    required super.task,
    required super.guidanceGroup,
    required this.guidanceGroupObj,
    required this.taskObj,
    required super.createdAt,
    super.lastUpdatedAt,
  });

  /// The loaded guidance group.
  final GuidanceGroupWithRefs guidanceGroupObj;

  /// The loaded task.
  final Task taskObj;
}
