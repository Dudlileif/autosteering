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
import 'dart:math';
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/providers/providers.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// A configurator widget for configuring how to use the WAS with the vehicle.
class SteeringHardwareConfigurator extends StatelessWidget {
  /// A configurator widget for configuring how to use the WAS with the vehicle.
  const SteeringHardwareConfigurator({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final mediaSize = MediaQuery.sizeOf(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        primary: false,
        backgroundColor: switch (mediaSize) {
          Size(width: < 600) => null,
          _ => theme.scaffoldBackgroundColor.withValues(alpha: 0.7),
        },
        appBar: AppBar(
          primary: false,
          scrolledUnderElevation: 4,
          title: Text(strings.steeringConfigurator, maxLines: 2),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Consumer(
                builder: (context, ref, child) => CloseButton(
                  onPressed: switch (mediaSize) {
                    Size(width: < 600) => Navigator.of(context).pop,
                    _ =>
                      () => ref
                          .read(showSteeringHardwareConfigProvider.notifier)
                          .update(value: false),
                  },
                ),
              ),
            ),
          ],
          bottom: TabBar(
            labelStyle: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
            unselectedLabelStyle: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w300,
            ),
            tabs: [
              Tab(text: strings.motor),
              Tab(text: strings.was),
              Tab(text: strings.pid),
            ],
            dividerColor: theme.dividerColor,
          ),
        ),
        body: const TabBarView(
          children: [
            _MotorPage(),
            _WasPage(),
            _PidPage(),
          ],
        ),
      ),
    );
  }
}

class _SteeringHardwareConfigListTile extends StatelessWidget {
  const _SteeringHardwareConfigListTile({
    required this.initialValue,
    required this.text,
    required this.onChangeEnd,
    this.subtitle,
    this.resetValue,
    this.setWidget,
    this.min,
    this.max,
    this.divisions,
    this.selectionValues,
    super.key,
  });

  final num initialValue;
  final String Function(double value) text;
  final void Function(double value) onChangeEnd;
  final String? subtitle;
  final num? resetValue;
  final Widget Function(void Function(double) updateValue)? setWidget;
  final num? min;
  final num? max;
  final int? divisions;
  final List<num>? selectionValues;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text(initialValue.toDouble())),
      onTap: () => showDialog<void>(
        context: context,
        builder: (context) => _SteeringHardwareConfigDialog(
          initialValue: initialValue,
          text: text,
          onChangeEnd: onChangeEnd,
          subtitle: subtitle,
          resetValue: resetValue,
          setWidget: setWidget,
          min: min,
          max: max,
          divisions: divisions,
          selectionValues: selectionValues,
        ),
      ),
    );
  }
}

class _SteeringHardwareConfigDialog extends StatefulWidget {
  const _SteeringHardwareConfigDialog({
    required this.initialValue,
    required this.text,
    required this.onChangeEnd,
    this.subtitle,
    this.resetValue,
    this.setWidget,
    this.min,
    this.max,
    this.divisions,
    this.selectionValues,
  });
  final num initialValue;
  final String Function(double value) text;
  final void Function(double value) onChangeEnd;
  final String? subtitle;
  final num? resetValue;
  final Widget Function(void Function(double) updateValue)? setWidget;
  final num? min;
  final num? max;
  final int? divisions;
  final List<num>? selectionValues;

  @override
  State<StatefulWidget> createState() => __SteeringHardwareConfigDialogState();
}

