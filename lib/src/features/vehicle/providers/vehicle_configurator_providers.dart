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

import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_configurator_providers.g.dart';

/// A provider for the index of the naviagtion rail of the vehicle configurator
/// dialog.
@Riverpod(keepAlive: true)
class VehicleConfiguratorIndex extends _$VehicleConfiguratorIndex {
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
/// [VehicleConfigurator].
@riverpod
class VehicleConfiguratorPageController
    extends _$VehicleConfiguratorPageController {
  static const _animationDuration = Durations.long4;
  static const _animationCurve = Curves.easeInOutCubicEmphasized;

  @override
  Raw<PageController> build() => PageController(
      initialPage: ref.read(vehicleConfiguratorIndexProvider),
    )..addListener(() {
        ref
            .read(vehicleConfiguratorIndexProvider.notifier)
            .update((state.page ?? 0).round());
      });
  
  

  /// Animates to the [index] page with [_animationDuration] and
  /// [_animationCurve].
  Future<void> animateToPage(int index) => state
      .animateToPage(
        index,
        duration: _animationDuration,
        curve: _animationCurve,
      )
      ;

  /// Animates to the next page with [_animationDuration] and [_animationCurve].
  Future<void> nextPage() => state
      .nextPage(
        duration: _animationDuration,
        curve: _animationCurve,
      )
      ;

  /// Animates to the previous page with [_animationDuration] and
  /// [_animationCurve].
  Future<void> previousPage() => state
      .previousPage(
        duration: _animationDuration,
        curve: _animationCurve,
      )
    ;
}

/// A provider for the vehicle from the configurator.
@Riverpod(keepAlive: true)
class ConfiguredVehicle extends _$ConfiguredVehicle {
  @override
  Vehicle build() => ref.read(mainVehicleProvider);

  /// Update the [state] to [vehicle].
  void update(Vehicle vehicle) => Future(() => state = vehicle);

  /// Updates the vehicle's name to [name].
  void updateName(String? name) =>
      Future(() => state = state.copyWith(name: name));
}

/// A provider for the [TextEditingController] for the name in the
/// vehicle configurator.
@Riverpod(keepAlive: true)
class ConfiguredVehicleNameTextController
    extends _$ConfiguredVehicleNameTextController {
  @override
  Raw<TextEditingController> build() {
    final controller = TextEditingController(
      text: ref.read(configuredVehicleProvider.select((value) => value.name)),
    );

    controller.addListener(() {
      ref.read(configuredVehicleProvider.notifier).updateName(controller.text);
    });

    return controller;
  }
}
