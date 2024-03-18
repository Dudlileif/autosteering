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
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for changing network settings to connect to the hardware.
class HardwareNetworkMenu extends ConsumerWidget {
  /// A menu for changing network settings to connect to the hardware.
  const HardwareNetworkMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Network',
      icon: Icons.settings_ethernet,
      menuChildren: [
        if (Device.isNative)
          Consumer(
            builder: (context, ref, child) {
              final ip = ref.watch(deviceIPAdressWlanProvider).when(
                    data: (data) => data ?? 'No connection',
                    error: (error, stackTrace) => 'Error',
                    loading: () => 'loading',
                  );
              return ListTile(
                leading: const Icon(Icons.wifi),
                title: Text(
                  '''
This device wlan:
$ip''',
                  style: textStyle,
                ),
              );
            },
          ),
        if (Device.isNative)
          Consumer(
            builder: (context, ref, child) {
              final ip = ref.watch(deviceIPAdressEthernetProvider).when(
                    data: (data) => data ?? 'No connection',
                    error: (error, stackTrace) => 'Error',
                    loading: () => 'loading',
                  );
              return ListTile(
                leading: const Icon(Icons.cable),
                title: Text(
                  '''
This device ethernet:
$ip''',
                  style: textStyle,
                ),
              );
            },
          ),
        Consumer(
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(sendMessagesToHardwareIfNetworkProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(sendMessagesToHardwareIfNetworkProvider.notifier)
                    .update(value: value)
                : null,
            title: Text(
              'Send messages',
              style: textStyle,
            ),
            secondary: const Icon(Icons.message),
          ),
        ),
        ListTile(
          leading: Column(
            children: [
              Consumer(
                builder: (context, ref, child) =>
                    ref.watch(hardwareNetworkAliveProvider)
                        ? const Icon(Icons.check, color: Colors.green)
                        : const Icon(Icons.clear, color: Colors.red),
              ),
              const Icon(Icons.router),
            ],
          ),
          title: Consumer(
            builder: (context, ref, child) => TextFormField(
              decoration: const InputDecoration(
                labelText: 'Hardware Address',
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null &&
                      (ref.watch(validInternetAddressProvider(value)).value ??
                          false)
                  ? 'Valid IP found'
                  : 'No IP found',
              initialValue: ref.watch(hardwareAddressProvider),
              onChanged: ref.read(hardwareAddressProvider.notifier).update,
            ),
          ),
        ),
        if (Device.isNative)
          Consumer(
            builder: (context, ref, child) => ListTile(
              leading: const Icon(Icons.call_received),
              title: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Receive port',
                  labelStyle: textStyle,
                  floatingLabelStyle: textStyle,
                ),
                keyboardType: TextInputType.number,
                maxLength: 5,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  final port = value != null ? int.tryParse(value) : null;

                  return port != null && port >= 1000 && port <= 65535
                      ? 'Valid Port'
                      : 'Invalid Port';
                },
                initialValue:
                    ref.watch(hardwareUDPReceivePortProvider).toString(),
                onChanged: ref
                    .read(hardwareUDPReceivePortProvider.notifier)
                    .updateFromString,
              ),
            ),
          ),
        if (Device.isNative)
          Consumer(
            builder: (context, ref, child) => ListTile(
              leading: const Icon(Icons.send),
              title: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Send port',
                ),
                keyboardType: TextInputType.number,
                maxLength: 5,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  final port = value != null ? int.tryParse(value) : null;

                  return port != null && port >= 1000 && port <= 65535
                      ? 'Valid Port'
                      : 'Invalid Port';
                },
                initialValue: ref.watch(hardwareUDPSendPortProvider).toString(),
                onChanged: ref
                    .read(hardwareUDPSendPortProvider.notifier)
                    .updateFromString,
              ),
            ),
          ),
      ],
    );
  }
}
