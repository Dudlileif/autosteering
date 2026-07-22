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

import 'dart:ui' show Color;

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/database/database.dart';
import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:drift/drift.dart';

/// A table for sections of an [Implement].
@UseRowClass(Section, constructor: 'fromDatabase')
class Sections extends Table {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// Reference to the parent [Implement].
  @ReferenceName('sectionImplement')
  late final Column<int> implement = integer().references(
    Implements,
    #id,
  )();

  /// Longitudinal offset from the reference point. Positive means ahead and
  /// negative behind.
  late final Column<double> longitudinalOffset = real()();

  /// Lateral offset from the reference point. Positive means to the right and
  /// negative to the left.
  late final Column<double> lateralOffset = real()();

  /// The widt of this, in meters.
  late final Column<double> width = real()();

  /// The working width of this, in meters.
  late final Column<double> workingWidth = real()();

  /// The length of this, in meters.
  late final Column<double> length = real()();

  /// Whether this should use automated activation.
  late final Column<bool> automateActivation = boolean().withDefault(
    const Constant(false),
  )();

  /// The display color of this.
  late final Column<String> color = text()
      .map(const ColorConverter())
      .nullable()();

  /// The color of paths worked by this.
  late final Column<String> workedPathColor = text()
      .map(const ColorConverter())
      .nullable()();

  /// When this was created.
  late final Column<DateTime> createdAt = dateTime().clientDefault(
    DateTime.now,
  )();

  /// When this was last updated.
  late final Column<DateTime> lastUpdatedAt = dateTime().nullable()();
}

/// An SQL converter for [Color].
class ColorConverter extends TypeConverter<Color, String> {
  /// An SQL converter for [Color].
  const ColorConverter();

  @override
  Color fromSql(String fromDb) => const ColorSerializer().fromJson(fromDb);

  @override
  String toSql(Color value) => const ColorSerializer().toJson(value);
}

/// Extension with getters for ids for use with database inserts/extractions.
extension SectionImplement on Section {
  /// Same as [implementId].
  int? get implement => implementId;
}
