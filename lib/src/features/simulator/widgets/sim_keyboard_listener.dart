// Copyright (C) 2026 Gaute Hagen
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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

/// A predefined [KeyboardListener] for handling keyboard input events in the
/// main view of the application.
class SimKeyboardListener extends ConsumerWidget {
  /// A predefined [KeyboardListener] for handling keyboard input events in the
  /// main view of the application.
  const SimKeyboardListener({required this.child, super.key});

  /// The child widget of this.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var shiftModifier = false;
    var altModifier = false;

    return KeyboardListener(
      autofocus: true,
      onKeyEvent: (event) async {
        switch (event) {
          case KeyDownEvent(logicalKey: .shiftLeft):
            shiftModifier = true;
          case KeyUpEvent(logicalKey: .shiftLeft):
            shiftModifier = false;

          case KeyDownEvent(logicalKey: .altLeft):
            altModifier = true;
          case KeyUpEvent(logicalKey: .altLeft):
            altModifier = false;

          case KeyDownEvent(logicalKey: .minus):
            ref.read(zoomTimerControllerProvider.notifier).zoomOut();
          case KeyUpEvent(logicalKey: .minus):
            ref.read(zoomTimerControllerProvider.notifier).cancel();

          case KeyDownEvent(logicalKey: .add || .equal):
            ref.read(zoomTimerControllerProvider.notifier).zoomIn();
          case KeyUpEvent(logicalKey: .add || .equal):
            ref.read(zoomTimerControllerProvider.notifier).cancel();

          case KeyDownEvent(logicalKey: .enter)
              when altModifier && Device.isDesktop:
            await windowManager.setFullScreen(
              !await windowManager.isFullScreen(),
            );

          case KeyDownEvent(logicalKey: .f11) when Device.isDesktop:
            await windowManager.setFullScreen(
              !await windowManager.isFullScreen(),
            );

          case KeyDownEvent(logicalKey: .space) when shiftModifier:
            ref.read(simInputProvider.notifier).send(
              const (steeringChange: SimInputChange.reset),
            );
          case KeyDownEvent(logicalKey: .space) when !shiftModifier:
            ref.read(simInputProvider.notifier).send(
              const (velocityChange: SimInputChange.reset),
            );

          case KeyDownEvent(logicalKey: .keyV):
            final equipments = ref.read(
              allEquipmentsProvider.select(
                (value) => value.values.where(
                  (element) => element.sections.isNotEmpty,
                ),
              ),
            );
            for (final equipment in equipments) {
              ref.read(simInputProvider.notifier).send((
                uuid: equipment.uuid,
                activeSections:
                    (equipment..toggleAll(deactivateAllIfAnyActive: true))
                        .sectionActivationStatus,
              ));
            }

          case KeyDownEvent(logicalKey: .keyB):
            ref.read(simInputProvider.notifier).send((
              enableAutoSteer:
                  ref.read(activeAutosteeringStateProvider) ==
                  AutosteeringState.disabled,
            ));

          case KeyDownEvent(logicalKey: .keyW || .arrowUp):
            ref.read(simInputProvider.notifier).send((
              velocityChange: SimInputChange.increase,
            ));
          case KeyUpEvent(logicalKey: .keyW || .arrowUp):
            ref.read(simInputProvider.notifier).send((
              velocityChange: SimInputChange.hold,
            ));

          case KeyDownEvent(logicalKey: .keyS || .arrowDown):
            ref.read(simInputProvider.notifier).send((
              velocityChange: SimInputChange.decrease,
            ));
          case KeyUpEvent(logicalKey: .keyS || .arrowDown):
            ref.read(simInputProvider.notifier).send((
              velocityChange: SimInputChange.hold,
            ));

          case KeyDownEvent(logicalKey: .keyA || .arrowLeft):
            ref.read(simInputProvider.notifier).send((
              steeringChange: SimInputChange.decrease,
            ));
          case KeyUpEvent(logicalKey: .keyA || .arrowLeft):
            ref.read(simInputProvider.notifier).send((
              steeringChange: SimInputChange.hold,
            ));

          case KeyDownEvent(logicalKey: .keyD || .arrowRight):
            ref.read(simInputProvider.notifier).send((
              steeringChange: SimInputChange.increase,
            ));
          case KeyUpEvent(logicalKey: .keyD || .arrowRight):
            ref.read(simInputProvider.notifier).send((
              steeringChange: SimInputChange.hold,
            ));
        }
      },
      focusNode: FocusNode(
        descendantsAreFocusable: false,
        descendantsAreTraversable: false,
      ),
      child: child,
    );
  }
}
