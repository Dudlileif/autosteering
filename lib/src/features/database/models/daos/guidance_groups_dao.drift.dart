// dart format width=80
// ignore_for_file: type=lint
part of 'guidance_groups_dao.dart';

mixin _$GuidanceGroupsDaoMixin on DatabaseAccessor<Database> {
  $PolygonsTable get polygons => attachedDatabase.polygons;
  $GuidanceGroupsTable get guidanceGroups => attachedDatabase.guidanceGroups;
  $LineStringsTable get lineStrings => attachedDatabase.lineStrings;
  $GuidancePatternsTable get guidancePatterns =>
      attachedDatabase.guidancePatterns;
  $GuidanceGroupPatternsTable get guidanceGroupPatterns =>
      attachedDatabase.guidanceGroupPatterns;
  GuidanceGroupsDaoManager get managers => GuidanceGroupsDaoManager(this);
}

class GuidanceGroupsDaoManager {
  final _$GuidanceGroupsDaoMixin _db;
  GuidanceGroupsDaoManager(this._db);
  $$PolygonsTableTableManager get polygons =>
      $$PolygonsTableTableManager(_db.attachedDatabase, _db.polygons);
  $$GuidanceGroupsTableTableManager get guidanceGroups =>
      $$GuidanceGroupsTableTableManager(
        _db.attachedDatabase,
        _db.guidanceGroups,
      );
  $$LineStringsTableTableManager get lineStrings =>
      $$LineStringsTableTableManager(_db.attachedDatabase, _db.lineStrings);
  $$GuidancePatternsTableTableManager get guidancePatterns =>
      $$GuidancePatternsTableTableManager(
        _db.attachedDatabase,
        _db.guidancePatterns,
      );
  $$GuidanceGroupPatternsTableTableManager get guidanceGroupPatterns =>
      $$GuidanceGroupPatternsTableTableManager(
        _db.attachedDatabase,
        _db.guidanceGroupPatterns,
      );
}
