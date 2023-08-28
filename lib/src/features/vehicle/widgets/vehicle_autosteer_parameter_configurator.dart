import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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
        height: 270,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.7),
            appBar: const TabBar(
              tabs: _tabs,
            ),
            body: const Padding(
              padding: EdgeInsets.all(8),
              child: TabBarView(
                children: [
                  _PidParametersConfigurator(),
                  _PurePursuitConfigurator(),
                  _StanleyParametersConfigurator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PidParametersConfigurator extends ConsumerWidget {
  const _PidParametersConfigurator();

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
                Text('I: ${i.toStringAsFixed(1)}'),
                Slider(
                  value: i,
                  max: 2,
                  divisions: 40,
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
                Text('D: ${d.toStringAsFixed(1)}'),
                Slider(
                  value: d,
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
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
