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
import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:quiver/strings.dart';
import 'package:universal_io/io.dart';

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
      icon: Icons.work_outline,
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
          Consumer(
            child: Text('Rename', style: textStyle),
            builder: (context, ref, child) => MenuItemButton(
              closeOnActivate: false,
              leadingIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.edit),
              ),
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => const _RenameDialog(),
              ),
              child: child,
            ),
          ),
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
          ExportAllMenuButton(
            onPressed: () =>
                ref.read(exportAllProvider(directory: 'work_sessions')),
          ),
          const _ImportButton(),
        ],
      ],
    );
  }
}

class _RenameDialog extends ConsumerStatefulWidget {
  const _RenameDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __RenameDialogState();
}

class __RenameDialogState extends ConsumerState<_RenameDialog> {
  late final session = ref.watch(activeWorkSessionProvider);
  late String? name = session?.name;

  @override
  Widget build(BuildContext context) {
    final otherSessionNames = ref.watch(
      savedWorkSessionsProvider.select(
        (value) => value.when(
          data: (data) =>
              data.where((e) => e.uuid != session?.uuid).map((e) => e.name),
          error: (error, stackTrace) => <String?>[],
          loading: () => <String?>[],
        ),
      ),
    );
    return SimpleDialog(
      title: const Text('Name the work session'),
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
            onChanged: (value) => setState(() => name = value.trim()),
            onFieldSubmitted: (value) => setState(() => name = value.trim()),
            keyboardType: TextInputType.text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => isBlank(value?.trim())
                ? '''No name entered! Please enter a name so that the session can be saved!'''
                : otherSessionNames.any((element) => element == value?.trim())
                    ? 'Name already in use'
                    : null,
          ),
        ),
        if (session != null)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Consumer(
              builder: (context, ref, child) => FilledButton(
                onPressed: name != null && name!.isNotEmpty
                    ? () {
                        if (session!.name != name && name!.isNotEmpty) {
                          Timer(const Duration(milliseconds: 100), () {
                            ref
                              ..read(
                                deleteWorkSessionProvider(session!),
                              )
                              ..read(
                                saveWorkSessionProvider(session!..name = name),
                              );
                          });
                        }
                        Navigator.of(context).pop();
                      }
                    : null,
                child: const Text('Rename and save'),
              ),
            ),
          ),
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
            Text('Close ${workSession.name}'),
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
                    onPressed: () async {
                      ref
                          .read(activeWorkSessionProvider.notifier)
                          .addAllDeactivationEquipmentLogRecords();
                      await ref.read(
                        saveWorkSessionProvider(workSession).future,
                      );
                      await ref.read(
                        saveWorkSessionEquipmentLogsProvider(
                          workSession,
                          overwrite: false,
                        ).future,
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
                        ).update(null)
                        ..invalidate(
                          savedFilesInSubDirectoriesProvider(
                            fromJson: WorkSession.fromJson,
                            folder: 'work_sessions',
                          ),
                        );
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
              value != null && value.name != null && value.name!.isNotEmpty,
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

  final fieldController = TextEditingController();
  final equipmentSetupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final workSessions = ref.watch(savedWorkSessionsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <WorkSession>[],
          loading: () => <WorkSession>[],
        )..sort(
        (a, b) =>
            (b.start ?? DateTime.now()).compareTo(a.start ?? DateTime.now()),
      );

    final fields = ref.watch(savedFieldsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <Field>[],
          loading: () => <Field>[],
        )..sort(
        (a, b) => b.lastUsed.compareTo(a.lastUsed),
      );

    final equipmentSetups = ref.watch(savedEquipmentSetupsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <EquipmentSetup>[],
          loading: () => <EquipmentSetup>[],
        )..sort(
        (a, b) => b.lastUsed.compareTo(a.lastUsed),
      );

    final theme = Theme.of(context);

    final name = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextFormField(
        decoration: const InputDecoration(
          label: Text('Name'),
          prefixIcon: Icon(Icons.label_outline),
        ),
        initialValue: workSession.name,
        onChanged: (value) => setState(() => workSession.name = value.trim()),
        keyboardType: TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => isBlank(value?.trim())
            ? 'Enter a name for the session'
            : workSessions.any((e) => e.name == value?.trim())
                ? 'Name already in use'
                : null,
      ),
    );

    final field = DropdownMenu<Field>(
      controller: fieldController,
      width: 300,
      leadingIcon: const Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.texture),
          Icon(Icons.square_outlined),
        ],
      ),
      hintText: 'Field',
      onSelected: (value) => setState(() => workSession.field = value),
      initialSelection: fields.firstWhereOrNull(
        (element) => element.uuid == workSession.field?.uuid,
      ),
      dropdownMenuEntries: fields
          .map(
            (field) => DropdownMenuEntry(
              value: field,
              label: field.name,
            ),
          )
          .toList(),
    );

    final equipment = DropdownMenu<EquipmentSetup>(
      controller: equipmentSetupController,
      width: 300,
      leadingIcon: const Icon(Icons.handyman),
      hintText: 'Equipment setup',
      onSelected: (value) => setState(
        () => workSession.equipmentSetup = value,
      ),
      initialSelection: equipmentSetups.firstWhereOrNull(
        (element) => element.name == workSession.equipmentSetup?.name,
      ),
      dropdownMenuEntries: equipmentSetups
          .map(
            (equipmentSetup) => DropdownMenuEntry(
              value: equipmentSetup,
              label: equipmentSetup.name,
            ),
          )
          .toList(),
    );

    final fromSession = DropdownMenu<WorkSession>(
      enabled: workSessions.isNotEmpty,
      leadingIcon: const Icon(Icons.work_outline),
      helperText: 'Copy field, equipment and guidance from this.',
      hintText: 'Copy from work session',
      width: 300,
      dropdownMenuEntries: workSessions
          .map(
            (session) => DropdownMenuEntry(
              label: session.name ?? 'No name',
              value: session,
            ),
          )
          .toList(),
      onSelected: (session) {
        if (session != null) {
          if (session.field == null) {
            fieldController.clear();
          }
          if (session.equipmentSetup == null) {
            equipmentSetupController.clear();
          }
          setState(() {
            workSession
              ..field = session.field
              ..equipmentSetup = session.equipmentSetup
              ..abTracking = session.abTracking
              ..pathTracking = session.pathTracking;
          });
        }
      },
    );

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
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: name,
              ),
              if (workSessions.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: fromSession,
                ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: field,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: equipment,
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
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),
                FilledButton.icon(
                  onPressed: (workSession.name != null &&
                          workSession.name!.isNotEmpty &&
                          workSessions.none((e) => e.name == workSession.name))
                      ? () {
                          workSession
                            ..vehicle = ref.watch(mainVehicleProvider)
                            ..equipmentSetup ??=
                                ref.watch(mainVehicleProvider).equipmentSetup(
                                      '${workSession.name} setup',
                                    );
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
                                  mainVehicleProvider
                                      .select((value) => value.uuid),
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
                title: Text(workSession.name ?? 'No name', style: textStyle),
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
                    'Loaded work session: ${workSession.name}.',
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
                  if (workSession.equipmentLogs.isNotEmpty) {
                    for (final equipment in workSession
                        .equipmentSetup!.allAttached
                        .cast<Equipment>()) {
                      final records = workSession.equipmentLogs[equipment.uuid];
                      if (records != null) {
                        final overrideHitch = workSession.equipmentSetup
                            ?.findHitchOfChild(equipment);

                        ref
                            .read(
                              equipmentPathsProvider(equipment.uuid).notifier,
                            )
                            .updateFromLogRecords(
                              records: records,
                              equipment: equipment,
                              overrideHitch: overrideHitch,
                            );
                      }
                    }
                  }
                  if (Device.isNative) {
                    for (final equipment in workSession
                        .equipmentSetup!.allAttached
                        .cast<Equipment>()) {
                      final fileName = path.join(
                        ref.read(fileDirectoryProvider).requireValue.path,
                        'work_sessions',
                        workSession.name ?? workSession.uuid,
                        'equipment_logs',
                        '${equipment.uuid}.log',
                      );
                      final file = File(fileName);

                      if (file.existsSync()) {
                        Logger.instance
                            .i('Loading equipment logs from file: $fileName.');
                        final records = const LineSplitter()
                            .convert(
                              file.readAsStringSync(),
                            )
                            .map(
                              (line) => EquipmentLogRecord.fromJson(
                                Map<String, dynamic>.from(
                                  jsonDecode(line) as Map,
                                ),
                              ),
                            )
                            .toList();
                        if (records.isNotEmpty) {
                          workSession.equipmentLogs.update(
                            equipment.uuid,
                            (oldRecords) => oldRecords.isEmpty
                                ? [...records]
                                : [
                                    ...oldRecords,
                                    ...records.where(
                                      (record) => oldRecords.last.time
                                          .isBefore(record.time),
                                    ),
                                  ],
                            ifAbsent: () => records,
                          );
                        }

                        Logger.instance.i(
                          '''Loaded ${records.length} log records from: $fileName.''',
                        );

                        final overrideHitch = workSession.equipmentSetup
                            ?.findHitchOfChild(equipment);

                        ref
                            .read(
                              equipmentPathsProvider(equipment.uuid).notifier,
                            )
                            .updateFromLogRecords(
                              records: records,
                              equipment: equipment,
                              overrideHitch: overrideHitch,
                            );
                      } else {
                        if (workSession.equipmentLogs
                            .containsKey(equipment.uuid)) {
                          file
                            ..createSync(recursive: true)
                            ..writeAsStringSync(
                              [
                                workSession.equipmentLogs[equipment.uuid]!
                                    .map((e) => jsonEncode(e.toJson()))
                                    .join(Platform.lineTerminator),
                                Platform.lineTerminator,
                              ].join(),
                            );
                        }
                      }
                    }
                  }
                },
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => Consumer(
                              builder: (context, ref, child) => DeleteDialog(
                                name: workSession.name ?? 'Session',
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
                  if (tracking is APlusLine) {
                    ref
                      ..read(aBPointAProvider.notifier).update(tracking.start)
                      ..invalidate(aBPointBProvider)
                      ..read(aPlusLineBearingProvider.notifier)
                          .update(tracking.initialBearing);
                  } else if (tracking is ABLine) {
                    ref
                      ..read(aBPointAProvider.notifier).update(tracking.start)
                      ..read(aBPointBProvider.notifier).update(tracking.end);
                  } else if (tracking is ABCurve) {
                    ref
                      ..read(aBPointAProvider.notifier).update(tracking.start)
                      ..read(aBPointBProvider.notifier).update(tracking.end);
                    ref
                        .read(aBCurvePointsProvider.notifier)
                        .update(tracking.baseLine);
                  }
                  Logger.instance.i(
                    'Loaded AB tracking from work session: ${tracking.name}.',
                  );
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
                onTap: () {
                  ref
                      .read(configuredPathTrackingProvider.notifier)
                      .update(tracking);
                  Logger.instance.i(
                    '''Loaded path tracking from work session: ${tracking.name}.''',
                  );
                },
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
