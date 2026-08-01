// dart format width=80
// ignore_for_file: type=lint
part of 'connections_dao.dart';

mixin _$ConnectionsDaoMixin on DatabaseAccessor<Database> {
  $PartfieldsTable get partfields => attachedDatabase.partfields;
  $TasksTable get tasks => attachedDatabase.tasks;
  $VehiclesTable get vehicles => attachedDatabase.vehicles;
  $ImplementsTable get implements => attachedDatabase.implements;
  $ConnectorsTable get connectors => attachedDatabase.connectors;
  $ConnectionsTable get connections => attachedDatabase.connections;
  ConnectionsDaoManager get managers => ConnectionsDaoManager(this);
}

class ConnectionsDaoManager {
  final _$ConnectionsDaoMixin _db;
  ConnectionsDaoManager(this._db);
  $$PartfieldsTableTableManager get partfields =>
      $$PartfieldsTableTableManager(_db.attachedDatabase, _db.partfields);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db.attachedDatabase, _db.tasks);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db.attachedDatabase, _db.vehicles);
  $$ImplementsTableTableManager get implements =>
      $$ImplementsTableTableManager(_db.attachedDatabase, _db.implements);
  $$ConnectorsTableTableManager get connectors =>
      $$ConnectorsTableTableManager(_db.attachedDatabase, _db.connectors);
  $$ConnectionsTableTableManager get connections =>
      $$ConnectionsTableTableManager(_db.attachedDatabase, _db.connections);
}
