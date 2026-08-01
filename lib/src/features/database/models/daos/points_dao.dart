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
import 'package:drift/drift.dart';

part 'points_dao.drift.dart';

/// A database accessor object for [Points] related interactions.
@DriftAccessor(tables: [Points])
class PointsDao extends DatabaseAccessor<Database> with _$PointsDaoMixin {
  /// A database accessor object for [Points] related interactions.
  PointsDao(super.attachedDatabase);

  /// Insert [point] into the database.
  Future<int> insertPoint(Point point) async {
    final id = await managers.points.create(
      (_) => point.toCompanion(true).copyWith(id: const Value.absent()),
    );
    Logger.instance.i(
      'Inserted point ${point.id}: ${point.name}, ${point.type}.',
    );
    return id;
  }

  /// Insert [points] into the database.
  Future<List<int>> insertPoints(List<Point> points) async {
    final prevMaxPointId =
        await managers.points
            .orderBy((p) => p.id.desc())
            .limit(1)
            .map((p) => p.id)
            .getSingleOrNull() ??
        0;

    await managers.points.bulkCreate(
      (_) => points.map(
        (p) => p.toCompanion(true).copyWith(id: const Value.absent()),
      ),
    );
    Logger.instance.i('Inserted points: ${points.length}.');

    return managers.points
        .filter((p) => p.id.isBiggerThan(prevMaxPointId))
        .map((p) => p.id)
        .get();
  }

  /// Update [point] in the database.
  Future<void> updatePoint(Point point) async {
    await managers.points.replace(
      point.toCompanion(true).copyWith(lastUpdatedAt: Value(DateTime.now())),
    );

    Logger.instance.i(
      'Updated point ${point.id}: ${point.name}, ${point.type}.',
    );
  }

  /// Get the object with [id] from the database.
  Future<Point> getPoint(int id) async =>
      managers.points.filter((p) => p.id.equals(id)).getSingle();
}
