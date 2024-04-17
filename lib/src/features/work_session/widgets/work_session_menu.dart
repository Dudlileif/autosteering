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
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for creating, loading and handling work sessions.
class WorkSessionMenu extends ConsumerWidget {
  /// A menu for  creating, loading and handling work sessions.
  const WorkSessionMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Work session',
      icon: Icons.work,
      menuChildren: [
        if (ref.watch(
          activeWorkSessionProvider.select((value) => value != null),
        )) ...[
          MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            onPressed: () {
              final workSession = ref.watch(activeWorkSessionProvider);
              if (workSession != null) {
                ref.read(
                  saveWorkSessionProvider(workSession),
                );
              }
              Logger.instance.i(
                'Closed work session.',
              );
              ref
                ..invalidate(activeWorkSessionProvider)
                ..read(activeFieldProvider.notifier).update(null)
                ..read(configuredABTrackingProvider.notifier).update(null)
                ..read(allEquipmentsProvider.notifier).clearPaintedArea()
                ..invalidate(aBPointAProvider)
                ..invalidate(aBPointBProvider)
                ..invalidate(aBCurvePointsProvider)
                ..read(configuredPathTrackingProvider.notifier).update(null);
            },
            child: Text('Close', style: textStyle),
          ),
          const _ExportButton(),
        ] else
          const _CreateWorkSessionButton(),
        if (ref.watch(
          activeWorkSessionProvider.select((value) => value == null),
        )) ...[
          const _LoadWorkSessionMenu(),
          const _ImportButton(),
        ],
      ],
    );
  }
}

class _ExportButton extends ConsumerWidget {
  const _ExportButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuItemButton(
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.save_alt),
      ),
      closeOnActivate: false,
      onPressed: ref.watch(
        activeWorkSessionProvider.select(
          (value) =>
              value != null && value.title != null && value.title!.isNotEmpty,
        ),
      )
          ? () => ref.watch(
                exportWorkSessionProvider(
                  ref.watch(activeWorkSessionProvider)!,
                ),
              )
          : null,
      child: Text('Export', style: textStyle),
    );
  }
}

class _ImportButton extends ConsumerWidget {
  const _ImportButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuItemButton(
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.file_open),
      ),
      closeOnActivate: false,
      onPressed: () => ref.read(importWorkSessionProvider),
      child: Text('Import', style: textStyle),
    );
  }
}

class _CreateWorkSessionButton extends StatelessWidget {
  const _CreateWorkSessionButton();

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.add),
      ),
      child: Text(
        'Create new',
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
      onPressed: () => showDialog<void>(
        context: context,
        builder: (context) => const _CreateWorkSessionDialog(),
      ),
    );
  }
}

class _CreateWorkSessionDialog extends ConsumerStatefulWidget {
  const _CreateWorkSessionDialog();
  @override
  ConsumerState<_CreateWorkSessionDialog> createState() =>
      _CreateWorkSessionDialogState();
}

