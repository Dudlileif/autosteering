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

import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/map/providers/ui_providers.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_autosteer_parameter_configurator.dart';
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
                virtualLedBarPerpendicularDistanceProvider
                    .select((value) => value != null),
              ))
            const Padding(
              padding: EdgeInsets.all(8),
              child:
                  Align(alignment: Alignment.topCenter, child: VirtualLedBar()),
            ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: 8 +
                    2 *
                        ref.watch(
                          virtualLedBarConfigurationProvider
                              .select((value) => value.ledSize),
                        ),
              ),
              child: SizedBox(
                width: ref.watch(miniMapSizeProvider),
                child: ColoredBox(
                  color: Colors.black12,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BasicVehicleGauges(),
                        const Divider(),
                        if (ref.watch(
                          displayABTrackingProvider
                              .select((value) => value != null),
                        )) ...[
                          const ABTrackingControls(),
                          const Divider(),
                        ],
                        if (ref.watch(simCoreAllowManualInputProvider)) ...[
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
          const Align(
            alignment: Alignment.bottomRight,
            child: MapContributionWidget(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: 8 +
                    2 *
                        ref.watch(
                          virtualLedBarConfigurationProvider
                              .select((value) => value.ledSize),
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
          if (ref.watch(debugVehicleIMUProvider))
            Consumer(
              builder: (context, ref, child) {
                var offset = ref.read(imuConfiguratorUiOffsetProvider);
                return StatefulBuilder(
                  builder: (context, setState) => Positioned(
                    left: offset.dx.clamp(
                      0,
                      constraints.maxWidth - 380,
                    ),
                    top: offset.dy.clamp(0, constraints.maxHeight - 350),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: min(
                          700,
                          constraints.maxHeight -
                              offset.dy.clamp(0, constraints.maxHeight - 350),
                        ),
                        child: LongPressDraggable(
                          onDragUpdate: (update) => setState(
                            () => offset = Offset(
                              offset.dx + update.delta.dx,
                              offset.dy + update.delta.dy,
                            ),
                          ),
                          onDragEnd: (details) => ref
                              .read(
                                imuConfiguratorUiOffsetProvider.notifier,
                              )
                              .update(
                                Offset(
                                  offset.dx.clamp(
                                    0,
                                    constraints.maxWidth - 380,
                                  ),
                                  offset.dy
                                      .clamp(0, constraints.maxHeight - 350),
                                ),
                              ),
                          childWhenDragging: const SizedBox.shrink(),
                          feedback: const Opacity(
                            opacity: 0.7,
                            child: SizedBox(
                              height: 700,
                              child: ImuConfigurator(),
                            ),
                          ),
                          child: const ImuConfigurator(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          if (ref.watch(debugVehicleWASProvider))
            Consumer(
              builder: (context, ref, child) {
                var offset =
                    ref.read(steeringHardwareConfiguratorUiOffsetProvider);
                return StatefulBuilder(
                  builder: (context, setState) => Positioned(
                    left: offset.dx.clamp(
                      0,
                      constraints.maxWidth - 380,
                    ),
                    top: offset.dy.clamp(0, constraints.maxHeight - 350),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: min(
                          700,
                          constraints.maxHeight -
                              offset.dy.clamp(0, constraints.maxHeight - 350),
                        ),
                        child: LongPressDraggable(
                          onDragUpdate: (update) => setState(
                            () => offset = Offset(
                              offset.dx + update.delta.dx,
                              offset.dy + update.delta.dy,
                            ),
                          ),
                          onDragEnd: (details) => ref
                              .read(
                                steeringHardwareConfiguratorUiOffsetProvider
                                    .notifier,
                              )
                              .update(
                                Offset(
                                  offset.dx.clamp(
                                    0,
                                    constraints.maxWidth - 380,
                                  ),
                                  offset.dy
                                      .clamp(0, constraints.maxHeight - 350),
                                ),
                              ),
                          childWhenDragging: const SizedBox.shrink(),
                          feedback: const Opacity(
                            opacity: 0.7,
                            child: SizedBox(
                              height: 700,
                              child: SteeringHardwareConfigurator(),
                            ),
                          ),
                          child: const SteeringHardwareConfigurator(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          if (ref.watch(debugVehicleAutosteerParametersProvider))
            Consumer(
              builder: (context, ref, child) {
                var offset = ref.read(autosteeringConfiguratorUiOffsetProvider);
                return StatefulBuilder(
                  builder: (context, setState) => Positioned(
                    left: offset.dx.clamp(
                      0,
                      constraints.maxWidth - 380,
                    ),
                    top: offset.dy.clamp(0, constraints.maxHeight - 340),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: min(
                          325,
                          constraints.maxHeight -
                              offset.dy.clamp(0, constraints.maxHeight - 340),
                        ),
                        child: LongPressDraggable(
                          onDragUpdate: (update) {
                            setState(
                              () => offset = Offset(
                                offset.dx + update.delta.dx,
                                offset.dy + update.delta.dy,
                              ),
                            );
                          },
                          onDragEnd: (details) => ref
                              .read(
                                autosteeringConfiguratorUiOffsetProvider
                                    .notifier,
                              )
                              .update(
                                Offset(
                                  offset.dx.clamp(
                                    0,
                                    constraints.maxWidth - 380,
                                  ),
                                  offset.dy
                                      .clamp(0, constraints.maxHeight - 340),
                                ),
                              ),
                          childWhenDragging: const SizedBox.shrink(),
                          feedback: const Opacity(
                            opacity: 0.7,
                            child: SizedBox(
                              height: 325,
                              child: VehicleAutosteerParameterConfigurator(),
                            ),
                          ),
                          child: const SizedBox(
                            height: 325,
                            child: VehicleAutosteerParameterConfigurator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          if (ref.watch(showPathRecordingMenuProvider))
            Consumer(
              builder: (context, ref, child) {
                var offset = ref.read(pathRecordingMenuUiOffsetProvider);
                return StatefulBuilder(
                  builder: (context, setState) => Positioned(
                    left: offset.dx.clamp(
                      0,
                      constraints.maxWidth - 380,
                    ),
                    top: offset.dy.clamp(0, constraints.maxHeight - 350),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: min(
                          700,
                          constraints.maxHeight -
                              offset.dy.clamp(0, constraints.maxHeight - 350),
                        ),
                        child: LongPressDraggable(
                          onDragUpdate: (update) => setState(
                            () => offset = Offset(
                              offset.dx + update.delta.dx,
                              offset.dy + update.delta.dy,
                            ),
                          ),
                          onDragEnd: (details) => ref
                              .read(
                                pathRecordingMenuUiOffsetProvider.notifier,
                              )
                              .update(
                                Offset(
                                  offset.dx.clamp(
                                    0,
                                    constraints.maxWidth - 380,
                                  ),
                                  offset.dy
                                      .clamp(0, constraints.maxHeight - 350),
                                ),
                              ),
                          childWhenDragging: const SizedBox.shrink(),
                          feedback: const Opacity(
                            opacity: 0.7,
                            child: SizedBox(
                              height: 700,
                              child: PathRecordingMenu(),
                            ),
                          ),
                          child: const PathRecordingMenu(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );

    return Device.isDesktop || Device.isWeb
        ? KeyboardListener(
            autofocus: true,
            onKeyEvent: (event) async => switch (event.logicalKey) {
              LogicalKeyboardKey.shiftLeft => {
                  if (event is KeyDownEvent)
                    shiftModifier = true
                  else if (event is KeyUpEvent)
                    shiftModifier = false,
                },
              LogicalKeyboardKey.altLeft => {
                  if (event is KeyDownEvent)
                    altModifier = true
                  else if (event is KeyUpEvent)
                    altModifier = false,
                },
              LogicalKeyboardKey.minus => {
                  if (event is KeyUpEvent)
                    ref.read(zoomTimerControllerProvider.notifier).cancel()
                  else if (event is KeyDownEvent)
                    ref.read(zoomTimerControllerProvider.notifier).zoomOut(),
                },
              LogicalKeyboardKey.add || LogicalKeyboardKey.equal => {
                  if (event is KeyUpEvent)
                    ref.read(zoomTimerControllerProvider.notifier).cancel()
                  else if (event is KeyDownEvent)
                    ref.read(zoomTimerControllerProvider.notifier).zoomIn(),
                },
              LogicalKeyboardKey.enter => {
                  if (Device.isDesktop && altModifier)
                    if (event is KeyDownEvent)
                      windowManager
                          .setFullScreen(!await windowManager.isFullScreen()),
                },
              LogicalKeyboardKey.f11 => {
                  if (Device.isDesktop)
                    if (event is KeyDownEvent)
                      windowManager
                          .setFullScreen(!await windowManager.isFullScreen()),
                },
              LogicalKeyboardKey.space => {
                  if (event is KeyDownEvent)
                    ref.read(simInputProvider.notifier).send(
                          switch (shiftModifier) {
                            false => const (
                                velocityChange: SimInputChange.reset
                              ),
                            true => const (steeringChange: SimInputChange.reset)
                          },
                        ),
                },
              LogicalKeyboardKey.keyW || LogicalKeyboardKey.arrowUp => {
                  if (event is KeyDownEvent)
                    ref
                        .read(simInputProvider.notifier)
                        .send((velocityChange: SimInputChange.increase))
                  else if (event is KeyUpEvent)
                    ref
                        .read(simInputProvider.notifier)
                        .send((velocityChange: SimInputChange.hold)),
                },
              LogicalKeyboardKey.keyS || LogicalKeyboardKey.arrowDown => {
                  if (event is KeyDownEvent)
                    ref
                        .read(simInputProvider.notifier)
                        .send((velocityChange: SimInputChange.decrease))
                  else if (event is KeyUpEvent)
                    ref
                        .read(simInputProvider.notifier)
                        .send((velocityChange: SimInputChange.hold)),
                },
              LogicalKeyboardKey.keyA || LogicalKeyboardKey.arrowLeft => {
                  if (event is KeyDownEvent)
                    ref
                        .read(simInputProvider.notifier)
                        .send((steeringChange: SimInputChange.decrease))
                  else if (event is KeyUpEvent)
                    ref
                        .read(simInputProvider.notifier)
                        .send((steeringChange: SimInputChange.hold)),
                },
              LogicalKeyboardKey.keyD || LogicalKeyboardKey.arrowRight => {
                  if (event is KeyDownEvent)
                    ref
                        .read(simInputProvider.notifier)
                        .send((steeringChange: SimInputChange.increase))
                  else if (event is KeyUpEvent)
                    ref
                        .read(simInputProvider.notifier)
                        .send((steeringChange: SimInputChange.hold)),
                },
              _ => null
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