class __SteeringHardwareConfigDialogState
    extends State<_SteeringHardwareConfigDialog> {
  late double _value = widget.initialValue.toDouble();

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final text = Text(widget.text(_value), style: theme.textTheme.bodyLarge);

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
          text,
          if (widget.resetValue != null)
            IconButton(
              onPressed: () {
                setState(() => _value = widget.resetValue!.toDouble());
              },
              icon: const Icon(Icons.refresh),
            ),
        ],
      ),
      children: [
        if (widget.subtitle != null) Text(widget.subtitle!),
        if (widget.setWidget != null)
          widget.setWidget!((value) => setState(() => _value = value)),
        Slider(
          value: widget.selectionValues != null
              ? widget.selectionValues!.indexOf(_value.round()).toDouble()
              : _value,
          onChanged: (value) => setState(
            () => _value = widget.selectionValues != null
                ? widget.selectionValues![value.round()].toDouble()
                : value,
          ),
          min: widget.min?.toDouble() ?? 0,
          max: widget.selectionValues != null
              ? widget.selectionValues!.length - 1
              : widget.max?.toDouble() ?? 1,
          divisions: widget.selectionValues != null
              ? widget.selectionValues!.length - 1
              : widget.divisions,
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
                label: Text(strings.cancel),
              ),
              FilledButton.icon(
                onPressed: () {
                  widget.onChangeEnd(_value);
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.check),
                label: Text(strings.apply),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MotorPage extends ConsumerWidget {
  const _MotorPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final maxRPM = ref.watch(
      mainVehicleProvider.select(
        (value) => value.steeringHardwareConfig.maxRPM,
      ),
    );

    final children = [
      // Reverse motor output
      Consumer(
        child: Text(
          strings.reverseMotorDirection,
          style: theme.textTheme.bodyLarge,
        ),
        builder: (context, ref, child) => CheckboxListTile(
          value: ref.watch(
            mainVehicleProvider.select(
              (vehicle) => vehicle.steeringHardwareConfig.reverseDirection,
            ),
          ),
          onChanged: (value) {
            if (value != null) {
              ref
                  .read(simInputProvider.notifier)
                  .send(
                    ref
                        .read(
                          mainVehicleProvider.select(
                            (value) => value.steeringHardwareConfig,
                          ),
                        )
                        .copyWith(reverseDirection: value),
                  );

              // Wait a short while before saving the hopefully
              // updated vehicle.
              Timer(const Duration(milliseconds: 100), () {
                ref.read(
                  updateSteeringHardwareConfigProvider(
                    const SteeringHardwareConfigKeysContainer({
                      SteeringHardwareConfigKey.reverseDirection,
                    }),
                  ),
                );
                final vehicle = ref.watch(mainVehicleProvider);
                ref.read(updateVehicleProvider(vehicle));
                Logger.instance.i(
                  '''Updated vehicle motor config reverse output: ${!value} -> ${vehicle.steeringHardwareConfig.reverseDirection}''',
                );
              });
            }
          },
          secondary: child,
        ),
      ),
      // Threshold velocities
      Consumer(
        child: Text(
          strings.thresholdVelocities,
          style: theme.textTheme.bodyLarge,
        ),
        builder: (context, ref, child) => ListTile(
          title: child,
          onTap: () => showDialog<void>(
            context: context,
            builder: (context) => const _VehicleThresholdsDialog(),
          ),
        ),
      ),
      // Motor max RPM
      _SteeringHardwareConfigListTile(
        initialValue: ref.read(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.maxRPM,
          ),
        ),
        resetValue: 200,
        text: (value) => strings.maxVelocityRpm(value.round()),
        onChangeEnd: (value) {
          final oldConfig = ref.read(
            mainVehicleProvider.select((value) => value.steeringHardwareConfig),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                oldConfig.copyWith(
                  maxRPM: value,
                  coolstepThresholdRPM: clampDouble(
                    oldConfig.coolstepThresholdRPM,
                    0,
                    value,
                  ),
                  dcStepThresholdRPM: clampDouble(
                    oldConfig.dcStepThresholdRPM,
                    0,
                    value,
                  ),
                  highVelocityChopperModeChangeThresholdRPM: clampDouble(
                    oldConfig.highVelocityChopperModeChangeThresholdRPM,
                    0,
                    value,
                  ),
                  stealthChopThresholdRPM: clampDouble(
                    oldConfig.stealthChopThresholdRPM,
                    0,
                    value,
                  ),
                ),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.maxRPM,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config max RPM: ${oldConfig.maxRPM} -> ${vehicle.steeringHardwareConfig.maxRPM}''',
            );
          });
        },
        max: 300,
        divisions: 30,
      ),
      // Motor max acceletation RPM/s
      _SteeringHardwareConfigListTile(
        initialValue: ref.read(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.maxAcceleration,
          ),
        ),
        resetValue: 100,
        text: (value) => strings.maxAccelerationRpms(value.round()),
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.maxAcceleration,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(maxAcceleration: value),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.maxAcceleration,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config max acceleration RPM/s: $oldValue -> ${vehicle.steeringHardwareConfig.maxAcceleration}''',
            );
          });
        },
        max: 200,
        divisions: 20,
      ),
      // Motor max deceletation RPM/s
      _SteeringHardwareConfigListTile(
        initialValue: ref.read(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.maxDeceleration,
          ),
        ),
        resetValue: 160,
        text: (value) => strings.maxDecelerationRpms(value.round()),
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.maxDeceleration,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(maxDeceleration: value),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.maxDeceleration,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config max deceleration RPM/s: $oldValue -> ${vehicle.steeringHardwareConfig.maxDeceleration}''',
            );
          });
        },
        max: 500,
        divisions: 50,
      ),
      // Micro steps
      _SteeringHardwareConfigListTile(
        initialValue: ref.read(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.microSteps,
          ),
        ),
        text: (value) =>
            '${strings.microsteps}: ${switch (value.round()) {
              0 => strings.fullstep,
              _ => value.round(),
            }}',
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.microSteps,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(microSteps: value.round()),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.microSteps,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config micro steps²: $oldValue -> ${vehicle.steeringHardwareConfig.microSteps}''',
            );
          });
        },
        selectionValues: const [0, 2, 4, 8, 16, 32, 64, 128, 256],
        resetValue: 256,
      ),
      // Steps per rotation
      _SteeringHardwareConfigListTile(
        initialValue: ref.read(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.stepsPerRotation,
          ),
        ),
        text: (value) => strings.stepsPerRotation(value.round()),
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.stepsPerRotation,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(stepsPerRotation: value.round()),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.stepsPerRotation,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor steps per rotation: $oldValue -> ${vehicle.steeringHardwareConfig.stepsPerRotation}''',
            );
          });
        },
        selectionValues: const [200, 400],
        resetValue: 200,
      ),
      // RMS current
      _SteeringHardwareConfigListTile(
        initialValue: ref.read(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.rmsCurrent,
          ),
        ),
        text: (value) => strings.rmsCurrent(value.round()),
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.rmsCurrent,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(rmsCurrent: value.round()),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.rmsCurrent,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config RMS current: $oldValue -> ${vehicle.steeringHardwareConfig.rmsCurrent}''',
            );
          });
        },
        max: 3000,
        divisions: 30,
        resetValue: 1000,
      ),
      // StallGuard threshold
      _SteeringHardwareConfigListTile(
        initialValue: ref.read(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.stallguardThreshold,
          ),
        ),
        text: (value) => strings.stallGuardThreshold(value.round()),
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.stallguardThreshold,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(stallguardThreshold: value.round()),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.stallguardThreshold,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config StallGuard threshold: $oldValue -> ${vehicle.steeringHardwareConfig.stallguardThreshold}''',
            );
          });
        },
        max: 63,
        min: -64,
        divisions: 127,
        resetValue: 0,
        subtitle: strings.stallingSensitivity,
      ),
      // StealthChop upper threshold
      _SteeringHardwareConfigListTile(
        key: ValueKey('StealthChop - $maxRPM'),
        initialValue: ref.watch(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.stealthChopThresholdRPM,
          ),
        ),
        text: (value) =>
            strings.stealthChopMaxRpm(value > 0 ? '' : 'disabled', value),
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.stealthChopThresholdRPM,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(stealthChopThresholdRPM: value),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.stealthChopThresholdRPM,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config StealthChop threshold RPM: $oldValue -> ${vehicle.steeringHardwareConfig.stealthChopThresholdRPM}''',
            );
          });
        },
        max: maxRPM,
        divisions: maxRPM ~/ 5,
        resetValue: 0,
        subtitle: strings.upperThreshold,
      ),
      // High velocity chopper change threshold
      _SteeringHardwareConfigListTile(
        key: ValueKey('High velocity - $maxRPM'),
        initialValue: ref.watch(
          mainVehicleProvider.select(
            (value) => value
                .steeringHardwareConfig
                .highVelocityChopperModeChangeThresholdRPM,
          ),
        ),
        text: (value) =>
            strings.highVelocityMinRpm(value > 0 ? '' : 'disabled', value),
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value
                  .steeringHardwareConfig
                  .highVelocityChopperModeChangeThresholdRPM,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(highVelocityChopperModeChangeThresholdRPM: value),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey
                      .highVelocityChopperModeChangeThresholdRPM,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config high velocity chopper mode change threshold RPM: $oldValue -> ${vehicle.steeringHardwareConfig.highVelocityChopperModeChangeThresholdRPM}''',
            );
          });
        },
        max: maxRPM,
        divisions: maxRPM ~/ 5,
        resetValue: 0,
        subtitle: strings.lowerThreshold,
      ),
      // CoolStep threshold
      _SteeringHardwareConfigListTile(
        key: ValueKey('CoolStep - $maxRPM'),
        initialValue: ref.watch(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.coolstepThresholdRPM,
          ),
        ),
        text: (value) =>
            strings.coolStepMinRpm(value > 0 ? '' : 'disabled', value),
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.coolstepThresholdRPM,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(coolstepThresholdRPM: value),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.coolstepThresholdRPM,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config CoolStep threshold RPM: $oldValue -> ${vehicle.steeringHardwareConfig.coolstepThresholdRPM}''',
            );
          });
        },
        max: maxRPM,
        divisions: maxRPM ~/ 5,
        resetValue: 0,
        subtitle: strings.lowerThreshold,
      ),
      // DcStep threshold
      _SteeringHardwareConfigListTile(
        key: ValueKey('DcStep - $maxRPM'),
        initialValue: ref.watch(
          mainVehicleProvider.select(
            (value) => value.steeringHardwareConfig.dcStepThresholdRPM,
          ),
        ),
        text: (value) =>
            strings.dcStepMinRpm(value > 0 ? '' : 'disabled', value),
        onChangeEnd: (value) {
          final oldValue = ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.dcStepThresholdRPM,
            ),
          );
          ref
              .read(simInputProvider.notifier)
              .send(
                ref
                    .read(
                      mainVehicleProvider.select(
                        (value) => value.steeringHardwareConfig,
                      ),
                    )
                    .copyWith(dcStepThresholdRPM: value),
              );
          // Wait a short while before saving the
          // hopefully updated vehicle.
          Timer(const Duration(milliseconds: 100), () {
            ref.read(
              updateSteeringHardwareConfigProvider(
                const SteeringHardwareConfigKeysContainer({
                  SteeringHardwareConfigKey.dcStepThresholdRPM,
                }),
              ),
            );
            final vehicle = ref.watch(mainVehicleProvider);
            ref.read(updateVehicleProvider(vehicle));
            Logger.instance.i(
              '''Updated vehicle motor config CoolStep threshold RPM: $oldValue -> ${vehicle.steeringHardwareConfig.dcStepThresholdRPM}''',
            );
          });
        },
        max: maxRPM,
        divisions: maxRPM ~/ 5,
        resetValue: 0,
        subtitle: strings.lowerThreshold,
      ),
    ];

    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

