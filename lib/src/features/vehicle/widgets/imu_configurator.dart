import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/simulator/providers/providers.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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
        width: 260,
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.7),
          appBar: AppBar(
            primary: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'IMU Configurator',
                  style: theme.textTheme.bodyLarge,
                ),
                Consumer(
                  builder: (context, ref, child) => CloseButton(
                    onPressed: () => ref
                        .read(debugVehicleIMUProvider.notifier)
                        .update(value: false),
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              Consumer(
                child: Text(
                  'Use IMU bearing',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider
                        .select((value) => value.imuConfig.useBearing),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                        (useIMUBearing: value),
                      );
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Future.delayed(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU use bearing: ${!value} -> ${vehicle.imuConfig.useBearing}''',
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
                      (vehicle) => vehicle.imuConfig.usePitchAndRoll,
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref
                          .read(simInputProvider.notifier)
                          .send((useIMUPitchAndRoll: value));
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Future.delayed(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU use pitch and roll: ${!value} -> ${vehicle.imuConfig.usePitchAndRoll}''',
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
                      (vehicle) => vehicle.imuConfig.swapPitchAndRoll,
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref
                          .read(simInputProvider.notifier)
                          .send((swapPitchAndRoll: value));
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Future.delayed(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU swap pitch and roll: ${!value} -> ${vehicle.imuConfig.swapPitchAndRoll}''',
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
                        .select((vehicle) => vehicle.imuConfig.invertPitch),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref
                          .read(simInputProvider.notifier)
                          .send((invertPitch: value));
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Future.delayed(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU invert pitch: ${!value} -> ${vehicle.imuConfig.invertPitch}''',
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
                        .select((vehicle) => vehicle.imuConfig.invertRoll),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref
                          .read(simInputProvider.notifier)
                          .send((invertRoll: value));
                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Future.delayed(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU invert roll: ${!value} -> ${vehicle.imuConfig.invertRoll}''',
                        );
                      });
                    }
                  },
                  secondary: child,
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
                builder: (context, ref, child) {
                  var pitchGain = ref.read(
                    mainVehicleProvider
                        .select((value) => value.imuConfig.pitchGain),
                  );
                  return StatefulBuilder(
                    builder: (context, setState) => Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Pitch gain: ${pitchGain.toStringAsFixed(2)}',
                              style: theme.textTheme.bodyLarge,
                            ),
                            IconButton(
                              onPressed: () {
                                final oldValue = pitchGain;
                                ref
                                    .read(simInputProvider.notifier)
                                    .send((pitchGain: 1.0));
                                // Wait a short while before saving the
                                // hopefully updated vehicle.
                                Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () {
                                    final vehicle =
                                        ref.watch(mainVehicleProvider);
                                    ref.read(saveVehicleProvider(vehicle));
                                    Logger.instance.i(
                                      '''Updated vehicle IMU pitch gain: $oldValue -> ${vehicle.imuConfig.pitchGain}''',
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                          ],
                        ),
                        Slider(
                          value: pitchGain,
                          onChanged: (value) =>
                              setState(() => pitchGain = value),
                          onChangeEnd: (value) {
                            final oldValue = ref.read(
                              mainVehicleProvider.select(
                                (value) => value.imuConfig.pitchGain,
                              ),
                            );
                            ref
                                .read(simInputProvider.notifier)
                                .send((pitchGain: pitchGain));
                            // Wait a short while before saving the
                            // hopefully updated vehicle.
                            Future.delayed(
                              const Duration(milliseconds: 100),
                              () {
                                final vehicle = ref.watch(mainVehicleProvider);
                                ref.read(saveVehicleProvider(vehicle));
                                Logger.instance.i(
                                  '''Updated vehicle IMU pitch gain: $oldValue -> ${vehicle.imuConfig.pitchGain}''',
                                );
                              },
                            );
                          },
                          max: 2,
                          divisions: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  var rollGain = ref.read(
                    mainVehicleProvider
                        .select((value) => value.imuConfig.rollGain),
                  );
                  return StatefulBuilder(
                    builder: (context, setState) => Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Roll gain: ${rollGain.toStringAsFixed(2)}',
                              style: theme.textTheme.bodyLarge,
                            ),
                            IconButton(
                              onPressed: () {
                                final oldValue = rollGain;
                                ref
                                    .read(simInputProvider.notifier)
                                    .send((rollGain: 1.0));
                                // Wait a short while before saving the
                                // hopefully updated vehicle.
                                Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () {
                                    final vehicle =
                                        ref.watch(mainVehicleProvider);
                                    ref.read(
                                      saveVehicleProvider(vehicle),
                                    );
                                    Logger.instance.i(
                                      '''Updated vehicle IMU roll gain: $oldValue -> ${vehicle.imuConfig.rollGain}''',
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                          ],
                        ),
                        Slider(
                          value: rollGain,
                          onChanged: (value) =>
                              setState(() => rollGain = value),
                          onChangeEnd: (value) {
                            final oldValue = ref.read(
                              mainVehicleProvider.select(
                                (value) => value.imuConfig.rollGain,
                              ),
                            );
                            ref
                                .read(simInputProvider.notifier)
                                .send((rollGain: rollGain));
                            // Wait a short while before saving the hopefully
                            // updated vehicle.
                            Future.delayed(
                              const Duration(milliseconds: 100),
                              () {
                                final vehicle = ref.watch(mainVehicleProvider);
                                ref.read(saveVehicleProvider(vehicle));
                                Logger.instance.i(
                                  '''Updated vehicle IMU roll gain: $oldValue -> ${vehicle.imuConfig.rollGain}''',
                                );
                              },
                            );
                          },
                          max: 2,
                          divisions: 20,
                        ),
                      ],
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
                  onTap: () {
                    final oldValues = ref.read(
                      mainVehicleProvider
                          .select((value) => value.imuConfig.zeroValues),
                    );
                    ref
                        .read(simInputProvider.notifier)
                        .send((setZeroIMUPitchAndRoll: true));
                    // Wait a short while before saving the hopefully
                    // updated vehicle.
                    Future.delayed(
                      const Duration(milliseconds: 100),
                      () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU zero values: $oldValues -> ${vehicle.imuConfig.zeroValues}''',
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
                          .select((value) => value.imuConfig.zeroValues),
                    );
                    ref
                        .read(simInputProvider.notifier)
                        .send((setZeroIMUBearingToNextGNSSBearing: true));
                    // Wait a short while before saving the hopefully
                    // updated vehicle.
                    Future.delayed(
                      const Duration(milliseconds: 1000),
                      () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU zero values: $oldValues -> ${vehicle.imuConfig.zeroValues}''',
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
                          .select((value) => value.imuConfig.zeroValues),
                    );
                    ref
                        .read(simInputProvider.notifier)
                        .send((setZeroIMUBearingToNorth: true));
                    // Wait a short while before saving the hopefully
                    // updated vehicle.
                    Future.delayed(
                      const Duration(milliseconds: 1000),
                      () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle IMU zero values: $oldValues -> ${vehicle.imuConfig.zeroValues}''',
                        );
                      },
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
