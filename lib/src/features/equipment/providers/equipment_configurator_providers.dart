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
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'equipment_configurator_providers.g.dart';

/// A provider for the index of the naviagtion rail of the equipment
/// configurator dialog.
@Riverpod(keepAlive: true)
class EquipmentConfiguratorIndex extends _$EquipmentConfiguratorIndex {
  @override
  int build() => 0;

  /// Updates the [state] to [value].
  void update(int value) => Future(() => state = value);

  /// Increase [state] by 1.
  void increase() => update(state + 1);

  /// Decrease [state] by 1.
  void decrease() => update(state - 1);
}

/// A provider for the vehicle from the configurator.
@Riverpod(keepAlive: true)
class ConfiguredEquipment extends _$ConfiguredEquipment {
  @override
  Equipment build() => Equipment(hitchType: HitchType.fixed);

  /// Update the [state] to [equipment].
  void update(Equipment equipment) => Future(() => state = equipment);

  /// Updates the equipment's name to [name].
  void updateName(String? name) =>
      Future(() => state = state.copyWith(name: name));

  /// Updates the equipment's [section].
  void updateSection(Section section) => Future(
        () => state = state.copyWith(
          sections: state.sections
            ..replaceRange(
              section.index,
              section.index + 1,
              [section],
            ),
        ),
      );
}

/// A provider for the [TextEditingController] for the name in the
/// equipment configurator.
@Riverpod(keepAlive: true)
class ConfiguredEquipmentNameTextController
    extends _$ConfiguredEquipmentNameTextController {
  @override
  Raw<TextEditingController> build() {
    final controller = TextEditingController(
      text: ref.read(configuredEquipmentProvider.select((value) => value.name)),
    );

    controller.addListener(() {
      ref
          .read(configuredEquipmentProvider.notifier)
          .updateName(controller.text);
    });

    return controller;
  }
}

/// A provider for whether the configured equipment sections should have equal
/// widths.
@riverpod
class ConfiguredEquipmentEqualWidths extends _$ConfiguredEquipmentEqualWidths {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null && !previous && next) {
        final equipment = ref.read(configuredEquipmentProvider);
        ref.read(configuredEquipmentProvider.notifier).update(
              equipment.copyWith(
                sections: equipment.sections
                    .map(
                      (section) => section.copyWith(
                        width: equipment.sections.first.width,
                      ),
                    )
                    .toList(),
              ),
            );
      }
    });

    return ref.read(
      configuredEquipmentProvider.select(
        (value) =>
            value.sections.isNotEmpty &&
            value.sections.every(
              (element) => element.width == value.sections.first.width,
            ),
      ),
    );
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for whether the configured equipment sections should have equal
/// working widths.
@riverpod
class ConfiguredEquipmentEqualWorkingWidths
    extends _$ConfiguredEquipmentEqualWorkingWidths {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null && !previous && next) {
        final equipment = ref.read(configuredEquipmentProvider);

        ref.read(configuredEquipmentProvider.notifier).update(
              equipment.copyWith(
                sections: equipment.sections
                    .map(
                      (section) => section.copyWith(
                        workingWidth: equipment.sections.first.workingWidth,
                      ),
                    )
                    .toList(),
              ),
            );
      }
    });

    return ref.read(
      configuredEquipmentProvider.select(
        (value) =>
            value.sections.isNotEmpty &&
            value.sections.every(
              (element) =>
                  element.workingWidth == value.sections.first.workingWidth,
            ),
      ),
    );
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}
