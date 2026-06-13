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
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';
import 'package:uuid/uuid.dart';

/// Which type of hitch a [Hitchable] is using to connect to it's parent.
enum HitchType {
  /// A three point hitch.
  fixed,

  /// A drawbar or similar articulating hitch.
  drawbar,
}

/// Which position and hitch type a hitch is.
enum Hitch {
  /// The front three point hitch.
  frontFixed,

  /// The rear three point hitch.
  rearFixed,

  /// The rear drawbar or similar articulating hitch.
  rearDrawbar,
}

//?: make this sealed/final for vehicle and equipment

/// A class for making interfacing between vehicle and equipment easier by
/// giving them parent <-> children relations.
abstract class Hitchable {
  /// A class for making interfacing between vehicle and equipment easier by
  /// giving them parent <-> children relations.
  ///
  /// Give a [name] to make it easier to identify in the UI.
  /// If a [uuid] is not supplied, a new one will be generated.
  /// Set a [hitchParent] if this hitchable is a child/equipment attached to
  /// said parent.
  /// Attach [hitchFrontFixedChild], [hitchRearFixedChild] and/or
  /// [hitchRearDrawbarChild] to attach children to this hitchable.
  ///
  Hitchable({
    this.name,
    this.hitchParent,
    this.hitchFrontFixedChild,
    this.hitchRearFixedChild,
    this.hitchRearDrawbarChild,
    String? uuid,
    DateTime? lastUsed,
  }) : uuid = uuid ?? const Uuid().v4(),
       lastUsed = lastUsed ?? DateTime.now();

  /// A unique identifier for every [Hitchable].
  final String uuid;

  /// The name/id of this.
  String? name;

  /// The last time this was used.
  DateTime lastUsed;

  /// The parent of this, if there is one.
  Hitchable? hitchParent;

  /// Which position of the parent this is connected to.
  Hitch? parentHitch;

  /// The child of this front fixed hitch.
  Hitchable? hitchFrontFixedChild;

  /// The child of this rear fixed hitch.
  Hitchable? hitchRearFixedChild;

  /// The child of this rear drawbar hitch.
  Hitchable? hitchRearDrawbarChild;

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
  void attachChild(Hitchable child, [Hitch position = Hitch.rearFixed]) {
    child.runFunctionRecursively((hitchable) => hitchable.bearing = bearing);
    var childToAttach = child;

    final uuidAlreadyAttached = findChildRecursive(child.uuid);
    if (uuidAlreadyAttached != null &&
        uuidAlreadyAttached is Equipment &&
        childToAttach is Equipment) {
      final newSections = childToAttach.sections;
      for (final (index, section) in newSections.indexed) {
        newSections[index] = section.copyWith(
          active: uuidAlreadyAttached.sections
              .firstWhereOrNull((element) => element.index == section.index)
              ?.active,
        );
      }

      childToAttach = uuidAlreadyAttached.copyWith(
        decorationLength: childToAttach.decorationLength,
        decorationSidewaysOffset: childToAttach.decorationSidewaysOffset,
        decorationWidth: childToAttach.decorationWidth,
        drawbarLength: childToAttach.drawbarLength,
        sidewaysOffset: childToAttach.sidewaysOffset,
        workingAreaLength: childToAttach.workingAreaLength,
        lastUsed: childToAttach.lastUsed,
        name: childToAttach.name,
        hitchType: childToAttach.hitchType,
        sections: newSections,
      );
    }

    switch (position) {
      case Hitch.frontFixed:
        hitchFrontFixedChild = childToAttach..parentHitch = Hitch.frontFixed;

      case Hitch.rearFixed:
        hitchRearFixedChild = childToAttach..parentHitch = Hitch.rearFixed;

      case Hitch.rearDrawbar:
        hitchRearDrawbarChild = childToAttach..parentHitch = Hitch.rearDrawbar;
    }
    updateChildren(0);
  }

  /// Attach the [child] to the parent [Hitchable] with uuid [parentUuid] at
  /// the [position] hitch.
  void attachChildTo(
    String parentUuid,
    Hitchable child, [
    Hitch position = Hitch.rearFixed,
  ]) {
    var childToAttach = child;

    final uuidAlreadyAttached = findChildRecursive(child.uuid);
    if (uuidAlreadyAttached != null &&
        childToAttach is Equipment &&
        uuidAlreadyAttached is Equipment) {
      final newSections = childToAttach.sections;
      for (final (index, section) in newSections.indexed) {
        newSections[index] = section.copyWith(
          active: uuidAlreadyAttached.sections
              .firstWhereOrNull((element) => element.index == section.index)
              ?.active,
        );
      }

      childToAttach = uuidAlreadyAttached.copyWith(
        decorationLength: childToAttach.decorationLength,
        decorationSidewaysOffset: childToAttach.decorationSidewaysOffset,
        decorationWidth: childToAttach.decorationWidth,
        drawbarLength: childToAttach.drawbarLength,
        sidewaysOffset: childToAttach.sidewaysOffset,
        workingAreaLength: childToAttach.workingAreaLength,
        lastUsed: childToAttach.lastUsed,
        name: childToAttach.name,
        hitchType: childToAttach.hitchType,
        sections: newSections,
      );
    }

    if (uuid == parentUuid) {
      attachChild(childToAttach, position);
    } else {
      final foundChild = findChildRecursive(parentUuid);
      foundChild?.attachChild(childToAttach, position);
    }
  }

