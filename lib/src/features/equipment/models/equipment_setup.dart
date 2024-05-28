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

  /// Attempts to update [child] if it's in the hierarchy.
  bool updateChild(Hitchable child) {
    var updated = false;
    if (frontFixedChild?.uuid == child.uuid) {
      frontFixedChild = child
        ..copyWith(
          hitchFrontFixedChild: frontFixedChild!.hitchFrontFixedChild,
          hitchRearFixedChild: frontFixedChild!.hitchRearFixedChild,
          hitchRearTowbarChild: frontFixedChild!.hitchRearTowbarChild,
        );
      updated = true;
    } else if (rearFixedChild?.uuid == child.uuid) {
      rearFixedChild = child
        ..copyWith(
          hitchFrontFixedChild: rearFixedChild!.hitchFrontFixedChild,
          hitchRearFixedChild: rearFixedChild!.hitchRearFixedChild,
          hitchRearTowbarChild: rearFixedChild!.hitchRearTowbarChild,
        );
      updated = true;
    } else if (rearTowbarChild?.uuid == child.uuid) {
      rearTowbarChild = child
        ..copyWith(
          hitchFrontFixedChild: rearTowbarChild!.hitchFrontFixedChild,
          hitchRearFixedChild: rearTowbarChild!.hitchRearFixedChild,
          hitchRearTowbarChild: rearTowbarChild!.hitchRearTowbarChild,
        );
      updated = true;
    } else {
      updated = (frontFixedChild?.updateChild(child) ?? false) ||
          (rearFixedChild?.updateChild(child) ?? false) ||
          (rearTowbarChild?.updateChild(child) ?? false);
    }
    return updated;
  }

  /// Lists all the children attached and their children recursively.
  List<Hitchable> get allAttached {
    final list = <Hitchable>[
      if (frontFixedChild != null) frontFixedChild!,
      if (rearFixedChild != null) rearFixedChild!,
      if (rearTowbarChild != null) rearTowbarChild!,
    ];

    return list;
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

/// An extension for getting the [EquipmentSetup] of the attached children
/// of a [Hitchable].
extension EquipmentSetupOfHitchable on Hitchable {
  /// Creates an [EquipmentSetup] for the attached children.
  ///
  /// The setup requires a [name].
  EquipmentSetup equipmentSetup(String name) => EquipmentSetup(
        name: name,
        frontFixedChild: hitchFrontFixedChild,
        rearFixedChild: hitchRearFixedChild,
        rearTowbarChild: hitchRearTowbarChild,
      );
}
