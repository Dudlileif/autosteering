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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/graph/graph.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

/// The main map widget with overlayed widgets (buttons, gauges).
class MapAndGaugeStackView extends ConsumerWidget {
  /// The main map widget with overlayed widgets (buttons, gauges).
  const MapAndGaugeStackView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var shiftModifier = false;
    var altModifier = false;

    const map = MainMap();

    final stack = LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          switch (ref.watch(mapUse3DPerspectiveProvider)) {
            false => map,
            true => PerspectiveWithOverflow(
              perspectiveAngle: ref.watch(map3DPerspectiveAngleProvider),
              widthFactor: 1.5,
              heightFactor: 3,
              child: map,
            ),
          },
          if (ref.watch(virtualLedBarEnabledProvider) &&
              ref.watch(
                virtualLedBarPerpendicularDistanceProvider.select(
                  (value) => value != null,
                ),
              ))
            const Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topCenter,
                child: VirtualLedBar(),
              ),
            ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top:
                    8 +
                    2 *
                        ref.watch(
                          virtualLedBarConfigurationProvider.select(
                            (value) => value.ledSize,
                          ),
                        ),
              ),
              child: SizedBox(
                width: ref.watch(miniMapSizeProvider),
                child: ColoredBox(
                  color: Colors.black12,
                  child: SingleChildScrollView(
                    child: AnimatedSize(
                      duration: Durations.extralong1,
                      curve: Easing.standardDecelerate,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const EquipmentWorkedAreaGauge(),
                          const BasicVehicleGauges(),
                          const Divider(),
                          if (ref.watch(
                            displayABTrackingProvider.select(
                              (value) => value != null,
                            ),
                          )) ...[
                            const ABTrackingControls(),
                            const Divider(),
                          ],
                          if (ref.watch(simCoreAllowManualInputProvider) ||
                              ref.watch(showOverrideSteeringProvider)) ...[
                            const SimVehicleSteeringSlider(),
                            const Divider(),
                          ],
                          if (ref.watch(showMiniMapProvider)) const MiniMap(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: MapContributionWidget(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                top:
                    8 +
                    2 *
                        ref.watch(
                          virtualLedBarConfigurationProvider.select(
                            (value) => value.ledSize,
                          ),
                        ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MapControlButtons(),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: EnableAutosteeringButton(),
                    ),
                    if (ref.watch(simCoreAllowManualInputProvider))
                      const SimVehicleVelocityControls(),
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: EquipmentSectionButtons(),
            ),
          ),
          if (ref.watch(showIMUConfigProvider))
            DraggableImuConfigurator(constraints: constraints),
          if (ref.watch(showSteeringHardwareConfigProvider))
            DraggableSteeringHardwareConfigurator(constraints: constraints),
          if (ref.watch(showAutosteeringParameterConfigProvider))
            DraggableAutosteeringParameterConfigurator(
              constraints: constraints,
            ),
          if (ref.watch(showPathRecordingMenuProvider))
            DraggablePathRecordingMenu(constraints: constraints),
          if (ref.watch(showNudgingControlsProvider))
            DraggableNudgingControls(constraints: constraints),
          if (ref.watch(enableDebugModeProvider) &&
              ref.watch(showDraggableGraphProvider))
            DraggableGraph(constraints: constraints),
        ],
      ),
    );

    return Device.isDesktop || Device.isWeb
        ? KeyboardListener(
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
            child: stack,
          )
        : stack;
  }
}
