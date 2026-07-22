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

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';

/// A connection class for binding child [Equipment] and parent [Hitchable]s
/// with their respective [Connector]s.
class Connection {
  /// A connection class for binding child [Equipment] and parent [Hitchable]s
  /// with their respective [Connector]s.
  const Connection({
    required this.child,
    required this.childConnector,
    required this.parent,
    required this.parentConnector,
  });

  /// The child [Equipment] of this connection relation.
  final Equipment child;

  /// The connector on the child.
  final Connector childConnector;

  /// The parent [Hitchable] of this connection relation.
  final Hitchable parent;

  /// The connector on the parent.
  final Connector parentConnector;

  /// The geographic point of this connection.
  Geographic get connectionPoint => parent.position.rhumb
      .destinationPoint(
        distance: parentConnector.longitudinalOffsetFromRef,
        bearing: parent.bearing,
      )
      .rhumb
      .destinationPoint(
        distance: parentConnector.lateralOffsetFromRef,
        bearing: parent.bearing + 90,
      );

  /// The geographic reference point of the [child].
  Geographic get childRefPosition => connectionPoint.rhumb
      .destinationPoint(
        distance: childConnector.longitudinalOffsetFromRef,
        bearing: child.bearing + 180,
      )
      .rhumb
      .destinationPoint(
        distance: childConnector.lateralOffsetFromRef,
        bearing: child.bearing + 90,
      );

  /// The bearing of the [child], as calculated form the parent bearing and
  /// connector angles.
  double get childBearing => switch ((parent, parentConnector)) {
    (
      ArticulatedTractor(:final frontAxleAngle),
      Connector(longitudinalOffsetFromRef: > 0),
    ) =>
      frontAxleAngle + parentConnector.angle - childConnector.angle - 180,
    (
      ArticulatedTractor(:final rearAxleAngle),
      Connector(longitudinalOffsetFromRef: <= 0),
    ) =>
      (rearAxleAngle + parentConnector.angle - childConnector.angle - 180),
    _ => parent.bearing + parentConnector.angle - childConnector.angle - 180,
  }.wrap360();

  /// Returns a new instance of this, with some parameters altered.
  Connection copyWith({
    Equipment? child,
    Connector? childConnector,
    Hitchable? parent,
    Connector? parentConnector,
  }) => Connection(
    child: child ?? this.child,
    childConnector: childConnector ?? this.childConnector,
    parent: parent ?? this.parent,
    parentConnector: parentConnector ?? this.parentConnector,
  );
}
