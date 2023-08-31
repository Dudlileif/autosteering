import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for working with the path tracking
/// feature.
class PathTrackingMenu extends StatelessWidget {
  /// A menu button with attached submenu for working with the path tracking
  ///  feature.
  const PathTrackingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Path tracking',
      menuChildren: [
        Consumer(
          child: Text(
            'Enable',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              secondary: child,
              value: ref.watch(enablePathTrackingProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(enablePathTrackingProvider.notifier)
                      .update(value: value)
                  : null,
            );
          },
        ),
        Consumer(
          child: Text(
            'Show',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              secondary: child,
              value: ref.watch(debugPathTrackingProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(debugPathTrackingProvider.notifier)
                      .update(value: value)
                  : null,
            );
          },
        ),
        ListTile(
          title: Text(
            'Loop',
            style: textStyle,
          ),
          trailing: Consumer(
            builder: (context, ref, child) {
              final loopMode = ref.watch(pathTrackingLoopProvider);

              return ToggleButtons(
                isSelected: PathTrackingLoopMode.values
                    .map((mode) => mode == loopMode)
                    .toList(),
                onPressed: (index) => ref
                    .read(pathTrackingLoopProvider.notifier)
                    .update(PathTrackingLoopMode.values[index]),
                children: PathTrackingLoopMode.values
                    .map(
                      (mode) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(mode.name.capitalize),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
        ListTile(
          title: Text(
            'Tracking mode',
            style: textStyle,
          ),
          trailing: Consumer(
            builder: (context, ref, child) {
              final pursuitMode = ref.watch(
                mainVehicleProvider
                    .select((vehicle) => vehicle.pathTrackingMode),
              );

              return ToggleButtons(
                onPressed: (index) => ref
                    .read(simInputProvider.notifier)
                    .send(PathTrackingMode.values[index]),
                isSelected: PathTrackingMode.values
                    .map((mode) => mode == pursuitMode)
                    .toList(),
                children: PathTrackingMode.values
                    .map(
                      (mode) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          mode.name.capitalize,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
        ListTile(
          title: Consumer(
            builder: (context, ref, child) {
              final distance = ref.watch(pathInterpolationDistanceProvider);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Interpolation distance: $distance m',
                    style: textStyle,
                  ),
                  Slider(
                    value: distance,
                    onChanged: ref
                        .read(pathInterpolationDistanceProvider.notifier)
                        .update,
                    max: 20,
                    min: 1,
                    divisions: 19,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
