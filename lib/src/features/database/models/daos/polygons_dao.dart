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

part 'polygons_dao.drift.dart';

/// A database accessor object for [Polygons] related interactions.
@DriftAccessor(tables: [PolygonLineStrings, Polygons])
class PolygonsDao extends DatabaseAccessor<Database> with _$PolygonsDaoMixin {
  /// A database accessor object for [Polygons] related interactions.
  PolygonsDao(super.attachedDatabase);

  /// Insert [polygon] into the database.
  Future<int> insertPolygon(PolygonWithRefs polygon) async {
    final createdPolygon = await managers.polygons.create(
      (o) => polygon.toCompanion(true).copyWith(id: const Value.absent()),
    );

    for (final lineString in polygon.lineStrings) {
      if (lineString.id < 0) {
        final createdLineString = await attachedDatabase.lineStringsDao
            .insertLineString(lineString);
        await managers.polygonLineStrings.create(
          (o) => o(
            polygon: createdPolygon,
            lineString: createdLineString,
          ),
        );
      } else {
        await managers.polygonLineStrings.create(
          (o) => o(
            polygon: createdPolygon,
            lineString: lineString.id,
          ),
        );
      }
    }

    Logger.instance.i(
      'Insertered polygon ${polygon.id}: ${polygon.name}, ${polygon.type}.',
    );

    return createdPolygon;
  }

  /// Update [polygon] in the database.
  Future<void> updatePolygon(PolygonWithRefs polygon) async {
    await managers.polygons.replace(
      polygon.toCompanion(true).copyWith(lastUpdatedAt: Value(DateTime.now())),
    );

    final existingLineStringIds = polygon.lineStrings
        .map((p) => p.id)
        .where((id) => id > 0);

    final newLineStrings = polygon.lineStrings.where((l) => l.id < 0).toList();
    final newLineStringIds = await Future.wait(
      newLineStrings.map(
        (lineString) =>
            attachedDatabase.lineStringsDao.insertLineString(lineString),
      ),
    );
    final lineStringIds = [
      existingLineStringIds,
      newLineStringIds,
    ].flattenedToList;

    await managers.polygonLineStrings
        .filter(
          (f) =>
              f.polygon.id.equals(polygon.id) &
              f.lineString.id.not.isIn(lineStringIds),
        )
        .delete();

    await managers.polygonLineStrings.bulkCreate(
      (o) => lineStringIds.map(
        (id) => o(polygon: polygon.id, lineString: id),
      ),
      onConflict: DoNothing(),
    );
    Logger.instance.i(
      'Updated polygon ${polygon.id}: ${polygon.name}, ${polygon.type}.',
    );
  }

  /// Get the object with [id] from the database. Child objects/refs will also
  /// be loaded.
  Future<PolygonWithRefs> getPolygon(int id) async {
    final polygon = await managers.polygons
        .filter((p) => p.id.equals(id))
        .getSingle();

    final lineStrings = await Future.wait(
      await managers.polygonLineStrings
          .filter((g) => g.polygon.id.equals(id))
          .map((row) => row.lineString)
          .get()
          .then(
            (ids) async => ids.map(
              (id) => attachedDatabase.lineStringsDao.getLineString(id),
            ),
          ),
    );

    return PolygonWithRefs(
      polygon: polygon,
      lineStrings: lineStrings,
    );
  }
}
