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

import 'dart:async';

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_control_providers.g.dart';

/// A provider for which [RemoteControlButtonAction]s the remote control buttons
/// shuld map to.
@Riverpod(keepAlive: true)
class RemoteControlButtonActions extends _$RemoteControlButtonActions {
  @override
  Map<int, RemoteControlButtonAction?> build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        if (const MapEquality<int, RemoteControlButtonAction?>()
            .equals(previous, next)) {
          ref.read(settingsProvider.notifier).update(
                SettingsKey.remoteControlButtonActions,
                next.map((key, value) => MapEntry('$key', value?.name)),
              );
        }
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getMap(SettingsKey.remoteControlButtonActions)
            ?.map(
              (key, value) => MapEntry(
                int.tryParse(key) ?? 0,
                RemoteControlButtonAction.values
                    .firstWhereOrNull((element) => element.name == value),
              ),
            ) ??
        {
          0: RemoteControlButtonAction.toggleEquipmentSections,
          1: RemoteControlButtonAction.toggleABSnap,
          2: RemoteControlButtonAction.toggleAutosteering,
        };
  }

  /// Updates [state] to [value].
  void update(Map<int, RemoteControlButtonAction?> value) =>
      Future(() => state = value);

  /// Updates the [action] for button [i].
  void updateButton(int i, RemoteControlButtonAction? action) => Future(
        () =>
            state = state..update(i, (value) => action, ifAbsent: () => action),
      );

  @override
  bool updateShouldNotify(
    Map<int, RemoteControlButtonAction?> previous,
    Map<int, RemoteControlButtonAction?> next,
  ) =>
      const MapEquality<int, RemoteControlButtonAction?>()
          .equals(previous, next);
}

/// A provider for sending the current state of the features corresponding of
/// the mapped [RemoteControlButtonActions] to the remote controller.
@riverpod
void sendRemoteControlLedState(SendRemoteControlLedStateRef ref) {
  if (ref.watch(remoteControlHardwareNetworkAliveProvider)) {
    final actions = ref.watch(remoteControlButtonActionsProvider);

    final states = <int>[];
    for (final action in actions.values) {
      if (action != null) {
        final state = switch (action) {
          RemoteControlButtonAction.toggleABSnap => ref.watch(
                displayABTrackingProvider.select((value) => value != null),
              ) &&
              ref.watch(aBSnapToClosestLineProvider),
          RemoteControlButtonAction.toggleAutosteering => ref.watch(
              activeAutosteeringStateProvider
                  .select((value) => value != AutosteeringState.disabled),
            ),
          RemoteControlButtonAction.toggleEquipmentSections => ref.watch(
              allEquipmentsProvider.select(
                (value) => value.values.any(
                  (element) =>
                      element.sections.any((element) => element.active),
                ),
              ),
            ),
        };
        states.add(state ? 1 : 0);
      } else {
        states.add(0);
      }
    }
    ref.read(simInputProvider.notifier).send((remoteControlLedState: states));
  }
}
