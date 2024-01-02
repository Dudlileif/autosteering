import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for configuring the NTRIP Client settings.
class NtripMenu extends ConsumerWidget {
  /// A menu for configuring the NTRIP Client settings.
  const NtripMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'NTRIP (RTK)',
      iconOverrideWidget: Consumer(
        builder: (context, ref, child) => Icon(
          Icons.straighten,
          color: ref.watch(ntripAliveProvider) ? Colors.green : null,
        ),
      ),
      menuChildren: [
        Consumer(
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(ntripEnabledProvider),
            onChanged: (value) => value != null
                ? ref.read(ntripEnabledProvider.notifier).update(value: value)
                : null,
            secondary: Text('Enabled', style: textStyle),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.public),
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Host address',
              ),
              initialValue: ref.watch(ntripHostProvider),
              onChanged: ref.read(ntripHostProvider.notifier).update,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.tag),
            title: TextFormField(
              decoration: InputDecoration(
                labelText: 'Host port',
                labelStyle: textStyle,
                floatingLabelStyle: textStyle,
              ),
              keyboardType: TextInputType.number,
              maxLength: 5,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                final port = value != null ? int.tryParse(value) : null;

                return port != null && port >= 1 && port <= 65535
                    ? 'Valid Port'
                    : 'Invalid Port';
              },
              initialValue: ref.watch(ntripPortProvider).toString(),
              onChanged: ref.read(ntripPortProvider.notifier).updateFromString,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.email),
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              initialValue: ref.watch(ntripUsernameProvider),
              onChanged: ref.read(ntripUsernameProvider.notifier).update,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.password),
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              initialValue: ref.watch(ntripPasswordProvider),
              onChanged: ref.read(ntripPasswordProvider.notifier).update,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.router),
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Mount point / base station',
              ),
              initialValue: ref.watch(ntripMountPointProvider),
              onChanged: ref.read(ntripMountPointProvider.notifier).update,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final dataUsage = ref.watch(ntripDataUsageSessionProvider);
            if (dataUsage == null) {
              return const SizedBox.shrink();
            }

            return ListTile(
              leading: const Icon(Icons.data_usage),
              title: Text(
                '''Data usage (session): ${fileEntitySize(dataUsage, decimals: 3)}''',
                style: textStyle,
              ),
            );
          },
        ),
        if (Device.isNative)
          Consumer(
            builder: (context, ref, child) {
              final usageMap = ref.watch(ntripDataUsageByMonthProvider);
              final dataUsage =
                  usageMap[DateTime.now().toIso8601String().substring(0, 7)];
              if (dataUsage == null) {
                return const SizedBox.shrink();
              }

              return ListTile(
                leading: const Icon(Icons.data_usage),
                title: Text(
                  '''Data usage (month): ${fileEntitySize(dataUsage, decimals: 3)}''',
                  style: textStyle,
                ),
              );
            },
          ),
      ],
    );
  }
}
