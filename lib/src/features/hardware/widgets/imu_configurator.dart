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
import 'dart:ui';

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
          primary: false,
          backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.7),
          appBar: AppBar(
            primary: false,
            scrolledUnderElevation: 0,
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
                    builder: (context) => const _DelayReadingsDialog(),
                  ),
                ),
              ),
              Consumer(
                child: Text(
                  'Only use GNSS synced readings',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider.select(
                      (value) => value.imu.config.useOnlyGnssSyncedReadings,
                    ),
                  ),
                  subtitle: const Text('DO NOT DISABLE'),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                            ref
                                .read(
                                  mainVehicleProvider
                                      .select((value) => value.imu.config),
                                )
                                .copyWith(useOnlyGnssSyncedReadings: value),
                          );
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Timer(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU only use GNSS synced readings: ${!value} -> ${vehicle.imu.config.useOnlyGnssSyncedReadings}''',
                        );
                      });
                    }
                  },
                  title: child,
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
                          value: clampDouble(pitch, -25, 25),
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
                          value: clampDouble(roll, -25, 25),
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
                    builder: (context) => const _PitchGainDialog(),
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final gain = ref.watch(
                    mainVehicleProvider
                        .select((value) => value.imu.config.rollGain),
                  );
                  final asymmetricRollGainLeft = ref.watch(
                    mainVehicleProvider.select(
                      (value) => value.imu.config.asymmetricRollGainLeft,
                    ),
                  );
                  return ListTile(
                    title: Text(
                      [
                        '''${asymmetricRollGainLeft != null ? 'Right roll' : 'Roll'} gain: ${gain.toStringAsFixed(2)}''',
                        if (asymmetricRollGainLeft != null)
                          '''Left roll gain: ${asymmetricRollGainLeft.toStringAsFixed(2)}''',
                      ].join('\n'),
                    ),
                    onTap: () => showDialog<void>(
                      context: context,
                      builder: (context) => const _RollGainDialog(),
                    ),
                  );
                },
              ),
              Consumer(
                child: Text(
                  'Zero Pitch and Roll',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => ListTile(
                  title: child,
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (context) => const _ZeroPitchAndRollDialog(),
                  ),
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

class _DelayReadingsDialog extends ConsumerStatefulWidget {
  const _DelayReadingsDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __DelayReadingsDialogState();
}

class __DelayReadingsDialogState extends ConsumerState<_DelayReadingsDialog> {
  late int delayReadings = ref.watch(
    mainVehicleProvider.select(
      (value) => value.imu.config.delayReadings,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(
        left: 24,
        top: 12,
        right: 24,
        bottom: 16,
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
              () => delayReadings = const ImuConfig().delayReadings,
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
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(Icons.clear),
                label: const Text('Cancel'),
              ),
              FilledButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Apply'),
                onPressed: () {
                  final oldValue = ref.read(
                    mainVehicleProvider.select(
                      (value) => value.imu.config.delayReadings,
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
                      final vehicle = ref.watch(mainVehicleProvider);
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
        ),
      ],
    );
  }
}

class _PitchGainDialog extends ConsumerStatefulWidget {
  const _PitchGainDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __PitchGainDialogState();
}

class __PitchGainDialogState extends ConsumerState<_PitchGainDialog> {
  late double pitchGain = ref.watch(
    mainVehicleProvider.select((value) => value.imu.config.pitchGain),
  );
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(
        left: 24,
        top: 12,
        right: 24,
        bottom: 16,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pitch gain: ${pitchGain.toStringAsFixed(2)}',
            style: theme.textTheme.bodyLarge,
          ),
          IconButton(
            onPressed: () => setState(() => pitchGain = 1),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      children: [
        Slider(
          value: pitchGain,
          onChanged: (value) => setState(() => pitchGain = value),
          max: 2,
          divisions: 20,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(Icons.clear),
                label: const Text('Cancel'),
              ),
              FilledButton.icon(
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
                            .copyWith(
                              pitchGain: pitchGain,
                            ),
                      );
                  // Wait a short while before saving the
                  // hopefully updated vehicle.
                  Timer(
                    const Duration(milliseconds: 100),
                    () {
                      final vehicle = ref.watch(mainVehicleProvider);
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
                icon: const Icon(Icons.check),
                label: const Text('Apply'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RollGainDialog extends ConsumerStatefulWidget {
  const _RollGainDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __RollGainDialogState();
}

class __RollGainDialogState extends ConsumerState<_RollGainDialog> {
  late double rollGain = ref.watch(
    mainVehicleProvider.select((value) => value.imu.config.rollGain),
  );
  late double? asymmetricRollGainLeft = ref.watch(
    mainVehicleProvider.select(
      (value) => value.imu.config.asymmetricRollGainLeft,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SimpleDialog(
      contentPadding: const EdgeInsets.only(
        left: 24,
        top: 12,
        right: 24,
        bottom: 16,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '''Roll gain ${asymmetricRollGainLeft != null ? '' : ' ${rollGain.toStringAsFixed(2)}'}''',
            style: theme.textTheme.bodyLarge,
          ),
          IconButton(
            onPressed: () => setState(() {
              rollGain = 1;
              asymmetricRollGainLeft = null;
            }),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      children: [
        CheckboxListTile(
          value: asymmetricRollGainLeft != null,
          onChanged: (value) => setState(
            () => asymmetricRollGainLeft = switch (value) {
              true => 1,
              _ => null,
            },
          ),
          secondary: Text(
            'Asymmetric roll gain',
            style: theme.textTheme.bodyLarge,
          ),
        ),
        if (asymmetricRollGainLeft != null)
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Right gain: ${rollGain.toStringAsFixed(2)}',
              style: theme.textTheme.bodyLarge,
            ),
          ),
        Slider(
          value: rollGain,
          onChanged: (value) => setState(() => rollGain = value),
          max: 2,
          divisions: 20,
        ),
        if (asymmetricRollGainLeft != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Left gain: ${asymmetricRollGainLeft?.toStringAsFixed(2)}',
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Slider(
            value: asymmetricRollGainLeft ?? 1,
            onChanged: (value) =>
                setState(() => asymmetricRollGainLeft = value),
            max: 2,
            divisions: 20,
          ),
        ],
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(Icons.clear),
                label: const Text('Cancel'),
              ),
              FilledButton.icon(
                onPressed: () {
                  final oldValues = ref.read(
                    mainVehicleProvider.select(
                      (value) => (
                        rollGain: value.imu.config.rollGain,
                        asymmetricRollGainLeft:
                            value.imu.config.asymmetricRollGainLeft
                      ),
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
                              rollGain: rollGain,
                              asymmetricRollGainLeft: asymmetricRollGainLeft,
                            ),
                      );
                  // Wait a short while before saving the
                  // hopefully updated vehicle.
                  Timer(
                    const Duration(milliseconds: 100),
                    () {
                      final vehicle = ref.watch(mainVehicleProvider);
                      ref.read(
                        saveVehicleProvider(vehicle),
                      );
                      final newValues = (
                        rollGain: vehicle.imu.config.rollGain,
                        asymmetricRollGainLeft:
                            vehicle.imu.config.asymmetricRollGainLeft
                      );
                      Logger.instance.i(
                        '''Updated vehicle IMU roll gain: $oldValues -> $newValues''',
                      );
                    },
                  );
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.check),
                label: const Text('Apply'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ZeroPitchAndRollDialog extends ConsumerWidget {
  const _ZeroPitchAndRollDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: const Text('Zero Pitch and Roll?'),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                const Text(
                  '''Ensure that you are on a flat and horizontal surface, preferably concrete or asphalt.''',
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ElevatedButton.icon(
                        label: const Text('Cancel'),
                        icon: const Icon(Icons.clear),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      FilledButton.icon(
                        label: const Text('Confirm'),
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          final oldValues = ref.read(
                            mainVehicleProvider.select(
                              (value) => value.imu.config.zeroValues,
                            ),
                          );
                          ref.read(simInputProvider.notifier).send(
                            (setZeroIMUPitchAndRoll: true),
                          );
                          // Wait a short while before saving the hopefully
                          // updated vehicle.
                          Timer(
                            const Duration(milliseconds: 100),
                            () {
                              final vehicle = ref.watch(mainVehicleProvider);
                              ref.read(
                                saveVehicleProvider(vehicle),
                              );
                              Logger.instance.i(
                                '''Updated vehicle IMU zero values: $oldValues -> ${vehicle.imu.config.zeroValues}''',
                              );
                            },
                          );
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A draggable version of [ImuConfigurator], typically used as
/// a child of a [Stack] that is a child of a [LayoutBuilder].
class DraggableImuConfigurator extends ConsumerWidget {
  /// A draggable version of [ImuConfigurator], typically used as
  /// a child of a [Stack] that is a child of a [LayoutBuilder].
  ///
  /// [constraints] as used to layout the widget.
  const DraggableImuConfigurator({required this.constraints, super.key});

  /// Constraints used to layout this widget.
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) => DynamicDraggableWidget(
        offset: ref.watch(imuConfiguratorUiOffsetProvider),
        constraints: constraints,
        maxWidth: 350,
        maxHeight: 700,
        maxWidthFraction: 0.7,
        maxHeightFraction: 1,
        onDragEnd: ref.read(imuConfiguratorUiOffsetProvider.notifier).update,
        child: const ImuConfigurator(),
      );
}
