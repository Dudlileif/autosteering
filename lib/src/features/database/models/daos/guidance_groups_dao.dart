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

part 'guidance_groups_dao.drift.dart';

/// A database accessor object for [GuidanceGroups] related interactions.
@DriftAccessor(tables: [GuidanceGroupPatterns, GuidanceGroups])
class GuidanceGroupsDao extends DatabaseAccessor<Database>
    with _$GuidanceGroupsDaoMixin {
  /// A database accessor object for [GuidanceGroups] related interactions.
  GuidanceGroupsDao(super.attachedDatabase);

  /// Insert [guidanceGroup] into the database.
  Future<int> insertGuidanceGroup(GuidanceGroupWithRefs guidanceGroup) async {
    var borderPolygonId = guidanceGroup.borderPolygon;
    if (guidanceGroup.borderPolygonObj case final polygon?
        when polygon.id < 0) {
      borderPolygonId = await attachedDatabase.polygonsDao.insertPolygon(
        polygon,
      );
    }

    final createdGuidanceGroup = await managers.guidanceGroups.create(
      (o) => guidanceGroup
          .toCompanion(true)
          .copyWith(
            id: const Value.absent(),
            borderPolygon: Value.absentIfNull(borderPolygonId),
          ),
    );

    for (final guidancePattern in guidanceGroup.guidancePatterns) {
      if (guidancePattern.id < 0) {
        final createdGuidancePattern = await attachedDatabase
            .guidancePatternsDao
            .insertGuidancePattern(guidancePattern);
        await managers.guidanceGroupPatterns.create(
          (o) => o(
            guidanceGroup: createdGuidanceGroup,
            guidancePattern: createdGuidancePattern,
          ),
        );
      } else {
        await managers.guidanceGroupPatterns.create(
          (o) => o(
            guidanceGroup: createdGuidanceGroup,
            guidancePattern: guidancePattern.id,
          ),
        );
      }
    }
    Logger.instance.i(
      'Inserted guidance groupd $createdGuidanceGroup: ${guidanceGroup.name}.',
    );

    return createdGuidanceGroup;
  }

  /// Update [guidanceGroup] in the database.
  Future<void> updateGuidanceGrouo(GuidanceGroupWithRefs guidanceGroup) async {
    var borderPolygonId = guidanceGroup.borderPolygon;
    if (guidanceGroup.borderPolygonObj case final polygon?
        when polygon.id < 0) {
      borderPolygonId = await attachedDatabase.polygonsDao.insertPolygon(
        polygon,
      );
    }

    await managers.guidanceGroups.replace(
      guidanceGroup
          .toCompanion(true)
          .copyWith(
            borderPolygon: Value.absentIfNull(borderPolygonId),
            lastUpdatedAt: Value(DateTime.now()),
          ),
    );

    final existingGuidancePatternIds = guidanceGroup.guidancePatterns
        .map((p) => p.id)
        .where((id) => id > 0);

    final newGuidancePatterns = guidanceGroup.guidancePatterns
        .where((l) => l.id < 0)
        .toList();
    final newGuidancePatternIds = await Future.wait(
      newGuidancePatterns.map(
        (guidancePattern) => attachedDatabase.guidancePatternsDao
            .insertGuidancePattern(guidancePattern),
      ),
    );
    final guidancePatternIds = [
      existingGuidancePatternIds,
      newGuidancePatternIds,
    ].flattenedToList;

    await managers.guidanceGroupPatterns
        .filter(
          (f) =>
              f.guidanceGroup.id.equals(guidanceGroup.id) &
              f.guidancePattern.id.not.isIn(guidancePatternIds),
        )
        .delete();

    await managers.guidanceGroupPatterns.bulkCreate(
      (o) => guidancePatternIds.map(
        (id) => o(guidanceGroup: guidanceGroup.id, guidancePattern: id),
      ),
      onConflict: DoNothing(),
    );
    Logger.instance.i(
      'Updated guidance group ${guidanceGroup.id}: ${guidanceGroup.name}.',
    );
  }

  /// Get the object with [id] from the database. Child objects/refs will also
  /// be loaded.
  Future<GuidanceGroupWithRefs> getGuidanceGroup(int id) async {
    final guidanceGroup = await managers.guidanceGroups
        .filter((g) => g.id.equals(id))
        .getSingle();

    PolygonWithRefs? borderPolygonObj;
    if (guidanceGroup.borderPolygon != null) {
      borderPolygonObj = await attachedDatabase.polygonsDao.getPolygon(
        guidanceGroup.borderPolygon!,
      );
    }

    final guidancePatterns = await Future.wait(
      await managers.guidanceGroupPatterns
          .filter((p) => p.guidanceGroup.id.equals(id))
          .map((p) => p.guidancePattern)
          .get()
          .then(
            (guidancePatternIds) => guidancePatternIds.map(
              (guidancePatternId) => attachedDatabase.guidancePatternsDao
                  .getGuidancePattern(guidancePatternId),
            ),
          ),
    );

    return GuidanceGroupWithRefs(
      guidanceGroup: guidanceGroup,
      borderPolygonObj: borderPolygonObj,
      guidancePatterns: guidancePatterns,
    );
  }

  /// Get objects from the database. [limit], [offset] and [orderBy] can be
  /// set to alter the query.
  Future<List<GuidanceGroupWithRefs>> list({
    int limit = 10,
    int? offset,
    ComposableOrdering Function($$GuidanceGroupsTableOrderingComposer)? orderBy,
  }) async => Future.wait(
    await managers.guidanceGroups
        .orderBy(
          orderBy ??
              (g) => g.lastUpdatedAt.desc(nulls: .last) & g.createdAt.desc(),
        )
        .limit(limit, offset: offset)
        .map((row) => getGuidanceGroup(row.id))
        .get(),
  );
}
