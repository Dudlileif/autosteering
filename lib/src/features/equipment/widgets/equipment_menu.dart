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
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu with attached submenu for interacting with the equipment feature.
class EquipmentMenu extends StatelessWidget {
  /// A menu with attached submenu for interacting with the equipment feature.
  const EquipmentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Equipment',
      icon: Icons.handyman,
      menuChildren: [
        const _LoadEquipmentSetupMenu(),
        const _LoadEquipmentMenu(),
        const _ImportExportMenu(),
        MenuItemButton(
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.settings),
          ),
          child: Text('Configure', style: textStyle),
          onPressed: () => showDialog<void>(
            context: context,
            builder: (context) => const EquipmentConfigurator(),
          ),
        ),
        const _SaveEquipmentSetup(),
        const _AttachEquipmentMenu(),
        const _AttachEquipmentSetupMenu(),
        const _DetachMenu(),
        Consumer(
          child: Text(
            'Draw equipment',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(showEquipmentDrawingLayerProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showEquipmentDrawingLayerProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text(
            'Debug equipment',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: const Icon(Icons.bug_report),
            title: child,
            value: ref.watch(showEquipmentDebugProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showEquipmentDebugProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text(
            'Clear unused',
            style: textStyle,
          ),
          builder: (context, ref, child) => MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            onPressed: ref.read(allEquipmentsProvider.notifier).clear,
            child: child,
          ),
        ),
        Consumer(
          child: Text(
            'Clear worked area',
            style: textStyle,
          ),
          builder: (context, ref, child) => MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            onPressed: () =>
                ref.read(allEquipmentsProvider.notifier).clearPaintedArea(),
            child: child,
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final fraction = ref.watch(equipmentRecordPositionFractionProvider);
            return ListTile(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Recording position',
                    style: textStyle,
                  ),
                  SegmentedButton<double?>(
                    selected: {fraction},
                    segments: const [
                      ButtonSegment(
                        value: null,
                        label: Text('Default'),
                      ),
                      ButtonSegment(
                        value: 1,
                        label: Text('Front'),
                      ),
                      ButtonSegment(
                        value: 0.5,
                        label: Text('Center'),
                      ),
                      ButtonSegment(
                        value: 0,
                        label: Text('Rear'),
                      ),
                    ],
                    onSelectionChanged: (values) => ref
                        .read(equipmentRecordPositionFractionProvider.notifier)
                        .update(values.first),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SaveEquipmentSetup extends StatelessWidget {
  const _SaveEquipmentSetup();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return Consumer(
      child: Text(
        'Save setup',
        style: textStyle,
      ),
      builder: (context, ref, child) {
        if (ref.watch(
          mainVehicleProvider.select((value) => value.numAttachedChildren > 0),
        )) {
          return MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.save),
            ),
            child: child,
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) {
                var name = '';
                return StatefulBuilder(
                  builder: (context, setState) => SimpleDialog(
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
                              : '''No name entered! Please enter a name so that the setup can be saved!''',
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Consumer(
                          builder: (context, ref, child) => FilledButton(
                            onPressed: () {
                              ref.read(
                                saveEquipmentSetupProvider(
                                  ref.read(
                                    mainVehicleProvider.select(
                                      (value) => value.equipmentSetup(name),
                                    ),
                                  ),
                                  downloadIfWeb: true,
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            child: const Text('Name the setup'),
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
        return const SizedBox.shrink();
      },
    );
  }
}

/// A menu for loading an [Equipment] from saved equipments.
class _LoadEquipmentMenu extends ConsumerWidget {
  /// A menu for loading an [Equipment] from saved equipments.
  const _LoadEquipmentMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipments = ref.watch(savedEquipmentsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <Equipment>[],
          loading: () => <Equipment>[],
        )..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));

    if (equipments.isEmpty) {
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load',
      icon: Icons.history,
      menuChildren: equipments
          .map(
            (equipment) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 300),
              child: ListTile(
                onTap: () {
                  equipment.lastUsed = DateTime.now();

                  ref
                      .read(configuredEquipmentProvider.notifier)
                      .update(equipment);

                  ref
                    ..read(saveEquipmentProvider(equipment))
                    ..invalidate(configuredEquipmentNameTextControllerProvider);
                },
                title: Text(equipment.name ?? equipment.uuid, style: textStyle),
                subtitle: Text(
                  '''${equipment.hitchType.name.capitalize} | ${equipment.width} m${equipment.sections.length > 1 ? ' | ${equipment.sections.length} sections' : ''}''',
                ),
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: Text(
                                'Delete ${equipment.name ?? equipment.uuid}?',
                              ),
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SimpleDialogOption(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    Consumer(
                                      builder: (context, ref, child) =>
                                          SimpleDialogOption(
                                        onPressed: () async {
                                          await ref
                                              .watch(
                                                deleteEquipmentProvider(
                                                  equipment,
                                                ).future,
                                              )
                                              .then(
                                                (value) => Navigator.of(context)
                                                    .pop(true),
                                              );
                                        },
                                        child: const Text('Confirm'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
    );
  }
}

class _ImportExportMenu extends ConsumerWidget {
  const _ImportExportMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.import_export,
      text: 'Import/Export',
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            return MenuItemButton(
              closeOnActivate: false,
              onPressed: () => ref.read(importEquipmentProvider),
              leadingIcon: const Icon(Icons.file_open),
              child: Text('Import', style: textStyle),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return MenuItemButton(
              closeOnActivate: false,
              onPressed: ref.watch(
                configuredEquipmentProvider.select(
                  (value) =>
                      value.name != null && (value.name ?? '').isNotEmpty,
                ),
              )
                  ? () => ref.watch(
                        exportEquipmentProvider(
                          ref.watch(configuredEquipmentProvider),
                        ),
                      )
                  : null,
              leadingIcon: const Icon(Icons.save_alt),
              child: Text('Export', style: textStyle),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return MenuItemButton(
              closeOnActivate: false,
              onPressed: () => ref.read(importEquipmentSetupProvider),
              leadingIcon: const Icon(Icons.file_open),
              child: Text('Import setup', style: textStyle),
            );
          },
        ),
        if (ref.watch(
          configuredEquipmentSetupProvider.select((value) => value != null),
        ))
          Consumer(
            builder: (context, ref, child) {
              return MenuItemButton(
                closeOnActivate: false,
                onPressed: ref.watch(
                  configuredEquipmentSetupProvider.select(
                    (value) => value != null && value.name.isNotEmpty,
                  ),
                )
                    ? () => ref.watch(
                          exportEquipmentSetupProvider(
                            ref.watch(configuredEquipmentSetupProvider)!,
                          ),
                        )
                    : null,
                leadingIcon: const Icon(Icons.save_alt),
                child: Text('Export setup', style: textStyle),
              );
            },
          ),
      ],
    );
  }
}

/// A menu for loading an [EquipmentSetup] from saved equipments.
class _LoadEquipmentSetupMenu extends ConsumerWidget {
  /// A menu for loading an [EquipmentSetup] from saved equipments.
  const _LoadEquipmentSetupMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setups = ref.watch(savedEquipmentSetupsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <EquipmentSetup>[],
          loading: () => <EquipmentSetup>[],
        )..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));

    if (setups.isEmpty) {
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load setup',
      icon: Icons.history,
      menuChildren: setups
          .map(
            (setup) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: ListTile(
                onTap: () {
                  setup.lastUsed = DateTime.now();

                  ref.read(saveEquipmentSetupProvider(setup));
                  ref
                      .read(configuredEquipmentSetupProvider.notifier)
                      .update(setup);
                },
                title: Text(setup.name, style: textStyle),
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: Text(
                                'Delete ${setup.name}?',
                              ),
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SimpleDialogOption(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    Consumer(
                                      builder: (context, ref, child) =>
                                          SimpleDialogOption(
                                        onPressed: () async {
                                          await ref
                                              .watch(
                                                deleteEquipmentSetupProvider(
                                                  setup,
                                                ).future,
                                              )
                                              .then(
                                                (value) => Navigator.of(context)
                                                    .pop(true),
                                              );
                                        },
                                        child: const Text('Confirm'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
    );
  }
}

/// A menu for attaching the [Equipment] in [configuredEquipmentProvider] to
/// the hierarchy.
class _AttachEquipmentMenu extends ConsumerWidget {
  /// A menu for attaching the [Equipment] in [configuredEquipmentProvider] to
  /// the hierarchy.
  const _AttachEquipmentMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasHitches = ref.watch(
      mainVehicleProvider.select((value) => value.hitchPoints.isNotEmpty),
    );

    if (!hasHitches) {
      return const SizedBox.shrink();
    }

    final equipmentName = ref.watch(
      configuredEquipmentProvider.select((value) => value.name ?? 'Unnamed'),
    );

    return MenuButtonWithChildren(
      text: 'Attach\n$equipmentName',
      icon: Icons.commit,
      menuChildren: [
        _RecursiveAttachEquipmentMenu(
          parent: ref.watch(mainVehicleProvider),
          child: ref.watch(configuredEquipmentProvider),
        ),
      ],
    );
  }
}

/// A recursive menu entry for attaching the [Equipment] in
/// [configuredEquipmentProvider] the hierarchy.
class _RecursiveAttachEquipmentMenu extends ConsumerWidget {
  /// A recursive menu entry for attaching the [Equipment] in
  /// [configuredEquipmentProvider] the hierarchy.
  ///
  /// [parent] is which [Hitchable] the [child] should connect to.
  const _RecursiveAttachEquipmentMenu({
    required this.parent,
    required this.child,
  });

  final Hitchable parent;
  final Equipment child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = [
      if (parent.parentHitch != null) parent.parentHitch!.name,
      (parent.name ?? parent.uuid),
    ].join('\n');

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    if (parent.hitchPoints.isEmpty) {
      return MenuItemButton(
        child: Text(text, style: textStyle),
      );
    }

    return MenuButtonWithChildren(
      text: text,
      menuChildren: [
        if (parent.hitchFrontFixedChild != null)
          _RecursiveAttachEquipmentMenu(
            parent: parent.hitchFrontFixedChild!,
            child: child,
          )
        else if (parent.hitchFrontFixedPoint != null)
          MenuItemButton(
            onPressed: child.hitchType == HitchType.fixed
                ? () => ref.read(simInputProvider.notifier).send(
                      (
                        parentUuid: parent.uuid,
                        child: child,
                        position: Hitch.frontFixed
                      ),
                    )
                : null,
            closeOnActivate: false,
            child: Text('Front fixed', style: textStyle),
          ),
        if (parent.hitchRearFixedChild != null)
          _RecursiveAttachEquipmentMenu(
            parent: parent.hitchRearFixedChild!,
            child: child,
          )
        else if (parent.hitchRearFixedPoint != null)
          MenuItemButton(
            onPressed: child.hitchType == HitchType.fixed
                ? () => ref.read(simInputProvider.notifier).send(
                      (
                        parentUuid: parent.uuid,
                        child: child,
                        position: Hitch.rearFixed
                      ),
                    )
                : null,
            closeOnActivate: false,
            child: Text('Rear fixed', style: textStyle),
          ),
        if (parent.hitchRearTowbarChild != null)
          _RecursiveAttachEquipmentMenu(
            parent: parent.hitchRearTowbarChild!,
            child: child,
          )
        else if (parent.hitchRearTowbarPoint != null)
          MenuItemButton(
            onPressed: child.hitchType == HitchType.towbar
                ? () => ref.read(simInputProvider.notifier).send(
                      (
                        parentUuid: parent.uuid,
                        child: child,
                        position: Hitch.rearTowbar
                      ),
                    )
                : null,
            closeOnActivate: false,
            child: Text('Tow bar', style: textStyle),
          ),
      ],
    );
  }
}

/// A menu for attaching the [EquipmentSetup] in
/// [configuredEquipmentSetupProvider] to the hierarchy.
class _AttachEquipmentSetupMenu extends ConsumerWidget {
  /// A menu for attaching the [EquipmentSetup] in
  /// [configuredEquipmentSetupProvider] to the hierarchy.
  const _AttachEquipmentSetupMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasHitches = ref.watch(
      mainVehicleProvider.select((value) => value.hitchPoints.isNotEmpty),
    );

    final setup = ref.watch(configuredEquipmentSetupProvider);

    if (!hasHitches || setup == null) {
      return const SizedBox.shrink();
    }

    return MenuButtonWithChildren(
      text: 'Attach setup\n${setup.name}',
      icon: Icons.commit,
      menuChildren: [
        _RecursiveAttachEquipmentSetupMenu(
          parent: ref.watch(mainVehicleProvider),
          setup: setup,
        ),
      ],
    );
  }
}

/// A recursive menu for attaching the [EquipmentSetup] in
/// [configuredEquipmentSetupProvider] to the hierarchy.
class _RecursiveAttachEquipmentSetupMenu extends ConsumerWidget {
  /// A recursive menu for attaching the [EquipmentSetup] in
  /// [configuredEquipmentSetupProvider] to the hierarchy.
  ///
  /// [parent] is which [Hitchable] the [setup] should apply/attach to.
  const _RecursiveAttachEquipmentSetupMenu({
    required this.parent,
    required this.setup,
  });

  final Hitchable parent;
  final EquipmentSetup setup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = [
      if (parent.parentHitch != null) parent.parentHitch!.name,
      (parent.name ?? parent.uuid),
    ].join('\n');

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    if (parent.hitchPoints.isEmpty) {
      return MenuItemButton(
        child: Text(text, style: textStyle),
      );
    }

    if (parent.hitchPoints.isNotEmpty && parent.hitchChildren.isEmpty) {
      return MenuItemButton(
        closeOnActivate: false,
        onPressed: () {
          ref
              .read(simInputProvider.notifier)
              .send((equipmentSetup: setup, parentUuid: parent.uuid));
        },
        child: Text(text, style: textStyle),
      );
    }

    return MenuButtonWithChildren(
      text: text,
      menuChildren: [
        if (parent.hitchFrontFixedChild != null)
          _RecursiveAttachEquipmentSetupMenu(
            parent: parent.hitchFrontFixedChild!,
            setup: setup,
          ),
        if (parent.hitchRearFixedChild != null)
          _RecursiveAttachEquipmentSetupMenu(
            parent: parent.hitchRearFixedChild!,
            setup: setup,
          ),
        if (parent.hitchRearTowbarChild != null)
          _RecursiveAttachEquipmentSetupMenu(
            parent: parent.hitchRearTowbarChild!,
            setup: setup,
          ),
      ],
    );
  }
}

/// A menu for detaching an [Equipment] from the hierarchy.
class _DetachMenu extends ConsumerWidget {
  /// A menu for detaching an [Equipment] from the hierarchy.

  const _DetachMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasChildren = ref.watch(
      mainVehicleProvider.select((value) => value.hitchChildren.isNotEmpty),
    );

    if (!hasChildren) {
      return const SizedBox.shrink();
    }

    return MenuButtonWithChildren(
      text: 'Detach',
      icon: Icons.commit,
      menuChildren: [
        MenuItemButton(
          closeOnActivate: false,
          onPressed: () => ref.read(simInputProvider.notifier).send(
            (
              detachAllFromUuid:
                  ref.read(mainVehicleProvider.select((value) => value.uuid))
            ),
          ),
          child: Text(
            'Detach all',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
        ),
        _RecursiveDetachMenu(parent: ref.watch(mainVehicleProvider)),
      ],
    );
  }
}

/// A recursive menu entry for detaching an [Equipment] from the hierarchy.
class _RecursiveDetachMenu extends ConsumerWidget {
  /// A recursive menu entry for detaching an [Equipment] from the hierarchy.
  ///
  /// [parent] is which [Hitchable] that should detach the child at the
  /// chosen hitch.
  const _RecursiveDetachMenu({required this.parent});

  final Hitchable parent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = [
      if (parent.parentHitch != null) parent.parentHitch!.name,
      (parent.name ?? parent.uuid),
    ].join('\n');

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    if (parent.hitchChildren.isEmpty && parent is! Vehicle) {
      return MenuItemButton(
        closeOnActivate: false,
        child: Text(text, style: textStyle),
        onPressed: () =>
            ref.read(simInputProvider.notifier).send((detachUuid: parent.uuid)),
      );
    }

    return MenuButtonWithChildren(
      text: text,
      menuChildren: parent.hitchChildren
          .map(
            (child) => _RecursiveDetachMenu(parent: child),
          )
          .toList(),
    );
  }
}
