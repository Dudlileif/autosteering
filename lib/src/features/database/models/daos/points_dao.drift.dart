// dart format width=80
// ignore_for_file: type=lint
part of 'points_dao.dart';

mixin _$PointsDaoMixin on DatabaseAccessor<Database> {
  $PointsTable get points => attachedDatabase.points;
  PointsDaoManager get managers => PointsDaoManager(this);
}

class PointsDaoManager {
  final _$PointsDaoMixin _db;
  PointsDaoManager(this._db);
  $$PointsTableTableManager get points =>
      $$PointsTableTableManager(_db.attachedDatabase, _db.points);
}
