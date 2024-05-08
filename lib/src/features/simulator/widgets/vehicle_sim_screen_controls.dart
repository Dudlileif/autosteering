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
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  heightFactor: 1.1,
                  child: Icon(
                    Icons.stop_circle,
                    size: 36,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'STOP',
                    style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      textStyle: theme.textTheme.labelLarge,
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
                          style: GoogleFonts.robotoMono(
                            color: Colors.white,
                            textStyle: theme.textTheme.titleMedium,
                          ),
                          strokeWidth: 3.5,
                        ),
                      ),
                      TextWithStroke(
                        '${velocity.toStringAsFixed(1).padLeft(5)} m/s',
                        style:
                          GoogleFonts.robotoMono(
                          color: Colors.white,
                          textStyle: theme.textTheme.titleMedium,
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
    final showOverrideToggle = ref.watch(showOverrideSteeringProvider);
    final overrideEnabled = ref.watch(overrideSteeringProvider);
    final steeringAngle = overrideEnabled
        ? ref.watch(overrideSteeringAngleProvider)
        : ref.watch(
            mainVehicleProvider.select(
              (vehicle) => vehicle is AxleSteeredVehicle
                  ? vehicle.ackermannSteering.innerAngle
                  : vehicle.steeringAngle,
            ),
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
        if (showOverrideToggle)
          CheckboxListTile(
            title: Text(
              'Motor target override',
              style: theme.textTheme.titleMedium,
            ),
            value: overrideEnabled,
            onChanged: (value) => value != null
                ? ref
                    .read(overrideSteeringProvider.notifier)
                    .update(value: value)
                : null,
          ),
        TextWithStroke(
          '''Steering:${steeringAngle.toStringAsFixed(1).padLeft(6)}°''',
          style: GoogleFonts.robotoMono(
            color: Colors.white,
            textStyle: theme.textTheme.titleMedium,
          ),
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
              onChanged: (value) => overrideEnabled
                  ? ref
                      .read(overrideSteeringAngleProvider.notifier)
                      .update(value)
                  : ref.read(simInputProvider.notifier).send(
                      (steeringAngle: value),
                    ),
              min: -steeringAngleMax,
              max: steeringAngleMax,
            ),
          ),
        ),
      ],
    );
  }
}
