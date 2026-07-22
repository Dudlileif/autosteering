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

import 'package:autosteering/src/features/database/models/models.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';

/// A connection table for binding [Polygons] to [Partfields].
class PartfieldPolygons extends Table {
  /// A reference to a [Partfield].
  @ReferenceName('partfieldPolygonPartfield')
  late final Column<int> partfield = integer().references(
    Partfields,
    #id,
  )();

  /// A reference to a [Polygon].
  @ReferenceName('partfieldPolygonPolygon')
  late final Column<int> polygon = integer().references(Polygons, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {partfield, polygon};

  @override
  bool get withoutRowId => true;
}
