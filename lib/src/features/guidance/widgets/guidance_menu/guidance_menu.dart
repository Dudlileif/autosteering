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

import 'dart:async';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/ab_tracking_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/path_tracking_menu.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/virtual_led_bar_menu.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO(dudlileif): AB tracking from part of path tracking/field border

/// A menu with attached submenu for working with the guidance features.
class GuidanceMenu extends ConsumerWidget {
  /// A menu with attached submenu for working with the guidance features.
  const GuidanceMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Guidance',
      icon: Icons.navigation_outlined,
      menuChildren: [
        ListTile(
          title: Text(
            'Tracking mode',
            style: textStyle,
          ),
          trailing: Consumer(
            builder: (context, ref, child) {
              final trackingMode = ref.watch(
                mainVehicleProvider
                    .select((vehicle) => vehicle.pathTrackingMode),
              );
              return SegmentedButton<PathTrackingMode>(
                style: theme.segmentedButtonTheme.style?.copyWith(
                  visualDensity: VisualDensity.compact,
                ),
                showSelectedIcon: false,
                onSelectionChanged: (values) {
                  final oldValue = ref.read(
                    mainVehicleProvider
                        .select((value) => value.pathTrackingMode),
                  );

                  ref.read(simInputProvider.notifier).send(values.first);

                  // Wait a short while before saving the hopefully
                  // updated vehicle.
                  Timer(const Duration(milliseconds: 250), () {
                    final vehicle = ref.read(mainVehicleProvider);
                    ref.read(saveVehicleProvider(vehicle));
                    Logger.instance.i(
                      '''Updated vehicle path tracking mode: $oldValue -> ${vehicle.pathTrackingMode}''',
                    );
                  });
                },
                selected: {trackingMode},
                segments: const [
                  ButtonSegment(
                    value: PathTrackingMode.purePursuit,
                    label: Text('Pure pursuit'),
                  ),
                  ButtonSegment(
                    value: PathTrackingMode.stanley,
                    label: Text('Stanley'),
                  ),
                ],
              );
            },
          ),
        ),
        if (ref.watch(
              displayABTrackingProvider.select((value) => value != null),
            ) ||
            ref.watch(
              displayPathTrackingProvider.select((value) => value != null),
            ))
          MenuItemButton(
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            onPressed: () {
              ref
                ..read(simInputProvider.notifier).send((abTracking: null))
                ..read(simInputProvider.notifier).send((pathTracking: null))
                ..invalidate(configuredABTrackingProvider)
                ..invalidate(configuredPathTrackingProvider)
                ..invalidate(pathTrackingPointsProvider);
            },
            closeOnActivate: false,
            child: Text(
              'Close active',
              style: textStyle,
            ),
          ),
        if (ref.watch(
              displayABTrackingProvider.select((value) => value == null),
            ) &&
            ref.watch(
              displayPathTrackingProvider.select((value) => value == null),
            )) ...[
          if (Device.isNative) const _LoadPathTrackingMenu(),
          if (Device.isNative) const _LoadABTrackingMenu(),
          const _ImportMenu(),
        ],
        if (ref.watch(
          displayABTrackingProvider.select((value) => value != null),
        )) ...[
          const _SaveABTrackingButton(),
          const _RenameABTrackingButton(),
        ],
        if (ref.watch(
          displayPathTrackingProvider.select((value) => value != null),
        )) ...[
          const _SavePathTrackingButton(),
          const _RenamePathTrackingButton(),
        ],
        if (ref.watch(
              displayABTrackingProvider.select((value) => value != null),
            ) ||
            ref.watch(
              displayPathTrackingProvider.select((value) => value != null),
            )) ...[
          const _ExportButton(),
        ],
        const ABTrackingMenu(),
        const PathTrackingMenu(),
        const VirtualLedBarMenu(),
      ],
    );
  }
}

/// A menu for loading a [PathTracking] from saved fields.
class _LoadPathTrackingMenu extends ConsumerWidget {
  /// A menu for loading a [PathTracking] from saved fields.
  const _LoadPathTrackingMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathTrackings = ref.watch(savedPathTrackingsProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => <PathTracking>[],
              loading: () => <PathTracking>[],
            )
        // ..sort((a, b) => b.lastUsed.compareTo(a.lastUsed))
        ;

