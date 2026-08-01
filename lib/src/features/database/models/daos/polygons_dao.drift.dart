// dart format width=80
// ignore_for_file: type=lint
part of 'polygons_dao.dart';

mixin _$PolygonsDaoMixin on DatabaseAccessor<Database> {
  $PolygonsTable get polygons => attachedDatabase.polygons;
  $LineStringsTable get lineStrings => attachedDatabase.lineStrings;
  $PolygonLineStringsTable get polygonLineStrings =>
      attachedDatabase.polygonLineStrings;
  PolygonsDaoManager get managers => PolygonsDaoManager(this);
}

class PolygonsDaoManager {
  final _$PolygonsDaoMixin _db;
  PolygonsDaoManager(this._db);
  $$PolygonsTableTableManager get polygons =>
      $$PolygonsTableTableManager(_db.attachedDatabase, _db.polygons);
  $$LineStringsTableTableManager get lineStrings =>
      $$LineStringsTableTableManager(_db.attachedDatabase, _db.lineStrings);
  $$PolygonLineStringsTableTableManager get polygonLineStrings =>
      $$PolygonLineStringsTableTableManager(
        _db.attachedDatabase,
        _db.polygonLineStrings,
      );
}
