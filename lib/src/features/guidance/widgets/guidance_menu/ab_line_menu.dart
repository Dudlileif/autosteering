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
    ref.watch(activeABConfigProvider);

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    final abLine = ref.watch(aBLineDebugProvider);

    return MenuButtonWithChildren(
      text: 'AB-line',
      menuChildren: [
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
        if (abLine != null)
          Consumer(
            builder: (context, ref, child) => MenuButtonWithChildren(
              text: 'Bearing: ${abLine.initialBearing.toStringAsFixed(1)}°',
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
                      onChanged: (value) {
                        ref.read(simInputProvider.notifier).send(mode);
                        ref
                            .read(aBTrackingLimitModeProvider.notifier)
                            .update(mode);
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
          builder: (context, ref, child) => MenuItemButton(
            child: child,
            onPressed: () {
              ref.read(aBPointAProvider.notifier).update(
                    ref.watch(
                      mainVehicleProvider.select((vehicle) => vehicle.wayPoint),
                    ),
                  );
              ref
                  .read(aBTrackingDebugShowProvider.notifier)
                  .update(value: true);
            },
          ),
        ),
        Consumer(
          child: Text(
            'Set B',
            style: textStyle,
          ),
          builder: (context, ref, child) => MenuItemButton(
            child: child,
            onPressed: () {
              ref.read(aBPointBProvider.notifier).update(
                    ref.watch(
                      mainVehicleProvider.select((vehicle) => vehicle.wayPoint),
                    ),
                  );
              ref
                  .read(aBTrackingDebugShowProvider.notifier)
                  .update(value: true);
            },
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final width = ref.watch(aBWidthProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Width: ${width.toStringAsFixed(2)} m',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: width,
                  onChanged: ref.read(aBWidthProvider.notifier).update,
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
            final width = ref.watch(aBTurningRadiusProvider);
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
                    ref.read(aBTurningRadiusProvider.notifier).update(value);
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
            final turnOffsetIncrease = ref.watch(aBTurnOffsetIncreaseProvider);
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
                        .read(aBTurnOffsetIncreaseProvider.notifier)
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
                  onChanged: (value) =>
                      ref.read(aBDebugStepSizeProvider.notifier).update(value),
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
      ],
    );
  }
}
