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

import 'package:autosteering/src/features/database/database.dart';
import 'package:autosteering/src/features/database/models/tables/table_timestamps_mixin.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';

/// A table for recording tasks, which has bindings to a [Partfield],
/// [GuidancePatterns], [GuidanceShifts] and [GuidanceGroups] through
/// [GuidanceAllocations], and [Implements] and [Vehicles] through
/// [Connections].
class Tasks extends Table with TableTimestamps {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// The name of this.
  late final Column<String> name = text()();

  /// A note with various information recorded by the worker.
  late final Column<String> note = text().nullable()();

  /// A reference to a [Partfield].
  @ReferenceName('taskPartfield')
  late final Column<int> partfield = integer()
      .references(Partfields, #id)
      .nullable()();

  /// When the work started.
  late final Column<DateTime> workStartedAt = dateTime().nullable()();

  /// When the work ended.
  late final Column<DateTime> workEndedAt = dateTime().nullable()();
}

/// A [Task] extended with all children/refs loaded.
class TaskWithRefs extends Task {
  /// A [Task] extended with all children/refs loaded.
  factory TaskWithRefs({
    required Task task,
    PartfieldWithRefs? partfieldObj,
    List<ConnectionWithRefs>? connections,
    List<GuidanceAllocationWithRefs>? guidanceAllocations,
  }) => TaskWithRefs._(
    id: task.id,
    name: task.name,
    note: task.note,
    partfield: task.partfield,
    workStartedAt: task.workStartedAt,
    workEndedAt: task.workEndedAt,
    createdAt: task.createdAt,
    lastUpdatedAt: task.lastUpdatedAt,
    partfieldObj: partfieldObj,
    connections: connections ?? [],
    guidanceAllocations: guidanceAllocations ?? [],
  );

  const TaskWithRefs._({
    required super.id,
    required super.name,
    required super.createdAt,
    super.note,
    super.partfield,
    super.workStartedAt,
    super.workEndedAt,
    super.lastUpdatedAt,
    this.partfieldObj,
    this.connections = const [],
    this.guidanceAllocations = const [],
  });

  /// The loaded optional partfield.
  final PartfieldWithRefs? partfieldObj;

  /// The loaded connections.
  final List<ConnectionWithRefs> connections;

  /// The loaded guidance allocations.
  final List<GuidanceAllocationWithRefs> guidanceAllocations;
}
