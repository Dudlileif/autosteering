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
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

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
      contentPadding: const EdgeInsets.only(
        left: 24,
        top: 12,
        right: 24,
        bottom: 16,
      ),
      children: [
        if (Device.isNative) ...[
          if (ref.watch(
            deviceIPAddressWlanProvider.select((value) => value != null),
          ))
            Consumer(
              builder: (context, ref, child) => Row(
                children: [
                  const Icon(Icons.wifi),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: SelectableText('''
This device WLAN:
${ref.watch(deviceIPAddressWlanProvider)}''', style: textStyle),
                  ),
                ],
              ),
            ),
          if (ref.watch(
            deviceIPAddressAPProvider.select((value) => value != null),
          ))
            Consumer(
              builder: (context, ref, child) => Row(
                children: [
                  const Icon(Icons.router),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text('''
This device AP host:
${ref.watch(deviceIPAddressAPProvider)}''', style: textStyle),
                  ),
                ],
              ),
            ),
          if (ref.watch(
            deviceIPAddressEthernetProvider.select((value) => value != null),
          ))
            Consumer(
              builder: (context, ref, child) => Row(
                children: [
                  const Icon(Icons.cable),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text('''
This device Ethernet:
${ref.watch(deviceIPAddressEthernetProvider)}''', style: textStyle),
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
              return TextField(
                controller: controller,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Steering Hardware Address',
                  icon: Column(
                    children: [
                      Consumer(
                        builder: (context, ref, child) =>
                            ref.watch(steeringHardwareNetworkAliveProvider)
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                      ),
                      const Icon(Icons.router),
                    ],
                  ),
                  suffixIcon: switch (controller.text) {
                    String(isNotEmpty: true) => Row(
                      mainAxisSize: .min,
                      children: [
                        IconButton(
                          onPressed: () => Clipboard.setData(
                            ClipboardData(text: controller.text),
                          ),
                          icon: const Icon(Symbols.copy_all_rounded),
                        ),
                        IconButton(
                          onPressed: () async {
                            final uri = Uri(
                              scheme: 'http',
                              host: controller.text,
                            );
                            await launchUrl(uri, mode: .inAppBrowserView);
                          },
                          icon: const Icon(Symbols.globe_rounded),
                        ),
                      ],
                    ),
                    _ => null,
                  },
                ),
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
              return TextField(
                controller: controller,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Remote Control Hardware Address',
                  icon: Column(
                    children: [
                      Consumer(
                        builder: (context, ref, child) =>
                            ref.watch(
                              remoteControlHardwareNetworkAliveProvider,
                            )
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                      ),
                      const Icon(Icons.settings_remote),
                    ],
                  ),
                  suffixIcon: switch (controller.text) {
                    String(isNotEmpty: true) => Row(
                      mainAxisSize: .min,
                      children: [
                        IconButton(
                          onPressed: () => Clipboard.setData(
                            ClipboardData(text: controller.text),
                          ),
                          icon: const Icon(Symbols.copy_all_rounded),
                        ),
                        IconButton(
                          onPressed: () async {
                            final uri = Uri(
                              scheme: 'http',
                              host: controller.text,
                            );
                            await launchUrl(uri, mode: .inAppBrowserView);
                          },
                          icon: const Icon(Symbols.globe_rounded),
                        ),
                      ],
                    ),

                    _ => null,
                  },
                ),
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
