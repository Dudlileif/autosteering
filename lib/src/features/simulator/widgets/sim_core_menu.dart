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
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/simulator/widgets/log_replay_menu.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for configuring the simulator.
class SimCoreMenu extends ConsumerWidget {
  /// A menu button with attached submenu for configuring the simulator.
  const SimCoreMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manualSimulationMode = ref.watch(simCoreAllowManualInputProvider);

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Sim core',
      icon: Icons.memory,
      menuChildren: [
        Consumer(
          child: Text(
            'Manual simulation mode',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: const Icon(Icons.gamepad),
            title: child,
            value: ref.watch(simCoreAllowManualInputProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(simCoreAllowManualInputProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        if (!manualSimulationMode)
          Consumer(
          child: Text(
            'Allow sim interpolation',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: const Icon(Icons.timer_outlined),
            title: child,
            subtitle: const Text('Interpolation between GNSS updates'),
            value: ref.watch(simCoreAllowInterpolationProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(simCoreAllowInterpolationProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        if (manualSimulationMode) const VehicleSimMenu(),
        Consumer(
          child: Text(
            'Reset position',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            onTap: () {
              // The simulation has to have a stationary vehicle for the reset
              // to work.
              ref.read(simInputProvider.notifier).send((velocity: 0));
              ref.read(simInputProvider.notifier).send((steeringAngle: 0));

              ref.read(simInputProvider.notifier).send(
                (position: ref.watch(homePositionProvider).gbPosition),
              );
            },
            leading: const Icon(Icons.replay),
            title: child,
          ),
        ),
        if (Device.isNative)
          Consumer(
            child: Text(
              'Restart sim core',
              style: textStyle,
            ),
            builder: (context, ref, child) => ListTile(
              onTap: () => ref.invalidate(simCoreIsolateStreamProvider),
              leading: const Icon(Icons.replay),
              title: child,
            ),
          ),
        if (kDebugMode)
          Consumer(
            child: Text(
              'Allow long breaks',
              style: textStyle,
            ),
            builder: (context, ref, child) {
              final allowBreaks =
                  ref.watch(simCoreDebugAllowLongBreaksProvider);
              return CheckboxListTile(
                secondary: allowBreaks
                    ? const Icon(Icons.timer_off_outlined)
                    : const Icon(Icons.timer_outlined),
                value: allowBreaks,
                onChanged: (value) => value != null
                    ? ref
                        .read(simCoreDebugAllowLongBreaksProvider.notifier)
                        .update(value: value)
                    : null,
                title: child,
              );
            },
          ),
        Consumer(
          builder: (context, ref, child) {
            var targetHz = ref.read(simulatorUpdateFrequencyProvider);
            const values = [5, 10, 20, 30, 60, 90, 100, 120];
            var index = values.indexOf(targetHz);
            if (index.isNegative) {
              index = 4;
            }
            return StatefulBuilder(
              builder: (context, setState) {
                targetHz = values[index];
                return ListTile(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Simulation frequency: $targetHz Hz',
                        style: textStyle,
                      ),
                      Slider(
                        value: index.toDouble(),
                        onChanged: (value) =>
                            setState(() => index = value.round()),
                        onChangeEnd: (value) {
                          final oldValue =
                              ref.read(simulatorUpdateFrequencyProvider);
                          ref
                              .read(simulatorUpdateFrequencyProvider.notifier)
                              .update(targetHz);
                          // Wait a short while before saving the
                          // hopefully updated vehicle.
                          Timer(
                            const Duration(milliseconds: 100),
                            () {
                              final value =
                                  ref.watch(simulatorUpdateFrequencyProvider);
                              Logger.instance.w(
                                '''Updated simulation update frequency: $oldValue Hz -> $value Hz''',
                              );
                            },
                          );
                        },
                        max: values.length - 1,
                        divisions: values.length - 1,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        const LogReplayMenu(),
      ],
    );
  }
}
