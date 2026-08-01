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
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

part 'tasks_dao.drift.dart';

/// A database accessor object for [Tasks] related interactions.
@DriftAccessor(tables: [Connections, GuidanceAllocations, Tasks])
class TasksDao extends DatabaseAccessor<Database> with _$TasksDaoMixin {
  /// A database accessor object for [Tasks] related interactions.
  TasksDao(super.attachedDatabase);

  /// Insert [task] into the database.
  Future<int> insertTask(TaskWithRefs task) async {
    final createdTask = await managers.tasks.create(
      (_) => task.toCompanion(true).copyWith(id: const Value.absent()),
    );

    await managers.guidanceAllocations.bulkCreate(
      (_) => task.guidanceAllocations.map(
        (guidanceAllocation) => guidanceAllocation
            .toCompanion(true)
            .copyWith(
              id: const Value.absent(),
              task: Value(createdTask),
            ),
      ),
    );

    await managers.connections.bulkCreate(
      (_) => task.connections.map(
        (connection) =>
            connection.toCompanion(true).copyWith(task: Value(createdTask)),
      ),
    );

    Logger.instance.i('Inserted task $createdTask: ${task.name}.');

    return createdTask;
  }

  /// Update [task] in the database.
  Future<void> updateTask(TaskWithRefs task) async {
    await managers.tasks.replace(
      task.toCompanion(true).copyWith(lastUpdatedAt: Value(DateTime.now())),
    );
    // GuidanceAllocations
    {
      final existingIds = task.guidanceAllocations
          .map((p) => p.id)
          .where((id) => id > 0);

      final newGuidanceAllocations = task.guidanceAllocations
          .where((l) => l.id < 0)
          .toList();
      final newIds = await Future.wait(
        newGuidanceAllocations.map(
          (guidanceAllocation) => managers.guidanceAllocations.create(
            (_) => guidanceAllocation
                .toCompanion(true)
                .copyWith(
                  id: const Value.absent(),
                  task: Value(task.id),
                ),
          ),
        ),
      );
      final ids = [
        existingIds,
        newIds,
      ].flattenedToList;

      await managers.guidanceAllocations
          .filter(
            (f) => f.task.id.equals(task.id) & f.guidanceGroup.id.not.isIn(ids),
          )
          .delete();

      await managers.guidanceAllocations.bulkCreate(
        (o) => ids.map(
          (id) => o(task: task.id, guidanceGroup: id),
        ),
        onConflict: DoNothing(),
      );
    }
    Logger.instance.i('Updated task ${task.id}: ${task.name}.');
  }

  /// Get the object with [id] from the database. Child objects/refs will also
  /// be loaded.
  Future<TaskWithRefs> getTask(int id) async {
    final task = await managers.tasks
        .filter((t) => t.id.equals(id))
        .getSingle();

    final partfieldObj = task.partfield != null
        ? await attachedDatabase.partfieldsDao.getPartfield(task.partfield!)
        : null;

    final guidanceAllocations = await Future.wait(
      await managers.guidanceAllocations
          .filter((g) => g.task.id.equals(id))
          .map((row) => row.id)
          .get()
          .then(
            (ids) => ids.map(
              (id) =>
                  attachedDatabase.guidanceAllocationsDao.getGuidanceAllocation(
                    id,
                    preloadedTask: task,
                  ),
            ),
          ),
    );

    final connections = await managers.connections
        .filter((c) => c.task.id.equals(id))
        .withReferences(
          (prefetch) => prefetch(childConnector: true, parentConnector: true),
        )
        .asyncMap(
          (row) async {
            final parentConnector =
                row.$2.parentConnector.prefetchedData!.first;

            final parentVehicle = await managers.vehicles
                .filter((v) => v.id.equals(parentConnector.vehicleId))
                .withReferences((prefetch) => prefetch(connectorVehicle: true))
                .limit(1)
                .map(
                  (vehicleRow) => vehicleRow.$1.copyWith(
                    connectors: vehicleRow.$2.connectorVehicle.prefetchedData,
                  ),
                )
                .getSingleOrNull();

            final parentImplement = await managers.implements
                .filter((v) => v.id.equals(parentConnector.implementId))
                .withReferences(
                  (prefetch) => prefetch(
                    connectorImplement: true,
                    sectionImplement: true,
                  ),
                )
                .limit(1)
                .map(
                  (row) => row.$1.copyWith(
                    connectors: row.$2.connectorImplement.prefetchedData,
                    sections: row.$2.sectionImplement.prefetchedData,
                  ),
                )
                .getSingleOrNull();

            final childConnector = row.$2.childConnector.prefetchedData!.first;

            final childImplement = await managers.implements
                .filter((v) => v.id.equals(childConnector.implementId))
                .withReferences(
                  (prefetch) => prefetch(
                    connectorImplement: true,
                    sectionImplement: true,
                  ),
                )
                .limit(1)
                .map(
                  (row) => row.$1.copyWith(
                    connectors: row.$2.connectorImplement.prefetchedData,
                    sections: row.$2.sectionImplement.prefetchedData,
                  ),
                )
                .getSingleOrNull();

            return ConnectionWithRefs(
              connection: row.$1,
              taskObj: task,
              parentConnectorObj: ConnectorWithRefs(
                connector: parentConnector,
                vehicle: parentVehicle,
                implement: parentImplement,
              ),
              childConnectorObj: ConnectorWithRefs(
                connector: childConnector,
                implement: childImplement,
              ),
            );
          },
        )
        .get();

    return TaskWithRefs(
      task: task,
      partfieldObj: partfieldObj,
      guidanceAllocations: guidanceAllocations,
      connections: connections,
    );
  }

  /// Get objects from the database. [limit], [offset] and [orderBy] can be
  /// set to alter the query.
  Future<List<TaskWithRefs>> list({
    int limit = 10,
    int? offset,
    ComposableOrdering Function($$TasksTableOrderingComposer)? orderBy,
  }) async => Future.wait(
    await managers.tasks
        .orderBy(
          orderBy ??
              (t) => t.lastUpdatedAt.desc(nulls: .last) & t.createdAt.desc(),
        )
        .limit(limit, offset: offset)
        .map(
          (row) => getTask(row.id),
        )
        .get(),
  );
}
