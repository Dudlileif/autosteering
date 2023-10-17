import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/hardware/hardware.dart';
import 'package:agopengps_flutter/src/features/hardware/widgets/hardware_network_menu.dart';
import 'package:agopengps_flutter/src/features/hardware/widgets/hardware_serial_menu.dart'
    if (dart.library.html) 'hardware_serial_menu_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for configuring settings related to hardware features.
class HardwareMenu extends ConsumerWidget {
  /// A menu for configuring settings related to the hardware features.
  const HardwareMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(combinedCommunicationProvider);

    return MenuButtonWithChildren(
      text: 'Hardware',
      icon: Icons.router,
      menuChildren: [
        const HardwareNetworkMenu(),
        if (Device.isNative) const NtripMenu(),
        if (Device.supportsSerial) const HardwareSerialMenu(),
      ],
    );
  }
}
