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
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A menu for configuring and using an [ABTracking] to track after.
class ABTrackingMenu extends ConsumerWidget {
  /// A menu for configuring and using an [ABTracking] to track after.
  const ABTrackingMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final abTrackingType = ref.watch(currentABTrackingTypeProvider);

    final workSessionGuidanceActive = ref.watch(
          activeWorkSessionProvider.select((value) => value != null),
        ) &&
        ref.watch(
          configuredABTrackingProvider.select((value) => value != null),
        );

    final abTracking = switch (workSessionGuidanceActive) {
      true => ref.watch(configuredABTrackingProvider),
      false => ref.watch(configuredMenuABTrackingProvider)
    };

    return MenuButtonWithChildren(
      iconOverrideWidget: SizedBox.square(
        dimension: 24,
        child: SvgPicture.asset(
          'assets/icons/ab_line.svg',
          colorFilter: ColorFilter.mode(
            theme.iconTheme.color ?? Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
      text: 'AB tracking',
      menuChildren: [
        if (!workSessionGuidanceActive)
          Padding(
          padding: const EdgeInsets.all(8),
          child: ToggleButtons(
            onPressed: (index) => ref
                .read(currentABTrackingTypeProvider.notifier)
                .update(ABTrackingType.values[index]),
            isSelected: ABTrackingType.values
                .map((type) => type == abTrackingType)
                .toList(),
              children: ABTrackingType.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
          ),
        ),
        if (!workSessionGuidanceActive &&
            (abTrackingType == ABTrackingType.aPlusLine ||
                abTrackingType == ABTrackingType.abLine))
          Consumer(
            child: Text(
              'Set A',
              style: theme.menuButtonWithChildrenText,
            ),
            builder: (context, ref, child) {
              final pointIsSet = ref.watch(aBPointAProvider) != null;
              return MenuItemButton(
                leadingIcon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: pointIsSet
                      ? const Icon(Icons.gps_fixed)
                      : const Icon(Icons.gps_not_fixed),
                ),
                trailingIcon: pointIsSet
                    ? IconButton(
                        onPressed: () => ref.invalidate(aBPointAProvider),
                        icon: const Icon(Icons.clear),
                      )
                    : null,
                closeOnActivate: false,
                onPressed: () {
                  ref.read(aBPointAProvider.notifier).update(
                        ref.watch(
                          mainVehicleProvider
                              .select((vehicle) => vehicle.wayPoint),
                        ),
                      );
                  ref.read(showABTrackingProvider.notifier).update(value: true);
                },
                child: child,
              );
            },
          ),
        if (abTrackingType == ABTrackingType.abLine)
          Consumer(
            child: Text(
              'Set B',
              style: theme.menuButtonWithChildrenText,
            ),
            builder: (context, ref, child) {
              final pointIsSet = ref.watch(aBPointBProvider) != null;
              return MenuItemButton(
                leadingIcon: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: pointIsSet
                      ? const Icon(Icons.gps_fixed)
                      : const Icon(Icons.gps_not_fixed),
                ),
                trailingIcon: pointIsSet
                    ? IconButton(
                        onPressed: () => ref.invalidate(aBPointBProvider),
                        icon: const Icon(Icons.clear),
                      )
                    : null,
                closeOnActivate: false,
                onPressed: () {
                  ref.read(aBPointBProvider.notifier).update(
                        ref.watch(
                          mainVehicleProvider
                              .select((vehicle) => vehicle.wayPoint),
                        ),
                      );
                  ref.read(showABTrackingProvider.notifier).update(value: true);
                },
                child: child,
              );
            },
          ),
        if (abTrackingType == ABTrackingType.aPlusLine)
          Consumer(
            builder: (context, ref, child) {
              final bearing = abTracking?.initialBearing ??
                  ref.watch(aPlusLineBearingProvider);

              return ListTile(
                title: Text(
                  '''Bearing: ${bearing != null ? '${bearing.toStringAsFixed(2)}°' : ''}''',
                ),
                onTap: workSessionGuidanceActive
                    ? null
                    : () => showDialog<void>(
                  context: context,
                  builder: (context) => const _APlusLineBearingDialog(),
                ),
              );
            },
          )
        else if (abTrackingType == ABTrackingType.abLine)
          Consumer(
            builder: (context, ref, child) => ListTile(
              title: Text(
                '''Bearing: ${abTracking != null ? '${abTracking.initialBearing.toStringAsFixed(1)}°' : ''}''',
              ),
            ),
          )
        else if (abTrackingType == ABTrackingType.abCurve)
          Consumer(
            builder: (context, ref, child) => MenuItemButton(
              closeOnActivate: false,
              leadingIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.voicemail),
              ),
              onPressed: () {
                ref
                    .read(enablePathRecorderProvider.notifier)
                    .update(value: true);
                ref
                    .read(activePathRecordingTargetProvider.notifier)
                    .update(PathRecordingTarget.abCurve);
                ref
                    .read(showPathRecordingMenuProvider.notifier)
                    .update(value: true);
              },
              child:
                  Text('Record curve', style: theme.menuButtonWithChildrenText),
            ),
          ),
        _ABCommonMenu(
          abTracking: abTracking,
        ),
        Consumer(
          child: Text(
            'Recalc bounded lines',
            style: theme.menuButtonWithChildrenText,
          ),
          builder: (context, ref, child) => MenuItemButton(
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.refresh),
            ),
            closeOnActivate: false,
            child: child,
            onPressed: () => ref
              ..invalidate(aPlusLineProvider)
              ..invalidate(aBLineProvider)
              ..invalidate(aBCurveProvider)
              ..invalidate(configuredABTrackingProvider),
          ),
        ),
      ],
    );
  }
}

