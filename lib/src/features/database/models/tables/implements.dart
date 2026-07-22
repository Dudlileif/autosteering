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

import 'package:drift/drift.dart';

/// A table for implements.
class Implements extends Table {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// The name of this.
  late final Column<String> name = text().nullable()();

  /// When this was last used.
  late final Column<DateTime> lastUsedAt = dateTime().nullable()();

  /// When this was created.
  late final Column<DateTime> createdAt = dateTime().clientDefault(
    DateTime.now,
  )();

  /// When this was last updated.
  late final Column<DateTime> lastUpdatedAt = dateTime().nullable()();
}