  /// Recursively looks through the connected children of this and itself to
  /// find a [Hitchable] with the given [uuid]. If there isn't one, null is
  /// returned.
  Hitchable? findChildRecursive(String uuid) {
    if (uuid == this.uuid) {
      return this;
    }
    for (final element in hitchChildren) {
      final recursiveChild = element.findChildRecursive(uuid);
      if (recursiveChild != null) {
        return recursiveChild;
      }
    }
    return null;
  }

  /// Update the [child] at the correct point/position in the hierarchy.
  bool updateChild(Hitchable child) {
    final foundChild = findChildRecursive(child.uuid);

    foundChild?.hitchParent?.attachChild(
      child.copyWith(
        hitchFrontFixedChild: foundChild.hitchFrontFixedChild,
        hitchRearFixedChild: foundChild.hitchRearFixedChild,
        hitchRearDrawbarChild: foundChild.hitchRearDrawbarChild,
      ),
      foundChild.parentHitch ?? Hitch.rearFixed,
    );
    return foundChild != null;
  }

  /// Detaches the child with the given [uuid] from the hierarchy.
  void detachChild(String uuid) {
    final foundChild = findChildRecursive(uuid);

    switch (foundChild?.parentHitch) {
      case Hitch.frontFixed:
        foundChild?.hitchParent?.hitchFrontFixedChild = null;
      case Hitch.rearFixed:
        foundChild?.hitchParent?.hitchRearFixedChild = null;

      case Hitch.rearDrawbar:
        foundChild?.hitchParent?.hitchRearDrawbarChild = null;
      case null:
    }
    foundChild?.hitchParent = null;
  }

  /// Detaches all children from the child with given [uuid] from the hierarchy.
  void detachAllFrom(String uuid) {
    final foundChild = findChildRecursive(uuid);

    foundChild?.hitchFrontFixedChild?.hitchParent = null;
    foundChild?.hitchFrontFixedChild = null;

    foundChild?.hitchRearFixedChild?.hitchParent = null;
    foundChild?.hitchRearFixedChild = null;

    foundChild?.hitchRearDrawbarChild?.hitchParent = null;
    foundChild?.hitchRearDrawbarChild = null;
  }

  /// A list of the directly attached children.
  List<Hitchable> get hitchChildren => [
    ?hitchFrontFixedChild,
    ?hitchRearFixedChild,
    ?hitchRearDrawbarChild,
  ];

  /// A list of the all the recursively attached children.
  List<Hitchable> get hitchChildrenRecursively => [
    if (hitchFrontFixedChild != null) ...[
      hitchFrontFixedChild!,
      ...hitchFrontFixedChild!.hitchChildrenRecursively,
    ],
    if (hitchRearFixedChild != null) ...[
      hitchRearFixedChild!,
      ...hitchRearFixedChild!.hitchChildrenRecursively,
    ],
    if (hitchRearDrawbarChild != null) ...[
      hitchRearDrawbarChild!,
      ...hitchRearDrawbarChild!.hitchChildrenRecursively,
    ],
  ];

  /// The position of the front fixed hitch point, if there is one.
  Geographic? get hitchFrontFixedPoint;

  /// The position of the rear fixed hitch point, if there is one.
  Geographic? get hitchRearFixedPoint;

  /// The position of the rear drawbar hitch point, if there is one.
  Geographic? get hitchRearDrawbarPoint;

  /// The hitch positions of this that are not null.
  Iterable<Geographic> get hitchPoints => [
    hitchFrontFixedPoint,
    hitchRearFixedPoint,
    hitchRearDrawbarPoint,
  ].nonNulls;

  /// The number of children recursively attached to this.
  int get numAttachedChildren => hitchChildren.fold(
    hitchChildren.length,
    (previousValue, element) => previousValue + element.numAttachedChildren,
  );

  /// Update the children connected to this.
  void updateChildren(double period) {
    hitchFrontFixedChild?.hitchParent = this;
    hitchFrontFixedChild?.lastUsed = lastUsed;
    hitchFrontFixedChild?.updateChildren(period);
    hitchRearFixedChild?.hitchParent = this;
    hitchRearFixedChild?.lastUsed = lastUsed;
    hitchRearFixedChild?.updateChildren(period);
    hitchRearDrawbarChild?.hitchParent = this;
    hitchRearDrawbarChild?.lastUsed = lastUsed;
    hitchRearDrawbarChild?.updateChildren(period);
  }

  /// Create a new [Hitchable] based on this one, but with parameters/variables
  /// changed.
  Hitchable copyWith({
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearDrawbarChild,
    String? name,
    String? uuid,
    DateTime? lastUsed,
  });

  /// Converts the object to a json compatible structure.
  Map<String, dynamic> toJson();

  /// Converts the object to a json compatible structure with all the
  /// connected children added recursively.
  Map<String, dynamic> toJsonWithChildren() {
    final map = toJson();

    map['children'] = {
      'front_fixed': hitchFrontFixedChild?.toJsonWithChildren(),
      'rear_fixed': hitchRearFixedChild?.toJsonWithChildren(),
      'rear_drawbar': hitchRearDrawbarChild?.toJsonWithChildren(),
    };

    return map;
  }
}
