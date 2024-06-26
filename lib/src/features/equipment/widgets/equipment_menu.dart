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
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiver/strings.dart';

/// A menu with attached submenu for interacting with the equipment feature.
class EquipmentMenu extends ConsumerWidget {
  /// A menu with attached submenu for interacting with the equipment feature.
  const EquipmentMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Equipment',
      icon: Icons.handyman,
      menuChildren: [
        const _LoadEquipmentSetupMenu(),
        const _LoadEquipmentMenu(),
        const _ImportExportMenu(),
        MenuItemButton(
          closeOnActivate: false,
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
        if (ref.watch(enableDebugModeProvider))
          const _EqiupmentDebugMenu()
        else
          const _EquipmentTrajectoryButton(),
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
                    style: theme.segmentedButtonTheme.style?.copyWith(
                      visualDensity: VisualDensity.compact,
                    ),
                    showSelectedIcon: false,
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
                    title: const Text('Save equipment setup'),
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
                        validator: (value) => isBlank(value)
                            ? '''No name entered! Please enter a name so that the setup can be saved!'''
                            : null,
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
                                onPressed: Navigator.of(context).pop,
                                icon: const Icon(Icons.clear),
                                label: const Text('Cancel'),
                              ),
                              Consumer(
                                builder: (context, ref, child) =>
                                    FilledButton.icon(
                                  onPressed: name.isNotEmpty
                                      ? () {
                                          ref.read(
                                            saveEquipmentSetupProvider(
                                              ref.read(
                                                mainVehicleProvider.select(
                                                  (value) => value
                                                      .equipmentSetup(name),
                                                ),
                                              ),
                                              downloadIfWeb: true,
                                            ),
                                          );
                                          Navigator.of(context).pop();
                                        }
                                      : null,
                                  icon: const Icon(Icons.check),
                                  label: const Text('Save'),
                                ),
                              ),
                            ],
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
                    ..read(loadedEquipmentProvider.notifier).update(equipment)
                    ..read(saveEquipmentProvider(equipment));
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
                            builder: (context) => Consumer(
                              builder: (context, ref, child) => DeleteDialog(
                                name: equipment.name ?? equipment.uuid,
                                onDelete: () async => await ref.watch(
                                  deleteEquipmentProvider(
                                    equipment,
                                  ).future,
                                ),
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
              leadingIcon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.file_open),
              ),
              child: Text('Import', style: textStyle),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return MenuItemButton(
              closeOnActivate: false,
              onPressed: ref.watch(
                loadedEquipmentProvider.select(
                  (value) =>
                      value?.name != null && (value?.name ?? '').isNotEmpty,
                ),
              )
                  ? () => ref.watch(
                        exportEquipmentProvider(
                          ref.watch(loadedEquipmentProvider)!,
                        ),
                      )
                  : null,
              leadingIcon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.save_alt),
              ),
              child: Text('Export', style: textStyle),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return MenuItemButton(
              closeOnActivate: false,
              onPressed: () => ref.read(importEquipmentSetupProvider),
              leadingIcon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.file_open),
              ),
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
                leadingIcon: const Padding(
                    padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.save_alt),
                ),
                child: Text('Export setup', style: textStyle),
              );
            },
          ),
        Consumer(
          builder: (context, ref, child) => ExportAllMenuButton(
            onPressed: () =>
                ref.read(exportAllProvider(directory: 'equipment')),
          ),
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
                            builder: (context) => Consumer(
                              builder: (context, ref, child) => DeleteDialog(
                                name: setup.name,
                                onDelete: () async => await ref.watch(
                                  deleteEquipmentSetupProvider(
                                    setup,
                                  ).future,
                                ),
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
      loadedEquipmentProvider.select((value) => value?.name),
    );

    return equipmentName?.isNotEmpty ?? false
        ? MenuButtonWithChildren(
            text: 'Attach\n$equipmentName',
            icon: Icons.commit,
            menuChildren: [
              _RecursiveAttachEquipmentMenu(
                parent: ref.watch(mainVehicleProvider),
                child: ref.watch(loadedEquipmentProvider)!,
              ),
            ],
          )
        : const SizedBox.shrink();
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
        if (parent.hitchFrontFixedChild != null &&
            child.hitchType == HitchType.fixed)
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
        else if (parent.hitchRearFixedPoint != null &&
            child.hitchType == HitchType.fixed)
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
        else if (parent.hitchRearTowbarPoint != null &&
            child.hitchType == HitchType.towbar)
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

class _EquipmentTrajectoryButton extends StatelessWidget {
  const _EquipmentTrajectoryButton();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Trajectory',
      icon: Icons.straight,
      menuChildren: [
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 320),
          child: Consumer(
            child: Text(
              'Trajectory',
              style: textStyle,
            ),
            builder: (context, ref, child) => CheckboxListTile(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  child ?? const SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Time'),
                      Slider.adaptive(
                        value: ref.watch(
                          debugEquipmentTrajectorySecondsProvider,
                        ),
                        onChanged: ref
                            .read(
                              debugEquipmentTrajectorySecondsProvider.notifier,
                            )
                            .update,
                        min: 1,
                        max: 20,
                        divisions: 19,
                        label:
                            '''${ref.watch(debugEquipmentTrajectorySecondsProvider).round()} s''',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Min'),
                      Slider.adaptive(
                        value: ref.watch(
                          debugEquipmentTrajectoryMinLengthProvider,
                        ),
                        onChanged: ref
                            .read(
                              debugEquipmentTrajectoryMinLengthProvider
                                  .notifier,
                            )
                            .update,
                        max: 20,
                        divisions: 20,
                        label:
                            '''${ref.watch(debugEquipmentTrajectoryMinLengthProvider).round()} m''',
                      ),
                    ],
                  ),
                ],
              ),
              value: ref.watch(debugEquipmentTrajectoryProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(debugEquipmentTrajectoryProvider.notifier)
                      .update(value: value)
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

class _EqiupmentDebugMenu extends StatelessWidget {
  const _EqiupmentDebugMenu();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Debug',
      icon: Icons.bug_report,
      menuChildren: [
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
            'Sections',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(debugEquipmentSectionsProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugEquipmentSectionsProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text(
            'Turning',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(debugEquipmentTurningProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugEquipmentTurningProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text(
            'Hitches',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(debugEquipmentHitchesProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugEquipmentHitchesProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        const _EquipmentTrajectoryButton(),
        Consumer(
          child: Text(
            'Travelled path',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child ?? const SizedBox.shrink(),
                Slider.adaptive(
                  value: ref
                      .watch(debugEquipmentTravelledPathSizeProvider)
                      .toDouble(),
                  onChanged: (value) => ref
                      .read(
                        debugEquipmentTravelledPathSizeProvider.notifier,
                      )
                      .update(value.toInt()),
                  min: 1,
                  max: 1000,
                  divisions: 10,
                ),
              ],
            ),
            value: ref.watch(debugEquipmentTravelledPathProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugEquipmentTravelledPathProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
      ],
    );
  }
}
