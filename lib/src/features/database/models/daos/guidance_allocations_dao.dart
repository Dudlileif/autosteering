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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/database/database.dart';
import 'package:autosteering/src/features/database/models/daos/tasks_dao.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';

part 'guidance_allocations_dao.drift.dart';

@DriftAccessor(tables: [GuidanceAllocations])
/// A database accessor object for [GuidanceAllocations] related interactions.
class GuidanceAllocationsDao extends DatabaseAccessor<Database>
    with _$GuidanceAllocationsDaoMixin {
  /// A database accessor object for [GuidanceAllocations] related interactions.
  GuidanceAllocationsDao(super.attachedDatabase);

  /// Insert [guidanceAllocation] into the database.
  Future<int> insertGuidanceAllocation(
    GuidanceAllocationWithRefs guidanceAllocation,
  ) async {
    final id = await managers.guidanceAllocations.create(
      (_) => guidanceAllocation
          .toCompanion(true)
          .copyWith(id: const Value.absent()),
    );
    Logger.instance.i('Inserted guidance allocation $id.');

    return id;
  }

  /// Update [guidanceAllocation] in the database.
  Future<void> updateGuidanceAllocation(
    GuidanceAllocationWithRefs guidanceAllocation,
  ) async {
    await managers.guidanceAllocations.replace(
      guidanceAllocation
          .toCompanion(true)
          .copyWith(lastUpdatedAt: Value(DateTime.now())),
    );
    Logger.instance.i('Updated guidance allocation $guidanceAllocation.');
  }

  /// Get the object with [id] from the database. Child objects/refs will also
  /// be loaded.
  ///
  /// [preloadedTask] must used when possible to stop looping. If not set, it
  /// will run [TasksDao.getTask] and set it for subsequent loops.
  Future<GuidanceAllocationWithRefs> getGuidanceAllocation(
    int id, {
    Task? preloadedTask,
  }) async {
    final guidanceAllocation = await managers.guidanceAllocations
        .filter((p) => p.id.equals(id))
        .getSingle();

    final guidanceGroup = await attachedDatabase.guidanceGroupsDao
        .getGuidanceGroup(
          guidanceAllocation.guidanceGroup,
        );

    final task =
        preloadedTask ??
        await attachedDatabase.tasksDao.getTask(
          guidanceAllocation.task,
        );

    return GuidanceAllocationWithRefs(
      guidanceAllocation: guidanceAllocation,
      guidanceGroupObj: guidanceGroup,
      taskObj: task,
    );
  }
}
