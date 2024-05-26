// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/hardware/widgets/hardware_logging_menu.dart';
import 'package:autosteering/src/features/hardware/widgets/hardware_network_menu.dart';
import 'package:autosteering/src/features/hardware/widgets/hardware_serial_menu.dart'
    if (dart.library.js_interop) 'hardware_serial_menu_web.dart';
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
        if (Device.isNative)
          MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.settings_remote),
            ),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => const RemoteControlConfigurator(),
            ),
            child: Text(
              'Remote control',
              style: textStyle,
            ),
          ),
        if (Device.isNative)
          MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.download),
            ),
            child: Text(
              'Get hardware config',
              style: textStyle,
            ),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => ConfirmationDialog(
                title: 'Get hardware config?',
                onConfirmation: () async =>
                    ref.read(getSteeringHardwareConfigProvider),
              ),
            ),
          ),
        if (Device.isNative)
          MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.upload),
            ),
            child: Text(
              'Send hardware config',
              style: textStyle,
            ),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => ConfirmationDialog(
                title: 'Send hardware config?',
                onConfirmation: () async =>
                    ref.read(sendSteeringHardwareConfigProvider),
              ),
            ),
          ),
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