class _WasPage extends ConsumerWidget {
  const _WasPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final numberFormatter = NumberFormat.decimalPatternDigits(
      locale: strings.localeName,
      decimalDigits: 3,
    ).format;

    return ListView(
      children: [
        // Use WAS
        Consumer(
          child: Text(
            strings.useValue(strings.was),
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
                ref
                    .read(simInputProvider.notifier)
                    .send(
                      ref
                          .read(
                            mainVehicleProvider.select(
                              (value) => value.was.config,
                            ),
                          )
                          .copyWith(useWas: value),
                    );
                // Wait a short while before saving the hopefully
                // updated vehicle.
                Timer(const Duration(milliseconds: 100), () {
                  final vehicle = ref.watch(mainVehicleProvider);
                  ref.read(updateVehicleProvider(vehicle));
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
            strings.invertSensorInput,
            style: theme.textTheme.bodyLarge,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(
              mainVehicleProvider.select(
                (vehicle) => vehicle.was.config.invertInput,
              ),
            ),
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(simInputProvider.notifier)
                    .send(
                      ref
                          .read(
                            mainVehicleProvider.select(
                              (value) => value.was.config,
                            ),
                          )
                          .copyWith(invertInput: value),
                    );

                // Wait a short while before saving the hopefully
                // updated vehicle.
                Timer(const Duration(milliseconds: 100), () {
                  final vehicle = ref.watch(mainVehicleProvider);
                  ref.read(updateVehicleProvider(vehicle));
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
        _SteeringHardwareConfigListTile(
          initialValue: ref.read(
            mainVehicleProvider.select((value) => value.was.config.bits),
          ),
          text: (value) => '${strings.bits}: ${value.round()}',
          onChangeEnd: (value) {
            final oldValue = ref.read(
              mainVehicleProvider.select((value) => value.was.config.bits),
            );
            ref
                .read(simInputProvider.notifier)
                .send(
                  ref
                      .read(
                        mainVehicleProvider.select((value) => value.was.config),
                      )
                      .copyWith(bits: value.round()),
                );
            // Wait a short while before saving the hopefully
            // updated vehicle.
            Timer(const Duration(milliseconds: 100), () {
              final vehicle = ref.watch(mainVehicleProvider);
              ref.read(updateVehicleProvider(vehicle));
              Logger.instance.i(
                '''Updated vehicle WAS config bits: $oldValue -> ${vehicle.was.config.bits}''',
              );
            });
          },
          min: 10,
          max: 20,
          divisions: 10,
        ),
        // Sensor discrete reading
        Consumer(
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
                      '${strings.discrete}: $reading',
                      style: theme.textTheme.bodyLarge,
                    ),
                    IconButton(
                      onPressed: () => ref
                          .read(simInputProvider.notifier)
                          .send(
                            WasReading(
                              receiveTime: DateTime.now(),
                              value: ref.read(
                                mainVehicleProvider.select(
                                  (value) =>
                                      value.steeringHardwareConfig.wasCenter,
                                ),
                              ),
                            ),
                          ),
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
                Slider(
                  value: reading.toDouble(),
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send(
                          WasReading(
                            receiveTime: DateTime.now(),
                            value: value.round(),
                          ),
                        );
                  },
                  max: pow(2, config.bits).toDouble() - 1,
                ),
              ],
            );
          },
        ),
        // Sensor normalized reading
        Consumer(
          builder: (context, ref, child) {
            final reading = clampDouble(
              ref.watch(
                mainVehicleProvider.select(
                  (vehicle) => vehicle.wasReadingNormalizedInRange,
                ),
              ),
              -1,
              1,
            );
            return Column(
              children: [
                Text(
                  '${strings.normalized}: ${numberFormatter(reading)}',
                  style: theme.textTheme.bodyLarge,
                ),
                Slider(value: reading, onChanged: null, min: -1),
              ],
            );
          },
        ),
        // Range min
        _SteeringHardwareConfigListTile(
          initialValue: ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.wasMin.toDouble(),
            ),
          ),
          resetValue: 250,
          text: (value) =>
              '${strings.was} ${strings.min.toLowerCase()}: ${value.round()}',
          onChangeEnd: (value) {
            final oldValue = ref.read(
              mainVehicleProvider.select(
                (value) => value.steeringHardwareConfig.wasMin,
              ),
            );
            ref
                .read(simInputProvider.notifier)
                .send(
                  ref
                      .read(
                        mainVehicleProvider.select(
                          (value) => value.steeringHardwareConfig,
                        ),
                      )
                      .copyWith(wasMin: value.round()),
                );
            // Wait a short while before saving the
            // hopefully updated vehicle.
            Timer(const Duration(milliseconds: 100), () {
              ref.read(
                updateSteeringHardwareConfigProvider(
                  const SteeringHardwareConfigKeysContainer({
                    SteeringHardwareConfigKey.wasMin,
                  }),
                ),
              );
              final vehicle = ref.watch(mainVehicleProvider);
              ref.read(updateVehicleProvider(vehicle));
              Logger.instance.i(
                '''Updated vehicle WAS min point: $oldValue -> ${vehicle.steeringHardwareConfig.wasMin}''',
              );
            });
          },
          max:
              pow(
                2,
                ref.watch(
                  mainVehicleProvider.select((value) => value.was.config.bits),
                ),
              ).toDouble() -
              1,
          setWidget: (updateValue) => ElevatedButton(
            onPressed: () {
              final oldValue = ref.read(
                mainVehicleProvider.select(
                  (value) => value.steeringHardwareConfig.wasMin,
                ),
              );
              final reading = ref.read(
                mainVehicleProvider.select((value) => value.was.reading.value),
              );
              ref
                  .read(simInputProvider.notifier)
                  .send(
                    ref
                        .read(
                          mainVehicleProvider.select(
                            (value) => value.steeringHardwareConfig,
                          ),
                        )
                        .copyWith(wasMin: reading),
                  );
              updateValue(reading.toDouble());
              // Wait a short while before saving the
              // hopefully updated vehicle.
              Timer(const Duration(milliseconds: 100), () {
                ref.read(
                  updateSteeringHardwareConfigProvider(
                    const SteeringHardwareConfigKeysContainer({
                      SteeringHardwareConfigKey.wasMin,
                    }),
                  ),
                );
                final vehicle = ref.watch(mainVehicleProvider);
                ref.read(updateVehicleProvider(vehicle));
                Logger.instance.i(
                  '''Updated vehicle WAS min point: $oldValue -> ${vehicle.steeringHardwareConfig.wasMin}''',
                );
              });
            },
            child: Consumer(
              builder: (context, ref, child) => Text(
                '''${strings.setToLiveReading}: ${ref.watch(mainVehicleProvider.select((value) => value.was.reading.value))}''',
              ),
            ),
          ),
        ),
        // Range center
        _SteeringHardwareConfigListTile(
          initialValue: ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.wasCenter.toDouble(),
            ),
          ),
          resetValue:
              (pow(
                        2,
                        ref.watch(
                              mainVehicleProvider.select(
                                (value) => value.was.config.bits,
                              ),
                            ) -
                            1,
                      ) -
                      1)
                  .round(),
          text: (value) =>
              '''${strings.was} ${strings.center.toLowerCase()}: ${value.round()}''',
          onChangeEnd: (value) {
            final oldValue = ref.read(
              mainVehicleProvider.select(
                (value) => value.steeringHardwareConfig.wasCenter,
              ),
            );
            ref
                .read(simInputProvider.notifier)
                .send(
                  ref
                      .read(
                        mainVehicleProvider.select(
                          (value) => value.steeringHardwareConfig,
                        ),
                      )
                      .copyWith(wasCenter: value.round()),
                );
            // Wait a short while before saving the
            // hopefully updated vehicle.
            Timer(const Duration(milliseconds: 100), () {
              ref.read(
                updateSteeringHardwareConfigProvider(
                  const SteeringHardwareConfigKeysContainer({
                    SteeringHardwareConfigKey.wasCenter,
                  }),
                ),
              );
              final vehicle = ref.watch(mainVehicleProvider);
              ref.read(updateVehicleProvider(vehicle));
              Logger.instance.i(
                '''Updated vehicle WAS center point: $oldValue -> ${vehicle.steeringHardwareConfig.wasCenter}''',
              );
            });
          },
          max:
              pow(
                2,
                ref.watch(
                  mainVehicleProvider.select((value) => value.was.config.bits),
                ),
              ).toDouble() -
              1,
          setWidget: (updateValue) => ElevatedButton(
            onPressed: () {
              final oldValue = ref.read(
                mainVehicleProvider.select(
                  (value) => value.steeringHardwareConfig.wasCenter,
                ),
              );
              final reading = ref.read(
                mainVehicleProvider.select((value) => value.was.reading.value),
              );
              ref
                  .read(simInputProvider.notifier)
                  .send(
                    ref
                        .read(
                          mainVehicleProvider.select(
                            (value) => value.steeringHardwareConfig,
                          ),
                        )
                        .copyWith(wasCenter: reading),
                  );
              updateValue(reading.toDouble());
              // Wait a short while before saving the
              // hopefully updated vehicle.
              Timer(const Duration(milliseconds: 100), () {
                ref.read(
                  updateSteeringHardwareConfigProvider(
                    const SteeringHardwareConfigKeysContainer({
                      SteeringHardwareConfigKey.wasCenter,
                    }),
                  ),
                );
                final vehicle = ref.watch(mainVehicleProvider);
                ref.read(updateVehicleProvider(vehicle));
                Logger.instance.i(
                  '''Updated vehicle WAS center point: $oldValue -> ${vehicle.steeringHardwareConfig.wasCenter}''',
                );
              });
            },
            child: Consumer(
              builder: (context, ref, child) => Text(
                '''${strings.setToLiveReading}: ${ref.watch(mainVehicleProvider.select((value) => value.was.reading.value))}''',
              ),
            ),
          ),
        ),
        // Range max
        _SteeringHardwareConfigListTile(
          initialValue: ref.read(
            mainVehicleProvider.select(
              (value) => value.steeringHardwareConfig.wasMax.toDouble(),
            ),
          ),
          resetValue:
              (pow(
                        2,
                        ref.watch(
                          mainVehicleProvider.select(
                            (value) => value.was.config.bits,
                          ),
                        ),
                      ) -
                      1)
                  .round(),
          text: (value) =>
              '${strings.was} ${strings.max.toLowerCase()}: ${value.round()}',
          onChangeEnd: (value) {
            final oldValue = ref.read(
              mainVehicleProvider.select(
                (value) => value.steeringHardwareConfig.wasMax,
              ),
            );
            ref
                .read(simInputProvider.notifier)
                .send(
                  ref
                      .read(
                        mainVehicleProvider.select(
                          (value) => value.steeringHardwareConfig,
                        ),
                      )
                      .copyWith(wasMax: value.round()),
                );
            // Wait a short while before saving the
            // hopefully updated vehicle.
            Timer(const Duration(milliseconds: 100), () {
              ref.read(
                updateSteeringHardwareConfigProvider(
                  const SteeringHardwareConfigKeysContainer({
                    SteeringHardwareConfigKey.wasMax,
                  }),
                ),
              );
              final vehicle = ref.watch(mainVehicleProvider);
              ref.read(updateVehicleProvider(vehicle));
              Logger.instance.i(
                '''Updated vehicle WAS center point: $oldValue -> ${vehicle.steeringHardwareConfig.wasMax}''',
              );
            });
          },
          max:
              pow(
                2,
                ref.watch(
                  mainVehicleProvider.select((value) => value.was.config.bits),
                ),
              ).toDouble() -
              1,
          setWidget: (updateValue) => ElevatedButton(
            onPressed: () {
              final oldValue = ref.read(
                mainVehicleProvider.select(
                  (value) => value.steeringHardwareConfig.wasMax,
                ),
              );
              final reading = ref.read(
                mainVehicleProvider.select((value) => value.was.reading.value),
              );
              ref
                  .read(simInputProvider.notifier)
                  .send(
                    ref
                        .read(
                          mainVehicleProvider.select(
                            (value) => value.steeringHardwareConfig,
                          ),
                        )
                        .copyWith(wasMax: reading),
                  );
              updateValue(reading.toDouble());
              // Wait a short while before saving the
              // hopefully updated vehicle.
              Timer(const Duration(milliseconds: 100), () {
                ref.read(
                  updateSteeringHardwareConfigProvider(
                    const SteeringHardwareConfigKeysContainer({
                      SteeringHardwareConfigKey.wasMax,
                    }),
                  ),
                );
                final vehicle = ref.watch(mainVehicleProvider);
                ref.read(updateVehicleProvider(vehicle));
                Logger.instance.i(
                  '''Updated vehicle WAS max point: $oldValue -> ${vehicle.steeringHardwareConfig.wasMax}''',
                );
              });
            },
            child: Consumer(
              builder: (context, ref, child) => Text(
                '''${strings.setToLiveReading}: ${ref.watch(mainVehicleProvider.select((value) => value.was.reading.value))}''',
              ),
            ),
          ),
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
                    strings.rawSensorReading(strings.was),
                    style: theme.textTheme.bodyLarge,
                  ),
                  if (reading != null) ...[
                    Text('${strings.value}: ${reading.value}'),
                    Consumer(
                      builder: (context, ref, child) {
                        final freq = ref.watch(wasCurrentFrequencyProvider);

                        return switch (freq) {
                          final double freq => Text(
                            strings.updateFrequency(freq),
                          ),
                          _ => const SizedBox.shrink(),
                        };
                      },
                    ),
                  ] else
                    Text(strings.notReceivingSensorReadings(strings.was)),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PidPage extends ConsumerWidget {
  const _PidPage();

  void onChangeEnd(double value, String key, WidgetRef ref) {
    // Wait a short while before saving the hopefully
    // updated vehicle.
    Timer(const Duration(milliseconds: 100), () {
      final vehicle = ref.watch(mainVehicleProvider);
      ref.read(updateVehicleProvider(vehicle));
      Logger.instance.i(
        '''Updated vehicle PID parameters: ${vehicle.pidParameters}''',
      );
      ref.read(
        updateSteeringHardwareConfigProvider(
          SteeringHardwareConfigKeysContainer({key}),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

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
                Text(
                  'P: ${p.round()}',
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  [strings.current, strings.error.toLowerCase()].join(' '),
                  style: theme.textTheme.bodySmall,
                ),
                Slider(
                  value: p,
                  max: 50,
                  divisions: 50,
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.steeringHardwareConfig,
                                ),
                              )
                              .copyWith(pidP: value),
                        );

                    final configuredVehicle = ref.watch(
                      configuredVehicleProvider,
                    );
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          configuredVehicle.copyWith(
                            steeringHardwareConfig: configuredVehicle
                                .steeringHardwareConfig
                                .copyWith(pidP: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) =>
                      onChangeEnd(value, SteeringHardwareConfigKey.pidP, ref),
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
                Text(
                  'I: ${i.round()}',
                  style: theme.textTheme.bodyLarge,
                ),
                Text(strings.errorOverTime, style: theme.textTheme.bodySmall),
                Slider(
                  value: i,
                  max: 50,
                  divisions: 50,
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.steeringHardwareConfig,
                                ),
                              )
                              .copyWith(pidI: value),
                        );

                    final configuredVehicle = ref.watch(
                      configuredVehicleProvider,
                    );
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          configuredVehicle.copyWith(
                            steeringHardwareConfig: configuredVehicle
                                .steeringHardwareConfig
                                .copyWith(pidI: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) =>
                      onChangeEnd(value, SteeringHardwareConfigKey.pidI, ref),
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
                Text(
                  'D: ${d.round()}',
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  strings.errorRateOfChange,
                  style: theme.textTheme.bodySmall,
                ),
                Slider(
                  value: d,
                  max: 50,
                  divisions: 50,
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send(
                          ref
                              .watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.steeringHardwareConfig,
                                ),
                              )
                              .copyWith(pidD: value),
                        );

                    final configuredVehicle = ref.watch(
                      configuredVehicleProvider,
                    );
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          configuredVehicle.copyWith(
                            steeringHardwareConfig: configuredVehicle
                                .steeringHardwareConfig
                                .copyWith(pidD: value),
                          ),
                        );
                  },
                  onChangeEnd: (value) =>
                      onChangeEnd(value, SteeringHardwareConfigKey.pidD, ref),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _VehicleThresholdsDialog extends ConsumerStatefulWidget {
  const _VehicleThresholdsDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __VehicleThresholdsDialogState();
}

class __VehicleThresholdsDialogState
    extends ConsumerState<_VehicleThresholdsDialog> {
  late VehicleThresholds vehicleThresholds = ref.read(
    mainVehicleProvider.select((vehicle) => vehicle.thresholds),
  );

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final textTheme = TextTheme.of(context);
    final velocityUnit = ref.watch(uiUnitVelocityProvider);

    final numberFormatter = NumberFormat.decimalPatternDigits(
      locale: strings.localeName,
      decimalDigits: 1,
    ).format;

    return SimpleDialog(
      title: Text(strings.thresholdVelocities),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${strings.min} ${strings.velocity.toLowerCase()}: ${numberFormatter(vehicleThresholds.minVelocity * 3.6)} km/h',
              style: textTheme.bodyLarge,
            ),
            Text(
              strings.autosteeringDisabledBelowThreshold,
              style: textTheme.bodySmall,
            ),
            Slider(
              value: vehicleThresholds.minVelocity,
              max: 2,
              divisions: 100,
              onChanged: (value) => setState(
                () {
                  vehicleThresholds = vehicleThresholds.copyWith(
                    minVelocity: value,
                    maxVelocity: vehicleThresholds.maxVelocity < value
                        ? value
                        : vehicleThresholds.maxVelocity,
                  );
                },
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${strings.max} ${strings.velocity.toLowerCase()}: ${numberFormatter(vehicleThresholds.maxVelocity * 3.6)} km/h',
              style: textTheme.bodyLarge,
            ),
            Text(
              strings.autosteeringDisabledAboveThreshold,
              style: textTheme.bodySmall,
            ),
            Slider(
              value: vehicleThresholds.maxVelocity,
              min: vehicleThresholds.minVelocity,
              max: 5,
              divisions: 60,
              onChanged: (value) => setState(
                () => vehicleThresholds = vehicleThresholds.copyWith(
                  maxVelocity: value,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              strings.maxReversingVelocity(
                velocityUnit.fromUnit(vehicleThresholds.maxReversingVelocity),
                strings.unitVelocityDisplay(velocityUnit.symbol),
              ),
              style: textTheme.bodyLarge,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(
                [
                  strings.autosteeringDisabledAboveThreshold,
                  strings.setToZeroToDisableInReverse,
                ].join(' '),
                style: textTheme.bodySmall,
                textAlign: .center,
              ),
            ),
            Slider(
              value: vehicleThresholds.maxReversingVelocity,
              max: 2,
              divisions: 100,
              onChanged: (value) => setState(
                () => vehicleThresholds = vehicleThresholds.copyWith(
                  maxReversingVelocity: value,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              strings.maxAngularVelocity(
                vehicleThresholds.maxAngularVelocity.round(),
              ),
              style: textTheme.bodyLarge,
            ),
            Text(
              strings.autosteeringAngularVelocityDescription,
              style: textTheme.bodySmall,
            ),
            Slider(
              value: vehicleThresholds.maxAngularVelocity,
              max: 50,
              min: 10,
              divisions: 40,
              onChanged: (value) => setState(
                () => vehicleThresholds = vehicleThresholds.copyWith(
                  maxAngularVelocity: value,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  label: Text(strings.cancel),
                  icon: const Icon(Icons.clear),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                FilledButton.icon(
                  label: Text(strings.confirm),
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    final oldValues = ref.read(
                      mainVehicleProvider.select(
                        (value) => value.thresholds,
                      ),
                    );
                    ref.read(simInputProvider.notifier).send(vehicleThresholds);
                    // Wait a short while before saving the hopefully
                    // updated vehicle.
                    Timer(const Duration(milliseconds: 100), () {
                      final vehicle = ref.watch(mainVehicleProvider);
                      ref.read(updateVehicleProvider(vehicle));
                      Logger.instance.i(
                        '''Updated vehicle threshold velocities: $oldValues -> ${vehicle.thresholds}''',
                      );
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A draggable version of [SteeringHardwareConfigurator], typically used as
/// a child of a [Stack] that is a child of a [LayoutBuilder].
class DraggableSteeringHardwareConfigurator extends ConsumerWidget {
  /// A draggable version of [SteeringHardwareConfigurator], typically used as
  /// a child of a [Stack] that is a child of a [LayoutBuilder].
  ///
  /// [constraints] are used to layout the widget.
  const DraggableSteeringHardwareConfigurator({
    required this.constraints,
    super.key,
  });

  /// Constraints used to layout this widget.
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) => DynamicDraggableWidget(
    offset: ref.watch(steeringHardwareConfiguratorUiOffsetProvider),
    constraints: constraints,
    maxWidth: 350,
    maxHeight: 700,
    maxWidthFraction: 0.7,
    maxHeightFraction: 1,
    onDragEnd: ref
        .read(steeringHardwareConfiguratorUiOffsetProvider.notifier)
        .update,
    child: const Card(
      color: Colors.transparent,
      child: SizedBox(
        width: 325,
        child: SteeringHardwareConfigurator(),
      ),
    ),
  );
}
