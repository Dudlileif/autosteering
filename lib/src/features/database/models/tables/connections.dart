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
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:autosteering/src/features/hitching/hitching.dart'
    show Connector;
import 'package:drift/drift.dart';

/// A connection table for binding [Connectors] in a [Task].
class Connections extends Table {
  /// Reference to a [Task].
  @ReferenceName('connectionTask')
  late final Column<int> task = integer().references(Tasks, #id)();

  /// Reference to the parent [Connector].
  @ReferenceName('connectionParent')
  late final Column<int> parentConnector = integer().references(
    Connectors,
    #id,
  )();

  /// Reference to the child [Connector].
  @ReferenceName('connectionChild')
  late final Column<int> childConnector = integer().references(
    Connectors,
    #id,
  )();

  @override
  Set<Column<Object>>? get primaryKey => {
    task,
    parentConnector,
    childConnector,
  };

  @override
  bool get withoutRowId => true;
}

/// A [Connection] extended with all children/refs loaded.
class ConnectionWithRefs extends Connection {
  /// A [Connection] extended with all children/refs loaded.
  factory ConnectionWithRefs({
    required Connection connection,
    required Task taskObj,
    required ConnectorWithRefs parentConnectorObj,
    required ConnectorWithRefs childConnectorObj,
  }) => ConnectionWithRefs._(
    task: connection.task,
    parentConnector: connection.parentConnector,
    childConnector: connection.childConnector,
    taskObj: taskObj,
    parentConnectorObj: parentConnectorObj,
    childConnectorObj: childConnectorObj,
  );

  const ConnectionWithRefs._({
    required super.task,
    required super.parentConnector,
    required super.childConnector,
    required this.taskObj,
    required this.parentConnectorObj,
    required this.childConnectorObj,
  });

  /// The loaded parent task.
  final Task taskObj;

  /// The loaded parent connector.
  final ConnectorWithRefs parentConnectorObj;

  /// The loaded child connector.
  final ConnectorWithRefs childConnectorObj;
}
