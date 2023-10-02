import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/guidance_menu/ab_curve_menu.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/guidance_menu/ab_line_menu.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/guidance_menu/path_recorder_menu.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/guidance_menu/path_tracking_menu.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/guidance_menu/virtual_led_bar_menu.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu with attached submenu for working with the guidance features.
class GuidanceMenu extends StatelessWidget {
  /// A menu with attached submenu for working with the guidance features.
  const GuidanceMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuButtonWithChildren(
      text: 'Guidance',
      icon: Icons.navigation,
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            if (ref.watch(displayABTrackingProvider) != null ||
                ref.watch(displayPathTrackingProvider) != null) {
              return MenuItemButton(
                leadingIcon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.clear),
                ),
                onPressed: () {
                  ref.read(simInputProvider.notifier).send((abTracking: null));
                  ref
                      .read(simInputProvider.notifier)
                      .send((pathTracking: null));
                },
                child: const Text('Close active'),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const PathRecorderMenu(),
        const PathTrackingMenu(),
        const ABLineMenu(),
        const ABCurveMenu(),
        const VirtualLedBarMenu(),
      ],
    );
  }
}
