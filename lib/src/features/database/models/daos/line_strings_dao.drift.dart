// dart format width=80
// ignore_for_file: type=lint
part of 'line_strings_dao.dart';

mixin _$LineStringsDaoMixin on DatabaseAccessor<Database> {
  $LineStringsTable get lineStrings => attachedDatabase.lineStrings;
  $PointsTable get points => attachedDatabase.points;
  $LineStringPointsTable get lineStringPoints =>
      attachedDatabase.lineStringPoints;
  LineStringsDaoManager get managers => LineStringsDaoManager(this);
}

class LineStringsDaoManager {
  final _$LineStringsDaoMixin _db;
  LineStringsDaoManager(this._db);
  $$LineStringsTableTableManager get lineStrings =>
      $$LineStringsTableTableManager(_db.attachedDatabase, _db.lineStrings);
  $$PointsTableTableManager get points =>
      $$PointsTableTableManager(_db.attachedDatabase, _db.points);
  $$LineStringPointsTableTableManager get lineStringPoints =>
      $$LineStringPointsTableTableManager(
        _db.attachedDatabase,
        _db.lineStringPoints,
      );
}
