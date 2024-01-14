import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A widget for configuring the active vehicle's autosteering parameters on
/// the fly.
class VehicleAutosteerParameterConfigurator extends StatelessWidget {
  /// A widget for configuring the active vehicle's autosteering parameters
  /// on the fly.
  const VehicleAutosteerParameterConfigurator({super.key});

  static const List<Tab> _tabs = [
    Tab(text: 'PID'),
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
        height: 325,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.7),
            appBar: AppBar(
              primary: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Autosteering configurator',
                    style: theme.textTheme.bodyLarge,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return CloseButton(
                        onPressed: () => ref
                            .read(
                              debugVehicleAutosteerParametersProvider.notifier,
                            )
                            .update(value: false),
                      );
                    },
                  ),
                ],
              ),
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
                        _PidParametersConfigurator(),
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

class _PidParametersConfigurator extends ConsumerWidget {
  const _PidParametersConfigurator();

  void onChangeEnd(double value, WidgetRef ref) {
    // Wait a short while before saving the hopefully
    // updated vehicle.
    Future.delayed(const Duration(milliseconds: 100), () {
      final vehicle = ref.watch(mainVehicleProvider);
      ref.read(saveVehicleProvider(vehicle));
      Logger.instance.i(
        '''Updated vehicle PID parameters: ${vehicle.pidParameters}''',
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // P
        Consumer(
          builder: (context, ref, child) {
            final p = ref.watch(
              mainVehicleProvider.select((vehicle) => vehicle.pidParameters.p),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('P: ${p.toStringAsFixed(1)}'),
                Slider(
                  value: p,
                  max: 50,
                  divisions: 50,
                  onChanged: (value) {
                    ref.read(simInputProvider.notifier).send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.pidParameters,
                                ),
                              )
                              .copyWith(p: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            pidParameters: configuredVehicle.pidParameters
                                .copyWith(p: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) => onChangeEnd(value, ref),
                ),
              ],
            );
          },
        ),
        // I
        Consumer(
          builder: (context, ref, child) {
            final i = ref.watch(
              mainVehicleProvider.select((vehicle) => vehicle.pidParameters.i),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('I: ${i.toStringAsFixed(3)}'),
                Slider(
                  value: i,
                  max: 2,
                  divisions: 200,
                  onChanged: (value) {
                    ref.read(simInputProvider.notifier).send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.pidParameters,
                                ),
                              )
                              .copyWith(i: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            pidParameters: configuredVehicle.pidParameters
                                .copyWith(i: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) => onChangeEnd(value, ref),
                ),
              ],
            );
          },
        ),
        // D
        Consumer(
          builder: (context, ref, child) {
            final d = ref.watch(
              mainVehicleProvider.select((vehicle) => vehicle.pidParameters.d),
            );
            return Column(  
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('D: ${d.toStringAsFixed(3)}'),
                Slider(
                  value: d,
                  max: 0.5,
                  divisions: 500,
                  onChanged: (value) {
                    ref.read(simInputProvider.notifier).send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.pidParameters,
                                ),
                              )
                              .copyWith(d: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            pidParameters: configuredVehicle.pidParameters
                                .copyWith(d: value),
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

class _PurePursuitConfigurator extends ConsumerWidget {
  const _PurePursuitConfigurator();

  void onChangeEnd(double value, WidgetRef ref) {
    // Wait a short while before saving the hopefully
    // updated vehicle.
    Future.delayed(const Duration(milliseconds: 100), () {
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
                (vehicle) => vehicle.purePursuitParameters.lookAheadDistance,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Look ahead: ${lookAhead.toStringAsFixed(1)} m'),
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
                              .copyWith(lookAheadDistance: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            purePursuitParameters: configuredVehicle
                                .purePursuitParameters
                                .copyWith(lookAheadDistance: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) => onChangeEnd(value, ref),
                ),
              ],
            );
          },
        ),
        // Look ahead velocity gain
        Consumer(
          builder: (context, ref, child) {
            final velocityGain = ref.watch(
              mainVehicleProvider.select(
                (vehicle) =>
                    vehicle.purePursuitParameters.lookAheadVelocityGain,
              ),
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
                                  (vehicle) => vehicle.purePursuitParameters,
                                ),
                              )
                              .copyWith(lookAheadVelocityGain: value),
                        );

                    final configuredVehicle =
                        ref.watch(configuredVehicleProvider);
                    ref.read(configuredVehicleProvider.notifier).update(
                          configuredVehicle.copyWith(
                            purePursuitParameters: configuredVehicle
                                .purePursuitParameters
                                .copyWith(lookAheadVelocityGain: value),
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
    Future.delayed(const Duration(milliseconds: 100), () {
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
