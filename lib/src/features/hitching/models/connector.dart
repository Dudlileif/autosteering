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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart'
    show Equipment;
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart'
    show ArticulatedTractor, Vehicle;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geobase/geobase.dart';

part 'connector.freezed.dart';
part 'connector.g.dart';

/// A connector point on a [Hitchable].
@Freezed(fromJson: true, toJson: true)
abstract class Connector with _$Connector {
  /// A connector point on a [Hitchable].
  const factory Connector({
    /// The longitudinal offset from the reference point of the [Hitchable]
    /// parent.
    required double longitudinalOffsetFromRef,

    /// The lateral offset from the reference point of the [Hitchable].
    required double lateralOffsetFromRef,

    /// Which type of connector this is, i.e. fixed or drawbar/trailed.
    required ConnectorType type,

    /// Which relation this connector will have with another connector.
    required ConnectorRelation relation,

    /// The id of the parent [Vehicle].
    int? vehicleId,

    /// The id of the parent [Equipment].
    int? implementId,

    /// The local database id of this.
    int? id,

    /// The vertical offset from the reference point of the [Hitchable].
    @Default(0) double verticalOffsetFromRef,

    /// The angle of this relative to the normal forward direction.
    @Default(0) double angle,

    @DateTimeSerializer() DateTime? createdAt,
    @DateTimeSerializer() DateTime? lastUpdatedAt,
  }) = _Connector;

  const Connector._();

  /// Creates a [Connector] from the [json] object.
  factory Connector.fromJson(Map<String, dynamic> json) =>
      _$ConnectorFromJson(json);

  /// Creates a [Connector] from the database.
  factory Connector.fromDatabase({
    required double longitudinalOffsetFromRef,
    required double lateralOffsetFromRef,
    required ConnectorType type,
    required ConnectorRelation relation,
    int? vehicle,
    int? implement,
    int? id,
    double verticalOffsetFromRef = 0,
    double angle = 0,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
  }) => Connector(
    longitudinalOffsetFromRef: longitudinalOffsetFromRef,
    lateralOffsetFromRef: lateralOffsetFromRef,
    type: type,
    relation: relation,
    vehicleId: vehicle,
    implementId: implement,
    id: id,
    verticalOffsetFromRef: verticalOffsetFromRef,
    angle: angle,
    createdAt: createdAt,
    lastUpdatedAt: lastUpdatedAt,
  );

  /// The unique identifier of the parent [Hitchable].
  int get parentId => vehicleId ?? implementId!;

  /// The geographic position of this in relation to the [parent].
  Geographic position(Hitchable parent) {
    final (position, bearing) = switch (parent) {
      ArticulatedTractor(
        :final rearAxlePosition,
        :final bearing,
        :final rearAxleAngle,
      ) =>
        (
          rearAxlePosition,
          bearing + rearAxleAngle,
        ),
      Hitchable(:final position, :final bearing) => (position, bearing),
    };

    return position.rhumb
        .destinationPoint(
          distance: longitudinalOffsetFromRef,
          bearing: bearing,
        )
        .rhumb
        .destinationPoint(
          distance: lateralOffsetFromRef,
          bearing: bearing + 90,
        );
  }
}

/// Which type of connector a [Connector] is using to connect to it's parent.
enum ConnectorType {
  /// A three point hitch.
  fixed,

  /// A drawbar or similar articulating/trailed connector.
  drawbar,
}

/// Which relation a [Connector] will have with another [Connector].
enum ConnectorRelation {
  /// This is a parent that is connected to a child.
  parent,

  /// This is the child that is connected to a parent.
  child,
}
