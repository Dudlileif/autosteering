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

/// A provider for creating a [PageController] for using throughout the
/// [EquipmentConfigurator].
@riverpod
class EquipmentConfiguratorPageController
    extends _$EquipmentConfiguratorPageController {
  static const _animationDuration = Duration(milliseconds: 250);
  static const _animationCurve = Curves.slowMiddle;

  @override
  Raw<PageController> build() {
    final controller = PageController(
      initialPage: ref.read(equipmentConfiguratorIndexProvider),
    )..addListener(() {
        ref
            .read(equipmentConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round());
      });
    return controller;
  }

  /// Animates to the [index] page with [_animationDuration] and
  /// [_animationCurve].
  Future<void> animateToPage(int index) => state
      .animateToPage(
        index,
        duration: _animationDuration,
        curve: _animationCurve,
      )
      .then(
        (value) => ref
            .read(equipmentConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round()),
      );

  /// Animates to the next page with [_animationDuration] and [_animationCurve].
  Future<void> nextPage() => state
      .nextPage(
        duration: _animationDuration,
        curve: _animationCurve,
      )
      .then(
        (value) => ref
            .read(equipmentConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round()),
      );

  /// Animates to the previous page with [_animationDuration] and
  /// [_animationCurve].
  Future<void> previousPage() => state
      .previousPage(
        duration: _animationDuration,
        curve: _animationCurve,
      )
      .then(
        (value) => ref
            .read(equipmentConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round()),
      );
}

/// A provider for the vehicle from the configurator.
@Riverpod(keepAlive: true)
class ConfiguredEquipment extends _$ConfiguredEquipment {
  @override
  Equipment build() => Equipment(hitchType: HitchType.fixed);

  /// Update the [state] to [equipment].
  void update(Equipment equipment) => Future(() => state = equipment);

  /// Updates the vehicle's name to [name].
  void updateName(String? name) =>
      Future(() => state = state.copyWith(name: name));
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