class _CreateWorkSessionDialogState
    extends ConsumerState<_CreateWorkSessionDialog> {
  WorkSession workSession = WorkSession();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SimpleDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 8,
              runSpacing: 8,
              children: [
                Text(
                  'Create work session',
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: CloseButton(),
          ),
        ],
      ),
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                      onChanged: (value) =>
                          setState(() => workSession.title = value),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: DropdownMenu<Field>(
                        leadingIcon: const Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(Icons.texture),
                            Icon(Icons.square_outlined),
                          ],
                        ),
                        hintText: 'Field',
                        onSelected: (value) =>
                            setState(() => workSession.field = value),
                        dropdownMenuEntries:
                            (ref.watch(savedFieldsProvider).when(
                                      data: (data) => data,
                                      error: (error, stackTrace) => <Field>[],
                                      loading: () => <Field>[],
                                    )..sort(
                                    (a, b) => b.lastUsed.compareTo(a.lastUsed),
                                  ))
                                .map(
                                  (field) => DropdownMenuEntry(
                                    value: field,
                                    label: field.name,
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: DropdownMenu<EquipmentSetup>(
                        leadingIcon: const Icon(Icons.handyman),
                        hintText: 'Equipment setup',
                        onSelected: (value) => setState(
                          () => workSession.equipmentSetup = value,
                        ),
                        dropdownMenuEntries:
                            (ref.watch(savedEquipmentSetupsProvider).when(
                                      data: (data) => data,
                                      error: (error, stackTrace) =>
                                          <EquipmentSetup>[],
                                      loading: () => <EquipmentSetup>[],
                                    )..sort(
                                    (a, b) => b.lastUsed.compareTo(a.lastUsed),
                                  ))
                                .map(
                                  (equipmentSetup) => DropdownMenuEntry(
                                    value: equipmentSetup,
                                    label: equipmentSetup.name,
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),
                if (workSession.title != null && workSession.title!.isNotEmpty)
                  FilledButton.icon(
                    onPressed: () {
                      workSession
                        ..start = DateTime.now()
                        ..vehicle = ref.watch(mainVehicleProvider)
                        ..equipmentSetup ??= ref
                            .watch(mainVehicleProvider)
                            .equipmentSetup('${workSession.title} setup');
                      ref
                          .read(activeWorkSessionProvider.notifier)
                          .update(workSession);
                      ref.read(saveWorkSessionProvider(workSession));
                      ref
                          .read(activeFieldProvider.notifier)
                          .update(workSession.field);
                      if (workSession.equipmentSetup != null) {
                        ref.read(simInputProvider.notifier).send(
                          (
                            equipmentSetup: workSession.equipmentSetup!,
                            parentUuid: ref.watch(
                              mainVehicleProvider.select((value) => value.uuid),
                            )
                          ),
                        );
                      }
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Create'),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadWorkSessionMenu extends ConsumerWidget {
  const _LoadWorkSessionMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workSessions = ref.watch(savedWorkSessionsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <WorkSession>[],
          loading: () => <WorkSession>[],
        )..sort(
        (a, b) =>
            (b.start ?? DateTime.now()).compareTo(a.start ?? DateTime.now()),
      );

    if (workSessions.isEmpty) {
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load',
      icon: Icons.history,
      menuChildren: workSessions
          .map(
            (workSession) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: ListTile(
                title: Text(workSession.title ?? 'No title', style: textStyle),
                subtitle: workSession.field != null
                    ? Text(workSession.field!.name)
                    : const SizedBox.shrink(),
                onTap: () {
                  Logger.instance.i(
                    'Loaded work session: ${workSession.title}.',
                  );
                  ref
                    ..read(activeWorkSessionProvider.notifier)
                        .update(workSession)
                    ..read(activeFieldProvider.notifier)
                        .update(workSession.field)
                    ..read(configuredABTrackingProvider.notifier)
                        .update(workSession.abTracking)
                    ..read(configuredPathTrackingProvider.notifier)
                        .update(workSession.pathTracking)
                    ..read(configuredEquipmentSetupProvider.notifier)
                        .update(workSession.equipmentSetup);
                  if (workSession.equipmentSetup != null) {
                    ref.read(simInputProvider.notifier).send(
                      (
                        equipmentSetup: workSession.equipmentSetup,
                        parentUuid: ref.watch(
                          mainVehicleProvider.select((value) => value.uuid),
                        )
                      ),
                    );
                  }
                  if (workSession.abTracking != null) {
                    ref
                        .read(currentABTrackingTypeProvider.notifier)
                        .update(workSession.abTracking!.type);
                  }
                  if (workSession.workedPaths != null) {
                    workSession.workedPaths!.forEach((equipmentUuid, paths) {
                      ref
                          .read(equipmentPathsProvider(equipmentUuid).notifier)
                          .set(paths);
                    });
                  }
                },
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: Text(
                                'Delete ${workSession.title ?? 'No title'}?',
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
                                                deleteWorkSessionProvider(
                                                  workSession,
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
