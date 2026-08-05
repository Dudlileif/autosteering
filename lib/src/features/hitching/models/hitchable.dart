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
import 'package:autosteering/src/features/vehicle/models/models.dart';
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';
import 'package:uuid/uuid.dart';

//?: make this sealed/final for vehicle and equipment

/// A class for making interfacing between vehicle and equipment easier by
/// giving them parent <-> children relations.
abstract class Hitchable {
  /// A class for making interfacing between vehicle and equipment easier by
  /// giving them parent <-> children relations.
  ///
  /// Give a [name] to make it easier to identify in the UI.
  /// If a [uuid] is not supplied, a new one will be generated.
  Hitchable({
    this.name,
    this.connectors = const [],
    this.childConnections = const [],
    this.id,
    @Deprecated('To be removed') String? uuid,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
  }) : uuid = uuid ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now(),
       lastUpdatedAt = lastUpdatedAt ?? DateTime.now();

  /// Local database id;
  final int? id;

  /// A unique identifier for every [Hitchable].
  @Deprecated('To be removed')
  String? uuid;

  /// The name/id of this.
  String? name;

  /// Creation time of this.
  DateTime createdAt;

  /// Last time this was updated.
  DateTime lastUpdatedAt;

  /// The connectors on this.
  List<Connector> connectors;

  /// The current [Connection]s on this for connected child [Equipment]s.
  List<Connection> childConnections;

  /// The connectors on this that can be the parent in [Connection]s.
  List<Connector> get parentConnectors =>
      connectors.where((c) => c.relation == .parent).toList();

  /// The connectors on this that can be the child in [Connection]s.
  List<Connector> get childConnectors =>
      connectors.where((c) => c.relation == .child).toList();

  /// Available [parentConnectors] that are not connected to an child
  /// [Equipment] in [connectors].
  List<Connector> get availableParentConnectors => parentConnectors
      .where(
        (connector) => childConnections.none(
          (connectedConnector) =>
              connector == connectedConnector.parentConnector,
        ),
      )
      .toList();

  /// Available [childConnectors] that are not connected to a parent [Hitchable]
  /// in [connectors]
  List<Connector> get availableChildConnectors => childConnectors
      .where(
        (connector) => childConnections.none(
          (connectedConnector) =>
              connector == connectedConnector.childConnector,
        ),
      )
      .toList();

  /// The position of this hitchable.
  Geographic get position;

  /// Update the position of this.
  set position(Geographic value);

  /// The bearing/bearing of this in degrees.
  double get bearing;

  /// Update the bearing of this hitchable. [value] is in degrees.
  set bearing(double value);

  /// The velocity of this hitchable in m/s.
  double get velocity;

  /// Update the velocity of this, [value] is in m/s.
  set velocity(double value);

  /// Whether or not the hitchable is reversing.
  bool get isReversing => velocity < 0;

  /// The current turning radius of this.
  double? get currentTurningRadius;

  /// The center point of which the [currentTurningRadius] revolves around.
  Geographic? get turningRadiusCenter;

  /// Run the given [function] on this and all of its children recursively.
  ///
  /// Mainly used to update a Map of equipments in a provider.
  void runFunctionRecursively(void Function(Hitchable hitchable) function) {
    function(this);
    for (final element in hitchChildren) {
      function(element);
      element.runFunctionRecursively(function);
    }
  }

  /// Attach a [child] hitchable (equipment) to this at the given [position].
  void attachChild({
    required Hitchable child,
    required Connector childConnector,
    required Connector parentConnector,
  }) {
    child.runFunctionRecursively((hitchable) => hitchable.bearing = bearing);
    var childToAttach = child as Equipment;

    final uuidAlreadyAttached = findChildRecursive(child.id);
    if (uuidAlreadyAttached != null) {
      final newSections = childToAttach.sections;
      for (final (index, section) in newSections.indexed) {
        newSections[index] = section.copyWith(
          active: uuidAlreadyAttached.sections
              .firstWhereOrNull((element) => element.index == section.index)
              ?.active,
        );
      }

      childToAttach = uuidAlreadyAttached.copyWith(
        name: childToAttach.name,
        sections: newSections,
      )..parentConnection = null;
      childConnections.removeWhere(
        (connection) =>
            connection.child.uuid == childToAttach.uuid &&
            connection.parent.uuid == uuid,
      );
    }
    final connection = Connection(
      child: childToAttach,
      childConnector: childConnector,
      parent: this,
      parentConnector: parentConnector,
    );
    childConnections.add(connection);
    childToAttach.parentConnection = connection;
    updateChildren(0);
  }

