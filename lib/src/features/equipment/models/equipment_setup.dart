import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:equatable/equatable.dart';

/// A class that contains a setup for attached [Equipment]s that
/// can be saved and applied/attached to [Hitchable]s.
class EquipmentSetup with EquatableMixin {
  /// A class that contains a setup for attached [Equipment]s that
  /// can be saved and applied/attached to [Hitchable]s.
  EquipmentSetup({
    required this.name,
    this.frontFixedChild,
    this.rearFixedChild,
    this.rearTowbarChild,
    DateTime? lastUsed,
  }) : lastUsed = lastUsed ?? DateTime.now();

  /// Creates an [EquipmentSetup] from the [json] object.
  factory EquipmentSetup.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final lastUsed = DateTime.tryParse(json['last_used'] as String);

    final frontFixedChild = json['front_fixed_child'] != null
        ? Equipment.fromJson(
            Map<String, dynamic>.from(json['front_fixed_child'] as Map),
          )
        : null;

    final rearFixedChild = json['rear_fixed_child'] != null
        ? Equipment.fromJson(
            Map<String, dynamic>.from(json['rear_fixed_child'] as Map),
          )
        : null;

    final rearTowbarChild = json['rear_towbar_child'] != null
        ? Equipment.fromJson(
            Map<String, dynamic>.from(json['rear_towbar_child'] as Map),
          )
        : null;

    return EquipmentSetup(
      name: name,
      lastUsed: lastUsed,
      frontFixedChild: frontFixedChild,
      rearFixedChild: rearFixedChild,
      rearTowbarChild: rearTowbarChild,
    );
  }

  /// The name of the setup.
  String name;

  /// The front fixed [Hitchable] of the setup.
  Hitchable? frontFixedChild;

  /// The rear fixed [Hitchable] of the setup.
  Hitchable? rearFixedChild;

  /// The rear towbar [Hitchable] of the setup.
  Hitchable? rearTowbarChild;

  /// The last time the setup was used/saved.
  DateTime lastUsed;

  /// Attaches the children of the setup to the [parent].
  void attachChildrenTo(Hitchable parent) {
    if (frontFixedChild != null) {
      parent.attachChild(frontFixedChild!, Hitch.frontFixed);
    }
    if (rearFixedChild != null) {
      parent.attachChild(rearFixedChild!);
    }
    if (rearTowbarChild != null) {
      parent.attachChild(rearTowbarChild!, Hitch.rearTowbar);
    }
  }

  /// Converts the object to a json compatible structure.
  Map<String, dynamic> toJson() => {
        'name': name,
        'last_used': lastUsed.toIso8601String(),
        'front_fixed_child': frontFixedChild?.toJsonWithChildren(),
        'rear_fixed_child': rearFixedChild?.toJsonWithChildren(),
        'rear_towbar_child': rearTowbarChild?.toJsonWithChildren(),
      };

  @override
  List<Object?> get props => [
        name,
        frontFixedChild,
        rearFixedChild,
        rearTowbarChild,
        lastUsed,
      ];
}
