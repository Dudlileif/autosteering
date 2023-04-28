import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenVehicleControls extends ConsumerWidget {
  const ScreenVehicleControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(mainVehicleProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
          child: SizedBox(
            height: 50,
            width: 200,
            child: SliderTheme(
              data: Theme.of(context).sliderTheme.copyWith(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
              child: Slider(
                value: vehicle.wheelAngle,
                onChanged: (value) => ref
                    .read(simVehicleInputProvider.notifier)
                    .send(VehicleInput(wheelAngle: value)),
                min: -vehicle.wheelAngleMax,
                max: vehicle.wheelAngleMax,
                label: 'Wheel Angle: ${vehicle.wheelAngle.round()}°',
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              icon: const Icon(
                Icons.replay,
              ),
              label: const Text(
                'Reset',
              ),
              onPressed: () => ref.read(simVehicleInputProvider.notifier).send(
                    Vehicle(
                      position: ref.read(homePositionProvider),
                      heading: 241.5,
                      length: 4.358,
                      width: 2.360,
                      wheelBase: 2.550,
                      rearAxleDistance: 1.275,
                      minTurningRadius: 4.25,
                      wheelAngle: 0,
                      wheelAngleMax: 40,
                      velocity: 0,
                      acceleration: 0,
                    ),
                  ),
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.stop_circle,
              ),
              label: const Text(
                'STOP',
              ),
              onPressed: () => ref.read(simVehicleInputProvider.notifier).send(
                    const VehicleInput(
                      velocity: 0,
                      wheelAngle: 0,
                    ),
                  ),
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.error,
                    ),
                    foregroundColor: MaterialStatePropertyAll(
                      Theme.of(context).primaryTextTheme.bodyLarge?.color,
                    ),
                  ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Vel',
                  ),
                  Text(vehicle.velocity.toStringAsPrecision(2)),
                  RotatedBox(
                    quarterTurns: 3,
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: SliderTheme(
                        data: Theme.of(context).sliderTheme.copyWith(
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                        child: Slider(
                          value: vehicle.velocity,
                          onChanged: (value) => ref
                              .read(simVehicleInputProvider.notifier)
                              .send(VehicleInput(velocity: value)),
                          min: -11,
                          max: 11,
                          divisions: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
