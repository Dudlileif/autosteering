import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main map widget with overlayed widgets (buttons, gauges).
class MapAndGaugeStackView extends ConsumerWidget {
  const MapAndGaugeStackView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var shiftModifier = false;

    const map = MainMap();

    return KeyboardListener(
      autofocus: true,
      onKeyEvent: (event) => switch (event.logicalKey) {
        LogicalKeyboardKey.shiftLeft => {
            if (event is KeyDownEvent)
              shiftModifier = true
            else if (event is KeyUpEvent)
              shiftModifier = false
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
        LogicalKeyboardKey.space => {
            if (event is KeyDownEvent)
              ref.read(simVehicleInputProvider.notifier).send(
                    switch (shiftModifier) {
                      false => const VehicleInput(velocity: 0),
                      true => const VehicleInput(steeringAngle: 0)
                    },
                  ),
          },
        LogicalKeyboardKey.keyW || LogicalKeyboardKey.arrowUp => {
            if (event is KeyDownEvent)
              ref.read(simVehicleAcceleratorProvider.notifier).forward()
            else if (event is KeyUpEvent)
              ref.read(simVehicleAcceleratorProvider.notifier).cancel()
          },
        LogicalKeyboardKey.keyS || LogicalKeyboardKey.arrowDown => {
            if (event is KeyDownEvent)
              ref.read(simVehicleAcceleratorProvider.notifier).reverse()
            else if (event is KeyUpEvent)
              ref.read(simVehicleAcceleratorProvider.notifier).cancel()
          },
        LogicalKeyboardKey.keyA || LogicalKeyboardKey.arrowLeft => {
            if (event is KeyDownEvent)
              ref.read(simVehicleSteeringProvider.notifier).left()
            else if (event is KeyUpEvent)
              ref.read(simVehicleSteeringProvider.notifier).cancel()
          },
        LogicalKeyboardKey.keyD || LogicalKeyboardKey.arrowRight => {
            if (event is KeyDownEvent)
              ref.read(simVehicleSteeringProvider.notifier).right()
            else if (event is KeyUpEvent)
              ref.read(simVehicleSteeringProvider.notifier).cancel()
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
          if (ref.watch(displayPurePursuitProvider) != null)
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Consumer(
                    builder: (context, ref, child) {
                      return Text(
                        ref
                            .watch(displayPurePursuitProvider)!
                            .perpendicularDistance(
                              ref.watch(mainVehicleProvider),
                            )
                            .toStringAsFixed(3),
                      );
                    },
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
