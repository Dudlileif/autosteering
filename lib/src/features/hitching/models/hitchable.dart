import 'package:latlong2/latlong.dart';

/// A class for making interfacing between vehicle and equipment easier by
/// giving them parent <-> children relations.
abstract class Hitchable {
  const Hitchable({
    this.hitchParent,
    this.hitchFrontFixedChild,
    this.hitchRearFixedChild,
    this.hitchRearTowbarChild,
  });

  /// The parent of this hitch.
  final Hitchable? hitchParent;

  /// The child of this front fixed hitch.
  final Hitchable? hitchFrontFixedChild;

  /// The child of this rear fixed hitch.
  final Hitchable? hitchRearFixedChild;

  /// The child of this rear towbar hitch.
  final Hitchable? hitchRearTowbarChild;

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

  Hitchable copyWith({
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
  });
}
