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
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached menu for configuring the virtual LED bar.
class VirtualLedBarMenu extends ConsumerWidget {
  /// A menu button with attached menu for configuring the virtual LED bar.
  const VirtualLedBarMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;

    final config = ref.watch(virtualLedBarConfigurationProvider);

    return MenuButtonWithChildren(
      text: 'Virtual LED bar',
      icon: Icons.light_mode,
      menuChildren: [
        Consumer(
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(virtualLedBarEnabledProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(virtualLedBarEnabledProvider.notifier)
                    .update(value: value)
                : null,
            secondary: Text('Enabled', style: textStyle),
          ),
        ),
        _LedCountSelector(
          text: 'Center LEDs',
          count: config.centerCount,
          onChanged: (value) => ref
              .read(virtualLedBarConfigurationProvider.notifier)
              .update(config.copyWith(centerCount: value)),
        ),
        if (config.centerCount.isEven && config.centerCount > 0)
          Consumer(
            builder: (context, ref, child) => CheckboxListTile(
              value: config.evenCenterSimulateOdd,
              onChanged: (value) => value != null
                  ? ref
                      .read(virtualLedBarConfigurationProvider.notifier)
                      .update(config.copyWith(evenCenterSimulateOdd: value))
                  : null,
              secondary: Text('Active center', style: textStyle),
            ),
          ),
        _LedCountSelector(
          text: 'Intermediate LEDs',
          count: config.intermediateCount,
          onChanged: (value) =>
              ref.read(virtualLedBarConfigurationProvider.notifier).update(
                    config.copyWith(intermediateCount: value),
                  ),
        ),
        _LedCountSelector(
          text: 'End LEDs',
          count: config.endCount,
          onChanged: (value) =>
              ref.read(virtualLedBarConfigurationProvider.notifier).update(
                    config.copyWith(endCount: value),
                  ),
        ),
        Builder(
          builder: (context) {
            var distancePerLed = config.distancePerLed;
            return StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  Text(
                    'Distance / LED: ${(distancePerLed * 100).round()} cm',
                    style: textStyle,
                  ),
                  Slider(
                    value: distancePerLed * 100,
                    onChanged: (value) =>
                        setState(() => distancePerLed = value / 100),
                    onChangeEnd: (value) => ref
                        .read(virtualLedBarConfigurationProvider.notifier)
                        .update(config.copyWith(distancePerLed: value / 100)),
                    min: 1,
                    max: 20,
                    divisions: 19,
                  ),
                ],
              ),
            );
          },
        ),
        Builder(
          builder: (context) {
            var size = config.ledSize;
            return StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  Text(
                    'LED Size: ${size.round()}',
                    style: textStyle,
                  ),
                  Slider(
                    value: size,
                    onChanged: (value) => setState(() => size = value),
                    onChangeEnd: (value) => ref
                        .read(virtualLedBarConfigurationProvider.notifier)
                        .update(config.copyWith(ledSize: value)),
                    min: 10,
                    max: 40,
                    divisions: 30,
                  ),
                ],
              ),
            );
          },
        ),
        Builder(
          builder: (context) {
            var width = config.barWidth;
            return StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  Text(
                    'Bar width: ${width.round()}',
                    style: textStyle,
                  ),
                  Slider(
                    value: width,
                    onChanged: (value) => setState(() => width = value),
                    onChangeEnd: (value) => ref
                        .read(virtualLedBarConfigurationProvider.notifier)
                        .update(config.copyWith(barWidth: value)),
                    min: 200,
                    max: 1200,
                    divisions: 10,
                  ),
                ],
              ),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) => CheckboxListTile(
            value: !config.showInactiveLeds,
            onChanged: (value) => value != null
                ? ref
                    .read(virtualLedBarConfigurationProvider.notifier)
                    .update(config.copyWith(showInactiveLeds: !value))
                : null,
            secondary: Text('Hide unlit LEDs', style: textStyle),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => CheckboxListTile(
            value: config.reverseBar,
            onChanged: (value) => value != null
                ? ref
                    .read(virtualLedBarConfigurationProvider.notifier)
                    .update(config.copyWith(reverseBar: value))
                : null,
            secondary: Text('Reverse bar', style: textStyle),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(virtualLedBarTestingProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(virtualLedBarTestingProvider.notifier)
                    .update(value: value)
                : null,
            secondary: Text('Test', style: textStyle),
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            if (ref.watch(virtualLedBarTestingProvider)) {
              final min = -config.oneSideCount * config.distancePerLed;
              final max = config.oneSideCount * config.distancePerLed;

              final distance =
                  -(ref.watch(virtualLedBarTestingDistanceProvider) ?? 0)
                      .clamp(min, max);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Test distance: ${distance.toStringAsFixed(2)} m',
                    style: textStyle,
                  ),
                  Slider.adaptive(
                    value: distance,
                    onChanged: (value) => ref
                        .read(virtualLedBarTestingDistanceProvider.notifier)
                        .update(-value),
                    min: min,
                    max: max,
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class _LedCountSelector extends StatefulWidget {
  const _LedCountSelector({
    required this.text,
    required this.count,
    required this.onChanged,
  });

  final String text;
  final int count;
  final void Function(int) onChanged;

  @override
  State<_LedCountSelector> createState() => _LedCountSelectorState();
}

class _LedCountSelectorState extends State<_LedCountSelector> {
  late int count = widget.count;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${widget.text}: $count',
          style: textStyle,
        ),
        Slider.adaptive(
          value: count.toDouble(),
          onChanged: (value) => setState(() => count = value.toInt()),
          onChangeEnd: (value) => widget.onChanged(value.toInt()),
          max: 10,
          divisions: 10,
        ),
      ],
    );
  }
}