class _APlusLineBearingDialog extends ConsumerStatefulWidget {
  const _APlusLineBearingDialog();

  @override
  ConsumerState<_APlusLineBearingDialog> createState() =>
      _APlusLineBearingDialogState();
}

class _APlusLineBearingDialogState
    extends ConsumerState<_APlusLineBearingDialog> {
  double? bearing;

  @override
  void initState() {
    super.initState();
    bearing = ref.read(aPlusLineProvider).value?.initialBearing ??
        ref.read(aBPointAProvider)?.bearing ??
        ref.read(
          mainVehicleProvider.select((value) => value.bearing),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;

    return SimpleDialog(
      title: const Text('A+ line bearing'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) {
              final aPlusLine = ref.watch(aPlusLineProvider);
              return TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.navigation),
                  labelText: 'Bearing',
                  suffixText: '°',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                initialValue: (aPlusLine.value?.initialBearing ??
                        ref.read(aBPointAProvider)?.bearing ??
                        ref.read(
                          mainVehicleProvider.select((value) => value.bearing),
                        ) ??
                        0)
                    .toStringAsFixed(2),
                onChanged: (value) {
                  final updated =
                      double.tryParse(value.replaceAll(',', '.')) ?? bearing;
                  setState(() => bearing = updated);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: textStyle,
                ),
              ),
              Consumer(
                builder: (context, ref, child) => SimpleDialogOption(
                  onPressed: bearing != null
                      ? () {
                          ref
                              .read(aPlusLineBearingProvider.notifier)
                              .update(bearing);
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.check),
                      ),
                      Text(
                        'Use ${bearing?.toStringAsFixed(2)}°',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A [Column] widget with common menu items for the different AB-tracking
/// menus.
class _ABCommonMenu extends ConsumerWidget {
  /// A [Column] widget with common menu items for the different AB-tracking
  /// menus.
  const _ABCommonMenu({this.abTracking});

  /// The [ABTracking] for use with this menu.
  final ABTracking? abTracking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return Column(
      children: [
        Consumer(
          child: Text('Show', style: textStyle),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(showABTrackingProvider),
            onChanged: (value) => value != null
                ? ref.read(showABTrackingProvider.notifier).update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text('Show all lines', style: textStyle),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(aBTrackingShowAllLinesProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(aBTrackingShowAllLinesProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        if (ref.watch(displayABTrackingProvider) != null &&
            ref.watch(displayABTrackingProvider)!.finishedOffsets.isNotEmpty)
          Consumer(
            child: Text('Reset finished lines', style: textStyle),
            builder: (context, ref, child) => MenuItemButton(
              closeOnActivate: false,
              leadingIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.refresh),
              ),
              child: child,
              onPressed: () => ref
                  .read(simInputProvider.notifier)
                  .send((abTrackingClearFinishedOffsets: true)),
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
                      secondary: Text(
                        mode.name
                            .replaceFirst('un', 'Un')
                            .replaceFirst('limitedT', 'T')
                            .replaceFirst('Turn', 'Turn '),
                        style: textStyle,
                      ),
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
      ],
    );
  }
}
