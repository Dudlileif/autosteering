import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for configuring settings related to the network features.
class NetworkMenu extends ConsumerWidget {
  /// A menu for configuring settings related to the network features.
  const NetworkMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!Device.isWeb) {
      ref
        ..watch(hardwareCommunicationConfigProvider)
        ..watch(ntripClientProvider);
    } else if (Device.isWeb) {
      ref.watch(hardwareWebCommunicationConfigProvider);
    }
    if (Device.supportsSerial) {
      ref.watch(gnssSerialStreamProvider);
    }

    return MenuButtonWithChildren(
      text: 'Network Menu',
      icon: Icons.settings_ethernet,
      menuChildren: [
        const NetworkHardwareMenu(),
        if (!Device.isWeb) const NtripMenu(),
        if (Device.supportsSerial) const GnssSerialMenu(),
      ],
    );
  }
}
