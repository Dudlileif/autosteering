import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/providers/device_position_providers.dart';
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
      text: 'Debug',
      icon: Icons.bug_report,
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
        Consumer(
          child: Text(
            'Antenna position',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehicleAntennaPositionProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleAntennaPositionProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'IMU / Pitch and Roll',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehicleIMUProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleIMUProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Autosteering parameters',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehicleAutosteerParametersProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleAutosteerParametersProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Use IMU bearing',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(useIMUBearingProvider),
            onChanged: (value) => value != null
                ? ref.read(useIMUBearingProvider.notifier).update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Use device position',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(devicePositionAsVehiclePositionProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(devicePositionAsVehiclePositionProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
      ],
    );
  }
}
