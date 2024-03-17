import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Basic on screen controls for the simulated vehicle.
///
/// Contains controls for velocity and a separate stop button.
class SimVehicleVelocityControls extends StatelessWidget {
  /// Basic on screen controls for the simulated vehicle.
  ///
  /// Contains controls for velocity and a separate stop button.
  const SimVehicleVelocityControls({super.key});

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
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ColoredBox(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Consumer(
                builder: (context, ref, child) {
                  final velocity = ref.watch(
                    mainVehicleProvider.select((vehicle) => vehicle.velocity),
                  );
          
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextWithStroke(
                          'Velocity',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontFamily: 'Noto Sans Mono',
                                  ),
                          strokeWidth: 3.5,
                        ),
                      ),
                      TextWithStroke(
                        '${velocity.toStringAsFixed(1)} m/s',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontFamily: 'Noto Sans Mono',
                                ),
                        strokeWidth: 3.5,
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: SliderTheme(
                            data: theme.sliderTheme.copyWith(
                              trackHeight: 16,
                              activeTrackColor:
                                  theme.sliderTheme.inactiveTrackColor,
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12,
                              ),
                            ),
                            child: Slider(
                              value: velocity,
                              onChangeStart: (value) => ref.watch(
                                simCoreVehicleAutoSlowDownProvider,
                              )
                                  ? ref
                                      .read(simInputProvider.notifier)
                                      .send((autoSlowDown: false))
                                  : null,
                              onChangeEnd: (value) => ref.watch(
                                simCoreVehicleAutoSlowDownProvider,
                              )
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
          ),
        ),
      ],
    );
  }
}

/// Basic on screen controls for the simulated vehicle.
///
/// Contains controls for the steering angle.
class SimVehicleSteeringSlider extends ConsumerWidget {
  /// Basic on screen controls for the simulated vehicle.
  ///
  /// Contains controls for the steering angle.
  const SimVehicleSteeringSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final steeringAngle = ref.watch(
      mainVehicleProvider.select((vehicle) => vehicle.steeringAngle),
    );

    final steeringAngleMax = ref.watch(
      mainVehicleProvider.select(
        (vehicle) => vehicle.steeringAngleMax,
      ),
    );
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextWithStroke(
          '''Steering:${steeringAngle.toStringAsFixed(1).padLeft(5)}°''',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white, fontFamily: 'Noto Sans Mono'),
          strokeWidth: 3.5,
        ),
        SizedBox(
          height: 50,
          child: SliderTheme(
            data: theme.sliderTheme.copyWith(
              trackHeight: 16,
              activeTrackColor: theme.sliderTheme.inactiveTrackColor,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
            ),
            child: Slider(
              value: steeringAngle.clamp(-steeringAngleMax, steeringAngleMax),
              onChangeStart: (value) => ref.watch(
                simCoreVehicleAutoCenterSteeringProvider,
              )
                  ? ref
                      .read(
                      simInputProvider.notifier,
                    )
                      .send((autoCenterSteering: false))
                  : null,
              onChangeEnd: (value) => ref.watch(
                simCoreVehicleAutoCenterSteeringProvider,
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
        ),
      ],
    );
  }
}
