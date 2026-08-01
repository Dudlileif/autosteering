// dart format width=80
// ignore_for_file: type=lint
part of 'guidance_patterns_dao.dart';

mixin _$GuidancePatternsDaoMixin on DatabaseAccessor<Database> {
  $LineStringsTable get lineStrings => attachedDatabase.lineStrings;
  $PolygonsTable get polygons => attachedDatabase.polygons;
  $GuidancePatternsTable get guidancePatterns =>
      attachedDatabase.guidancePatterns;
  GuidancePatternsDaoManager get managers => GuidancePatternsDaoManager(this);
}

class GuidancePatternsDaoManager {
  final _$GuidancePatternsDaoMixin _db;
  GuidancePatternsDaoManager(this._db);
  $$LineStringsTableTableManager get lineStrings =>
      $$LineStringsTableTableManager(_db.attachedDatabase, _db.lineStrings);
  $$PolygonsTableTableManager get polygons =>
      $$PolygonsTableTableManager(_db.attachedDatabase, _db.polygons);
  $$GuidancePatternsTableTableManager get guidancePatterns =>
      $$GuidancePatternsTableTableManager(
        _db.attachedDatabase,
        _db.guidancePatterns,
      );
}
