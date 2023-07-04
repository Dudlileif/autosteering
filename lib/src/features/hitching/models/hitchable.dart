import 'package:latlong2/latlong.dart';

/// A class for making interfacing between vehicle and equipment easier by
/// giving them parent <-> children relations.
abstract class Hitchable {
  Hitchable({
    this.name = 'No name',
    this.hitchParent,
    this.hitchFrontFixedChild,
    this.hitchRearFixedChild,
    this.hitchRearTowbarChild,
  });

  /// The parent of this, if there is one.
  Hitchable? hitchParent;

  /// The child of this front fixed hitch.
  Hitchable? hitchFrontFixedChild;

  /// The child of this rear fixed hitch.
  Hitchable? hitchRearFixedChild;

  /// The child of this rear towbar hitch.
  Hitchable? hitchRearTowbarChild;

  /// The name/id of this.
  String name;

  /// A list of the currently attached children.
  List<Hitchable> get hitchChildren => [
        if (hitchFrontFixedChild != null) hitchFrontFixedChild!,
        if (hitchRearFixedChild != null) hitchRearFixedChild!,
        if (hitchRearTowbarChild != null) hitchRearTowbarChild!,
      ];

  /// The position of the front fixed hitch point, if there is one.
  LatLng? get hitchFrontFixedPosition;

  /// The position of the rear fixed hitch point, if there is one.
  LatLng? get hitchRearFixedPosition;

  /// The position of the rear towbar hitch point, if there is one.
  LatLng? get hitchRearTowbarPosition;

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

  Hitchable copyWith({
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    String? name,
  });
}
