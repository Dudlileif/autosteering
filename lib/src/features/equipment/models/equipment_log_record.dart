// Copyright (C) 2024 Gaute Hagen
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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipment_log_record.freezed.dart';
part 'equipment_log_record.g.dart';

/// A log record for logging the equipment's position  and active state at the
/// given time.
@freezed
class EquipmentLogRecord with _$EquipmentLogRecord {
  /// A log record for logging the equipment's position [wayPoint] and active
  /// state [activeSections] at the given [time] stamp.
  const factory EquipmentLogRecord({
    /// Time stamp of this.
    @DateTimeSerializer() required DateTime time,

    /// List of the section indices for the active sections only.
    required List<int> activeSections,

    /// [WayPoint] for position and bearing of the equipment.
    required WayPoint wayPoint,
  }) = _EquipmentLogRecord;

  /// Creates an [EquipmentLogRecord] from the [json] object.
  factory EquipmentLogRecord.fromJson(Map<String, Object?> json) =>
      _$EquipmentLogRecordFromJson(json);
}
