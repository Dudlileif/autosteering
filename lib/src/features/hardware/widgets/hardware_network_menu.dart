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
class HardwareNetworkMenu extends StatelessWidget {
  /// A menu for changing network settings to connect to the hardware.
  const HardwareNetworkMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Network',
      icon: Icons.settings_ethernet,
      menuChildren: [
        if (Device.isNative) ...[
          Consumer(
            builder: (context, ref, child) {
              final ip = ref.watch(deviceIPAdressWlanProvider).when(
                    data: (data) => data,
                    error: (error, stackTrace) => null,
                    loading: () => null,
                  );
              return ip != null
                  ? ListTile(
                leading: const Icon(Icons.wifi),
                title: Text(
                  '''
This device WLAN:
$ip''',
                  style: textStyle,
                ),
                    )
                  : const SizedBox.shrink();
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final ip = ref.watch(deviceIPAdressAPProvider).when(
                    data: (data) => data,
                    error: (error, stackTrace) => null,
                    loading: () => null,
                  );
              return ip != null
                  ? ListTile(
                      leading: const Icon(Icons.router),
                      title: Text(
                        '''
This device AP host:
$ip''',
                        style: textStyle,
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final ip = ref.watch(deviceIPAdressEthernetProvider).when(
                    data: (data) => data,
                    error: (error, stackTrace) => null,
                    loading: () => null,
                  );
              return ip != null
                  ? ListTile(
                leading: const Icon(Icons.cable),
                title: Text(
                  '''
This device Ethernet:
$ip''',
                  style: textStyle,
                ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
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
                    ref.watch(steeringHardwareNetworkAliveProvider)
                        ? const Icon(Icons.check, color: Colors.green)
                        : const Icon(Icons.clear, color: Colors.red),
              ),
              const Icon(Icons.router),
            ],
          ),
          title: Consumer(
            builder: (context, ref, child) {
              final controller = TextEditingController(
                text: ref.read(steeringHardwareAddressProvider),
              );
              return TextFormField(
                decoration: InputDecoration(
                  labelText: 'Steering Hardware Address',
                  error: SizedBox(
                    height: 16,
                    child: Column(
                      children: [
                        ListenableBuilder(
                          listenable: controller,
                          builder: (context, child) => Consumer(
                            builder: (context, ref, child) => ref
                                .watch(
                                  validInternetAddressProvider(controller.text),
                                )
                                .when(
                                  data: (data) => data
                                      ? Text(
                                          'Valid IP found',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: Colors.green.shade600,
                                          ),
                                        )
                                      : Text(
                                          'No valid IP found',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: theme.colorScheme.error,
                                          ),
                                        ),
                                  error: (error, stackTrace) => Text(
                                    'No valid IP found',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.error,
                                    ),
                                  ),
                                  loading: LinearProgressIndicator.new,
                                ),
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                      ],
                    ),
                  ),
                ),
                controller: controller,
                onChanged:
                    ref.read(steeringHardwareAddressProvider.notifier).update,
              );
            },
          ),
        ),
        ListTile(
          leading: Column(
            children: [
              Consumer(
                builder: (context, ref, child) =>
                    ref.watch(remoteControlHardwareNetworkAliveProvider)
                        ? const Icon(Icons.check, color: Colors.green)
                        : const Icon(Icons.clear, color: Colors.red),
              ),
              const Icon(Icons.settings_remote),
            ],
          ),
          title: Consumer(
            builder: (context, ref, child) {
              final controller = TextEditingController(
                text: ref.read(remoteControlHardwareAddressProvider),
              );
              return TextFormField(
                decoration: InputDecoration(
                  labelText: 'Remote Control Hardware Address',
                  error: SizedBox(
                    height: 16,
                    child: Column(
                      children: [
                        ListenableBuilder(
                          listenable: controller,
                          builder: (context, child) => Consumer(
                            builder: (context, ref, child) => ref
                                .watch(
                                  validInternetAddressProvider(controller.text),
                                )
                                .when(
                                  data: (data) => data
                                      ? Text(
                                          'Valid IP found',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: Colors.green.shade600,
                                          ),
                                        )
                                      : Text(
                                          'No valid IP found',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: theme.colorScheme.error,
                                          ),
                                        ),
                                  error: (error, stackTrace) => Text(
                                    'No valid IP found',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.error,
                                    ),
                                  ),
                                  loading: LinearProgressIndicator.new,
                                ),
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                      ],
                    ),
                  ),
                ),
                controller: controller,
                onChanged: ref
                    .read(remoteControlHardwareAddressProvider.notifier)
                    .update,
              );
            },
          ),
        ),
        if (Device.isNative)
          Consumer(
            builder: (context, ref, child) {
              final controller = TextEditingController(
                text: ref.read(hardwareUDPReceivePortProvider).toString(),
              );
              return ListTile(
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
                  controller: controller,
                  onChanged: ref
                      .read(hardwareUDPReceivePortProvider.notifier)
                      .updateFromString,
                ),
              );
            },
          ),
        if (Device.isNative)
          Consumer(
            builder: (context, ref, child) {
              final controller = TextEditingController(
                text: ref.read(hardwareUDPSendPortProvider).toString(),
              );
              return ListTile(
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
                  controller: controller,
                  onChanged: ref
                      .read(hardwareUDPSendPortProvider.notifier)
                      .updateFromString,
                ),
              );
            },
          ),
      ],
    );
  }
}
