import 'package:agopengps_flutter/src/features/simulator/providers/providers.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Basic gauges and controls for debugging the pitch and roll of the vehicle.
class PitchAndRollGauges extends StatelessWidget {
  /// Basic gauges and controls for debugging the pitch and roll of the vehicle.
  const PitchAndRollGauges({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor.withOpacity(0.5),
      child: SizedBox(
        width: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              child: const Text('Use IMU'),
              builder: (context, ref, child) => Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (child != null) child,
                  Checkbox(
                    value: ref.watch(
                      mainVehicleProvider
                          .select((vehicle) => vehicle.useIMUPitchAndRoll),
                    ),
                    onChanged: (value) => value != null
                        ? ref
                            .read(simInputProvider.notifier)
                            .send((useIMUPitchAndRoll: value))
                        : null,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Consumer(
                builder: (context, ref, child) {
                  final pitch = ref.watch(
                    mainVehicleProvider.select((vehicle) => vehicle.pitch),
                  );
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Pitch: ${pitch.toStringAsFixed(1)}º',
                          ),
                          IconButton(
                            onPressed: () => ref
                                .read(simInputProvider.notifier)
                                .send((pitch: 0.0)),
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                      Slider(
                        value: pitch.clamp(-25, 25),
                        onChanged: (value) => ref
                            .read(simInputProvider.notifier)
                            .send((pitch: value)),
                        min: -25,
                        max: 25,
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Consumer(
                builder: (context, ref, child) {
                  final roll = ref.watch(
                    mainVehicleProvider.select((vehicle) => vehicle.roll),
                  );
                  return Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Roll: ${roll.toStringAsFixed(1)}º',
                          ),
                          IconButton(
                            onPressed: () => ref
                                .read(simInputProvider.notifier)
                                .send((roll: 0.0)),
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                      Slider(
                        value: roll.clamp(-25, 25),
                        onChanged: (value) => ref
                            .read(simInputProvider.notifier)
                            .send((roll: value)),
                        min: -25,
                        max: 25,
                      )
                    ],
                  );
                },
              ),
            ),
            Consumer(
              child: const Text('Zero IMU'),
              builder: (context, ref, child) => ListTile(
                title: child,
                onTap: () => ref
                    .read(simInputProvider.notifier)
                    .send((setZeroIMU: true)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
