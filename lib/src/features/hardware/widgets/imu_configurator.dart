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

import 'dart:async';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A configurator widget for configuring how to use the IMU with the vehicle.
class ImuConfigurator extends StatelessWidget {
  /// A configurator widget for configuring how to use the IMU with the vehicle.
  const ImuConfigurator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.transparent,
      child: SizedBox(
        width: 300,
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.7),
          appBar: AppBar(
            primary: false,
            title: const Text('IMU Configurator'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) => CloseButton(
                    onPressed: () => ref
                        .read(showIMUConfigProvider.notifier)
                        .update(value: false),
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            children: [
              Consumer(
                child: Text(
                  'Use IMU yaw',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider
                        .select((value) => value.imu.config.useYaw),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                            ref
                                .read(
                                  mainVehicleProvider
                                      .select((value) => value.imu.config),
                                )
                                .copyWith(useYaw: value),
                          );
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Timer(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU use yaw: ${!value} -> ${vehicle.imu.config.useYaw}''',
                        );
                      });
                    }
                  },
                  secondary: child,
                ),
              ),
              Consumer(
                child: Text(
                  'Use IMU pitch and roll',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider.select(
                      (vehicle) => vehicle.imu.config.usePitchAndRoll,
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                            ref
                                .read(
                                  mainVehicleProvider
                                      .select((value) => value.imu.config),
                                )
                                .copyWith(usePitchAndRoll: value),
                          );
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Timer(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU use pitch and roll: ${!value} -> ${vehicle.imu.config.usePitchAndRoll}''',
                        );
                      });
                    }
                  },
                  secondary: child,
                ),
              ),
              Consumer(
                child: Text(
                  'Swap pitch and roll axes',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider.select(
                      (vehicle) => vehicle.imu.config.swapPitchAndRoll,
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                            ref
                                .read(
                                  mainVehicleProvider
                                      .select((value) => value.imu.config),
                                )
                                .copyWith(swapPitchAndRoll: value),
                          );
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Timer(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU swap pitch and roll: ${!value} -> ${vehicle.imu.config.swapPitchAndRoll}''',
                        );
                      });
                    }
                  },
                  secondary: child,
                ),
              ),
              Consumer(
                child: Text(
                  'Invert pitch',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider
                        .select((vehicle) => vehicle.imu.config.invertPitch),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                            ref
                                .read(
                                  mainVehicleProvider
                                      .select((value) => value.imu.config),
                                )
                                .copyWith(invertPitch: value),
                          );
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Timer(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU invert pitch: ${!value} -> ${vehicle.imu.config.invertPitch}''',
                        );
                      });
                    }
                  },
                  secondary: child,
                ),
              ),
              Consumer(
                child: Text(
                  'Invert roll',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider
                        .select((vehicle) => vehicle.imu.config.invertRoll),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                            ref
                                .read(
                                  mainVehicleProvider
                                      .select((value) => value.imu.config),
                                )
                                .copyWith(invertRoll: value),
                          );
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Timer(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU invert roll: ${!value} -> ${vehicle.imu.config.invertRoll}''',
                        );
                      });
                    }
                  },
                  secondary: child,
                ),
              ),
              Consumer(
                builder: (context, ref, child) => ListTile(
                  title: Text(
                    '''Delay readings: ${ref.watch(mainVehicleProvider.select((value) => value.imu.config.delayReadings))} ms''',
                  ),
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (context) => Consumer(
                      builder: (context, ref, child) {
                        var delayReadings = ref.watch(
                          mainVehicleProvider.select(
                            (value) => value.imu.config.delayReadings,
                          ),
                        );
                        return StatefulBuilder(
                          builder: (context, setState) => SimpleDialog(
                            contentPadding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 8,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delay readings: $delayReadings ms',
                                  style: theme.textTheme.bodyLarge,
                                ),
                                IconButton(
                                  onPressed: () => setState(
                                    () => delayReadings =
                                        const ImuConfig().delayReadings,
                                  ),
                                  icon: const Icon(Icons.refresh),
                                ),
                              ],
                            ),
                            children: [
                              Slider(
                                value: delayReadings.toDouble(),
                                onChanged: (value) => setState(
                                  () => delayReadings = value.round(),
                                ),
                                max: 100,
                                divisions: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SimpleDialogOption(
                                    onPressed: Navigator.of(context).pop,
                                    child: const Text('Cancel'),
                                  ),
                                  SimpleDialogOption(
                                    child: const Text('Apply'),
                                    onPressed: () {
                                      final oldValue = ref.read(
                                        mainVehicleProvider.select(
                                          (value) =>
                                              value.imu.config.delayReadings,
                                        ),
                                      );
                                      ref.read(simInputProvider.notifier).send(
                                            ref
                                                .read(
                                                  mainVehicleProvider.select(
                                                    (value) => value.imu.config,
                                                  ),
                                                )
                                                .copyWith(
                                                  delayReadings: delayReadings,
                                                ),
                                          );
                                      // Wait a short while before saving the
                                      // hopefully updated vehicle.
                                      Timer(
                                        const Duration(milliseconds: 100),
                                        () {
                                          final vehicle =
                                              ref.watch(mainVehicleProvider);
                                          ref.read(
                                            saveVehicleProvider(vehicle),
                                          );
                                          Logger.instance.i(
                                            '''Updated vehicle IMU delay readings: $oldValue ms -> ${vehicle.imu.config.delayReadings} ms''',
                                          );
                                        },
                                      );
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
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
                              style: theme.textTheme.bodyLarge,
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
                        ),
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
                              style: theme.textTheme.bodyLarge,
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
                        ),
                      ],
                    );
                  },
                ),
              ),
              Consumer(
                builder: (context, ref, child) => ListTile(
                  title: Text(
                    '''Pitch gain: ${ref.watch(mainVehicleProvider.select((value) => value.imu.config.pitchGain)).toStringAsFixed(2)}''',
                  ),
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (context) => Consumer(
                      builder: (context, ref, child) {
                        var pitchGain = ref.watch(
                          mainVehicleProvider
                              .select((value) => value.imu.config.pitchGain),
                        );
                        return StatefulBuilder(
                          builder: (context, setState) => SimpleDialog(
                            contentPadding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 8,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Pitch gain: ${pitchGain.toStringAsFixed(2)}',
                                  style: theme.textTheme.bodyLarge,
                                ),
                                IconButton(
                                  onPressed: () =>
                                      setState(() => pitchGain = 1),
                                  icon: const Icon(Icons.refresh),
                                ),
                              ],
                            ),
                            children: [
                              Slider(
                                value: pitchGain,
                                onChanged: (value) =>
                                    setState(() => pitchGain = value),
                                max: 2,
                                divisions: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SimpleDialogOption(
                                    onPressed: Navigator.of(context).pop,
                                    child: const Text('Cancel'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      final oldValue = ref.read(
                                        mainVehicleProvider.select(
                                          (value) => value.imu.config.pitchGain,
                                        ),
                                      );
                                      ref.read(simInputProvider.notifier).send(
                                            ref
                                                .read(
                                                  mainVehicleProvider.select(
                                                    (value) => value.imu.config,
                                                  ),
                                                )
                                                .copyWith(pitchGain: pitchGain),
                                          );
                                      // Wait a short while before saving the
                                      // hopefully updated vehicle.
                                      Timer(
                                        const Duration(milliseconds: 100),
                                        () {
                                          final vehicle =
                                              ref.watch(mainVehicleProvider);
                                          ref.read(
                                            saveVehicleProvider(vehicle),
                                          );
                                          Logger.instance.i(
                                            '''Updated vehicle IMU pitch gain: $oldValue -> ${vehicle.imu.config.pitchGain}''',
                                          );
                                        },
                                      );
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Apply'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, child) => ListTile(
                  title: Text(
                    '''Roll gain: ${ref.watch(mainVehicleProvider.select((value) => value.imu.config.rollGain)).toStringAsFixed(2)}''',
                  ),
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (context) => Consumer(
                      builder: (context, ref, child) {
                        var rollGain = ref.watch(
                          mainVehicleProvider
                              .select((value) => value.imu.config.rollGain),
                        );
                        return StatefulBuilder(
                          builder: (context, setState) => SimpleDialog(
                            contentPadding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              bottom: 8,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Roll gain: ${rollGain.toStringAsFixed(2)}',
                                  style: theme.textTheme.bodyLarge,
                                ),
                                IconButton(
                                  onPressed: () => setState(() => rollGain = 1),
                                  icon: const Icon(Icons.refresh),
                                ),
                              ],
                            ),
                            children: [
                              Slider(
                                value: rollGain,
                                onChanged: (value) =>
                                    setState(() => rollGain = value),
                                max: 2,
                                divisions: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SimpleDialogOption(
                                    onPressed: Navigator.of(context).pop,
                                    child: const Text('Cancel'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      final oldValue = ref.read(
                                        mainVehicleProvider.select(
                                          (value) => value.imu.config.rollGain,
                                        ),
                                      );
                                      ref.read(simInputProvider.notifier).send(
                                            ref
                                                .read(
                                                  mainVehicleProvider.select(
                                                    (value) => value.imu.config,
                                                  ),
                                                )
                                                .copyWith(rollGain: rollGain),
                                          );
                                      // Wait a short while before saving the
                                      // hopefully updated vehicle.
                                      Timer(
                                        const Duration(milliseconds: 100),
                                        () {
                                          final vehicle =
                                              ref.watch(mainVehicleProvider);
                                          ref.read(
                                            saveVehicleProvider(vehicle),
                                          );
                                          Logger.instance.i(
                                            '''Updated vehicle IMU roll gain: $oldValue -> ${vehicle.imu.config.rollGain}''',
                                          );
                                        },
                                      );
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Apply'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Consumer(
                child: Text(
                  'Zero Pitch and Roll',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => ListTile(
                  title: child,
                  onTap: () {
                    final oldValues = ref.read(
                      mainVehicleProvider
                          .select((value) => value.imu.config.zeroValues),
                    );
                    ref
                        .read(simInputProvider.notifier)
                        .send((setZeroIMUPitchAndRoll: true));
                    // Wait a short while before saving the hopefully
                    // updated vehicle.
                    Timer(
                      const Duration(milliseconds: 100),
                      () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU zero values: $oldValues -> ${vehicle.imu.config.zeroValues}''',
                        );
                      },
                    );
                  },
                ),
              ),
              Consumer(
                child: Text(
                  'Zero Bearing to GNSS bearing',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => ListTile(
                  title: child,
                  onTap: () {
                    final oldValues = ref.read(
                      mainVehicleProvider
                          .select((value) => value.imu.config.zeroValues),
                    );
                    ref
                        .read(simInputProvider.notifier)
                        .send((setZeroIMUBearingToNextGNSSBearing: true));
                    // Wait a short while before saving the hopefully
                    // updated vehicle.
                    Timer(
                      const Duration(milliseconds: 1000),
                      () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU zero values: $oldValues -> ${vehicle.imu.config.zeroValues}''',
                        );
                      },
                    );
                  },
                ),
              ),
              Consumer(
                child: Text(
                  'Zero Bearing to North',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => ListTile(
                  title: child,
                  onTap: () {
                    final oldValues = ref.read(
                      mainVehicleProvider
                          .select((value) => value.imu.config.zeroValues),
                    );
                    ref
                        .read(simInputProvider.notifier)
                        .send((setZeroIMUBearingToNorth: true));
                    // Wait a short while before saving the hopefully
                    // updated vehicle.
                    Timer(
                      const Duration(milliseconds: 1000),
                      () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU zero values: $oldValues -> ${vehicle.imu.config.zeroValues}''',
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    final imuReading = ref.watch(imuCurrentReadingProvider);

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Raw IMU readings',
                          style: theme.textTheme.bodyLarge,
                        ),
                        if (imuReading != null) ...[
                          Text(
                            '''Yaw from startup: ${imuReading.yaw.toStringAsFixed(1)}º''',
                          ),
                          Text(
                            'Pitch: ${imuReading.pitch.toStringAsFixed(1)}º',
                          ),
                          Text(
                            'Roll: ${imuReading.roll.toStringAsFixed(1)}º',
                          ),
                          Text(
                            '''Acceleration X: ${imuReading.accelerationX.toStringAsFixed(3)}''',
                          ),
                          Text(
                            '''Acceleration Y: ${imuReading.accelerationY.toStringAsFixed(3)}''',
                          ),
                          Text(
                            '''Acceleration Z: ${imuReading.accelerationZ.toStringAsFixed(3)}''',
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              final freq =
                                  ref.watch(imuCurrentFrequencyProvider);

                              return Text(
                                '''Update frequency: ${freq?.toStringAsFixed(1)} Hz''',
                              );
                            },
                          ),
                        ] else
                          const Text('Not receiving IMU readings'),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
