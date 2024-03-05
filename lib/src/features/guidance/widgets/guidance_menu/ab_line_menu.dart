import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/ab_common_menu.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for working with the [ABLine]
/// guidance feature.
class ABLineMenu extends ConsumerWidget {
  /// A menu button with attached submenu for working with the [ABLine]
  /// guidance feature.
  const ABLineMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(activeABConfigProvider);

    final abLine = ref.watch(aBLineDebugProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => null,
          loading: () => null,
        );

    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    
    return MenuButtonWithChildren(
      text: 'AB line',
      menuChildren: [
        Consumer(
          builder: (context, ref, child) => ListTile(
            title: Text(
              '''Bearing: ${abLine != null ? '${abLine.initialBearing.toStringAsFixed(1)}°' : ''}''',
            ),
          ),
        ),
        Consumer(
          child: Text(
            'Set A',
            style: textStyle,
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
                ref
                    .read(aBTrackingDebugShowProvider.notifier)
                    .update(value: true);
              },
              child: child,
            );
          },
        ),
        Consumer(
          child: Text(
            'Set B',
            style: textStyle,
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
                ref
                    .read(aBTrackingDebugShowProvider.notifier)
                    .update(value: true);
              },
              child: child,
            );
          },
        ),
        ABCommonMenu(abTracking: abLine),
        Consumer(
          child: Text('Recalc bounded lines', style: textStyle),
          builder: (context, ref, child) => MenuItemButton(
            closeOnActivate: false,
            child: child,
            onPressed: () => ref.invalidate(aBLineDebugProvider),
          ),
        ),
      ],
    );
  }
}
