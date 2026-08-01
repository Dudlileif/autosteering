// dart format width=80
// ignore_for_file: type=lint
part of 'partfields_dao.dart';

mixin _$PartfieldsDaoMixin on DatabaseAccessor<Database> {
  $PartfieldsTable get partfields => attachedDatabase.partfields;
  $PolygonsTable get polygons => attachedDatabase.polygons;
  $GuidanceGroupsTable get guidanceGroups => attachedDatabase.guidanceGroups;
  $PartfieldGuidanceGroupsTable get partfieldGuidanceGroups =>
      attachedDatabase.partfieldGuidanceGroups;
  $LineStringsTable get lineStrings => attachedDatabase.lineStrings;
  $PartfieldLineStringsTable get partfieldLineStrings =>
      attachedDatabase.partfieldLineStrings;
  $PointsTable get points => attachedDatabase.points;
  $PartfieldPointsTable get partfieldPoints => attachedDatabase.partfieldPoints;
  $PartfieldPolygonsTable get partfieldPolygons =>
      attachedDatabase.partfieldPolygons;
  PartfieldsDaoManager get managers => PartfieldsDaoManager(this);
}

class PartfieldsDaoManager {
  final _$PartfieldsDaoMixin _db;
  PartfieldsDaoManager(this._db);
  $$PartfieldsTableTableManager get partfields =>
      $$PartfieldsTableTableManager(_db.attachedDatabase, _db.partfields);
  $$PolygonsTableTableManager get polygons =>
      $$PolygonsTableTableManager(_db.attachedDatabase, _db.polygons);
  $$GuidanceGroupsTableTableManager get guidanceGroups =>
      $$GuidanceGroupsTableTableManager(
        _db.attachedDatabase,
        _db.guidanceGroups,
      );
  $$PartfieldGuidanceGroupsTableTableManager get partfieldGuidanceGroups =>
      $$PartfieldGuidanceGroupsTableTableManager(
        _db.attachedDatabase,
        _db.partfieldGuidanceGroups,
      );
  $$LineStringsTableTableManager get lineStrings =>
      $$LineStringsTableTableManager(_db.attachedDatabase, _db.lineStrings);
  $$PartfieldLineStringsTableTableManager get partfieldLineStrings =>
      $$PartfieldLineStringsTableTableManager(
        _db.attachedDatabase,
        _db.partfieldLineStrings,
      );
  $$PointsTableTableManager get points =>
      $$PointsTableTableManager(_db.attachedDatabase, _db.points);
  $$PartfieldPointsTableTableManager get partfieldPoints =>
      $$PartfieldPointsTableTableManager(
        _db.attachedDatabase,
        _db.partfieldPoints,
      );
  $$PartfieldPolygonsTableTableManager get partfieldPolygons =>
      $$PartfieldPolygonsTableTableManager(
        _db.attachedDatabase,
        _db.partfieldPolygons,
      );
}
