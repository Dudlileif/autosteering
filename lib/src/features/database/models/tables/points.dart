// Copyright (C) 2026 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:autosteering/src/features/database/database.dart';
import 'package:autosteering/src/features/database/models/tables/table_timestamps_mixin.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:drift/drift.dart';

/// A table of geographic points in the world.
///
/// These are used in [LineStrings] and standalone in [Partfields].
class Points extends Table with TableTimestamps {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// Which type of point this is.
  late final Column<int> type = integer().map(const PointTypeConverter())();

  /// The name of this.
  late final Column<String> name = text().nullable()();

  /// GNSS position north, format: WGS84 latitude
  late final Column<double> latitude = real()();

  /// GNSS position east, format: WGS84 longitude.
  late final Column<double> longitude = real()();

  /// The elevation of this, deviation in meters from WGS84 ellipsoid.
  late final Column<double> elevation = real().nullable()();
}

/// An enumerator for what type a [Point] is.
enum PointType {
  /// Flag
  flag(1, 'Flag'),

  /// Other
  other(2, 'Other'),

  /// Field access
  fieldAccess(3, 'Field Access'),

  /// Storage
  storage(4, 'Storage'),

  /// Obstacle
  obstacle(5, 'Obstacle'),

  /// Guidance reference A
  guidanceReferenceA(6, 'Guidance Reference A'),

  /// Guidance reference B
  guidanceReferenceB(7, 'Guidance Reference B'),

  /// Guidance reference center
  guidanceReferenceCenter(8, 'Guidance Reference Center'),

  /// Guidance point, but not A, B or Center.
  guidancePoint(9, 'Guidance Point'),

  /// Partfield reference point
  partfieldReferencePoint(10, 'Partfield Reference Point'),

  /// Homebase
  homebase(11, 'Homebase');

  const PointType(this.value, this.description);

  /// Enum integer value.
  final int value;

  /// Short description of the value.
  final String description;
}

/// An SQL enum converter for [PointType].
class PointTypeConverter extends TypeConverter<PointType, int> {
  /// An SQL enum converter for [PointType].
  const PointTypeConverter();

  @override
  PointType fromSql(int fromDb) => PointType.values.firstWhere(
    (value) => value.value == fromDb,
    orElse: () => .other,
  );

  @override
  int toSql(PointType value) => value.value;
}
