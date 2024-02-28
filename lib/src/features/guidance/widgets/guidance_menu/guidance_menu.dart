import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/a_plus_line_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/ab_curve_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/ab_line_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/path_recorder_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/path_tracking_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/virtual_led_bar_menu.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu with attached submenu for working with the guidance features.
class GuidanceMenu extends StatelessWidget {
  /// A menu with attached submenu for working with the guidance features.
  const GuidanceMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
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
                closeOnActivate: false,
                child: Text(
                  'Close active',
                  style: textStyle,
                ),
              );
            }
            return const SizedBox.shrink();
          },
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
                onPressed: (index) {
                  final oldValue = ref.read(
                    mainVehicleProvider
                        .select((value) => value.pathTrackingMode),
                  );

                  ref
                      .read(simInputProvider.notifier)
                      .send(PathTrackingMode.values[index]);

                  // Wait a short while before saving the hopefully
                  // updated vehicle.
                  Future.delayed(const Duration(milliseconds: 250), () {
                    final vehicle = ref.read(mainVehicleProvider);
                    ref.read(saveVehicleProvider(vehicle));
                    Logger.instance.i(
                      '''Updated vehicle path tracking mode: $oldValue -> ${vehicle.pathTrackingMode}''',
                    );
                  });
                },
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
        const PathRecorderMenu(),
        const PathTrackingMenu(),
        const APlusLineMenu(),
        const ABLineMenu(),
        const ABCurveMenu(),
        const VirtualLedBarMenu(),
      ],
    );
  }
}
