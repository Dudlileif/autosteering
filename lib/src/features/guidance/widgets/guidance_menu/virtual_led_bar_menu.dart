import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
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
          count: config.leftIntermediateCount,
          onChanged: (value) =>
              ref.read(virtualLedBarConfigurationProvider.notifier).update(
                    config.copyWith(
                      leftIntermediateCount: value,
                      rightIntermediateCount: value,
                    ),
                  ),
        ),
        _LedCountSelector(
          text: 'End LEDs',
          count: config.leftEndCount,
          onChanged: (value) =>
              ref.read(virtualLedBarConfigurationProvider.notifier).update(
                    config.copyWith(
                      leftEndCount: value,
                      rightEndCount: value,
                    ),
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
                    'Size: ${size.round()}',
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
                    divisions: 29,
                  ),
                ],
              ),
            );
          },
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
              final min = -config.rightOfCenterCount * config.distancePerLed;
              final max = config.leftOfCenterCount * config.distancePerLed;

              final distance =
                  (ref.watch(virtualLedBarTestingDistanceProvider) ?? 0)
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
                    onChanged: ref
                        .read(virtualLedBarTestingDistanceProvider.notifier)
                        .update,
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
