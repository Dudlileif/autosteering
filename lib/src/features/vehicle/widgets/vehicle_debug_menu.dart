import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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
      text: 'Vehicle',
      icon: Icons.agriculture,
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
            value: ref.watch(debugSteeringProvider),
            onChanged: (value) => value != null
                ? ref.read(debugSteeringProvider.notifier).update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Trajectory',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugTrajectoryProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugTrajectoryProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Travelled path',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugTravelledPathProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugTravelledPathProvider.notifier)
                    .update(value: value)
                : null,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child ?? const SizedBox.shrink(),
                Slider.adaptive(
                  value: ref.watch(debugTravelledPathSizeProvider).toDouble(),
                  onChanged: (value) => ref
                      .read(debugTravelledPathSizeProvider.notifier)
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
      ],
    );
  }
}
