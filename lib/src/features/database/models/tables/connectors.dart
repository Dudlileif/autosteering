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

import 'package:autosteering/src/features/database/database.dart'
    hide Connection;
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:autosteering/src/features/hitching/hitching.dart'
    show Connection, Connector, ConnectorRelation, ConnectorType;
import 'package:autosteering/src/features/vehicle/vehicle.dart' show Vehicle;
import 'package:drift/drift.dart';

/// A table for connector points on a [Vehicle] or [Implement].
@UseRowClass(Connector, constructor: 'fromDatabase')
class Connectors extends Table {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// Reference to the parent [Vehicle], if there is one.
  @ReferenceName('connectorVehicle')
  late final Column<int> vehicle = integer()
      .references(
        Vehicles,
        #id,
      )
      .nullable()();

  /// Reference to the parent [Implement], if there is one.
  @ReferenceName('connectorImplement')
  late final Column<int> implement = integer()
      .references(
        Implements,
        #id,
      )
      .nullable()();

  /// Which type of connector this is.
  late final Column<String> type = textEnum<ConnectorType>()();

  /// Which relation this connnector will have in a [Connection].
  late final Column<String> relation = textEnum<ConnectorRelation>()();

  /// The longitudinal offset from the reference point. Positive means ahead
  /// and negative behind.
  late final Column<double> longitudinalOffsetFromRef = real()();

  /// The lateral offset from the reference point. Positive means to the right
  /// and negative to the left.
  late final Column<double> lateralOffsetFromRef = real()();

  /// The vertical offset from the reference point. Positive means above and
  /// negative below.
  late final Column<double> verticalOffsetFromRef = real().withDefault(
    const Constant(0),
  )();

  /// The angle of the connector, relative to the forward direction.
  late final Column<double> angle = real()();

  /// When this was created.
  late final Column<DateTime> createdAt = dateTime().clientDefault(
    DateTime.now,
  )();

  /// When this was last updated.
  late final Column<DateTime> lastUpdatedAt = dateTime().nullable()();
}

/// Extension with getters for ids for use with database inserts/extractions.
extension ConnectorIds on Connector {
  /// Same as [implementId].
  int? get implement => implementId;

  /// Same as [vehicleId].
  int? get vehicle => vehicleId;
}