  /// Attach the [child] to the parent [Hitchable] with uuid [parentId] at
  /// the [position] hitch.
  void attachChildTo({
    required int parentId,
    required Hitchable child,
    required Connector childConnector,
    required Connector parentConnector,
    bool parentIsVehicle = false,
  }) {
    var childToAttach = child;

    final idAlreadyAttached = findChildRecursive(child.id);
    if (idAlreadyAttached != null && childToAttach is Equipment) {
      final newSections = childToAttach.sections;
      for (final (index, section) in newSections.indexed) {
        newSections[index] = section.copyWith(
          active: idAlreadyAttached.sections
              .firstWhereOrNull((element) => element.index == section.index)
              ?.active,
        );
      }

      childToAttach = idAlreadyAttached.copyWith(
        name: childToAttach.name,
        sections: newSections,
      );
    }

    final idIsThis = switch (this) {
      Vehicle(:final id) when id == parentId && parentIsVehicle => true,
      Equipment(:final id) when id == parentId && !parentIsVehicle => true,
      _ => false,
    };

    if (idIsThis) {
      attachChild(
        child: childToAttach,
        childConnector: childConnector,
        parentConnector: parentConnector,
      );
    } else {
      final foundChild = findChildRecursive(parentId);
      foundChild?.attachChild(
        child: childToAttach,
        childConnector: childConnector,
        parentConnector: parentConnector,
      );
    }
  }

  /// Recursively looks through the connected children of this and itself to
  /// find an [Equipment] with the given [id]. If there isn't one, null is
  /// returned.
  Equipment? findChildRecursive(int? id) {
    if (this case final Equipment equipment when equipment.id == id) {
      return equipment;
    }
    for (final connection in childConnections) {
      final recursiveChild = connection.child.findChildRecursive(id);
      if (recursiveChild != null) {
        return recursiveChild;
      }
    }
    return null;
  }

  /// Update the [child] at the correct point/position in the hierarchy.
  bool updateChild(Hitchable child) {
    final foundChild = findChildRecursive(child.id);

    if (foundChild?.parentConnection case final Connection connection) {
      connection.parent.attachChild(
        child: child,
        childConnector: connection.childConnector,
        parentConnector: connection.parentConnector,
      );
    }
    return foundChild != null;
  }

  /// Detaches the child with the given [id] from the hierarchy.
  void detachChild(int? id) {
    final foundChild = findChildRecursive(id);
    foundChild?.parentConnection?.parent.childConnections.removeWhere(
      (connection) => connection.child.id == id,
    );
    foundChild?.parentConnection = null;
  }

  /// Detaches all children from the child with given [uuid] from the hierarchy.
  void detachAllFrom(int? id, {bool isVehicle = false}) {
    final foundChild = switch (this) {
      Vehicle(id: final vehicleId) when isVehicle && vehicleId == id => this,
      Equipment(id: final equipmentId) when !isVehicle && equipmentId == id =>
        this,
      _ => findChildRecursive(id),
    };

    foundChild?.childConnections.forEach((c) {
      c.child.parentConnection = null;
    });
    foundChild?.childConnections = [];
  }

  /// A list of the directly attached children.
  List<Hitchable> get hitchChildren =>
      childConnections.map((e) => e.child).toList();

  /// A list of the all the recursively attached children.
  List<Hitchable> get hitchChildrenRecursively => [
    ...childConnections
        .map(
          (c) => [c.child, ...c.child.hitchChildrenRecursively],
        )
        .flattened,
  ];

  /// The connection positions of equipment connections.
  Iterable<Geographic> get connectionPoints =>
      childConnections.map((c) => c.connectionPoint);

  /// The connector positions of connectors.
  Iterable<Geographic> get connectorPoints => connectors.map(
    (c) => c.position(this),
  );

  /// The number of children recursively attached to this.
  int get numAttachedChildren => hitchChildren.fold(
    hitchChildren.length,
    (previousValue, element) => previousValue + element.numAttachedChildren,
  );

  /// Update the children connected to this.
  void updateChildren(double period) {
    childConnections = childConnections.map((c) {
      final connection = c.copyWith(
        parent: this,
        child: c.child,
      );
      connection.child.updateChildren(period);
      return connection;
    }).toList();
  }

  /// Create a new [Hitchable] based on this one, but with parameters/variables
  /// changed.
  Hitchable copyWith({
    List<Connector>? connectors,
    List<Connection>? childConnections,
    String? name,
    String? uuid,
  });

  /// Converts the object to a json compatible structure.
  Map<String, dynamic> toJson();

  /// Converts the object to a json compatible structure with all the
  /// connected children added recursively.
  Map<String, dynamic> toJsonWithChildren() {
    final map = toJson();

    map['connections'] = childConnections
        .map(
          (c) => {
            'child': c.child.toJson(),
            'childConnector': c.childConnector.toJson(),
            'parent': c.parent.toJson(),
            'parentConnector': c.parentConnector.toJson(),
          },
        )
        .toList();

    return map;
  }
}
