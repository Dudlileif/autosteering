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

        if (ref.watch(
          activeNtripProfileProvider.select((value) => value != null),
        )) ...[
          ListTile(
            leading: const Icon(Icons.tune),
            title: Text(
              '''Active profile: ${ref.watch(activeNtripProfileProvider.select((value) => value?.name ?? 'No profile selected'))}''',
              style: textStyle,
            ),
          ),
          ListTile(
            title: Text('Edit profile', style: textStyle),
            leading: const Icon(Icons.edit),
            onTap: () => showDialog<void>(
              context: context,
              builder: (context) => _NtripProfileDialog(
                profile: ref.watch(activeNtripProfileProvider),
              ),
            ),
          ),
        ],
        ListTile(
          title: Text('Add profile', style: textStyle),
          leading: const Icon(Icons.add),
          onTap: () => showDialog<void>(
            context: context,
            builder: (context) => const _NtripProfileDialog(),
          ),
        ),
        if (ref
            .watch(ntripProfilesProvider.select((value) => value.isNotEmpty)))
          Consumer(
            builder: (context, ref, child) => MenuButtonWithChildren(
              text: 'Load profile',
              icon: Icons.history,
              menuChildren: ref
                  .watch(ntripProfilesProvider)
                  .map(
                    (profile) => ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 200),
                      child: ListTile(
                        selectedTileColor: Theme.of(context)
                            .menuButtonTheme
                            .style
                            ?.overlayColor
                            ?.resolve({MaterialState.selected}),
                        selected:
                            profile == ref.watch(activeNtripProfileProvider),
                        title: Text(profile.name, style: textStyle),
                        onTap: () => ref
                            .read(activeNtripProfileProvider.notifier)
                            .update(profile),
                        trailing: Device.isNative
                            ? IconButton(
                                onPressed: () async {
                                  await showDialog<bool>(
                                    context: context,
                                    builder: (context) => Consumer(
                                      builder: (context, ref, child) =>
                                          DeleteDialog(
                                        name: profile.name,
                                        onDelete: () async => ref
                                            .read(
                                              ntripProfilesProvider.notifier,
                                            )
                                            .remove(profile),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              )
                            : null,
                      ),
                    ),
                  )
                  .toList(),
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
      ],
    );
  }
}

class _NtripSourcetableDialog extends StatefulWidget {
  const _NtripSourcetableDialog({
    required this.host,
    this.port = 2101,
    this.username,
    this.password,
  });
  final String host;
  final int port;
  final String? username;
  final String? password;

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
          builder: (context, ref, child) => ref
              .watch(
                ntripMountPointsSortedProvider(
                  host: widget.host,
                  port: widget.port,
                  username: widget.username,
                  password: widget.password,
                ),
              )
              .when(
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
                        Navigator.of(context).pop(selectedMountPoint);
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

class _NtripProfileDialog extends StatefulWidget {
  const _NtripProfileDialog({this.profile});
  final NtripProfile? profile;

  @override
  State<StatefulWidget> createState() => __NtripProfileDialogState();
}

class __NtripProfileDialogState extends State<_NtripProfileDialog> {
  late final name = TextEditingController(text: widget.profile?.name);
  late final hostAddress =
      TextEditingController(text: widget.profile?.hostAddress);
  late final port =
      TextEditingController(text: (widget.profile?.port ?? 2101).toString());
  late final username = TextEditingController(text: widget.profile?.username);
  late final password = TextEditingController(text: widget.profile?.password);
  late final mountPoint =
      TextEditingController(text: widget.profile?.mountPoint);
  late final ggaSendingInterval = TextEditingController(
    text: widget.profile?.ggaSendingInterval?.toString(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;
    return SimpleDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.profile != null
                ? 'Edit NTRIP profile'
                : 'Create NTRIP profile',
          ),
          const CloseButton(),
        ],
      ),
      contentPadding:
          const EdgeInsets.only(left: 24, top: 12, right: 24, bottom: 16),
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Name',
            icon: Icon(Icons.label_outlined),
          ),
          controller: name,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Host address',
              icon: Icon(Icons.public),
            ),
            controller: hostAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TextFormField(
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
            controller: port,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Username',
              icon: Icon(Icons.email),
            ),
            controller: username,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              icon: Icon(Icons.password),
            ),
            obscureText: true,
            controller: password,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Mount point / base station',
              icon: Icon(Icons.router),
            ),
            controller: mountPoint,
          ),
        ),
        ListenableBuilder(
          listenable: hostAddress,
          builder: (context, child) {
            if (hostAddress.text.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: () => showDialog<String?>(
                    context: context,
                    builder: (context) => _NtripSourcetableDialog(
                      host: hostAddress.text,
                      port: int.tryParse(port.text) ?? 2101,
                      username: username.text,
                      password: password.text,
                    ),
                  ).then((value) {
                    if (value != null) {
                      setState(() => mountPoint.text = value);
                    }
                  }),
                  child: Text('Find closest base station', style: textStyle),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'GGA sending interval (s)',
              icon: const Icon(Icons.timer_outlined),
              suffixIcon: IconButton(
                onPressed: () => setState(() => ggaSendingInterval.clear()),
                icon: const Icon(Icons.clear),
              ),
            ),
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLength: 4,
            validator: (value) {
              final interval = value != null ? int.tryParse(value) : null;

              return value == null ||
                      value.isEmpty ||
                      (interval != null && interval >= 1)
                  ? 'Valid interval'
                  : 'Input whole seconds from 1 or empty';
            },
            controller: ggaSendingInterval,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.clear),
                  label: const Text('Cancel'),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ListenableBuilder(
                      listenable:
                          Listenable.merge([name, hostAddress, mountPoint]),
                      builder: (context, child) => FilledButton.icon(
                        onPressed: name.text.isNotEmpty &&
                                hostAddress.text.isNotEmpty &&
                                mountPoint.text.isNotEmpty
                            ? () {
                                final profile = NtripProfile(
                                  name: name.text,
                                  hostAddress: hostAddress.text,
                                  port: int.tryParse(port.text) ?? 2101,
                                  mountPoint: mountPoint.text,
                                  username: username.text,
                                  password: password.text,
                                  ggaSendingInterval:
                                      int.tryParse(ggaSendingInterval.text),
                                );

                                ref
                                    .read(ntripProfilesProvider.notifier)
                                    .replace(profile);
                                if (ref.read(
                                  activeNtripProfileProvider.select(
                                    (value) =>
                                        value == null ||
                                        value.name == name.text,
                                  ),
                                )) {
                                  ref
                                      .read(activeNtripProfileProvider.notifier)
                                      .update(profile);
                                }
                                Navigator.of(context).pop();
                              }
                            : null,
                        icon: const Icon(Icons.check),
                        label:
                            Text(widget.profile != null ? 'Update' : 'Create'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
