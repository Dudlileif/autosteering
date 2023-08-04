import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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

    return KeyboardListener(
      autofocus: true,
      onKeyEvent: (event) async => switch (event.logicalKey) {
        LogicalKeyboardKey.shiftLeft => {
            if (event is KeyDownEvent)
              shiftModifier = true
            else if (event is KeyUpEvent)
              shiftModifier = false
          },
        LogicalKeyboardKey.altLeft => {
            if (event is KeyDownEvent)
              altModifier = true
            else if (event is KeyUpEvent)
              altModifier = false
          },
        LogicalKeyboardKey.minus => {
            if (event is KeyUpEvent)
              ref.read(zoomTimerControllerProvider.notifier).cancel()
            else if (event is KeyDownEvent)
              ref.read(zoomTimerControllerProvider.notifier).zoomOut(),
          },
        LogicalKeyboardKey.add => {
            if (event is KeyUpEvent)
              ref.read(zoomTimerControllerProvider.notifier).cancel()
            else if (event is KeyDownEvent)
              ref.read(zoomTimerControllerProvider.notifier).zoomIn(),
          },
        LogicalKeyboardKey.enter => {
            if (Device.isDesktop && altModifier)
              if (event is KeyDownEvent)
                windowManager.setFullScreen(!await windowManager.isFullScreen())
          },
        LogicalKeyboardKey.f11 => {
            if (Device.isDesktop)
              if (event is KeyDownEvent)
                windowManager.setFullScreen(!await windowManager.isFullScreen())
          },
        LogicalKeyboardKey.space => {
            if (event is KeyDownEvent)
              ref.read(simInputProvider.notifier).send(
                    switch (shiftModifier) {
                      false => const (velocityChange: SimInputChange.reset),
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
                  .send((velocityChange: SimInputChange.hold))
          },
        LogicalKeyboardKey.keyS || LogicalKeyboardKey.arrowDown => {
            if (event is KeyDownEvent)
              ref
                  .read(simInputProvider.notifier)
                  .send((velocityChange: SimInputChange.decrease))
            else if (event is KeyUpEvent)
              ref
                  .read(simInputProvider.notifier)
                  .send((velocityChange: SimInputChange.hold))
          },
        LogicalKeyboardKey.keyA || LogicalKeyboardKey.arrowLeft => {
            if (event is KeyDownEvent)
              ref
                  .read(simInputProvider.notifier)
                  .send((steeringChange: SimInputChange.decrease))
            else if (event is KeyUpEvent)
              ref
                  .read(simInputProvider.notifier)
                  .send((steeringChange: SimInputChange.hold))
          },
        LogicalKeyboardKey.keyD || LogicalKeyboardKey.arrowRight => {
            if (event is KeyDownEvent)
              ref
                  .read(simInputProvider.notifier)
                  .send((steeringChange: SimInputChange.increase))
            else if (event is KeyUpEvent)
              ref
                  .read(simInputProvider.notifier)
                  .send((steeringChange: SimInputChange.hold))
          },
        _ => null
      },
      focusNode: FocusNode(
        descendantsAreFocusable: false,
        descendantsAreTraversable: false,
      ),
      child: Stack(
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
          const Align(
            alignment: Alignment.bottomRight,
            child: MapContributionWidget(),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: MapControlButtons(),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: VehicleSimScreenControls(),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: BasicVehicleGauges(),
            ),
          ),
          if (ref.watch(showABLineDebugLayerProvider))
            const ABLineOffsetDebugControls(),
          if (ref.watch(showPurePursuitDebugLayerProvider))
            const PurePursuitDebugWidget()
        ],
      ),
    );
  }
}
