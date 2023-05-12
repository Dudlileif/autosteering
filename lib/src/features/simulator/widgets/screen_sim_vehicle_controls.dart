import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenSimVehicleControls extends ConsumerWidget {
  const ScreenSimVehicleControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(mainVehicleProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            onPressed: () => ref.read(simVehicleInputProvider.notifier).send(
                  const VehicleInput(velocity: 0),
                ),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            tooltip: 'Stop the vehicle',
            child: Stack(
              children: [
                const Align(
                  heightFactor: 1.5,
                  child: Icon(
                    Icons.stop_circle,
                    size: 32,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'STOP',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  color: Theme.of(context).cardColor.withOpacity(0.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Steering Angle: ${vehicle.steeringAngle.toStringAsFixed(1)}°',
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: Slider(
                          value: vehicle.steeringAngle,
                          onChanged: (value) => ref
                              .read(simVehicleInputProvider.notifier)
                              .send(VehicleInput(steeringAngle: value)),
                          min: -vehicle.steeringAngleMax,
                          max: vehicle.steeringAngleMax,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Card(
              color: Theme.of(context).cardColor.withOpacity(0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Velocity'),
                  ),
                  Text('${vehicle.velocity.toStringAsFixed(1)} m/s'),
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
                          min: -12,
                          max: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
