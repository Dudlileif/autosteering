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

part 'line_strings_dao.drift.dart';

/// A database accessor object for [LineStrings] related interactions.
@DriftAccessor(tables: [LineStringPoints, LineStrings, Points])
class LineStringsDao extends DatabaseAccessor<Database>
    with _$LineStringsDaoMixin {
  /// A database accessor object for [LineStrings] related interactions.
  LineStringsDao(super.attachedDatabase);

  /// Insert [lineString] into the database.
  Future<int> insertLineString(LineStringWithRefs lineString) async {
    final createdLineString = await managers.lineStrings.create(
      (_) => lineString.toCompanion(true).copyWith(id: const Value.absent()),
    );

    final pointIds = await attachedDatabase.pointsDao.insertPoints(
      lineString.points,
    );

    await managers.lineStringPoints.bulkCreate(
      (o) => pointIds.map(
        (id) => o(lineString: createdLineString, point: id),
      ),
    );

    Logger.instance.i(
      '''Inserted line string $createdLineString: ${lineString.name}, ${lineString.type}.''',
    );

    return createdLineString;
  }

  /// Update [lineString] in the database.
  Future<void> updateLineString(
    LineStringWithRefs lineString,
  ) async {
    await managers.lineStrings.replace(
      lineString
          .toCompanion(true)
          .copyWith(lastUpdatedAt: Value(DateTime.now())),
    );

    await managers.lineStringPoints
        .filter((f) => f.lineString.id.equals(lineString.id))
        .delete();

    final existingPointIds = lineString.points
        .map((p) => p.id)
        .where((id) => id > 0);

    final newPoints = lineString.points.where((p) => p.id < 0).toList();
    final newPointIds = switch (newPoints) {
      [_, ...] => await attachedDatabase.pointsDao.insertPoints(
        newPoints,
      ),
      _ => <int>[],
    };
    final ids = [existingPointIds, newPointIds].flattenedToList;

    await managers.lineStringPoints.bulkCreate(
      (o) => ids.map(
        (id) => o(lineString: lineString.id, point: id),
      ),
    );

    Logger.instance.i(
      '''Updated line string ${lineString.id}: ${lineString.name}, ${lineString.type}.''',
    );
  }

  /// Get the object with [id] from the database. Child objects/refs will also
  /// be loaded.
  Future<LineStringWithRefs> getLineString(int id) async {
    final lineString = await managers.lineStrings
        .filter((l) => l.id.equals(id))
        .getSingle();

    return LineStringWithRefs(
      lineString: lineString,
      points:
          await (select(points).join(
                [
                  innerJoin(
                    lineStringPoints,
                    lineStringPoints.point.equalsExp(
                      points.id,
                    ),
                    useColumns: false,
                  ),
                ],
              )..where(
                lineStringPoints.lineString.equals(
                  id,
                ),
              ))
              .map((row) => row.readTable(points))
              .get(),
    );
  }
}
