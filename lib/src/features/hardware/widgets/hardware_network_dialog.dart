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
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for changing network settings to connect to the hardware.
class HardwareNetworkDialog extends ConsumerWidget {
  /// A menu for changing network settings to connect to the hardware.
  const HardwareNetworkDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;
    return SimpleDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('Network'), CloseButton()],
      ),
      contentPadding:
          const EdgeInsets.only(left: 24, top: 12, right: 24, bottom: 16),
      children: [
        if (Device.isNative) ...[
          if (ref.watch(
            deviceIPAdressWlanProvider.select((value) => value != null),
          ))
            Consumer(
              builder: (context, ref, child) => Row(
                children: [
                  const Icon(Icons.wifi),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: SelectableText(
                      '''
This device WLAN:
${ref.watch(deviceIPAdressWlanProvider)}''',
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ),
          if (ref
              .watch(deviceIPAdressAPProvider.select((value) => value != null)))
            Consumer(
              builder: (context, ref, child) => Row(
                children: [
                  const Icon(Icons.router),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      '''
This device AP host:
${ref.watch(deviceIPAdressAPProvider)}''',
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ),
          if (ref.watch(
            deviceIPAdressEthernetProvider.select((value) => value != null),
          ))
            Consumer(
              builder: (context, ref, child) => Row(
                children: [
                  const Icon(Icons.cable),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      '''
This device Ethernet:
${ref.watch(deviceIPAdressEthernetProvider)}''',
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ),
        ],
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Consumer(
            builder: (context, ref, child) {
              final controller = TextEditingController(
                text: ref.watch(steeringHardwareAddressProvider),
              );
              return TextFormField(
                decoration: InputDecoration(
                  labelText: 'Steering Hardware Address',
                  counter: SizedBox(
                    height: 18,
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
                  icon: Column(
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
                ),
                controller: controller,
                onFieldSubmitted:
                    ref.read(steeringHardwareAddressProvider.notifier).update,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Consumer(
            builder: (context, ref, child) {
              final controller = TextEditingController(
                text: ref.watch(remoteControlHardwareAddressProvider),
              );
              return TextFormField(
                decoration: InputDecoration(
                  labelText: 'Remote Control Hardware Address',
                  counter: SizedBox(
                    height: 18,
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
                  icon: Column(
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
                ),
                controller: controller,
                onFieldSubmitted: ref
                    .read(remoteControlHardwareAddressProvider.notifier)
                    .update,
              );
            },
          ),
        ),
        if (Device.isNative) ...[
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Consumer(
              builder: (context, ref, child) => TextFormField(
                decoration: InputDecoration(
                  labelText: 'Receive port',
                  labelStyle: textStyle,
                  floatingLabelStyle: textStyle,
                  icon: const Icon(Icons.call_received),
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
                controller: TextEditingController(
                  text: ref.read(hardwareUDPReceivePortProvider).toString(),
                ),
                onChanged: ref
                    .read(hardwareUDPReceivePortProvider.notifier)
                    .updateFromString,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Consumer(
              builder: (context, ref, child) => TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Send port',
                  icon: Icon(Icons.send),
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
                controller: TextEditingController(
                  text: ref.read(hardwareUDPSendPortProvider).toString(),
                ),
                onChanged: ref
                    .read(hardwareUDPSendPortProvider.notifier)
                    .updateFromString,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
