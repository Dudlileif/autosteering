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
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A widget for configuring the active vehicle's autosteering parameters on
/// the fly.
class AutosteeringParameterConfigurator extends StatelessWidget {
  /// A widget for configuring the active vehicle's autosteering parameters
  /// on the fly.
  const AutosteeringParameterConfigurator({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Card(
      color: Colors.transparent,
      child: SizedBox(
        width: 300,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor.withValues(
              alpha: 0.7,
            ),
            appBar: AppBar(
              primary: false,
              title: Text(strings.autosteeringParameters),
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
                  labelStyle: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                  unselectedLabelStyle: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                  tabs: [
                    Tab(text: strings.trackingModePurePursuit),
                    Tab(text: strings.trackingModeStanley),
                  ],
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
      ref.read(updateVehicleProvider(vehicle));
      Logger.instance.i(
        '''Updated vehicle pure pursuit parameters: ${vehicle.pathTrackingParameters.purePursuit}''',
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Look ahead
        Consumer(
          builder: (context, ref, child) {
            final lookAhead = ref.watch(
              mainVehicleProvider.select(
                (vehicle) => vehicle
                    .pathTrackingParameters
                    .purePursuit
                    .lookAheadMinDistance,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(strings.lookAheadMinDistance(lookAhead)),
                Slider(
                  value: lookAhead,
                  max: 10,
                  divisions: 100,
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle
                                      .pathTrackingParameters
                                      .purePursuit,
                                ),
                              )
                              .copyWith(lookAheadMinDistance: value),
                        );

                    final configuredVehicle = ref.watch(
                      configuredVehicleProvider,
                    );
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          configuredVehicle.copyWith(
                            pathTrackingParameters: configuredVehicle
                                .pathTrackingParameters
                                .copyWith
                                .purePursuit(lookAheadMinDistance: value),
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
            final lookAheadTime = ref.watch(
              mainVehicleProvider.select(
                (vehicle) =>
                    vehicle.pathTrackingParameters.purePursuit.lookAheadSeconds,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(strings.lookAheadTime(lookAheadTime)),
                Slider(
                  value: lookAheadTime,
                  max: 5,
                  divisions: 50,
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle
                                      .pathTrackingParameters
                                      .purePursuit,
                                ),
                              )
                              .copyWith(lookAheadSeconds: value),
                        );

                    final configuredVehicle = ref.watch(
                      configuredVehicleProvider,
                    );
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          configuredVehicle.copyWith(
                            pathTrackingParameters: configuredVehicle
                                .pathTrackingParameters
                                .copyWith
                                .purePursuit(lookAheadSeconds: value),
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
      ref.read(updateVehicleProvider(vehicle));
      Logger.instance.i(
        '''Updated vehicle Stanley parameters: ${vehicle.pathTrackingParameters.stanley}''',
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Cross distance gain
        Consumer(
          builder: (context, ref, child) {
            final crossGain = ref.watch(
              mainVehicleProvider.select(
                (vehicle) =>
                    vehicle.pathTrackingParameters.stanley.crossDistanceGain,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  strings.crossDistanceGain(crossGain),
                ),
                Slider(
                  value: crossGain,
                  max: 3,
                  divisions: 30,
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) =>
                                      vehicle.pathTrackingParameters.stanley,
                                ),
                              )
                              .copyWith(crossDistanceGain: value),
                        );

                    final configuredVehicle = ref.watch(
                      configuredVehicleProvider,
                    );
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          configuredVehicle.copyWith(
                            pathTrackingParameters: configuredVehicle
                                .pathTrackingParameters
                                .copyWith
                                .stanley(crossDistanceGain: value),
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
              mainVehicleProvider.select(
                (vehicle) =>
                    vehicle.pathTrackingParameters.stanley.softeningGain,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(strings.softeningGain(softeningGain)),
                Slider(
                  value: softeningGain,
                  max: 10e-5,
                  divisions: 100,
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) =>
                                      vehicle.pathTrackingParameters.stanley,
                                ),
                              )
                              .copyWith(softeningGain: value),
                        );

                    final configuredVehicle = ref.watch(
                      configuredVehicleProvider,
                    );
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          configuredVehicle.copyWith(
                            pathTrackingParameters: configuredVehicle
                                .pathTrackingParameters
                                .copyWith
                                .stanley(softeningGain: value),
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
              mainVehicleProvider.select(
                (vehicle) =>
                    vehicle.pathTrackingParameters.stanley.velocityGain,
              ),
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(strings.velocityGain(velocityGain)),
                Slider(
                  value: velocityGain,
                  max: 3,
                  divisions: 30,
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) =>
                                      vehicle.pathTrackingParameters.stanley,
                                ),
                              )
                              .copyWith(velocityGain: value),
                        );

                    final configuredVehicle = ref.watch(
                      configuredVehicleProvider,
                    );
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          configuredVehicle.copyWith(
                            pathTrackingParameters: configuredVehicle
                                .pathTrackingParameters
                                .copyWith
                                .stanley(velocityGain: value),
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

/// A draggable version of [AutosteeringParameterConfigurator], typically used
/// as a child of a [Stack] that is a child of a [LayoutBuilder].

class DraggableAutosteeringParameterConfigurator extends ConsumerWidget {
  /// A draggable version of [AutosteeringParameterConfigurator], typically used
  /// as a child of a [Stack] that is a child of a [LayoutBuilder].
  ///
  /// [constraints] are used to layout the widget.
  const DraggableAutosteeringParameterConfigurator({
    required this.constraints,
    super.key,
  });

  /// Constraints used to layout this widget.
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) => DynamicDraggableWidget(
    offset: ref.watch(autosteeringConfiguratorUiOffsetProvider),
    constraints: constraints,
    maxWidth: 400,
    maxHeight: 350,
    maxWidthFraction: 0.7,
    maxHeightFraction: 1,
    onDragEnd: ref
        .read(autosteeringConfiguratorUiOffsetProvider.notifier)
        .update,
    child: const AutosteeringParameterConfigurator(),
  );
}
