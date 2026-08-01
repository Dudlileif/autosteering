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
import 'package:drift/drift.dart';

part 'guidance_patterns_dao.drift.dart';

@DriftAccessor(tables: [GuidancePatterns])
/// A database accessor object for [GuidancePatterns] related interactions.
class GuidancePatternsDao extends DatabaseAccessor<Database>
    with _$GuidancePatternsDaoMixin {
  /// A database accessor object for [GuidancePatterns] related interactions.
  GuidancePatternsDao(super.attachedDatabase);

  /// Insert [guidancePattern] into the database.
  Future<int> insertGuidancePattern(
    GuidancePatternWithRefs guidancePattern,
  ) async {
    var lineStringId = guidancePattern.lineString;
    if (guidancePattern.lineStringObj.id < 0) {
      lineStringId = await attachedDatabase.lineStringsDao.insertLineString(
        guidancePattern.lineStringObj,
      );
    }

    var borderPolygonId = guidancePattern.borderPolygon;
    if (guidancePattern.borderPolygonObj case final polygon?
        when polygon.id < 0) {
      borderPolygonId = await attachedDatabase.polygonsDao.insertPolygon(
        polygon,
      );
    }

    final id = await managers.guidancePatterns.create(
      (o) => guidancePattern
          .toCompanion(true)
          .copyWith(
            id: const Value.absent(),
            lineString: Value(lineStringId),
            borderPolygon: Value.absentIfNull(borderPolygonId),
          ),
    );
    Logger.instance.i(
      '''Inserted guidance pattern $id: ${guidancePattern.name}, ${guidancePattern.type}.''',
    );

    return id;
  }

  /// Update [guidancePattern] in the database.
  Future<void> updateGuidancePattern(
    GuidancePatternWithRefs guidancePattern,
  ) async {
    var lineStringId = guidancePattern.lineString;
    if (guidancePattern.lineStringObj.id < 0) {
      lineStringId = await attachedDatabase.lineStringsDao.insertLineString(
        guidancePattern.lineStringObj,
      );
    }

    var borderPolygonId = guidancePattern.borderPolygon;
    if (guidancePattern.borderPolygonObj case final polygon?
        when polygon.id < 0) {
      borderPolygonId = await attachedDatabase.polygonsDao.insertPolygon(
        polygon,
      );
    }

    await managers.guidancePatterns.replace(
      guidancePattern
          .toCompanion(true)
          .copyWith(
            id: const Value.absent(),
            lineString: Value(lineStringId),
            borderPolygon: Value.absentIfNull(borderPolygonId),
            lastUpdatedAt: Value(DateTime.now()),
          ),
    );
    Logger.instance.i(
      '''Updated guidance pattern ${guidancePattern.id}: ${guidancePattern.name}, ${guidancePattern.type}.''',
    );
  }

  /// Get the object with [id] from the database. Child objects/refs will also
  /// be loaded.
  Future<GuidancePatternWithRefs> getGuidancePattern(int id) async {
    final guidancePattern = await managers.guidancePatterns
        .filter((p) => p.id.equals(id))
        .getSingle();

    PolygonWithRefs? borderPolygonObj;
    if (guidancePattern.borderPolygon != null) {
      borderPolygonObj = await attachedDatabase.polygonsDao.getPolygon(
        guidancePattern.borderPolygon!,
      );
    }

    final lineStringObj = await attachedDatabase.lineStringsDao.getLineString(
      guidancePattern.lineString,
    );

    return GuidancePatternWithRefs(
      guidancePattern: guidancePattern,
      borderPolygonObj: borderPolygonObj,
      lineStringObj: lineStringObj,
    );
  }

  /// Get objects from the database. [limit], [offset] and [orderBy] can be
  /// set to alter the query.
  Future<List<GuidancePatternWithRefs>> list({
    int limit = 10,
    int? offset,
    ComposableOrdering Function($$GuidancePatternsTableOrderingComposer)?
    orderBy,
  }) async => Future.wait(
    await managers.guidancePatterns
        .orderBy(
          orderBy ??
              (g) => g.lastUpdatedAt.desc(nulls: .last) & g.createdAt.desc(),
        )
        .limit(limit, offset: offset)
        .map((row) => getGuidancePattern(row.id))
        .get(),
  );
}
