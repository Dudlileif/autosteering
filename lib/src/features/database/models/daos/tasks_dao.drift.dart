// dart format width=80
// ignore_for_file: type=lint
part of 'tasks_dao.dart';

mixin _$TasksDaoMixin on DatabaseAccessor<Database> {
  $PartfieldsTable get partfields => attachedDatabase.partfields;
  $TasksTable get tasks => attachedDatabase.tasks;
  $VehiclesTable get vehicles => attachedDatabase.vehicles;
  $ImplementsTable get implements => attachedDatabase.implements;
  $ConnectorsTable get connectors => attachedDatabase.connectors;
  $ConnectionsTable get connections => attachedDatabase.connections;
  $PolygonsTable get polygons => attachedDatabase.polygons;
  $GuidanceGroupsTable get guidanceGroups => attachedDatabase.guidanceGroups;
  $GuidanceAllocationsTable get guidanceAllocations =>
      attachedDatabase.guidanceAllocations;
  TasksDaoManager get managers => TasksDaoManager(this);
}

class TasksDaoManager {
  final _$TasksDaoMixin _db;
  TasksDaoManager(this._db);
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
  $$PolygonsTableTableManager get polygons =>
      $$PolygonsTableTableManager(_db.attachedDatabase, _db.polygons);
  $$GuidanceGroupsTableTableManager get guidanceGroups =>
      $$GuidanceGroupsTableTableManager(
        _db.attachedDatabase,
        _db.guidanceGroups,
      );
  $$GuidanceAllocationsTableTableManager get guidanceAllocations =>
      $$GuidanceAllocationsTableTableManager(
        _db.attachedDatabase,
        _db.guidanceAllocations,
      );
}
