import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';
import 'package:uuid/uuid.dart';

/// Which type of hitch a [Hitchable] is using to connect to it's parent.
enum HitchType {
  /// A three point hitch.
  fixed,

  /// A towbar or similar articulating hitch.
  towbar,
}

/// Which position and hitch type a hitch is.
enum Hitch {
  /// The front three point hitch.
  frontFixed('Front fixed'),

  /// The rear three point hitch.
  rearFixed('Rear fixed'),

  /// The rear towbar or similar articulating hitch.
  rearTowbar('Rear towbar');

  const Hitch(this.name);

  /// The name of this enumeration value.
  final String name;
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
  /// [hitchRearTowbarChild] to attach children to this hitchable.
  ///
  Hitchable({
    this.name,
    this.hitchParent,
    this.hitchFrontFixedChild,
    this.hitchRearFixedChild,
    this.hitchRearTowbarChild,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

  /// A unique identifier for every [Hitchable].
  final String uuid;

  /// The name/id of this.
  String? name;

  /// The parent of this, if there is one.
  Hitchable? hitchParent;

  /// Which position of the parent this is connected to.
  Hitch? parentHitch;

  /// The child of this front fixed hitch.
  Hitchable? hitchFrontFixedChild;

  /// The child of this rear fixed hitch.
  Hitchable? hitchRearFixedChild;

  /// The child of this rear towbar hitch.
  Hitchable? hitchRearTowbarChild;

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

  /// Attach a [child] hitchable (equipment) to this at the given [position].
  void attachChild(
    Hitchable child, [
    Hitch position = Hitch.rearFixed,
  ]) {
    var childToAttach = child;

    final uuidAlreadyAttached = findChildRecursive(child.uuid);
    if (uuidAlreadyAttached != null) {
      childToAttach = child.copyWith(uuid: const Uuid().v4());
    }

    switch (position) {
      case Hitch.frontFixed:
        hitchFrontFixedChild = childToAttach..parentHitch = Hitch.frontFixed;

      case Hitch.rearFixed:
        hitchRearFixedChild = childToAttach..parentHitch = Hitch.rearFixed;

      case Hitch.rearTowbar:
        hitchRearTowbarChild = childToAttach..parentHitch = Hitch.rearTowbar;
    }
    updateChildren();
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
    if (uuidAlreadyAttached != null) {
      childToAttach = child.copyWith(uuid: const Uuid().v4());
    }

    if (uuid == parentUuid) {
      attachChild(childToAttach, position);
    } else {
      final foundChild = findChildRecursive(parentUuid);
      foundChild?.attachChild(childToAttach, position);
    }
  }

  /// Recursively looks through the connected children of this to find a
  /// [Hitchable] with the given [uuid]. If there isn't one, null is returned.
  Hitchable? findChildRecursive(String uuid) {
    for (final element in hitchChildren) {
      if (element.uuid == uuid) {
        return element;
      }
      final recursiveChild = element.findChildRecursive(uuid);
      if (recursiveChild != null) {
        return recursiveChild;
      }
    }
    return null;
  }

  /// Update the [child] at the correct point/position in the hierarchy.
  void updateChild(Hitchable child) {
    final foundChild = findChildRecursive(child.uuid);

    foundChild?.hitchParent?.attachChild(
      child.copyWith(
        hitchFrontFixedChild: foundChild.hitchFrontFixedChild,
        hitchRearFixedChild: foundChild.hitchRearFixedChild,
        hitchRearTowbarChild: foundChild.hitchRearTowbarChild,
      ),
      foundChild.parentHitch ?? Hitch.rearFixed,
    );
  }

  /// Detaches the child with the given [uuid] from the hierarchy.
  void detachChild(String uuid) {
    final foundChild = findChildRecursive(uuid);

    switch (foundChild?.parentHitch) {
      case Hitch.frontFixed:
        foundChild?.hitchParent?.hitchFrontFixedChild = null;
      case Hitch.rearFixed:
        foundChild?.hitchParent?.hitchRearFixedChild = null;

      case Hitch.rearTowbar:
        foundChild?.hitchParent?.hitchRearTowbarChild = null;
      case null:
    }
    foundChild?.hitchParent = null;
  }

  /// A list of the currently attached children.
  List<Hitchable> get hitchChildren => [
        if (hitchFrontFixedChild != null) hitchFrontFixedChild!,
        if (hitchRearFixedChild != null) hitchRearFixedChild!,
        if (hitchRearTowbarChild != null) hitchRearTowbarChild!,
      ];

  /// The position of the front fixed hitch point, if there is one.
  Geographic? get hitchFrontFixedPoint;

  /// The position of the rear fixed hitch point, if there is one.
  Geographic? get hitchRearFixedPoint;

  /// The position of the rear towbar hitch point, if there is one.
  Geographic? get hitchRearTowbarPoint;

  /// The hitch positions of this that are not null.
  Iterable<Geographic> get hitchPoints => [
        hitchFrontFixedPoint,
        hitchRearFixedPoint,
        hitchRearTowbarPoint,
      ].whereNotNull();

  /// Update the children connected to this.
  void updateChildren() {
    hitchFrontFixedChild
      ?..hitchParent = this
      ..updateChildren();
    hitchRearFixedChild
      ?..hitchParent = this
      ..updateChildren();
    hitchRearTowbarChild
      ?..hitchParent = this
      ..updateChildren();
  }

  /// Create a new [Hitchable] based on this one, but with parameters/variables
  /// changed.
  Hitchable copyWith({
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    String? name,
    String? uuid,
  });
}