    if (pathTrackings.isEmpty) {
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load path tracking',
      icon: Icons.history,
      menuChildren: pathTrackings
          .map(
            (pathTracking) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: ListTile(
                onTap: () {
                  ref.read(simInputProvider.notifier).send((abTracking: null));
                  ref
                      .read(simInputProvider.notifier)
                      .send((pathTracking: null));
                  ref
                      .read(showPathTrackingProvider.notifier)
                      .update(value: true);
                  ref
                      .read(configuredPathTrackingProvider.notifier)
                      .update(pathTracking);
                  Logger.instance.i(
                    '''Loaded path tracking: ${pathTracking.name}.''',
                  );
                },
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => Consumer(
                              builder: (context, ref, child) => DeleteDialog(
                                name: pathTracking.name ?? pathTracking.uuid,
                                onDelete: () async => await ref.watch(
                                  deletePathTrackingProvider(
                                    pathTracking,
                                  ).future,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete),
                      )
                    : null,
                title: Text(pathTracking.name ?? 'No name', style: textStyle),
                subtitle: Builder(
                  builder: (context) {
                    final length =
                        pathTracking.cumulativePathSegmentLengths.last;
                    return Text(
                      '${length.toStringAsFixed(1)} m',
                    );
                  },
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

/// A menu for loading a [PathTracking] from saved fields.
class _LoadABTrackingMenu extends ConsumerWidget {
  /// A menu for loading a [PathTracking] from saved fields.
  const _LoadABTrackingMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final abTrackings = ref.watch(savedABTrackingsProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => <ABTracking>[],
              loading: () => <ABTracking>[],
            )
        // ..sort((a, b) => b.lastUsed.compareTo(a.lastUsed))
        ;

    if (abTrackings.isEmpty) {
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load AB tracking',
      icon: Icons.history,
      menuChildren: abTrackings
          .map(
            (abTracking) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: ListTile(
                onTap: () {
                  ref.read(simInputProvider.notifier).send((abTracking: null));
                  ref
                      .read(simInputProvider.notifier)
                      .send((pathTracking: null));
                  ref.read(showABTrackingProvider.notifier).update(value: true);
                  ref
                      .read(configuredABTrackingProvider.notifier)
                      .update(abTracking);
                  ref
                      .read(currentABTrackingTypeProvider.notifier)
                      .update(abTracking.type);
                  if (abTracking is APlusLine) {
                    ref
                      ..read(aBPointAProvider.notifier).update(abTracking.start)
                      ..invalidate(aBPointBProvider)
                      ..read(aPlusLineBearingProvider.notifier)
                          .update(abTracking.initialBearing);
                  } else if (abTracking is ABLine) {
                    ref
                      ..read(aBPointAProvider.notifier).update(abTracking.start)
                      ..read(aBPointBProvider.notifier).update(abTracking.end);
                  } else if (abTracking is ABCurve) {
                    ref
                      ..read(aBPointAProvider.notifier).update(abTracking.start)
                      ..read(aBPointBProvider.notifier).update(abTracking.end);
                    ref
                        .read(aBCurvePointsProvider.notifier)
                        .update(abTracking.baseLine);
                  }
                  Logger.instance.i(
                    'Loaded AB tracking: ${abTracking.name}.',
                  );
                },
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => Consumer(
                              builder: (context, ref, child) => DeleteDialog(
                                name: abTracking.name ?? abTracking.uuid,
                                onDelete: () async => await ref.watch(
                                  deleteABTrackingProvider(
                                    abTracking,
                                  ).future,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete),
                      )
                    : null,
                title: Text(abTracking.name ?? 'No name', style: textStyle),
                subtitle: Text(abTracking.type.name),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ImportMenu extends ConsumerWidget {
  const _ImportMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.file_open,
      text: 'Import',
      menuChildren: [
        MenuItemButton(
          onPressed: () async => await ref.watch(importABTrackingProvider),
          closeOnActivate: false,
          child: Text('AB-tracking', style: textStyle),
        ),
        MenuItemButton(
          onPressed: () async => await ref.watch(importPathTrackingProvider),
          closeOnActivate: false,
          child: Text('Path tracking', style: textStyle),
        ),
      ],
    );
  }
}

class _ExportButton extends ConsumerWidget {
  const _ExportButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    final abTracking = ref.watch(displayABTrackingProvider);
    final pathTracking = ref.watch(displayPathTrackingProvider);

    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.save_alt),
      ),
      onPressed: abTracking != null
          ? () async => await ref.watch(
                exportABTrackingProvider(abTracking).future,
              )
          : pathTracking != null
              ? () async => await ref
                  .watch(exportPathTrackingProvider(pathTracking).future)
              : null,
      child: Text('Export', style: textStyle),
    );
  }
}

class _RenameABTrackingButton extends ConsumerWidget {
  const _RenameABTrackingButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final abTracking = ref.watch(displayABTrackingProvider);
    if (abTracking == null) {
      return const SizedBox.shrink();
    }
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.edit),
      ),
      onPressed: () => showDialog<void>(
        context: context,
        builder: (context) {
          var name = abTracking.name ?? '';
          return StatefulBuilder(
            builder: (context, setState) => SimpleDialog(
              title: const Text('Name the AB tracking'),
              contentPadding: const EdgeInsets.only(
                left: 24,
                top: 12,
                right: 24,
                bottom: 16,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.label_outline),
                      labelText: 'Name',
                    ),
                    initialValue: name,
                    onChanged: (value) => setState(() => name = value),
                    onFieldSubmitted: (value) => setState(() => name = value),
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null &&
                            value.isNotEmpty &&
                            !value.startsWith(' ')
                        ? null
                        : '''No name entered! Please enter a name so that the tracking can be saved!''',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Consumer(
                    builder: (context, ref, child) => FilledButton(
                      onPressed: () {
                        if (abTracking.name != name && name.isNotEmpty) {
                          Timer(const Duration(milliseconds: 100), () {
                            ref
                              ..read(deleteABTrackingProvider(abTracking))
                              ..read(
                                saveABTrackingProvider(
                                  abTracking
                                    ..name = name.isNotEmpty ? name : null,
                                ),
                              );
                          });
                        }
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save tracking'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      child: Text('Rename AB tracking', style: textStyle),
    );
  }
}

class _RenamePathTrackingButton extends ConsumerWidget {
  const _RenamePathTrackingButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathTracking = ref.watch(displayPathTrackingProvider);
    if (pathTracking == null) {
      return const SizedBox.shrink();
    }
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.edit),
      ),
      onPressed: () => showDialog<void>(
        context: context,
        builder: (context) {
          var name = pathTracking.name ?? '';
          return StatefulBuilder(
            builder: (context, setState) => SimpleDialog(
              title: const Text('Name the AB tracking'),
              contentPadding: const EdgeInsets.only(
                left: 24,
                top: 12,
                right: 24,
                bottom: 16,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.label_outline),
                      labelText: 'Name',
                    ),
                    initialValue: name,
                    onChanged: (value) => setState(() => name = value),
                    onFieldSubmitted: (value) => setState(() => name = value),
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null &&
                            value.isNotEmpty &&
                            !value.startsWith(' ')
                        ? null
                        : '''No name entered! Please enter a name so that the tracking can be saved!''',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Consumer(
                    builder: (context, ref, child) => FilledButton(
                      onPressed: () {
                        if (pathTracking.name != name && name.isNotEmpty) {
                          Timer(const Duration(milliseconds: 100), () {
                            ref
                              ..read(deletePathTrackingProvider(pathTracking))
                              ..read(
                                savePathTrackingProvider(
                                  pathTracking
                                    ..name = name.isNotEmpty ? name : null,
                                ),
                              );
                          });
                        }
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save tracking'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      child: Text('Rename path tracking', style: textStyle),
    );
  }
}

class _SaveABTrackingButton extends ConsumerWidget {
  const _SaveABTrackingButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final abTracking = ref.watch(displayABTrackingProvider);
    if (abTracking == null) {
      return const SizedBox.shrink();
    }
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.save),
      ),
      onPressed: () {
        if (abTracking.name != null) {
          ref.watch(
            saveABTrackingProvider(
              abTracking,
              downloadIfWeb: true,
            ),
          );
        } else {
          unawaited(
            showDialog<void>(
              context: context,
              builder: (context) {
                var name = '';
                return StatefulBuilder(
                  builder: (context, setState) => SimpleDialog(
                    title: const Text('Name the AB tracking'),
                    contentPadding: const EdgeInsets.only(
                      left: 24,
                      top: 12,
                      right: 24,
                      bottom: 16,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.label_outline),
                            labelText: 'Name',
                          ),
                          initialValue: name,
                          onChanged: (value) => setState(() => name = value),
                          onFieldSubmitted: (value) =>
                              setState(() => name = value),
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value != null &&
                                  value.isNotEmpty &&
                                  !value.startsWith(' ')
                              ? null
                              : '''No name entered! Please enter a name so that the tracking can be saved!''',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Consumer(
                          builder: (context, ref, child) => FilledButton(
                            onPressed: () {
                              Timer(const Duration(milliseconds: 100), () {
                                ref.read(
                                  saveABTrackingProvider(
                                    abTracking
                                      ..name = name.isNotEmpty ? name : null,
                                  ),
                                );
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text('Save tracking'),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
      child: Text('Save AB tracking', style: textStyle),
    );
  }
}

class _SavePathTrackingButton extends ConsumerWidget {
  const _SavePathTrackingButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathTracking = ref.watch(displayPathTrackingProvider);
    if (pathTracking == null) {
      return const SizedBox.shrink();
    }
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.save),
      ),
      onPressed: () {
        if (pathTracking.name != null) {
          ref.watch(
            savePathTrackingProvider(
              pathTracking,
              downloadIfWeb: true,
            ),
          );
        } else {
          unawaited(
            showDialog<void>(
              context: context,
              builder: (context) {
                var name = '';
                return StatefulBuilder(
                  builder: (context, setState) => SimpleDialog(
                    title: const Text('Name the path tracking'),
                    contentPadding: const EdgeInsets.only(
                      left: 24,
                      top: 12,
                      right: 24,
                      bottom: 16,
                    ),
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.label_outline),
                          labelText: 'Name',
                        ),
                        initialValue: name,
                        onChanged: (value) => setState(() => name = value),
                        onFieldSubmitted: (value) =>
                            setState(() => name = value),
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null &&
                                value.isNotEmpty &&
                                !value.startsWith(' ')
                            ? null
                            : '''No name entered! Please enter a name so that the tracking can be saved!''',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Consumer(
                          builder: (context, ref, child) => FilledButton(
                            onPressed: () {
                              Timer(const Duration(milliseconds: 100), () {
                                ref.read(
                                  savePathTrackingProvider(
                                    pathTracking
                                      ..name = name.isNotEmpty ? name : null,
                                  ),
                                );
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text('Save tracking'),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
      child: Text('Save path tracking', style: textStyle),
    );
  }
}
