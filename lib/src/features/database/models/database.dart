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

import 'dart:ui' show Color;

import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path show join;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

// Update schema files with
// $ dart run drift_dev schema dump lib/src/features/database/models/database.dart drift_schemas/

@DriftDatabase(
  tables: [
    Connections,
    Connectors,
    GuidanceAllocations,
    GuidanceGroupPatterns,
    GuidanceGroups,
    GuidancePatterns,
    Implements,
    LineStringPoints,
    LineStrings,
    Links,
    PartfieldGuidanceGroups,
    PartfieldPolygons,
    PartfieldLineStrings,
    PartfieldPoints,
    Partfields,
    Points,
    PolygonLineStrings,
    Polygons,
    Sections,
    Tasks,
    Vehicles,
  ],
)
/// The local SQLite database that stores all data.
class Database extends _$Database {
  /// The local SQLite database that stores all data.
  Database([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
    onUpgrade: (migrator, from, to) async {
      // Disable foreign_keys before migrations
      await customStatement('PRAGMA foreign_keys = OFF');

      await transaction(() async {
        // Put migration logic here
        // await migrator.runMigrationSteps(
        //  from: from, to: to, steps: migrationSteps.from1To2
        // );
      });

      // Assert that the schema is valid after migrations
      if (kDebugMode) {
        final wrongForeignKeys = await customSelect(
          'PRAGMA foreign_key_check',
        ).get();
        assert(
          wrongForeignKeys.isEmpty,
          '${wrongForeignKeys.map((e) => e.data)}',
        );
      }
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'database',
      native: DriftNativeOptions(
        databaseDirectory: () async {
          final directoryPath = path.join(
            (await getApplicationDocumentsDirectory()).path,
            'Autosteering',
            'database',
          );
          return directoryPath;
        },
        shareAcrossIsolates: true,
      ),
    );
  }
}
