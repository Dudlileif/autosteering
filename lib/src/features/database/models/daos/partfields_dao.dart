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
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

part 'partfields_dao.drift.dart';

/// A database accessor object for [Partfields] related interactions.
@DriftAccessor(
  tables: [
    PartfieldGuidanceGroups,
    PartfieldLineStrings,
    PartfieldPoints,
    PartfieldPolygons,
    Partfields,
    Points,
  ],
)
class PartfieldsDao extends DatabaseAccessor<Database>
    with _$PartfieldsDaoMixin {
  /// A database accessor object for [Partfields] related interactions.
  PartfieldsDao(super.attachedDatabase);

  /// Insert [partfield] into the database.
  Future<int> insertPartfield(PartfieldWithRefs partfield) async {
    final createdPartfield = await managers.partfields.create(
      (_) => partfield.toCompanion(true).copyWith(id: const Value.absent()),
    );

    for (final guidanceGroup in partfield.guidanceGroups) {
      if (guidanceGroup.id < 0) {
        final createdGuidanceGroup = await attachedDatabase.guidanceGroupsDao
            .insertGuidanceGroup(
              guidanceGroup,
            );
        await managers.partfieldGuidanceGroups.create(
          (o) => o(
            partfield: createdPartfield,
            guidanceGroup: createdGuidanceGroup,
          ),
        );
      } else {
        await managers.partfieldGuidanceGroups.create(
          (o) => o(
            partfield: createdPartfield,
            guidanceGroup: guidanceGroup.id,
          ),
        );
      }
    }

    for (final polygon in partfield.polygons) {
      if (polygon.id < 0) {
        final createdPolygon = await attachedDatabase.polygonsDao.insertPolygon(
          polygon,
        );
        await managers.partfieldPolygons.create(
          (o) => o(
            partfield: createdPartfield,
            polygon: createdPolygon,
          ),
        );
      } else {
        await managers.partfieldPolygons.create(
          (o) => o(
            partfield: createdPartfield,
            polygon: polygon.id,
          ),
        );
      }
    }

    for (final lineString in partfield.lineStrings) {
      if (lineString.id < 0) {
        final createdLineString = await attachedDatabase.lineStringsDao
            .insertLineString(
              lineString,
            );
        await managers.partfieldLineStrings.create(
          (o) => o(
            partfield: createdPartfield,
            lineString: createdLineString,
          ),
        );
      } else {
        await managers.partfieldLineStrings.create(
          (o) => o(
            partfield: createdPartfield,
            lineString: lineString.id,
          ),
        );
      }
    }
    // Points
    {
      final existingPointIds = partfield.points
          .map((p) => p.id)
          .where((id) => id > 0);

      final newPoints = partfield.points.where((l) => l.id < 0).toList();
      final newPointIds = await attachedDatabase.pointsDao.insertPoints(
        newPoints,
      );
      final pointIds = [
        existingPointIds,
        newPointIds,
      ].flattenedToList;
      await managers.partfieldPoints.bulkCreate(
        (o) => pointIds.map(
          (id) => o(partfield: partfield.id, point: id),
        ),
      );
    }

    Logger.instance.i(
      'Inserted partfield $createdPartfield: ${partfield.name}.',
    );

    return createdPartfield;
  }

  /// Update [partfield] in the database.
  Future<void> updatePartfield(PartfieldWithRefs partfield) async {
    await managers.partfields.replace(
      partfield
          .toCompanion(true)
          .copyWith(lastUpdatedAt: Value(DateTime.now())),
    );
    // GuidanceGroups
    {
      final existingIds = partfield.guidanceGroups
          .map((p) => p.id)
          .where((id) => id > 0);

      final newGuidanceGroups = partfield.guidanceGroups
          .where((l) => l.id < 0)
          .toList();
      final newIds = await Future.wait(
        newGuidanceGroups.map(
          (guidanceGroup) => attachedDatabase.guidanceGroupsDao
              .insertGuidanceGroup(guidanceGroup),
        ),
      );
      final ids = [
        existingIds,
        newIds,
      ].flattenedToList;

      await managers.partfieldGuidanceGroups
          .filter(
            (f) =>
                f.partfield.id.equals(partfield.id) &
                f.guidanceGroup.id.not.isIn(ids),
          )
          .delete();

      await managers.partfieldGuidanceGroups.bulkCreate(
        (o) => ids.map(
          (id) => o(partfield: partfield.id, guidanceGroup: id),
        ),
        onConflict: DoNothing(),
      );
    }
    // Polygons
    {
      final existingIds = partfield.polygons
          .map((p) => p.id)
          .where((id) => id > 0);

      final newPolygons = partfield.polygons.where((l) => l.id < 0).toList();
      final newIds = await Future.wait(
        newPolygons.map(
          (polygon) => attachedDatabase.polygonsDao.insertPolygon(polygon),
        ),
      );
      final ids = [
        existingIds,
        newIds,
      ].flattenedToList;

      await managers.partfieldPolygons
          .filter(
            (f) =>
                f.partfield.id.equals(partfield.id) &
                f.polygon.id.not.isIn(ids),
          )
          .delete();

      await managers.partfieldPoints.bulkCreate(
        (o) => ids.map(
          (id) => o(partfield: partfield.id, point: id),
        ),
        onConflict: DoNothing(),
      );
    }

    // LineStrings
    {
      final existingIds = partfield.lineStrings
          .map((p) => p.id)
          .where((id) => id > 0);

      final newLineStrings = partfield.lineStrings
          .where((l) => l.id < 0)
          .toList();
      final newIds = await Future.wait(
        newLineStrings.map(
          (lineString) =>
              attachedDatabase.lineStringsDao.insertLineString(lineString),
        ),
      );
      final ids = [
        existingIds,
        newIds,
      ].flattenedToList;

      await managers.partfieldLineStrings
          .filter(
            (f) =>
                f.partfield.id.equals(partfield.id) &
                f.lineString.id.not.isIn(ids),
          )
          .delete();

      await managers.partfieldLineStrings.bulkCreate(
        (o) => ids.map(
          (id) => o(partfield: partfield.id, lineString: id),
        ),
        onConflict: DoNothing(),
      );
    }
    // Points
    {
      final existingIds = partfield.points
          .map((p) => p.id)
          .where((id) => id > 0);

      final newPoints = partfield.points.where((l) => l.id < 0).toList();
      final newIds = await attachedDatabase.pointsDao.insertPoints(
        newPoints,
      );
      final ids = [
        existingIds,
        newIds,
      ].flattenedToList;

      await managers.partfieldPoints
          .filter(
            (f) =>
                f.partfield.id.equals(partfield.id) & f.point.id.not.isIn(ids),
          )
          .delete();

      await managers.partfieldPoints.bulkCreate(
        (o) => ids.map(
          (id) => o(partfield: partfield.id, point: id),
        ),
        onConflict: DoNothing(),
      );
    }
    Logger.instance.i('Updated partfield ${partfield.id}: ${partfield.name}.');
  }

  /// Get the object with [id] from the database. Child objects/refs will also
  /// be loaded.
  Future<PartfieldWithRefs> getPartfield(int id) async {
    final partfield = await managers.partfields
        .filter((f) => f.id.equals(id))
        .getSingle();

    final guidanceGroups = await Future.wait(
      await managers.partfieldGuidanceGroups
          .filter((g) => g.partfield.id.equals(id))
          .map((row) => row.guidanceGroup)
          .get()
          .then(
            (ids) async => ids.map(
              (id) => attachedDatabase.guidanceGroupsDao.getGuidanceGroup(id),
            ),
          ),
    );

    final polygons = await Future.wait(
      await managers.partfieldPolygons
          .filter((g) => g.partfield.id.equals(id))
          .map((row) => row.polygon)
          .get()
          .then(
            (ids) async => ids.map(
              (id) => attachedDatabase.polygonsDao.getPolygon(id),
            ),
          ),
    );

    final lineStrings = await Future.wait(
      await managers.partfieldLineStrings
          .filter((g) => g.partfield.id.equals(id))
          .map((row) => row.lineString)
          .get()
          .then(
            (ids) async => ids.map(
              (id) => attachedDatabase.lineStringsDao.getLineString(id),
            ),
          ),
    );

    return PartfieldWithRefs(
      partfield: partfield,
      parent: partfield.parentField != null
          ? await getPartfield(partfield.parentField!)
          : null,
      guidanceGroups: guidanceGroups,
      polygons: polygons,
      lineStrings: lineStrings,
      points:
          await (select(points).join([
                innerJoin(
                  partfieldPoints,
                  partfieldPoints.point.equalsExp(
                    points.id,
                  ),
                  useColumns: false,
                ),
              ])..where(partfieldPoints.partfield.equals(id)))
              .map((row) => row.readTable(points))
              .get(),
    );
  }

  /// Get objects from the database. [limit], [offset] and [orderBy] can be
  /// set to alter the query.
  Future<List<PartfieldWithRefs>> list({
    int limit = 10,
    int? offset,
    ComposableOrdering Function($$PartfieldsTableOrderingComposer)? orderBy,
  }) async => Future.wait(
    await managers.partfields
        .orderBy(
          orderBy ??
              (p) => p.lastUpdatedAt.desc(nulls: .last) & p.createdAt.desc(),
        )
        .limit(limit, offset: offset)
        .map(
          (row) => getPartfield(row.id),
        )
        .get(),
  );
}
