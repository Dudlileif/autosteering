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
import 'package:autosteering/src/features/database/models/models.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:autosteering/src/features/equipment/equipment.dart'
    show Equipment;
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

part 'implements_dao.drift.dart';

/// A database accessor object for [Implements] related interactions.
@DriftAccessor(tables: [Connectors, Implements, Sections])
class ImplementsDao extends DatabaseAccessor<Database>
    with _$ImplementsDaoMixin {
  /// A database accessor object for [Implements] related interactions.
  ImplementsDao(super.attachedDatabase);

  /// Insert [implement] into the database.
  Future<int> insertImplement(Equipment implement) async {
    final implementId = await managers.implements.create(
      (o) => o(
        id: const Value.absent(),
        name: Value.absentIfNull(implement.name),
        createdAt: Value.absentIfNull(implement.createdAt),
        lastUpdatedAt: Value.absentIfNull(implement.lastUpdatedAt),
      ),
    );

    await managers.connectors.bulkCreate(
      (o) => implement.connectors.map(
        (connector) => o(
          longitudinalOffsetFromRef: connector.longitudinalOffsetFromRef,
          lateralOffsetFromRef: connector.lateralOffsetFromRef,
          type: connector.type,
          relation: connector.relation,
          implement: Value(implementId),
          id: const Value.absent(),
          verticalOffsetFromRef: Value.absentIfNull(
            connector.verticalOffsetFromRef,
          ),
          angle: connector.angle,
          createdAt: Value.absentIfNull(connector.createdAt),
          lastUpdatedAt: Value.absentIfNull(connector.lastUpdatedAt),
        ),
      ),
    );

    await managers.sections.bulkCreate(
      (o) => implement.sections.map(
        (section) => o(
          id: Value.absentIfNull(section.id),
          implement: implementId,
          longitudinalOffset: section.longitudinalOffset,
          lateralOffset: section.lateralOffset,
          width: section.width,
          workingWidth: section.workingWidth,
          length: section.length,
          color: Value.absentIfNull(section.color),
          workedPathColor: Value.absentIfNull(
            section.workedPathColor,
          ),
          createdAt: Value.absentIfNull(section.createdAt),
          lastUpdatedAt: Value.absentIfNull(section.lastUpdatedAt),
        ),
      ),
    );

    Logger.instance.i(
      '''Inserted implement $implementId: ${implement.name} with ${implement.connectors.length} connectors and ${implement.sections.length} sections.''',
    );

    return implementId;
  }

  /// Update [implement] in the database.
  Future<void> updateImplement(Equipment implement) async {
    await managers.implements
        .filter((i) => i.id.equals(implement.id))
        .update(
          (o) => o(
            name: Value(implement.name),
            lastUpdatedAt: Value(DateTime.now()),
          ),
        );

    // Connectors
    {
      final existingIds = implement.connectors
          .where(
            (c) => c.id != null && c.id! > 0,
          )
          .map((c) => c.id!);

      final newConnectors = implement.connectors.where(
        (c) => c.id == null || c.id! < 0,
      );

      final newIds = await Future.wait(
        newConnectors.map(
          (connector) => managers.connectors.create(
            (o) => o(
              longitudinalOffsetFromRef: connector.longitudinalOffsetFromRef,
              lateralOffsetFromRef: connector.lateralOffsetFromRef,
              type: connector.type,
              relation: connector.relation,
              implement: Value(implement.id),
              id: const Value.absent(),
              verticalOffsetFromRef: Value.absentIfNull(
                connector.verticalOffsetFromRef,
              ),
              angle: connector.angle,
              createdAt: Value.absentIfNull(connector.createdAt),
              lastUpdatedAt: Value.absentIfNull(connector.lastUpdatedAt),
            ),
          ),
        ),
      );
      final ids = [existingIds, newIds].flattenedToList;

      await managers.connectors
          .filter(
            (c) => c.implement.id.equals(implement.id) & c.id.not.isIn(ids),
          )
          .delete();
    }
    // Sections
    {
      final existingIds = implement.sections
          .where(
            (c) => c.id != null && c.id! > 0,
          )
          .map((c) => c.id!);

      final newSections = implement.sections.where(
        (c) => c.id == null || c.id! < 0,
      );

      final newIds = await Future.wait(
        newSections.map(
          (section) => managers.sections.create(
            (o) => o(
              id: Value.absentIfNull(section.id),
              implement: implement.id!,
              longitudinalOffset: section.longitudinalOffset,
              lateralOffset: section.lateralOffset,
              width: section.width,
              workingWidth: section.workingWidth,
              length: section.length,
              color: Value.absentIfNull(section.color),
              workedPathColor: Value.absentIfNull(
                section.workedPathColor,
              ),
              createdAt: Value.absentIfNull(section.createdAt),
              lastUpdatedAt: Value.absentIfNull(section.lastUpdatedAt),
            ),
          ),
        ),
      );
      final ids = [existingIds, newIds].flattenedToList;

      await managers.sections
          .filter(
            (c) => c.implement.id.equals(implement.id) & c.id.not.isIn(ids),
          )
          .delete();
    }
    Logger.instance.i('Updated implement ${implement.id}: ${implement.name}.');
  }

  /// Get the object with [id] from the database. Child objects/refs will also
  /// be loaded.
  Future<Equipment> getImplement(int id) async => attachedDatabase
      .managers
      .implements
      .filter((v) => v.id.equals(id))
      .withReferences(
        (prefetch) =>
            prefetch(connectorImplement: true, sectionImplement: true),
      )
      .map(
        (row) => row.$1.copyWith(
          connectors: row.$2.connectorImplement.prefetchedData,
          sections: row.$2.sectionImplement.prefetchedData,
        ),
      )
      .getSingle();

  /// Get objects from the database. [limit], [offset] and [orderBy] can be
  /// set to alter the query.
  Future<List<Equipment>> list({
    int limit = 10,
    int? offset,
    ComposableOrdering Function($$ImplementsTableOrderingComposer)? orderBy,
  }) async => managers.implements
      .orderBy(
        orderBy ??
            (implement) =>
                implement.lastUpdatedAt.desc(nulls: .last) &
                implement.createdAt.desc(),
      )
      .withReferences(
        (prefetch) =>
            prefetch(connectorImplement: true, sectionImplement: true),
      )
      .limit(limit, offset: offset)
      .map(
        (row) => row.$1.copyWith(
          connectors: row.$2.connectorImplement.prefetchedData,
          sections: row.$2.sectionImplement.prefetchedData,
        ),
      )
      .get();
}
