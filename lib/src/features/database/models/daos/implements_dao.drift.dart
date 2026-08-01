// dart format width=80
// ignore_for_file: type=lint
part of 'implements_dao.dart';

mixin _$ImplementsDaoMixin on DatabaseAccessor<Database> {
  $VehiclesTable get vehicles => attachedDatabase.vehicles;
  $ImplementsTable get implements => attachedDatabase.implements;
  $ConnectorsTable get connectors => attachedDatabase.connectors;
  $SectionsTable get sections => attachedDatabase.sections;
  ImplementsDaoManager get managers => ImplementsDaoManager(this);
}

class ImplementsDaoManager {
  final _$ImplementsDaoMixin _db;
  ImplementsDaoManager(this._db);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db.attachedDatabase, _db.vehicles);
  $$ImplementsTableTableManager get implements =>
      $$ImplementsTableTableManager(_db.attachedDatabase, _db.implements);
  $$ConnectorsTableTableManager get connectors =>
      $$ConnectorsTableTableManager(_db.attachedDatabase, _db.connectors);
  $$SectionsTableTableManager get sections =>
      $$SectionsTableTableManager(_db.attachedDatabase, _db.sections);
}
