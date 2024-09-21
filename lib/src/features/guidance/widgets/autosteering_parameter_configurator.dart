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
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A widget for configuring the active vehicle's autosteering parameters on
/// the fly.
class AutosteeringParameterConfigurator extends StatelessWidget {
  /// A widget for configuring the active vehicle's autosteering parameters
  /// on the fly.
  const AutosteeringParameterConfigurator({super.key});

  static const List<Tab> _tabs = [
    Tab(text: 'Pure\nPursuit'),
    Tab(text: 'Stanley'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: Colors.transparent,
      child: SizedBox(
        width: 300,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.7),
            appBar: AppBar(
              primary: false,
              title: const Text('Steering parameters'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Consumer(
                    builder: (context, ref, child) {
                      return CloseButton(
                        onPressed: () => ref
                            .read(
                              showAutosteeringParameterConfigProvider.notifier,
                            )
                            .update(value: false),
                      );
                    },
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                TabBar(
                  labelStyle: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w900),
                  unselectedLabelStyle: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w300),
                  tabs: _tabs,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: TabBarView(
                      children: [
                        _PurePursuitConfigurator(),
                        _StanleyParametersConfigurator(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _PurePursuitConfigurator extends ConsumerWidget {
  const _PurePursuitConfigurator();

  void onChangeEnd(double value, WidgetRef ref) {
    // Wait a short while before saving the hopefully
    // updated vehicle.
    Timer(const Duration(milliseconds: 100), () {
      final vehicle = ref.watch(mainVehicleProvider);
      ref.read(saveVehicleProvider(vehicle));
      Logger.instance.i(
        '''Updated vehicle pure pursuit parameters: ${vehicle.purePursuitParameters}''',
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Look ahead
        Consumer(
          builder: (context, ref, child) {
            final lookAhead = ref.watch(
              mainVehicleProvider.select(
                (vehicle) => vehicle.purePursuitParameters.lookAheadMinDistance,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '''Look ahead min distance: ${lookAhead.toStringAsFixed(1)} m''',
                ),
                Slider(
                  value: lookAhead,
                  max: 10,
                  divisions: 100,
                  onChanged: (value) {
                    ref.read(simInputProvider.notifier).send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.purePursuitParameters,
                                ),
                              )
                              .copyWith(lookAheadMinDistance: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            purePursuitParameters: configuredVehicle
                                .purePursuitParameters
                                .copyWith(lookAheadMinDistance: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) => onChangeEnd(value, ref),
                ),
              ],
            );
          },
        ),
        // Look ahead time
        Consumer(
          builder: (context, ref, child) {
            final velocityGain = ref.watch(
              mainVehicleProvider.select(
                (vehicle) => vehicle.purePursuitParameters.lookAheadSeconds,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Look ahead time: ${velocityGain.toStringAsFixed(1)} s',
                ),
                Slider(
                  value: velocityGain,
                  max: 5,
                  divisions: 50,
                  onChanged: (value) {
                    ref.read(simInputProvider.notifier).send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.purePursuitParameters,
                                ),
                              )
                              .copyWith(lookAheadSeconds: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            purePursuitParameters: configuredVehicle
                                .purePursuitParameters
                                .copyWith(lookAheadSeconds: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) => onChangeEnd(value, ref),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _StanleyParametersConfigurator extends ConsumerWidget {
  const _StanleyParametersConfigurator();

  void onChangeEnd(double value, WidgetRef ref) {
    // Wait a short while before saving the hopefully
    // updated vehicle.
    Timer(const Duration(milliseconds: 100), () {
      final vehicle = ref.watch(mainVehicleProvider);
      ref.read(saveVehicleProvider(vehicle));
      Logger.instance.i(
        '''Updated vehicle Stanley parameters: ${vehicle.stanleyParameters}''',
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Cross distance gain
        Consumer(
          builder: (context, ref, child) {
            final crossGain = ref.watch(
              mainVehicleProvider.select(
                (vehicle) => vehicle.stanleyParameters.crossDistanceGain,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Cross distance gain: ${crossGain.toStringAsFixed(1)}'),
                Slider(
                  value: crossGain,
                  max: 3,
                  divisions: 30,
                  onChanged: (value) {
                    ref.read(simInputProvider.notifier).send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.stanleyParameters,
                                ),
                              )
                              .copyWith(crossDistanceGain: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            stanleyParameters: configuredVehicle
                                .stanleyParameters
                                .copyWith(crossDistanceGain: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) => onChangeEnd(value, ref),
                ),
              ],
            );
          },
        ),
        // Softening gain
        Consumer(
          builder: (context, ref, child) {
            final softeningGain = ref.watch(
              mainVehicleProvider
                  .select((vehicle) => vehicle.stanleyParameters.softeningGain),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Softening gain: ${softeningGain.toStringAsExponential(1)}',
                ),
                Slider(
                  value: softeningGain,
                  max: 10e-5,
                  divisions: 100,
                  onChanged: (value) {
                    ref.read(simInputProvider.notifier).send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.stanleyParameters,
                                ),
                              )
                              .copyWith(softeningGain: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            stanleyParameters: configuredVehicle
                                .stanleyParameters
                                .copyWith(softeningGain: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) => onChangeEnd(value, ref),
                ),
              ],
            );
          },
        ),
        // Velocity gain
        Consumer(
          builder: (context, ref, child) {
            final velocityGain = ref.watch(
              mainVehicleProvider
                  .select((vehicle) => vehicle.stanleyParameters.velocityGain),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Velocity gain: ${velocityGain.toStringAsFixed(1)}'),
                Slider(
                  value: velocityGain,
                  max: 3,
                  divisions: 30,
                  onChanged: (value) {
                    ref.read(simInputProvider.notifier).send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.stanleyParameters,
                                ),
                              )
                              .copyWith(velocityGain: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            stanleyParameters: configuredVehicle
                                .stanleyParameters
                                .copyWith(velocityGain: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) => onChangeEnd(value, ref),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
