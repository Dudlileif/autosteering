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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/providers/device_position_providers.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for toggling vehicle debugging
/// features.
class VehicleDebugMenu extends StatelessWidget {
  /// A menu button with attached submenu for toggling vehicle debugging
  /// features.
  const VehicleDebugMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Debug',
      icon: Icons.bug_report,
      menuChildren: [
        Consumer(
          child: Text(
            'Vehicle image',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(showVehicleDrawingLayerProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showVehicleDrawingLayerProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Hitches',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehicleHitchesProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleHitchesProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Steering',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehicleSteeringProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleSteeringProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        const VehicleTrajectoryButton(),
        Consumer(
          child: Text(
            'Travelled path',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehicleTravelledPathProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleTravelledPathProvider.notifier)
                    .update(value: value)
                : null,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child ?? const SizedBox.shrink(),
                Slider.adaptive(
                  value: ref
                      .watch(debugVehicleTravelledPathSizeProvider)
                      .toDouble(),
                  onChanged: (value) => ref
                      .read(debugVehicleTravelledPathSizeProvider.notifier)
                      .update(value.toInt()),
                  min: 1,
                  max: 1000,
                  divisions: 10,
                ),
              ],
            ),
          ),
        ),
        Consumer(
          child: Text(
            'Polygons',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehiclePolygonsProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehiclePolygonsProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Antenna position',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehicleAntennaPositionProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleAntennaPositionProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Use device position',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(devicePositionAsVehiclePositionProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(devicePositionAsVehiclePositionProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
      ],
    );
  }
}

/// A button with a single menu item for configuring the vehicle trajectory
/// capability.
class VehicleTrajectoryButton extends StatelessWidget {
  /// A button with a single menu item for configuring the vehicle trajectory
  /// capability.
  const VehicleTrajectoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Trajectory',
      icon: Icons.straight,
      menuChildren: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 320),
          child: Consumer(
            child: Text(
              'Trajectory',
              style: textStyle,
            ),
            builder: (context, ref, child) => CheckboxListTile(
              value: ref.watch(debugVehicleTrajectoryProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(debugVehicleTrajectoryProvider.notifier)
                      .update(value: value)
                  : null,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  child ?? const SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Time'),
                      Slider.adaptive(
                        value: ref.watch(debugVehicleTrajectorySecondsProvider),
                        onChanged: (value) => ref
                            .read(
                              debugVehicleTrajectorySecondsProvider.notifier,
                            )
                            .update(value),
                        min: 1,
                        max: 20,
                        divisions: 19,
                        label:
                            '''${ref.watch(debugVehicleTrajectorySecondsProvider).round()} s''',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Min'),
                      Slider.adaptive(
                        value:
                            ref.watch(debugVehicleTrajectoryMinLengthProvider),
                        onChanged: (value) => ref
                            .read(
                              debugVehicleTrajectoryMinLengthProvider.notifier,
                            )
                            .update(value),
                        max: 20,
                        divisions: 20,
                        label:
                            '''${ref.watch(debugVehicleTrajectoryMinLengthProvider).round()} m''',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
