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

import 'package:autosteering/src/features/database/models/tables/table_timestamps_mixin.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:drift/drift.dart';

/// A table for implements.
@UseRowClass(Equipment, constructor: 'fromDatabase')
class Implements extends Table with TableTimestamps {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// The name of this.
  late final Column<String> name = text().nullable()();
}
