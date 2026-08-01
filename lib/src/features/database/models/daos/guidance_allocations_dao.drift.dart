// dart format width=80
// ignore_for_file: type=lint
part of 'guidance_allocations_dao.dart';

mixin _$GuidanceAllocationsDaoMixin on DatabaseAccessor<Database> {
  $PartfieldsTable get partfields => attachedDatabase.partfields;
  $TasksTable get tasks => attachedDatabase.tasks;
  $PolygonsTable get polygons => attachedDatabase.polygons;
  $GuidanceGroupsTable get guidanceGroups => attachedDatabase.guidanceGroups;
  $GuidanceAllocationsTable get guidanceAllocations =>
      attachedDatabase.guidanceAllocations;
  GuidanceAllocationsDaoManager get managers =>
      GuidanceAllocationsDaoManager(this);
}

class GuidanceAllocationsDaoManager {
  final _$GuidanceAllocationsDaoMixin _db;
  GuidanceAllocationsDaoManager(this._db);
  $$PartfieldsTableTableManager get partfields =>
      $$PartfieldsTableTableManager(_db.attachedDatabase, _db.partfields);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db.attachedDatabase, _db.tasks);
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
