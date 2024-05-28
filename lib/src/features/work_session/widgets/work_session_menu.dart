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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

/// A menu for creating, loading and handling work sessions.
class WorkSessionMenu extends ConsumerWidget {
  /// A menu for  creating, loading and handling work sessions.
  const WorkSessionMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;
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
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => const _CloseDialog(),
            ),
            child: Text('Close', style: textStyle),
          ),
          const _ExportButton(),
          MenuItemButton(
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.edit_note),
            ),
            child: Text('Edit note', style: textStyle),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => const _EditNoteDialog(),
            ),
          ),
          if (ref.watch(
                configuredABTrackingProvider.select((value) => value != null),
              ) ||
              ref.watch(
                configuredPathTrackingProvider.select((value) => value != null),
              ))
            MenuItemButton(
              closeOnActivate: false,
              onPressed: () => ref
                ..invalidate(configuredABTrackingProvider)
                ..invalidate(configuredPathTrackingProvider)
                ..invalidate(pathTrackingPointsProvider),
              leadingIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.clear),
              ),
              child: Text(
                'Close active guidance',
                style: Theme.of(context).menuButtonWithChildrenText,
              ),
            )
          else ...[
            const _ABTrackingMenu(),
            const _PathTrackingMenu(),
          ],
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

class _CloseDialog extends ConsumerWidget {
  const _CloseDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final workSession = ref.watch(activeWorkSessionProvider);
    if (workSession != null) {
      return SimpleDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Close ${workSession.title}'),
            const CloseButton(),
          ],
        ),
        contentPadding:
            const EdgeInsets.only(left: 24, top: 12, right: 24, bottom: 16),
        children: [
          Center(
            child: Wrap(
              runSpacing: 8,
              spacing: 24,
              children: [
                Column(
                  children: [
                    Text(
                      'Start',
                      style: theme.textTheme.titleLarge,
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      direction: Axis.vertical,
                      children: [
                        SelectableText(
                          workSession.start != null
                              ? '''${DateFormat(DateFormat.YEAR_MONTH_DAY).format(workSession.start!)} ${DateFormat(DateFormat.HOUR24_MINUTE).format(workSession.start!)}'''
                              : '-',
                          style: theme.menuButtonWithChildrenText,
                        ),
                    
                        ElevatedButton.icon(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              firstDate: workSession.start ??
                                  DateTime.now().subtract(
                                    const Duration(days: 7),
                                  ),
                              lastDate: DateTime.now(),
                            ).then(
                              (time) => time != null
                                  ? ref
                                      .read(
                                        activeWorkSessionProvider.notifier,
                                      )
                                      .updateStartTime(time)
                                  : null,
                            );
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: const Text('Set date'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            final date = workSession.start ?? DateTime.now();
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then(
                              (time) => time != null
                                  ? ref
                                      .read(
                                        activeWorkSessionProvider.notifier,
                                      )
                                      .updateStartTime(
                                        DateTime(
                                          date.year,
                                          date.month,
                                          date.day,
                                          time.hour,
                                          time.minute,
                                        ),
                                      )
                                  : null,
                            );
                          },
                          icon: const Icon(Icons.schedule),
                          label: const Text('Set time of day'),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'End',
                      style: theme.textTheme.titleLarge,
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      direction: Axis.vertical,
                      children: [
                        SelectableText(
                          workSession.end != null
                              ? '''${DateFormat(DateFormat.YEAR_MONTH_DAY).format(workSession.end!)} ${DateFormat(DateFormat.HOUR24_MINUTE).format(workSession.end!)}'''
                              : '-',
                          style: theme.menuButtonWithChildrenText,
                        ),
                    
                        ElevatedButton.icon(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              firstDate: workSession.start ??
                                  DateTime.now().subtract(
                                    const Duration(days: 7),
                                  ),
                              lastDate: DateTime.now(),
                            ).then(
                              (time) => time != null
                                  ? ref
                                      .read(
                                        activeWorkSessionProvider.notifier,
                                      )
                                      .updateEndTime(time)
                                  : null,
                            );
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: const Text('Set date'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            final date = workSession.end ?? DateTime.now();
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then(
                              (time) => time != null
                                  ? ref
                                      .read(
                                        activeWorkSessionProvider.notifier,
                                      )
                                      .updateEndTime(
                                        DateTime(
                                          date.year,
                                          date.month,
                                          date.day,
                                          time.hour,
                                          time.minute,
                                        ),
                                      )
                                  : null,
                            );
                          },
                          icon: const Icon(Icons.schedule),
                          label: const Text('Set time of day'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
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
                    onPressed: Navigator.of(context).pop,
                    icon: const Icon(Icons.clear),
                    label: const Text('Cancel'),
                  ),
                  FilledButton.icon(
                    onPressed: () {
                      ref.read(
                        saveWorkSessionProvider(workSession),
                      );
                      Logger.instance.i(
                        'Closed work session.',
                      );
                      ref
                        ..invalidate(activeWorkSessionProvider)
                        ..read(activeFieldProvider.notifier).update(null)
                        ..read(
                          configuredABTrackingProvider.notifier,
                        ).update(null)
                        ..read(allEquipmentsProvider.notifier)
                            .clearPaintedArea()
                        ..invalidate(aBPointAProvider)
                        ..invalidate(aBPointBProvider)
                        ..invalidate(aBCurvePointsProvider)
                        ..read(
                          configuredPathTrackingProvider.notifier,
                        ).update(null);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Confirm'),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    Navigator.of(context).maybePop();
    return const SizedBox.shrink();
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
      contentPadding:
          const EdgeInsets.only(left: 24, top: 12, right: 24, bottom: 16),
      children: [
        SingleChildScrollView(
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
                  padding: const EdgeInsets.only(top: 16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 200),
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
                      dropdownMenuEntries: (ref.watch(savedFieldsProvider).when(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 200),
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
                ),
              ],
            ),
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
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),
                FilledButton.icon(
                  onPressed: (workSession.title != null &&
                          workSession.title!.isNotEmpty)
                      ? () {
                      workSession
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
                        }
                      : null,
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
                subtitle: Builder(
                  builder: (context) {
                    var text = '';
                    if (workSession.field?.name != null) {
                      text += workSession.field!.name;
                      if (workSession.start != null) {
                        text += ' - ';
                      }
                    }
                    if (workSession.start != null) {
                      text +=
                          workSession.start!.toIso8601String().split('T').first;
                    }
                    return text.isNotEmpty
                        ? Text(text)
                        : const SizedBox.shrink();
                  },
                ),
                onTap: () {
                  Logger.instance.i(
                    'Loaded work session: ${workSession.title}.',
                  );
                  ref
                    ..read(activeWorkSessionProvider.notifier)
                        .update(workSession)
                    ..read(activeFieldProvider.notifier)
                        .update(workSession.field)
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
                            builder: (context) => Consumer(
                              builder: (context, ref, child) => DeleteDialog(
                                name: workSession.title ?? 'Session',
                                onDelete: () async => await ref.watch(
                                  deleteWorkSessionProvider(
                                    workSession,
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

class _ABTrackingMenu extends ConsumerWidget {
  const _ABTrackingMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final trackings = ref.watch(activeWorkSessionProvider)?.abTracking;
    if (trackings != null && trackings.isNotEmpty) {
      return MenuButtonWithChildren(
        text: 'AB Trackings',
        iconOverrideWidget: SizedBox.square(
          dimension: 24,
          child: SvgPicture.asset(
            'assets/icons/ab_line.svg',
            colorFilter: ColorFilter.mode(
              theme.iconTheme.color ?? Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        menuChildren: trackings
            .map(
              (tracking) => ListTile(
                onTap: () {
                  ref
                    ..read(configuredABTrackingProvider.notifier)
                        .update(tracking)
                    ..read(currentABTrackingTypeProvider.notifier)
                        .update(tracking.type);
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => showDialog<void>(
                        context: context,
                        builder: (context) => _RenameABTrackingDialog(tracking),
                      ),
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () => showDialog<bool>(
                        context: context,
                        builder: (context) => Consumer(
                          builder: (context, ref, child) => ConfirmationDialog(
                            title: 'Remove ${tracking.name ?? tracking.uuid}?',
                            onConfirmation: () async => ref
                                .read(
                                  activeWorkSessionProvider.notifier,
                                )
                                .removeABTracking(tracking.uuid),
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
                title: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 200),
                  child: Text(
                    tracking.name ?? tracking.uuid,
                    style: theme.menuButtonWithChildrenText,
                  ),
                ),
                subtitle: Builder(
                  builder: (context) {
                    var text = '${tracking.type.name} - ';
                    if (tracking.type != ABTrackingType.abCurve) {
                      text += '${tracking.initialBearing.toStringAsFixed(0)}° ';
                    }
                    text += '| ${tracking.width} m |';
                    text += ' ${tracking.lines.length} swaths';

                    return Text(text);
                  },
                ),
              ),
            )
            .toList(),
      );
    }
    return const SizedBox.shrink();
  }
}

class _RenameABTrackingDialog extends StatelessWidget {
  const _RenameABTrackingDialog(this.tracking);
  final ABTracking tracking;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
      text: tracking.name,
    );
    return SimpleDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('Rename AB Tracking'), CloseButton()],
      ),
      contentPadding:
          const EdgeInsets.only(left: 24, top: 12, right: 24, bottom: 16),

      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
          controller: controller,
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
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),
                ListenableBuilder(
                  listenable: controller,
                  builder: (context, child) => Consumer(
                    builder: (context, ref, child) => FilledButton.icon(
                      onPressed: controller.text.isNotEmpty
                          ? () {
                              ref
                                  .read(
                                    activeWorkSessionProvider.notifier,
                                  )
                                  .updateABTracking(
                                    tracking..name = controller.text,
                                  );
                              Navigator.of(context).pop();
                            }
                          : null,
                      icon: const Icon(Icons.check),
                      label: const Text('Rename'),
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

class _PathTrackingMenu extends ConsumerWidget {
  const _PathTrackingMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final trackings = ref
        .watch(
          activeWorkSessionProvider,
        )
        ?.pathTracking;
    if (trackings != null && trackings.isNotEmpty) {
      return MenuButtonWithChildren(
        text: 'Path Trackings',
        icon: Icons.route,
        menuChildren: trackings
            .map(
              (tracking) => ListTile(
                onTap: () => ref
                    .read(configuredPathTrackingProvider.notifier)
                    .update(tracking),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => showDialog<void>(
                        context: context,
                        builder: (context) =>
                            _RenamePathTrackingDialog(tracking),
                      ),
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () => showDialog<bool>(
                        context: context,
                        builder: (context) => Consumer(
                          builder: (context, ref, child) => ConfirmationDialog(
                            title: 'Remove ${tracking.name ?? tracking.uuid}?',
                            onConfirmation: () async => ref
                                .read(
                                  activeWorkSessionProvider.notifier,
                                )
                                .removePathTracking(tracking.uuid),
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
                title: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 200),
                  child: Text(
                    tracking.name ?? tracking.uuid,
                    style: theme.menuButtonWithChildrenText,
                  ),
                ),
                subtitle: Builder(
                  builder: (context) {
                    final length = tracking.cumulativePathSegmentLengths.last;
                    return Text(
                      '${length.toStringAsFixed(1)} m',
                    );
                  },
                ),
              ),
            )
            .toList(),
      );
    }
    return const SizedBox.shrink();
  }
}

class _RenamePathTrackingDialog extends StatelessWidget {
  const _RenamePathTrackingDialog(this.tracking);
  final PathTracking tracking;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
      text: tracking.name,
    );
    return SimpleDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Rename Path Tracking'),
          CloseButton(),
        ],
      ),
      contentPadding:
          const EdgeInsets.only(left: 24, top: 12, right: 24, bottom: 16),
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
          controller: controller,
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
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),
                ListenableBuilder(
                  listenable: controller,
                  builder: (context, child) => Consumer(
                    builder: (context, ref, child) => FilledButton.icon(
                      onPressed: controller.text.isNotEmpty
                          ? () {
                              ref
                                  .read(
                                    activeWorkSessionProvider.notifier,
                                  )
                                  .updatePathTracking(
                                    tracking..name = controller.text,
                                  );
                              Navigator.of(context).pop();
                            }
                          : null,
                      icon: const Icon(Icons.check),
                      label: const Text('Rename'),
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

class _EditNoteDialog extends ConsumerWidget {
  const _EditNoteDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController(
      text: ref.read(activeWorkSessionProvider.select((value) => value?.note)),
    );
    return SimpleDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Edit note'),
          CloseButton(),
        ],
      ),
      contentPadding:
          const EdgeInsets.only(left: 24, top: 12, right: 24, bottom: 16),

      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Note',
          ),
          controller: controller,
          maxLines: null,
          minLines: 5,
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
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),
                ListenableBuilder(
                  listenable: controller,
                  builder: (context, child) => Consumer(
                    builder: (context, ref, child) => FilledButton.icon(
                      onPressed: () {
                        ref
                            .read(
                              activeWorkSessionProvider.notifier,
                            )
                            .updateNote(
                              controller.text.isNotEmpty
                                  ? controller.text
                                  : null,
                            );
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Confirm'),
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
