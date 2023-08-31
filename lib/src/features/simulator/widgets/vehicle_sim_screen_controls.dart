import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Basic on screen controls for the simulated vehicle.
///
/// Contains controls for velocity, steering and a separate stop button.
class VehicleSimScreenControls extends StatelessWidget {
  /// Basic on screen controls for the simulated vehicle.
  ///
  /// Contains controls for velocity, steering and a separate stop button.
  const VehicleSimScreenControls({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) {
              final enabled = ref.watch(autoSteerEnabledProvider);

              return FloatingActionButton(
                onPressed: ref.read(autoSteerEnabledProvider.notifier).toggle,
                backgroundColor: switch (enabled) {
                  true => Colors.orange,
                  false => Colors.green,
                },
                foregroundColor: Colors.white,
                tooltip: switch (enabled) {
                  false => 'Enable auto steering',
                  true => 'Disable auto steering'
                },
                child: Stack(
                  children: [
                    Align(
                      heightFactor: 1.5,
                      child: Icon(
                        switch (enabled) {
                          true => Icons.pause_circle,
                          false => Icons.play_circle
                        },
                        size: 32,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'AUTO',
                        style: theme.textTheme.labelLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
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
                    style: theme.textTheme.labelLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            builder: (context, ref, child) => FloatingActionButton(
              onPressed: () => ref.read(simInputProvider.notifier).send(
                (velocity: 0),
              ),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              tooltip: 'Stop the vehicle',
              child: child,
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
                  color: theme.cardColor.withOpacity(0.5),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final steeringAngle = ref.watch(
                        mainVehicleProvider
                            .select((vehicle) => vehicle.steeringAngle),
                      );

                      final steeringAngleMax = ref.watch(
                        mainVehicleProvider.select(
                          (vehicle) => vehicle.steeringAngleMax,
                        ),
                      );

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '''Steering Angle: ${steeringAngle.toStringAsFixed(1)}°''',
                          ),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: Slider(
                              value: steeringAngle,
                              onChangeStart: (value) => ref.watch(
                                simVehicleAutoCenterSteeringProvider,
                              )
                                  ? ref
                                      .read(
                                      simInputProvider.notifier,
                                    )
                                      .send((autoCenterSteering: false))
                                  : null,
                              onChangeEnd: (value) => ref.watch(
                                simVehicleAutoCenterSteeringProvider,
                              )
                                  ? ref
                                      .read(
                                      simInputProvider.notifier,
                                    )
                                      .send((autoCenterSteering: true))
                                  : null,
                              onChanged: (value) => ref
                                  .read(simInputProvider.notifier)
                                  .send((steeringAngle: value)),
                              min: -steeringAngleMax,
                              max: steeringAngleMax,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Card(
              color: theme.cardColor.withOpacity(0.5),
              child: Consumer(
                builder: (context, ref, child) {
                  final velocity = ref.watch(
                    mainVehicleProvider.select((vehicle) => vehicle.velocity),
                  );

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Velocity'),
                      ),
                      Text('${velocity.toStringAsFixed(1)} m/s'),
                      RotatedBox(
                        quarterTurns: 3,
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: SliderTheme(
                            data: theme.sliderTheme.copyWith(
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: Slider(
                              value: velocity,
                              onChangeStart: (value) =>
                                  ref.watch(simVehicleAutoSlowDownProvider)
                                      ? ref
                                          .read(simInputProvider.notifier)
                                          .send((autoSlowDown: false))
                                      : null,
                              onChangeEnd: (value) =>
                                  ref.watch(simVehicleAutoSlowDownProvider)
                                      ? ref
                                          .read(simInputProvider.notifier)
                                          .send((autoSlowDown: true))
                                      : null,
                              onChanged: (value) => ref
                                  .read(simInputProvider.notifier)
                                  .send((velocity: value)),
                              min: -12,
                              max: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
