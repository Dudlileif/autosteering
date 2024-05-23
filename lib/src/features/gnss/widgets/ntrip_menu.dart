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
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
            
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Host address',
                icon: Icon(Icons.public),
              ),
              initialValue: ref.read(ntripHostProvider),
              onChanged: ref.read(ntripHostProvider.notifier).update,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            
            title: TextFormField(
              
              decoration: InputDecoration(
                labelText: 'Host port',
                labelStyle: textStyle,
                floatingLabelStyle: textStyle,
                icon: const Icon(Icons.tag),
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
              initialValue: ref.read(ntripPortProvider).toString(),
              onChanged: ref.read(ntripPortProvider.notifier).updateFromString,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
            
                icon: Icon(Icons.email),
              ),
              initialValue: ref.read(ntripUsernameProvider),
              onChanged: ref.read(ntripUsernameProvider.notifier).update,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.password),
              ),
              obscureText: true,
              initialValue: ref.read(ntripPasswordProvider),
              onChanged: ref.read(ntripPasswordProvider.notifier).update,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Mount point / base station',
                icon: Icon(Icons.router),
              ),
              textCapitalization: TextCapitalization.characters,
              initialValue: ref.read(activeNtripMountPointProvider),
              onChanged:
                  ref.read(activeNtripMountPointProvider.notifier).update,
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.table_rows),
            onTap: () => showDialog<String?>(
              context: context,
              builder: (context) => const _NtripSourcetableDialog(),
            ),
            title: Text('Find closest base station', style: textStyle),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ListTile(
            
            title: Builder(
              builder: (context) {
                final controller = TextEditingController(
                  text: ref.read(ntripGGASendingIntervalProvider)?.toString(),
                );
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: 'GGA sending interval (s)',
                    icon: const Icon(Icons.timer_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.clear();
                        ref
                            .read(ntripGGASendingIntervalProvider.notifier)
                            .update(null);
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: controller,
                  onChanged: (value) => ref
                      .read(ntripGGASendingIntervalProvider.notifier)
                      .update(int.tryParse(value)),
                );
              },
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
              title: RichText(
                text: TextSpan(
                  text: 'Data usage (session): ',
                  style: textStyle,
                  children: [
                    TextSpan(
                      text: fileEntitySize(dataUsage),
                      style: GoogleFonts.robotoMono(
                        textStyle: textStyle,
                      ),
                    ),
                  ],
                ),
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
                title: RichText(
                  text: TextSpan(
                    text: 'Data usage (month): ',
                    style: textStyle,
                    children: [
                      TextSpan(
                        text: fileEntitySize(dataUsage),
                        style:
                            GoogleFonts.robotoMono(
                          textStyle: textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

class _NtripSourcetableDialog extends StatefulWidget {
  const _NtripSourcetableDialog();

  @override
  State<_NtripSourcetableDialog> createState() =>
      _NtripSourcetableDialogState();
}

class _NtripSourcetableDialogState extends State<_NtripSourcetableDialog> {
  String? selectedMountPoint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;
    return SimpleDialog(
      title: Text(
        'NTRIP caster sourcetable',
        style: theme.textTheme.headlineSmall,
      ),
      contentPadding: const EdgeInsets.only(
        left: 24,
        top: 12,
        right: 24,
        bottom: 16,
      ),
      children: [
        Consumer(
          builder: (context, ref, child) =>
              ref.watch(ntripMountPointsSortedProvider).when(
                    data: (data) {
                      if (data != null && data.isNotEmpty) {
                        final entries = data.entries.take(10);

                        return MenuItemButton(
                          closeOnActivate: false,
                          child: DropdownMenu(
                            initialSelection: entries.first,
                            onSelected: (value) => setState(
                              () => selectedMountPoint = value?.key.name,
                            ),
                            dropdownMenuEntries: entries.map(
                              (station) {
                                final label = <String>[];
                                final name = station.key.name ?? 'No name';
                                label.add(name);
                                final identifier = station.key.identifier;
                                if (identifier != null) {
                                  label.add(identifier);
                                }
                                final country = station.key.country;
                                if (country != null && country != identifier) {
                                  label.add(country);
                                }
                                final distance = station.value != null
                                    ? '''${(station.value! / 1000).toStringAsFixed(1)} km'''
                                    : null;
                                if (distance != null) {
                                  label.add(distance);
                                }

                                return DropdownMenuEntry<
                                    MapEntry<NtripMountPointStream, double?>>(
                                  value: station,
                                  label: label.join(', '),
                                );
                              },
                            ).toList(),
                          ),
                        );
                      }
                      return Text(
                        'No sourcetable found at the host.',
                        style: textStyle,
                      );
                    },
                    error: (error, stackTrace) => ErrorWidget(error),
                    loading: () => const Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                ),
                  ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),
                if (selectedMountPoint != null)
                  Consumer(
                    builder: (context, ref, child) => FilledButton.icon(
                      onPressed: () {
                        ref
                            .read(activeNtripMountPointProvider.notifier)
                            .update(selectedMountPoint);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.check),
                      label: Text(
                        'Use $selectedMountPoint',
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
