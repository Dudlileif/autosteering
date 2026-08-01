// dart format width=80
// ignore_for_file: type=lint
part of 'vehicles_dao.dart';

mixin _$VehiclesDaoMixin on DatabaseAccessor<Database> {
  $VehiclesTable get vehicles => attachedDatabase.vehicles;
  $ImplementsTable get implements => attachedDatabase.implements;
  $ConnectorsTable get connectors => attachedDatabase.connectors;
  VehiclesDaoManager get managers => VehiclesDaoManager(this);
}

class VehiclesDaoManager {
  final _$VehiclesDaoMixin _db;
  VehiclesDaoManager(this._db);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db.attachedDatabase, _db.vehicles);
  $$ImplementsTableTableManager get implements =>
      $$ImplementsTableTableManager(_db.attachedDatabase, _db.implements);
  $$ConnectorsTableTableManager get connectors =>
      $$ConnectorsTableTableManager(_db.attachedDatabase, _db.connectors);
}
