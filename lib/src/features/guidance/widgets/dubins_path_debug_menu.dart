import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu or buttons used for debugging
/// a Dubins path between two points.
class DubinsPathDebugMenu extends ConsumerWidget {
  const DubinsPathDebugMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final start = ref.watch(dubinsPathDebugStartPointProvider);
    final end = ref.watch(dubinsPathDebugEndPointProvider);
    final selectedPathType = ref.watch(dubinsPathDebugPathTypeProvider);
    final dubinsPath = ref.watch(debugDubinsPathProvider);

    return MenuButtonWithChildren(
      icon: Icons.route,
      text: 'Dubins path',
      menuChildren: [
        CheckboxListTile(
          value: ref.watch(enableDubinsPathDebugProvider),
          onChanged: (value) => value != null
              ? ref
                  .read(enableDubinsPathDebugProvider.notifier)
                  .update(value: value)
              : null,
          secondary: Text(
            'Debugging',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        MenuButtonWithChildren(
          icon: Icons.abc,
          text:
              'Path type: ${(selectedPathType?.name ?? dubinsPath?.bestPathData?.pathType.name)?.toUpperCase()}\n${(dubinsPath?.pathData(selectedPathType)?.totalLength ?? dubinsPath?.bestPathData?.totalLength)?.round()} m',
          menuChildren: DubinsPathType.values
              .map(
                (pathType) => CheckboxListTile(
                  value: selectedPathType == pathType,
                  enabled: ref
                      .watch(debugDubinsPathProvider)
                      ?.isPathTypePossible(pathType),
                  onChanged: (value) => switch (value) {
                    true => {
                        ref
                            .read(dubinsPathDebugPathTypeProvider.notifier)
                            .update(pathType)
                      },
                    false => {ref.invalidate(dubinsPathDebugPathTypeProvider)},
                    _ => null,
                  },
                  secondary: Text(
                    pathType.name.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              )
              .toList(),
        ),
        MenuButtonWithChildren(
          icon: Icons.threesixty,
          text: 'Rotate points',
          menuChildren: [
            if (start != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Start:${start.heading.round()}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Slider(
                    value: start.heading,
                    onChanged: (value) => ref
                        .read(dubinsPathDebugStartPointProvider.notifier)
                        .update(
                          start.copyWith(heading: value),
                        ),
                    max: 360,
                  )
                ],
              ),
            if (end != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'End: ${end.heading.round()}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Slider(
                    value: end.heading,
                    onChanged: (value) => ref
                        .read(dubinsPathDebugEndPointProvider.notifier)
                        .update(
                          end.copyWith(heading: value),
                        ),
                    max: 360,
                  )
                ],
              ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Step size: ${ref.watch(dubinsPathDebugStepSizeProvider).toStringAsFixed(1)} m',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const StepSizeSlider(),
          ],
        ),
        ListTile(
          onTap: () {
            ref.read(dubinsPathDebugStartPointProvider.notifier).update(
                  WayPoint(
                    position: ref.watch(mainMapControllerProvider).center,
                    heading: 90,
                  ),
                );
            ref.read(dubinsPathDebugEndPointProvider.notifier).update(
                  WayPoint(
                    position: calculator.offset(
                      ref.watch(mainMapControllerProvider).center,
                      35,
                      0,
                    ),
                    heading: 210,
                  ),
                );
          },
          leading: const Icon(Icons.refresh),
          title: Text(
            'Reset points',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        ListTile(
          onTap: () => ref
            ..invalidate(dubinsPathDebugStartPointProvider)
            ..invalidate(dubinsPathDebugEndPointProvider),
          leading: const Icon(Icons.clear),
          title: Text(
            'Clear points',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class StepSizeSlider extends ConsumerWidget {
  const StepSizeSlider({
    super.key,
  });

  List<double> get values => <double>[0.1, 0.5, 1, 2, 5, 10];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepSize = ref.watch(dubinsPathDebugStepSizeProvider);

    return Slider(
      value: values.indexOf(stepSize).toDouble(),
      onChanged: (index) => ref
          .read(dubinsPathDebugStepSizeProvider.notifier)
          .update(values[index.toInt()]),
      max: values.length - 1,
      divisions: values.length - 1,
    );
  }
}
