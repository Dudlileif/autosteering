import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for working with the path recording
/// and editing feature.
class ABLineMenu extends ConsumerWidget {
  /// A menu button with attached submenu for working with the path recording
  /// and editing feature.
  const ABLineMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    final abLine = ref.watch(aBLineDebugProvider);

    return MenuButtonWithChildren(
      text: 'AB-line',
      menuChildren: [
        Consumer(
          child: Text('Enabled', style: textStyle),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(aBLineDebugEnabledProvider),
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(aBLineDebugEnabledProvider.notifier)
                    .update(value: value);
              }
            },
          ),
        ),
        Consumer(
          child: Text('Show', style: textStyle),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(aBLineDebugShowProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(aBLineDebugShowProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        if (abLine != null)
          Consumer(
            builder: (context, ref, child) => MenuButtonWithChildren(
              text: 'Bearing: ${abLine.initialBearing.toStringAsFixed(1)}°',
            ),
          ),
        Consumer(
          builder: (context, ref, child) {
            final limitMode = ref.watch(aBLineLimitModeProvider);
            return MenuButtonWithChildren(
              text: 'Limit mode',
              icon: Icons.u_turn_right,
              menuChildren: ABLimitMode.values
                  .map(
                    (mode) => CheckboxListTile(
                      secondary: Text(mode.name, style: textStyle),
                      value: limitMode == mode,
                      onChanged: (value) {
                        ref.read(simInputProvider.notifier).send(mode);
                        ref.read(aBLineLimitModeProvider.notifier).update(mode);
                      },
                    ),
                  )
                  .toList(),
            );
          },
        ),
        Consumer(
          child: Text(
            'Set A',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            title: child,
            onTap: () => ref.read(aBLinePointAProvider.notifier).update(
                  ref.watch(
                    mainVehicleProvider.select((vehicle) => vehicle.position),
                  ),
                ),
          ),
        ),
        Consumer(
          child: Text(
            'Set B',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            title: child,
            onTap: () => ref.read(aBLinePointBProvider.notifier).update(
                  ref.watch(
                    mainVehicleProvider.select((vehicle) => vehicle.position),
                  ),
                ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final width = ref.watch(aBLineWidthProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Width: ${width.toStringAsFixed(2)} m',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: width,
                  onChanged: ref.read(aBLineWidthProvider.notifier).update,
                  min: 0.5,
                  max: 20,
                  divisions: 390,
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final width = ref.watch(aBLineTurningRadiusProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Turning radius: $width m',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: width,
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send((abTurningRadius: value));
                    ref
                        .read(aBLineTurningRadiusProvider.notifier)
                        .update(value);
                  },
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
            final turnOffsetIncrease =
                ref.watch(aBLineTurnOffsetIncreaseProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Turn offset: $turnOffsetIncrease',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: turnOffsetIncrease.toDouble(),
                  onChanged: (value) {
                    ref
                        .read(simInputProvider.notifier)
                        .send((abTurnOffsetIncrease: value.round()));
                    ref
                        .read(aBLineTurnOffsetIncreaseProvider.notifier)
                        .update(value.round());
                  },
                  min: 1,
                  max: 10,
                  divisions: 10,
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final stepSize = ref.watch(aBLineDebugStepSizeProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Step size: ${stepSize.toStringAsFixed(1)} m',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: stepSize,
                  onChanged: (value) => ref
                      .read(aBLineDebugStepSizeProvider.notifier)
                      .update(value),
                  max: 10,
                  divisions: 20,
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final numPointsAhead = ref.watch(aBLineDebugNumPointsAheadProvider);
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
                      .read(aBLineDebugNumPointsAheadProvider.notifier)
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
            final numPointsBehind =
                ref.watch(aBLineDebugNumPointsBehindProvider);
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
                      .read(aBLineDebugNumPointsBehindProvider.notifier)
                      .update(value.round()),
                  max: 10,
                  divisions: 10,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
