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

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:collection/collection.dart';

/// A class that contains a setup for attached [Equipment]s that
/// can be saved and applied/attached to [Hitchable]s.
class EquipmentSetup {
  /// A class that contains a setup for attached [Equipment]s that
  /// can be saved and applied/attached to [Hitchable]s.
  EquipmentSetup({
    required this.name,
    this.children = const [],
    DateTime? lastUsed,
  }) : lastUsed = lastUsed ?? DateTime.now();

  /// Creates an [EquipmentSetup] from the [json] object.
  factory EquipmentSetup.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final lastUsed = DateTime.tryParse(json['last_used'] as String);

    final frontFixedChild = json['front_fixed_child'] != null
        ? (
            type: ConnectorType.fixed,
            angle: 0.0,
            child: Equipment.fromJson(
              Map<String, dynamic>.from(json['front_fixed_child'] as Map),
            ),
          )
        : null;

    final rearFixedChild = json['rear_fixed_child'] != null
        ? (
            type: ConnectorType.fixed,
            angle: 180.0,
            child: Equipment.fromJson(
              Map<String, dynamic>.from(json['rear_fixed_child'] as Map),
            ),
          )
        : null;

    final rearDrawbarChild = json['rear_drawbar_child'] != null
        ? (
            type: ConnectorType.drawbar,
            angle: 180.0,
            child: Equipment.fromJson(
              Map<String, dynamic>.from(json['rear_drawbar_child'] as Map),
            ),
          )
        : null;

    return EquipmentSetup(
      name: name,
      lastUsed: lastUsed,
      children: [?frontFixedChild, ?rearFixedChild, ?rearDrawbarChild],
    );
  }

  /// The name of the setup.
  String name;

  /// The [Hitchable] children of the setup.
  List<({ConnectorType type, double angle, Hitchable child})> children;

  /// The last time the setup was used/saved.
  DateTime lastUsed;

  /// Attaches the children of the setup to the [parent].
  void attachChildrenTo(Hitchable parent) {
    for (final (:child, :angle, :type) in children) {
      if (parent.availableParentConnectors.firstWhereOrNull(
            (connector) => connector.type == type && connector.angle == angle,
          )
          case final connector?) {
        parent.attachChild(
          child: child,
          childConnector: child.childConnectors.first,
          parentConnector: connector,
        );
      }
    }
  }

  /// Attempts to update [child] if it's in the hierarchy.
  bool updateChild(Hitchable child) {
    var updated = false;
    if (children.indexWhere(
          (connectedChild) =>
              connectedChild.child.id == child.id ||
              connectedChild.child.uuid == child.uuid,
        )
        case final index when index >= 0) {
      final existing = children[index];
      children.replaceRange(index, index + 1, [
        (
          type: existing.type,
          angle: existing.angle,
          child: child.copyWith(
            childConnections: existing.child.childConnections,
          ),
        ),
      ]);
      updated = true;
    }
    return updated;
  }

  /// Lists all the children attached and their children recursively.
  List<Hitchable> get allAttached => children
      .map((child) => [child.child, ...child.child.hitchChildrenRecursively])
      .flattenedToList;

  /// Converts the object to a json compatible structure.
  Map<String, dynamic> toJson() => {
    'name': name,
    'last_used': lastUsed.toIso8601String(),
    'front_fixed_child': children
        .where((child) => child.angle == 0 && child.type == .fixed)
        .firstOrNull
        ?.child
        .toJsonWithChildren(),
    'rear_fixed_child': children
        .where((child) => child.angle == 180 && child.type == .fixed)
        .firstOrNull
        ?.child
        .toJsonWithChildren(),
    'rear_drawbar_child': children
        .where((child) => child.angle == 180 && child.type == .drawbar)
        .firstOrNull
        ?.child
        .toJsonWithChildren(),
  };
}

/// An extension for getting the [EquipmentSetup] of the attached children
/// of a [Hitchable].
extension EquipmentSetupOfHitchable on Hitchable {
  /// Creates an [EquipmentSetup] for the attached children.
  ///
  /// The setup requires a [name].
  EquipmentSetup equipmentSetup(String name) => EquipmentSetup(
    name: name,
    children: childConnections
        .map(
          (connection) => (
            type: connection.parentConnector.type,
            angle: connection.parentConnector.angle,
            child: connection.child,
          ),
        )
        .toList(),
  );
}
