import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/simulator/providers/providers.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A configurator widget for configuring how to use the WAS with the vehicle.
class SteeringHardwareConfigurator extends StatelessWidget {
  /// A configurator widget for configuring how to use the WAS with the vehicle.
  const SteeringHardwareConfigurator({super.key});

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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Steering Configurator'),
                Consumer(
                  builder: (context, ref, child) => CloseButton(
                    onPressed: () => ref
                        .read(debugVehicleWASProvider.notifier)
                        .update(value: false),
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              Text(
                'Motor',
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              // Threshold velocity
              Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    var threshold = ref.read(
                      mainVehicleProvider.select(
                        (vehicle) => vehicle.motorConfig.thresholdVelocity,
                      ),
                    );
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '''Threshold velocity: ${threshold.toStringAsFixed(2)} m/s''',
                                  style: theme.textTheme.bodyLarge,
                                ),
                                IconButton(
                                  onPressed: () {
                                    ref.read(simInputProvider.notifier).send(
                                          ref
                                              .read(
                                                mainVehicleProvider.select(
                                                  (value) => value.motorConfig,
                                                ),
                                              )
                                              .copyWith(
                                                thresholdVelocity: 0.05,
                                              ),
                                        );
                                    // Wait a short while before saving the
                                    // hopefully updated vehicle.
                                    Future.delayed(
                                        const Duration(milliseconds: 100), () {
                                      final vehicle =
                                          ref.watch(mainVehicleProvider);
                                      ref.read(saveVehicleProvider(vehicle));
                                      Logger.instance.i(
                                        '''Updated vehicle motor config threshold velocity: $threshold -> ${vehicle.motorConfig.thresholdVelocity}''',
                                      );
                                    });
                                  },
                                  icon: const Icon(Icons.refresh),
                                ),
                              ],
                            ),
                            Slider(
                              value: threshold,
                              onChanged: (value) =>
                                  setState(() => threshold = value),
                              onChangeEnd: (value) {
                                ref.read(simInputProvider.notifier).send(
                                      ref
                                          .read(
                                            mainVehicleProvider.select(
                                              (value) => value.motorConfig,
                                            ),
                                          )
                                          .copyWith(
                                            thresholdVelocity: value,
                                          ),
                                    );
                                // Wait a short while before saving the hopefully
                                // updated vehicle.
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  final vehicle =
                                      ref.watch(mainVehicleProvider);
                                  ref.read(saveVehicleProvider(vehicle));
                                  Logger.instance.i(
                                    '''Updated vehicle motor config threshold velocity: $threshold -> ${vehicle.motorConfig.thresholdVelocity}''',
                                  );
                                });
                              },
                              min: 0.01,
                              max: 0.4,
                              divisions: 39,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              // Motor max RPM
              Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    final rpm = ref.watch(
                      mainVehicleProvider
                          .select((vehicle) => vehicle.motorConfig.maxRPM),
                    );
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Max RPM: $rpm',
                              style: theme.textTheme.bodyLarge,
                            ),
                            IconButton(
                              onPressed: () {
                                ref.read(simInputProvider.notifier).send(
                                      ref
                                          .read(
                                            mainVehicleProvider.select(
                                              (value) => value.motorConfig,
                                            ),
                                          )
                                          .copyWith(maxRPM: 200),
                                    );
                                // Wait a short while before saving the
                                // hopefully updated vehicle.
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  final vehicle =
                                      ref.watch(mainVehicleProvider);
                                  ref.read(saveVehicleProvider(vehicle));
                                  Logger.instance.i(
                                    '''Updated vehicle motor config max RPM: $rpm -> ${vehicle.motorConfig.maxRPM}''',
                                  );
                                });
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                          ],
                        ),
                        Slider(
                          value: rpm.toDouble(),
                          onChanged: (value) {
                            ref.read(simInputProvider.notifier).send(
                                  ref
                                      .read(
                                        mainVehicleProvider.select(
                                          (value) => value.motorConfig,
                                        ),
                                      )
                                      .copyWith(
                                        maxRPM: value.round(),
                                      ),
                                );
                            // Wait a short while before saving the hopefully
                            // updated vehicle.
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              final vehicle = ref.watch(mainVehicleProvider);
                              ref.read(saveVehicleProvider(vehicle));
                              Logger.instance.i(
                                '''Updated vehicle motor config max RPM: $rpm -> ${vehicle.motorConfig.maxRPM}''',
                              );
                            });
                          },
                          max: 500,
                          divisions: 10,
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Invert motor output
              Consumer(
                child: Text(
                  'Invert motor output',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider.select(
                      (vehicle) => vehicle.motorConfig.invertOutput,
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                            ref
                                .read(
                                  mainVehicleProvider
                                      .select((value) => value.motorConfig),
                                )
                                .copyWith(invertOutput: value),
                          );

                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Future.delayed(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle motor config invert output: ${!value} -> ${vehicle.motorConfig.invertOutput}''',
                        );
                      });
                    }
                  },
                  secondary: child,
                ),
              ),
              const Divider(),
              Text(
                'WAS',
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),

              // Use WAS
              Consumer(
                child: Text(
                  'Use WAS',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider.select(
                      (vehicle) => vehicle.was.config.useWas,
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                            ref
                                .read(
                                  mainVehicleProvider
                                      .select((value) => value.was.config),
                                )
                                .copyWith(useWas: value),
                          );

                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Future.delayed(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle WAS config use WAS: ${!value} -> ${vehicle.was.config.useWas}''',
                        );
                      });
                    }
                  },
                  secondary: child,
                ),
              ),

              // Invert sensor
              Consumer(
                child: Text(
                  'Invert sensor input',
                  style: theme.textTheme.bodyLarge,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  value: ref.watch(
                    mainVehicleProvider
                        .select((vehicle) => vehicle.was.config.invertInput),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(simInputProvider.notifier).send(
                            ref
                                .read(
                                  mainVehicleProvider
                                      .select((value) => value.was.config),
                                )
                                .copyWith(invertInput: value),
                          );

                      // Wait a short while before saving the hopefully
                      // updated vehicle.
                      Future.delayed(const Duration(milliseconds: 100), () {
                        final vehicle = ref.watch(mainVehicleProvider);
                        ref.read(saveVehicleProvider(vehicle));
                        Logger.instance.i(
                          '''Updated vehicle WAS config invert input: ${!value} -> ${vehicle.was.config.invertInput}''',
                        );
                      });
                    }
                  },
                  secondary: child,
                ),
              ),
              // Bits
              Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    final bits = ref.watch(
                      mainVehicleProvider
                          .select((vehicle) => vehicle.was.config.bits),
                    );
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Bits: $bits',
                              style: theme.textTheme.bodyLarge,
                            ),
                            IconButton(
                              onPressed: () {
                                ref.read(simInputProvider.notifier).send(
                                      ref
                                          .read(
                                            mainVehicleProvider.select(
                                              (value) => value.was.config,
                                            ),
                                          )
                                          .copyWith(bits: 12),
                                    );
                                // Wait a short while before saving the
                                // hopefully updated vehicle.
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  final vehicle =
                                      ref.watch(mainVehicleProvider);
                                  ref.read(saveVehicleProvider(vehicle));
                                  Logger.instance.i(
                                    '''Updated vehicle WAS config bits: $bits -> ${vehicle.was.config.bits}''',
                                  );
                                });
                              },
                              icon: const Icon(Icons.refresh),
                            ),
                          ],
                        ),
                        Slider(
                          value: bits.toDouble(),
                          onChanged: (value) {
                            ref.read(simInputProvider.notifier).send(
                                  ref
                                      .read(
                                        mainVehicleProvider.select(
                                          (value) => value.was.config,
                                        ),
                                      )
                                      .copyWith(
                                        bits: value.round(),
                                        max:
                                            (pow(2, value.round()) - 1).round(),
                                        center: (pow(2, value.round() - 1) - 1)
                                            .round(),
                                      ),
                                );
                            // Wait a short while before saving the hopefully
                            // updated vehicle.
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              final vehicle = ref.watch(mainVehicleProvider);
                              ref.read(saveVehicleProvider(vehicle));
                              Logger.instance.i(
                                '''Updated vehicle WAS config bits: $bits -> ${vehicle.was.config.bits}''',
                              );
                            });
                          },
                          min: 10,
                          max: 20,
                          divisions: 10,
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Sensor discrete reading
              Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    final config = ref.watch(
                      mainVehicleProvider.select((value) => value.was.config),
                    );

                    final reading = ref
                        .watch(
                          mainVehicleProvider.select(
                            (vehicle) => vehicle.was.reading.value,
                          ),
                        )
                        .clamp(0, pow(2, config.bits) - 1);
                    return Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Discrete: $reading',
                              style: theme.textTheme.bodyLarge,
                            ),
                            IconButton(
                              onPressed: () => ref
                                  .read(simInputProvider.notifier)
                                  .send((wasReading: config.center)),
                              icon: const Icon(Icons.refresh),
                            ),
                          ],
                        ),
                        Slider(
                          value: reading.toDouble(),
                          onChanged: (value) => ref
                              .read(simInputProvider.notifier)
                              .send((wasReading: value.round())),
                          max: pow(2, config.bits).toDouble() - 1,
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Sensor normalized reading
              Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    final reading = ref
                        .watch(
                          mainVehicleProvider.select(
                            (vehicle) => vehicle.was.readingNormalizedInRange,
                          ),
                        )
                        .clamp(-1.0, 1.0);
                    return Column(
                      children: [
                        Text(
                          'Normalized: ${reading.toStringAsFixed(3)}',
                          style: theme.textTheme.bodyLarge,
                        ),
                        Slider(
                          value: reading,
                          onChanged: null,
                          min: -1,
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Range center
              Consumer(
                builder: (context, ref, child) {
                  final config = ref.watch(
                    mainVehicleProvider.select((value) => value.was.config),
                  );
                  var center = config.center;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Center: $center',
                                style: theme.textTheme.bodyLarge,
                              ),
                              IconButton(
                                onPressed: () {
                                  final oldValue = config.center;
                                  ref.read(simInputProvider.notifier).send(
                                        config.copyWith(
                                          center: (pow(2, config.bits - 1) - 1)
                                              .round(),
                                        ),
                                      );
                                  // Wait a short while before saving the
                                  // hopefully updated vehicle.
                                  Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () {
                                      final vehicle =
                                          ref.watch(mainVehicleProvider);
                                      ref.read(saveVehicleProvider(vehicle));
                                      Logger.instance.i(
                                        '''Updated vehicle WAS center point: $oldValue -> ${vehicle.was.config.center}''',
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.refresh),
                              ),
                              FilledButton(
                                onPressed: () {
                                  final oldValue = config.center;
                                  ref.read(simInputProvider.notifier).send(
                                        config.copyWith(
                                          center: ref.read(
                                            mainVehicleProvider.select(
                                              (value) =>
                                                  value.was.reading.value,
                                            ),
                                          ),
                                        ),
                                      );
                                  // Wait a short while before saving the
                                  // hopefully updated vehicle.
                                  Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () {
                                      final vehicle =
                                          ref.watch(mainVehicleProvider);
                                      ref.read(saveVehicleProvider(vehicle));
                                      Logger.instance.i(
                                        '''Updated vehicle WAS center point: $oldValue -> ${vehicle.was.config.center}''',
                                      );
                                    },
                                  );
                                },
                                child: const Text('Set'),
                              ),
                            ],
                          ),
                          Slider(
                            value: center.toDouble(),
                            onChanged: (value) =>
                                setState(() => center = value.round()),
                            onChangeEnd: (value) {
                              final oldValue = config.center;
                              ref.read(simInputProvider.notifier).send(
                                    config.copyWith(center: value.round()),
                                  );
                              // Wait a short while before saving the
                              // hopefully updated vehicle.
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () {
                                  final vehicle =
                                      ref.watch(mainVehicleProvider);
                                  ref.read(saveVehicleProvider(vehicle));
                                  Logger.instance.i(
                                    '''Updated vehicle WAS center point: $oldValue -> ${vehicle.was.config.center}''',
                                  );
                                },
                              );
                            },
                            max: pow(2, config.bits).toDouble() - 1,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              // Range min
              Consumer(
                builder: (context, ref, child) {
                  final config = ref.watch(
                    mainVehicleProvider.select((value) => value.was.config),
                  );
                  var min = config.min;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Min: $min',
                                style: theme.textTheme.bodyLarge,
                              ),
                              IconButton(
                                onPressed: () {
                                  final oldValue = config.min;
                                  ref.read(simInputProvider.notifier).send(
                                        config.copyWith(min: 0),
                                      );
                                  // Wait a short while before saving the
                                  // hopefully updated vehicle.
                                  Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () {
                                      final vehicle =
                                          ref.watch(mainVehicleProvider);
                                      ref.read(saveVehicleProvider(vehicle));
                                      Logger.instance.i(
                                        '''Updated vehicle WAS min point: $oldValue -> ${vehicle.was.config.min}''',
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.refresh),
                              ),
                              FilledButton(
                                onPressed: () {
                                  final oldValue = config.center;
                                  ref.read(simInputProvider.notifier).send(
                                        config.copyWith(
                                          min: ref.read(
                                            mainVehicleProvider.select(
                                              (value) =>
                                                  value.was.reading.value,
                                            ),
                                          ),
                                        ),
                                      );
                                  // Wait a short while before saving the
                                  // hopefully updated vehicle.
                                  Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () {
                                      final vehicle =
                                          ref.watch(mainVehicleProvider);
                                      ref.read(saveVehicleProvider(vehicle));
                                      Logger.instance.i(
                                        '''Updated vehicle WAS min point: $oldValue -> ${vehicle.was.config.min}''',
                                      );
                                    },
                                  );
                                },
                                child: const Text('Set'),
                              ),
                            ],
                          ),
                          Slider(
                            value: min.toDouble(),
                            onChanged: (value) =>
                                setState(() => min = value.round()),
                            onChangeEnd: (value) {
                              final oldValue = config.min;
                              ref.read(simInputProvider.notifier).send(
                                    config.copyWith(min: value.round()),
                                  );
                              // Wait a short while before saving the
                              // hopefully updated vehicle.
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () {
                                  final vehicle =
                                      ref.watch(mainVehicleProvider);
                                  ref.read(saveVehicleProvider(vehicle));
                                  Logger.instance.i(
                                    '''Updated vehicle WAS min point: $oldValue -> ${vehicle.was.config.min}''',
                                  );
                                },
                              );
                            },
                            max: pow(2, config.bits).toDouble() - 1,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              // Range max
              Consumer(
                builder: (context, ref, child) {
                  final config = ref.watch(
                    mainVehicleProvider.select((value) => value.was.config),
                  );
                  var max = config.max;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Max: $max',
                                style: theme.textTheme.bodyLarge,
                              ),
                              IconButton(
                                onPressed: () {
                                  final oldValue = config.min;
                                  ref.read(simInputProvider.notifier).send(
                                        config.copyWith(
                                          max: pow(2, config.bits).round() - 1,
                                        ),
                                      );
                                  // Wait a short while before saving the
                                  // hopefully updated vehicle.
                                  Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () {
                                      final vehicle =
                                          ref.watch(mainVehicleProvider);
                                      ref.read(saveVehicleProvider(vehicle));
                                      Logger.instance.i(
                                        '''Updated vehicle WAS max point: $oldValue -> ${vehicle.was.config.max}''',
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.refresh),
                              ),
                              FilledButton(
                                onPressed: () {
                                  final oldValue = config.center;
                                  ref.read(simInputProvider.notifier).send(
                                        config.copyWith(
                                          max: ref.read(
                                            mainVehicleProvider.select(
                                              (value) =>
                                                  value.was.reading.value,
                                            ),
                                          ),
                                        ),
                                      );
                                  // Wait a short while before saving the
                                  // hopefully updated vehicle.
                                  Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () {
                                      final vehicle =
                                          ref.watch(mainVehicleProvider);
                                      ref.read(saveVehicleProvider(vehicle));
                                      Logger.instance.i(
                                        '''Updated vehicle WAS max point: $oldValue -> ${vehicle.was.config.max}''',
                                      );
                                    },
                                  );
                                },
                                child: const Text('Set'),
                              ),
                            ],
                          ),
                          Slider(
                            value: max.toDouble(),
                            onChanged: (value) =>
                                setState(() => max = value.round()),
                            onChangeEnd: (value) {
                              final oldValue = config.max;
                              ref.read(simInputProvider.notifier).send(
                                    config.copyWith(max: value.round()),
                                  );
                              // Wait a short while before saving the
                              // hopefully updated vehicle.
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () {
                                  final vehicle =
                                      ref.watch(mainVehicleProvider);
                                  ref.read(saveVehicleProvider(vehicle));
                                  Logger.instance.i(
                                    '''Updated vehicle WAS max point: $oldValue -> ${vehicle.was.config.max}''',
                                  );
                                },
                              );
                            },
                            max: pow(2, config.bits).toDouble() - 1,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              // Raw data
              Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    final reading = ref.watch(wasCurrentReadingProvider);

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Raw WAS reading',
                          style: theme.textTheme.bodyLarge,
                        ),
                        if (reading != null) ...[
                          Text(
                            'Value: ${reading.value}',
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              final freq =
                                  ref.watch(wasCurrentFrequencyProvider);

                              return Text(
                                '''Update frequency: ${freq?.toStringAsFixed(1)} Hz''',
                              );
                            },
                          ),
                        ] else
                          const Text('Not receiving WAS readings'),
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
