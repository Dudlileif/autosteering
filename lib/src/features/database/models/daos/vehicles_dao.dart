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
import 'package:autosteering/src/features/database/models/models.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart' show Vehicle;
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

part 'vehicles_dao.drift.dart';

/// A database accessor object for [Vehicles] related interactions.
@DriftAccessor(tables: [Connectors, Vehicles])
class VehiclesDao extends DatabaseAccessor<Database> with _$VehiclesDaoMixin {
  /// A database accessor object for [Vehicles] related interactions.
  VehiclesDao(super.attachedDatabase);

  /// Insert [vehicle] into the database.
  Future<int> insertVehicle(Vehicle vehicle) async {
    final vehicleId = await managers.vehicles.create(
      (o) => o(
        id: const Value.absent(),
        type: vehicle.type,
        geometry: vehicle.geometry,
        name: Value.absentIfNull(vehicle.name),
        gnssAntennaConfig: Value.absentIfNull(vehicle.gnssAntennaConfig),
        imuConfig: Value.absentIfNull(vehicle.imu.config),
        steeringHardwareConfig: Value.absentIfNull(
          vehicle.steeringHardwareConfig,
        ),
        wasConfig: Value.absentIfNull(vehicle.was.config),
        pathTrackingParameters: Value.absentIfNull(
          vehicle.pathTrackingParameters,
        ),
        colorScheme: Value.absentIfNull(vehicle.manufacturerColors),
        createdAt: Value.absentIfNull(vehicle.createdAt),
        lastUpdatedAt: Value.absentIfNull(vehicle.lastUpdatedAt),
        thresholds: Value.absentIfNull(vehicle.thresholds),
      ),
    );

    await managers.connectors.bulkCreate(
      (o) => vehicle.connectors.map(
        (connector) => o(
          longitudinalOffsetFromRef: connector.longitudinalOffsetFromRef,
          lateralOffsetFromRef: connector.lateralOffsetFromRef,
          type: connector.type,
          relation: connector.relation,
          vehicle: Value(vehicleId),
          id: const Value.absent(),
          verticalOffsetFromRef: Value.absentIfNull(
            connector.verticalOffsetFromRef,
          ),
          angle: connector.angle,
          createdAt: Value.absentIfNull(connector.createdAt),
          lastUpdatedAt: Value.absentIfNull(connector.lastUpdatedAt),
        ),
      ),
    );
    Logger.instance.i(
      '''Inserted vehicle $vehicleId: ${vehicle.name}, ${vehicle.type} with ${vehicle.connectors.length} connectors.''',
    );

    return vehicleId;
  }

  /// Update [vehicle] in the database.
  Future<void> updateVehicle(Vehicle vehicle) async {
    await managers.vehicles
        .filter((v) => v.id.equals(vehicle.id))
        .update((o) => o(lastUpdatedAt: Value(DateTime.now())));

    final existingIds = vehicle.connectors
        .where(
          (c) => c.id != null && c.id! > 0,
        )
        .map((c) => c.id!);
    final newConnectors = vehicle.connectors.where(
      (c) => c.id == null || c.id! < 0,
    );
    final newIds = await Future.wait(
      newConnectors.map(
        (connector) => managers.connectors.create(
          (o) => o(
            longitudinalOffsetFromRef: connector.longitudinalOffsetFromRef,
            lateralOffsetFromRef: connector.lateralOffsetFromRef,
            type: connector.type,
            relation: connector.relation,
            vehicle: Value(vehicle.id),
            id: const Value.absent(),
            verticalOffsetFromRef: Value.absentIfNull(
              connector.verticalOffsetFromRef,
            ),
            angle: connector.angle,
            createdAt: Value.absentIfNull(connector.createdAt),
            lastUpdatedAt: Value.absentIfNull(connector.lastUpdatedAt),
          ),
        ),
      ),
    );
    final ids = [existingIds, newIds].flattenedToList;

    await managers.connectors
        .filter((c) => c.vehicle.id.equals(vehicle.id) & c.id.not.isIn(ids))
        .delete();

    await managers.connectors.bulkReplace(
      vehicle.connectors
          .where((c) => (c.id ?? 0) > 0)
          .map(
            (connector) => ConnectorsCompanion(
              longitudinalOffsetFromRef: Value(
                connector.longitudinalOffsetFromRef,
              ),
              lateralOffsetFromRef: Value(connector.lateralOffsetFromRef),
              type: Value(connector.type),
              relation: Value(connector.relation),
              vehicle: Value(vehicle.id),
              id: Value(connector.id!),
              verticalOffsetFromRef: Value.absentIfNull(
                connector.verticalOffsetFromRef,
              ),
              angle: Value(connector.angle),
              createdAt: Value.absentIfNull(connector.createdAt),
              lastUpdatedAt: Value(DateTime.now()),
            ),
          ),
    );

    Logger.instance.i(
      '''Updated vehicle ${vehicle.id}: ${vehicle.name}, ${vehicle.type}.''',
    );
  }

  /// Get the object with [id] from the database. Child objects/refs will also
  /// be loaded.
  Future<Vehicle> getVehicle(int id) async => managers.vehicles
      .filter((v) => v.id.equals(id))
      .withReferences((prefetch) => prefetch(connectorVehicle: true))
      .map(
        (row) =>
            row.$1.copyWith(connectors: row.$2.connectorVehicle.prefetchedData),
      )
      .getSingle();

  /// Get the last used vehicle from the database, otherwise the last
  /// created/updated. Child objects/refs will also be loaded.
  Future<Vehicle?> get getLastUsedVehicle => managers.vehicles
      .orderBy(
        (vehicle) => vehicle.lastUpdatedAt.desc() & vehicle.createdAt.desc(),
      )
      .withReferences((prefetch) => prefetch(connectorVehicle: true))
      .limit(1)
      .map(
        (row) =>
            row.$1.copyWith(connectors: row.$2.connectorVehicle.prefetchedData),
      )
      .getSingleOrNull();

  /// Get objects from the database. [limit], [offset] and [orderBy] can be
  /// set to alter the query.
  Future<List<Vehicle>> list({
    int limit = 10,
    int? offset,
    ComposableOrdering Function($$VehiclesTableOrderingComposer)? orderBy,
  }) async => managers.vehicles
      .orderBy(
        orderBy ??
            (vehicle) =>
                vehicle.lastUpdatedAt.desc(nulls: .last) &
                vehicle.createdAt.desc(),
      )
      .withReferences((prefetch) => prefetch(connectorVehicle: true))
      .limit(limit, offset: offset)
      .map(
        (vehicleWithRefs) => vehicleWithRefs.$1.copyWith(
          connectors: vehicleWithRefs.$2.connectorVehicle.prefetchedData,
        ),
      )
      .get();
}
