import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/hardware/widgets/hardware_logging_menu.dart';
import 'package:autosteering/src/features/hardware/widgets/hardware_network_menu.dart';
import 'package:autosteering/src/features/hardware/widgets/hardware_serial_menu.dart'
    if (dart.library.html) 'hardware_serial_menu_web.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for configuring settings related to hardware features.
class HardwareMenu extends ConsumerWidget {
  /// A menu for configuring settings related to the hardware features.
  const HardwareMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    ref.watch(combinedCommunicationProvider);

    return MenuButtonWithChildren(
      text: 'Hardware',
      icon: Icons.router,
      menuChildren: [
        const HardwareNetworkMenu(),
        if (Device.isNative) const NtripMenu(),
        if (Device.supportsSerial) const HardwareSerialMenu(),
        if (Device.isNative) const HardwareLoggingMenu(),
        Consumer(
          child: Text(
            'Calibrate motor',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              secondary: child,
              value: ref.watch(steeringMotorEnableCalibrationProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(steeringMotorEnableCalibrationProvider.notifier)
                      .update(value: value)
                  : null,
            );
          },
        ),
      ],
    );
  }
}
