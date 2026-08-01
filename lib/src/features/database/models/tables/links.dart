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

import 'package:autosteering/src/features/database/database.dart' show Link;
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// A linking table for connecting link values (like UUIDs) to local database
/// ids.
class Links extends Table {
  /// Which table this referes to.
  late final Column<String> tableRef = text().map(
    const LinkTableRefConverter(),
  )();

  /// Which row in the reference table this referes to.
  late final Column<int> refId = integer()();

  /// The link value for the references table row.
  late final Column<String> linkValue = text().clientDefault(
    () => const Uuid().v4(),
  )();

  /// A name for the link.
  late final Column<String> name = text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {tableRef, refId};

  @override
  bool get withoutRowId => true;
}

/// Which table a [Link] should refer to.
enum LinkTableRef {
  /// [GuidancePatterns]
  guidancePatterns('guidance_patterns'),

  /// [Implements]
  implements('implements'),

  /// [Partfields]
  partfields('partfields'),

  /// [Tasks]
  tasks('tasks'),

  /// [Vehicles]
  vehicles('vehicles');

  const LinkTableRef(this.name);

  /// The snake_case name of this.
  final String name;
}

/// An SQL enum converter for [LinkTableRef].
class LinkTableRefConverter extends TypeConverter<LinkTableRef, String> {
  /// An SQL enum converter for [LinkTableRef].
  const LinkTableRefConverter();

  @override
  LinkTableRef fromSql(String fromDb) => LinkTableRef.values.firstWhere(
    (value) => value.name == fromDb,
    orElse: () => .vehicles,
  );

  @override
  String toSql(LinkTableRef value) => value.name;
}
