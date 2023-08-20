import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/network/network.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

/// A menu for changing network settings to connect to the hardware.
class NetworkMenu extends ConsumerWidget {
  /// A menu for changing network settings to connect to the hardware.
  const NetworkMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(hardwareCommunicationConfigProvider);

    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Network',
      icon: Icons.settings_ethernet,
      menuChildren: [
        Consumer(
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.devices),
            title: Text(
              'This device:\n${ref.watch(deviceIPAdressProvider).when(
                    data: (data) => data,
                    error: (error, stackTrace) => error,
                    loading: () => 'loading',
                  )}',
              style: textStyle,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.router),
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Hardware IP',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              maxLength: 15,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) =>
                  value != null && InternetAddress.tryParse(value) != null
                      ? 'Valid IP'
                      : 'Invalid IP',
              initialValue: ref.watch(hardwareIPAdressProvider),
              onChanged: ref.read(hardwareIPAdressProvider.notifier).update,
            ),
          ),
        ),
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
