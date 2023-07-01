import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu or buttons used for debugging
/// a Dubins path between two points.
class DubinsPathDebugMenu extends StatelessWidget {
  const DubinsPathDebugMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.route,
      text: 'Dubins path',
      menuChildren: [
        Consumer(
          child: Text(
            'Debugging',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              value: ref.watch(enableDubinsPathDebugProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(enableDubinsPathDebugProvider.notifier)
                      .update(value: value)
                  : null,
              secondary: child,
            );
          },
        ),
        Consumer(
          child: Text(
            'Turning circles',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              value: ref.watch(showDubinsPathDebugCirclesProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(showDubinsPathDebugCirclesProvider.notifier)
                      .update(value: value)
                  : null,
              secondary: const Icon(Icons.circle),
              title: child,
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final selectedPathType = ref.watch(dubinsPathDebugPathTypeProvider);
            final dubinsPath = ref.watch(debugDubinsPathProvider);

            return MenuButtonWithChildren(
              icon: Icons.abc,
              text:
                  'Path type: ${(selectedPathType?.name ?? dubinsPath?.bestPathData?.pathType.name)?.toUpperCase()}\n${(dubinsPath?.pathData(selectedPathType)?.totalLength ?? dubinsPath?.bestPathData?.totalLength)?.round()} m',
              menuChildren: DubinsPathType.values
                  .map(
                    (pathType) => CheckboxListTile(
                      value: selectedPathType == pathType,
                      enabled: dubinsPath?.isPathTypePossible(pathType),
                      onChanged: (value) => switch (value) {
                        true => {
                            ref
                                .read(dubinsPathDebugPathTypeProvider.notifier)
                                .update(pathType)
                          },
                        false => {
                            ref.invalidate(dubinsPathDebugPathTypeProvider)
                          },
                        _ => null,
                      },
                      secondary: Text(
                        pathType.name.toUpperCase(),
                        style: textStyle,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final start = ref.watch(dubinsPathDebugStartPointProvider);
            final end = ref.watch(dubinsPathDebugEndPointProvider);

            return MenuButtonWithChildren(
              icon: Icons.threesixty,
              text: 'Rotate points',
              menuChildren: [
                if (start != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Start:${start.heading.round()}',
                        style: textStyle,
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
                        style: textStyle,
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
            );
          },
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  'Step size: ${ref.watch(dubinsPathDebugStepSizeProvider).toStringAsFixed(1)} m',
                  style: textStyle,
                );
              },
            ),
            const StepSizeSlider(),
          ],
        ),
        Consumer(
          child: Text(
            'Reset points',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return ListTile(
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
              title: child,
            );
          },
        ),
        Consumer(
          child: Text(
            'Clear points',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return ListTile(
              onTap: () => ref
                ..invalidate(dubinsPathDebugStartPointProvider)
                ..invalidate(dubinsPathDebugEndPointProvider),
              leading: const Icon(Icons.clear),
              title: child,
            );
          },
        ),
      ],
    );
  }
}

/// A slider for specifying the step size for the Dubins path debugging.
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
