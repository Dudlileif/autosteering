import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A [Column] widget with common menu items for the different AB-tracking
/// menus.
class ABCommonMenu extends StatelessWidget {
  /// A [Column] widget with common menu items for the different AB-tracking
  /// menus.
  const ABCommonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return Column(
      children: [
        Consumer(
          child: Text('Show', style: textStyle),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(aBTrackingDebugShowProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(aBTrackingDebugShowProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final limitMode = ref.watch(aBTrackingLimitModeProvider);
            return MenuButtonWithChildren(
              text: 'Limit mode',
              icon: Icons.u_turn_right,
              menuChildren: ABLimitMode.values
                  .map(
                    (mode) => CheckboxListTile(
                      secondary: Text(mode.name, style: textStyle),
                      value: limitMode == mode,
                      onChanged: (value) => ref
                          .read(aBTrackingLimitModeProvider.notifier)
                          .update(mode),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            var width = ref.watch(aBWidthProvider);
            return StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Width: ${width.toStringAsFixed(2)} m',
                      style: textStyle,
                    ),
                    Slider.adaptive(
                      value: width,
                      onChanged: (value) => setState(() => width = value),
                      onChangeEnd: ref.read(aBWidthProvider.notifier).update,
                      min: 0.5,
                      max: 20,
                      divisions: 390,
                    ),
                  ],
                );
              },
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final radius = ref.watch(aBTurningRadiusProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Turning radius: $radius m',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: radius,
                  onChanged: ref.read(aBTurningRadiusProvider.notifier).update,
                  min: 4,
                  max: 20,
                  divisions: 16,
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final turnOffsetMinSkips = ref.watch(aBTurnOffsetMinSkipsProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Min offset skips: $turnOffsetMinSkips',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: turnOffsetMinSkips.toDouble(),
                  onChanged: (value) => ref
                      .read(aBTurnOffsetMinSkipsProvider.notifier)
                      .update(value.round()),
                  max: 10,
                  divisions: 10,
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final stepSize = ref.watch(aBDebugStepSizeProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Step size: ${stepSize.toStringAsFixed(1)} m',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: stepSize,
                  onChanged: ref.read(aBDebugStepSizeProvider.notifier).update,
                  max: 10,
                  divisions: 20,
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final numPointsAhead = ref.watch(aBDebugNumPointsAheadProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Points ahead: $numPointsAhead',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: numPointsAhead.toDouble(),
                  onChanged: (value) => ref
                      .read(aBDebugNumPointsAheadProvider.notifier)
                      .update(value.round()),
                  max: 10,
                  divisions: 10,
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final numPointsBehind = ref.watch(aBDebugNumPointsBehindProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Points behind: $numPointsBehind',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: numPointsBehind.toDouble(),
                  onChanged: (value) => ref
                      .read(aBDebugNumPointsBehindProvider.notifier)
                      .update(value.round()),
                  max: 10,
                  divisions: 10,
                ),
              ],
            );
          },
        ),
        Consumer(
          child: const Text('Recalc bounded lines'),
          builder: (context, ref, child) => MenuItemButton(
            child: child,
            onPressed: () => ref
              ..invalidate(aBCurveDebugProvider)
              ..invalidate(aBLineDebugProvider),
          ),
        ),
      ],
    );
  }
}
