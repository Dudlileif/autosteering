import 'package:collection/collection.dart';
import 'package:latlong2/latlong.dart';
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
  frontFixed,

  /// The rear three point hitch.
  rearFixed,

  /// The rear towbar or similar articulating hitch.
  rearTowbar;
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
    this.name = 'No name',
    this.hitchParent,
    this.hitchFrontFixedChild,
    this.hitchRearFixedChild,
    this.hitchRearTowbarChild,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

  /// A unique identifier for every [Hitchable].
  final String uuid;

  /// The name/id of this.
  String name;

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
  LatLng get position;

  /// Update the position of this.
  set position(LatLng value);

  /// The heading/bearing of this in degrees.
  double get heading;

  /// Update the heading of this hitchable. [value] is in degrees.
  set heading(double value);

  /// The velocity of this hitchable in m/s.
  double get velocity;

  /// Update the velocity of this, [value] is in m/s.
  set velocity(double value);

  /// Whether or not the hitchable is reversing.
  bool get isReversing => velocity < 0;

  /// Attach a [child] hitchable (equipment) to this at the given [position].
  ///
  /// The [child] can be null to remove/detach at the given [position].
  void attachChild(
    Hitchable? child, [
    Hitch position = Hitch.rearFixed,
  ]) {
    switch (position) {
      case Hitch.frontFixed:
        hitchFrontFixedChild = child?..parentHitch = Hitch.frontFixed;

      case Hitch.rearFixed:
        hitchRearFixedChild = child?..parentHitch = Hitch.rearFixed;

      case Hitch.rearTowbar:
        hitchRearTowbarChild = child?..parentHitch = Hitch.rearTowbar;
    }
    updateChildren();
  }

  /// Recursively looks through the  connected children of this to find a
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

  /// A list of the currently attached children.
  List<Hitchable> get hitchChildren => [
        if (hitchFrontFixedChild != null) hitchFrontFixedChild!,
        if (hitchRearFixedChild != null) hitchRearFixedChild!,
        if (hitchRearTowbarChild != null) hitchRearTowbarChild!,
      ];

  /// The position of the front fixed hitch point, if there is one.
  LatLng? get hitchFrontFixedPoint;

  /// The position of the rear fixed hitch point, if there is one.
  LatLng? get hitchRearFixedPoint;

  /// The position of the rear towbar hitch point, if there is one.
  LatLng? get hitchRearTowbarPoint;

  /// The hitch positions of this that are not null.
  Iterable<LatLng> get hitchPoints => [
        hitchFrontFixedPoint,
        hitchRearFixedPoint,
        hitchRearTowbarPoint
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
  });
}
