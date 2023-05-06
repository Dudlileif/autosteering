import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenVehicleControls extends ConsumerWidget {
  const ScreenVehicleControls({super.key});

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
                  const VehicleInput(
                    velocity: 0,
                    steeringAngle: 0,
                  ),
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
                if (!kIsWeb)
                  ElevatedButton.icon(
                    onPressed: () =>
                        ref.invalidate(simVehicleIsolateStreamProvider),
                    icon: const Icon(Icons.replay),
                    label: const Text('Sim'),
                  ),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.replay,
                  ),
                  label: const Text(
                    'Position as tractor',
                  ),
                  onPressed: () {
                    ref.read(simVehicleInputProvider.notifier).send(
                          Tractor(
                            position: ref.read(homePositionProvider),
                            antennaHeight: 2.822,
                            heading: 241.5,
                            length: 4.358,
                            width: 2.360,
                            wheelBase: 2.550,
                            solidAxleDistance: 1.275,
                            trackWidth: 1.8,
                            minTurningRadius: 4.25,
                            steeringAngleMax: 32,
                            simulated: true,
                          ),
                        );
                    ref.invalidate(debugTravelledPathListProvider);
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.replay,
                  ),
                  label: const Text(
                    'Position as\narticulated tractor',
                  ),
                  onPressed: () {
                    ref.read(simVehicleInputProvider.notifier).send(
                          ArticulatedTractor(
                            position: ref.read(homePositionProvider),
                            antennaHeight: 2.822,
                            heading: 241.5,
                            length: 4.358,
                            width: 2.360,
                            pivotToAntennaDistance: 1,
                            pivotToFrontAxle: 2,
                            pivotToRearAxle: 2,
                            trackWidth: 2.75,
                            minTurningRadius: 6,
                            steeringAngleMax: 20,
                            simulated: true,
                          ),
                        );
                    ref.invalidate(debugTravelledPathListProvider);
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.replay,
                  ),
                  label: const Text(
                    'Position as harvester',
                  ),
                  onPressed: () {
                    ref.read(simVehicleInputProvider.notifier).send(
                          Harvester(
                            position: ref.read(homePositionProvider),
                            antennaHeight: 2.822,
                            heading: 241.5,
                            length: 4.358,
                            width: 2.360,
                            wheelBase: 3.550,
                            solidAxleDistance: 1.275,
                            trackWidth: 1.8,
                            minTurningRadius: 4.25,
                            steeringAngleMax: 45,
                            simulated: true,
                          ),
                        );
                    ref.invalidate(debugTravelledPathListProvider);
                  },
                ),
                Card(
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: SliderTheme(
                      data: Theme.of(context).sliderTheme.copyWith(
                            showValueIndicator: ShowValueIndicator.always,
                          ),
                      child: Slider(
                        value: vehicle.steeringAngle,
                        onChanged: (value) => ref
                            .read(simVehicleInputProvider.notifier)
                            .send(VehicleInput(steeringAngle: value)),
                        min: -vehicle.steeringAngleMax,
                        max: vehicle.steeringAngleMax,
                        label:
                            'Steering Angle: ${vehicle.steeringAngle.toStringAsFixed(1)}°',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Card(
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
