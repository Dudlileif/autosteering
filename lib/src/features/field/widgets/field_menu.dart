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

import 'package:async/async.dart';
import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:collection/collection.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';

/// A menu with attached submenu for interacting with the field feature.
class FieldMenu extends ConsumerWidget {
  /// A menu with attached submenu for interacting with the field feature.
  const FieldMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;

    final activeField = ref.watch(activeFieldProvider);

    return MenuButtonWithChildren(
      text: 'Field',
      iconOverrideWidget: const Stack(
        children: [Icon(Icons.texture), Icon(Icons.square_outlined)],
      ),
      menuChildren: [
        if (activeField != null) ...[
          MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            onPressed: () => ref.invalidate(activeFieldProvider),
            child: Text('Close', style: textStyle),
          ),
          Consumer(
            child: Text(
              'Save field',
              style: textStyle,
            ),
            builder: (context, ref, child) {
              final field = ref.watch(activeFieldProvider);

              return MenuItemButton(
                leadingIcon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.save),
                ),
                closeOnActivate: false,
                onPressed: field != null
                    ? () => ref.watch(
                          saveFieldProvider(
                            field..lastUsed = DateTime.now(),
                            downloadIfWeb: true,
                          ),
                        )
                    : null,
                child: child,
              );
            },
          ),
          const _ExportButton(),
        ],
        if (activeField == null) ...[
          const _LoadFieldMenu(),
          const _ImportButton(),
          const _CreateFieldButton(),
        ],
        if (activeField != null) ...[
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
                builder: (context) {
                  final field = ref.watch(activeFieldProvider);
                  var name = field?.name ?? '';
                  return StatefulBuilder(
                    builder: (context, setState) => SimpleDialog(
                      title: const Text('Name the field'),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) => value != null &&
                                    value.isNotEmpty &&
                                    !value.startsWith(' ')
                                ? null
                                : '''No name entered! Please enter a name so that the field can be saved!''',
                          ),
                        ),
                        if (field != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Consumer(
                              builder: (context, ref, child) => FilledButton(
                                onPressed: () {
                                  if (field.name != name && name.isNotEmpty) {
                                    Timer(const Duration(milliseconds: 100),
                                        () {
                                      ref
                                        ..read(deleteFieldProvider(field))
                                        ..read(
                                          saveFieldProvider(
                                            field.copyWith(
                                              name:
                                                  name.isNotEmpty ? name : null,
                                            ),
                                          ),
                                        );
                                    });
                                  }
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Save field'),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              child: child,
            ),
          ),
          Consumer(
            child: Text(
              'Show field',
              style: textStyle,
            ),
            builder: (context, ref, child) => CheckboxListTile(
              secondary: switch (ref.watch(showFieldProvider)) {
                true => const Icon(Icons.visibility),
                false => const Icon(Icons.visibility_off),
              },
              title: child,
              value: ref.watch(showFieldProvider),
              onChanged: (value) => value != null
                  ? ref.read(showFieldProvider.notifier).update(value: value)
                  : null,
            ),
          ),
          if (ref.watch(showFieldProvider) ||
              ref.watch(showBufferedFieldProvider))
            Consumer(
              child: Text(
                'Show border points',
                style: textStyle,
              ),
              builder: (context, ref, child) => CheckboxListTile(
                secondary: switch (ref.watch(showFieldBorderPointsProvider)) {
                  true => const Icon(Icons.visibility),
                  false => const Icon(Icons.visibility_off),
                },
                title: child,
                value: ref.watch(showFieldBorderPointsProvider),
                onChanged: (value) => value != null
                    ? ref
                        .read(showFieldBorderPointsProvider.notifier)
                        .update(value: value)
                    : null,
              ),
            ),
          if (ref.watch(showFieldProvider))
            Consumer(
              child: Text(
                'Show bounding box',
                style: textStyle,
              ),
              builder: (context, ref, child) => CheckboxListTile(
                secondary: switch (ref.watch(showFieldBoundingBoxProvider)) {
                  true => const Icon(Icons.visibility),
                  false => const Icon(Icons.visibility_off),
                },
                title: child,
                value: ref.watch(showFieldBoundingBoxProvider),
                onChanged: (value) => value != null
                    ? ref
                        .read(showFieldBoundingBoxProvider.notifier)
                        .update(value: value)
                    : null,
              ),
            ),
          Consumer(
            child: Text(
              'Enable field buffer',
              style: textStyle,
            ),
            builder: (context, ref, child) => CheckboxListTile(
              secondary: child,
              value: ref.watch(fieldBufferEnabledProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(fieldBufferEnabledProvider.notifier)
                      .update(value: value)
                  : null,
            ),
          ),
          if (ref.watch(fieldBufferEnabledProvider)) ...[
            Consumer(
              child: Text(
                'Show buffered field',
                style: textStyle,
              ),
              builder: (context, ref, child) => CheckboxListTile(
                secondary: switch (ref.watch(showBufferedFieldProvider)) {
                  true => const Icon(Icons.visibility),
                  false => const Icon(Icons.visibility_off),
                },
                title: child,
                value: ref.watch(showBufferedFieldProvider),
                onChanged: (value) => value != null
                    ? ref
                        .read(showBufferedFieldProvider.notifier)
                        .update(value: value)
                    : null,
              ),
            ),
            if (ref.watch(showFieldProvider)) ...[
              Consumer(
                child: Text(
                  'Show buffered bounding box',
                  style: textStyle,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  secondary: switch (
                      ref.watch(showBufferedFieldBoundingBoxProvider)) {
                    true => const Icon(Icons.visibility),
                    false => const Icon(Icons.visibility_off),
                  },
                  title: child,
                  value: ref.watch(showBufferedFieldBoundingBoxProvider),
                  onChanged: (value) => value != null
                      ? ref
                          .read(showBufferedFieldBoundingBoxProvider.notifier)
                          .update(value: value)
                      : null,
                ),
              ),
              MenuItemButton(
                leadingIcon: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.straighten),
                ),
                closeOnActivate: false,
                onPressed: () => showDialog<void>(
                  context: context,
                  builder: (context) => const _BufferDistancesDialog(),
                ),
                child: Text('Buffer distances', style: textStyle),
              ),
              if (ref.watch(showBufferedFieldProvider))
                Consumer(
                  builder: (context, ref, child) {
                    final activeMode =
                        ref.watch(fieldExteriorBufferJoinProvider);
                    return MenuButtonWithChildren(
                      text: 'Exterior buffer join mode',
                      icon: Icons.rounded_corner,
                      menuChildren: BufferJoin.values
                          .map(
                            (mode) => CheckboxListTile(
                              secondary:
                                  Text(mode.name.capitalize, style: textStyle),
                              value: mode == activeMode,
                              onChanged: (value) => value != null && value
                                  ? ref
                                      .read(
                                        fieldExteriorBufferJoinProvider
                                            .notifier,
                                      )
                                      .update(mode)
                                  : null,
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              if (ref.watch(showBufferedFieldProvider) &&
                  (ref
                          .watch(activeFieldProvider)
                          ?.polygon
                          .interior
                          .isNotEmpty ??
                      false))
                Consumer(
                  builder: (context, ref, child) {
                    final activeMode =
                        ref.watch(fieldInteriorBufferJoinProvider);
                    return MenuButtonWithChildren(
                      text: 'Interior buffer join mode',
                      icon: Icons.rounded_corner,
                      menuChildren: BufferJoin.values
                          .map(
                            (mode) => CheckboxListTile(
                              secondary:
                                  Text(mode.name.capitalize, style: textStyle),
                              value: mode == activeMode,
                              onChanged: (value) => value != null && value
                                  ? ref
                                      .read(
                                        fieldInteriorBufferJoinProvider
                                            .notifier,
                                      )
                                      .update(mode)
                                  : null,
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              Consumer(
                child: Text(
                  'Raw buffer points',
                  style: textStyle,
                ),
                builder: (context, ref, child) => CheckboxListTile(
                  secondary: child,
                  value: ref.watch(fieldBufferGetRawPointsProvider),
                  onChanged: (value) => value != null
                      ? ref
                          .read(fieldBufferGetRawPointsProvider.notifier)
                          .update(value: value)
                      : null,
                ),
              ),
            ],
          ],
          if (ref.watch(fieldBufferEnabledProvider))
            Consumer(
              child: Text(
                'Save buffered field',
                style: textStyle,
              ),
              builder: (context, ref, child) {
                final field = ref.watch(bufferedFieldProvider).when(
                      data: (data) => data,
                      error: (error, stackTrace) => null,
                      loading: () => null,
                    );

                return MenuItemButton(
                  leadingIcon: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.save),
                  ),
                  closeOnActivate: false,
                  onPressed: field != null
                      ? () {
                          showDialog<void>(
                            context: context,
                            builder: (context) {
                              var name = '';
                              return StatefulBuilder(
                                builder: (context, setState) => SimpleDialog(
                                  title: const Text('Name the bufferd field'),
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
                                        onChanged: (value) =>
                                            setState(() => name = value),
                                        onFieldSubmitted: (value) =>
                                            setState(() => name = value),
                                        keyboardType: TextInputType.text,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) => value != null &&
                                                value.isNotEmpty &&
                                                !value.startsWith(' ')
                                            ? null
                                            : '''No name entered! Please enter a name so that the field can be saved!''',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Consumer(
                                        builder: (context, ref, child) =>
                                            FilledButton(
                                          onPressed: () {
                                            Timer(
                                                const Duration(
                                                  milliseconds: 100,
                                                ), () {
                                              ref.read(
                                                saveFieldProvider(
                                                  field.copyWith(
                                                    name: name.isNotEmpty
                                                        ? name
                                                        : null,
                                                  ),
                                                  downloadIfWeb: true,
                                                ),
                                              );
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child:
                                              const Text('Save bufferd field'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      : null,
                  child: child,
                );
              },
            ),
          if (ref.watch(fieldBufferEnabledProvider))
            Consumer(
              child: Text(
                'Create path tracking from buffered field exterior',
                style: textStyle,
              ),
              builder: (context, ref, child) {
                final wayPoints = ref.watch(bufferedFieldProvider).when(
                      data: (data) {
                        final points = <WayPoint>[];
                        final positions =
                            data?.polygon.exterior?.toGeographicPositions;
                        if (positions != null && positions.length >= 2) {
                          for (var i = 0; i < positions.length; i++) {
                            final point = positions.elementAt(i);
                            final nextPoint =
                                positions.elementAt((i + 1) % positions.length);
                            points.add(
                              WayPoint(
                                position: point,
                                bearing:
                                    point.rhumb.initialBearingTo(nextPoint),
                              ),
                            );
                          }
                          return points;
                        }

                        return null;
                      },
                      error: (error, stackTrace) => null,
                      loading: () => null,
                    );

                return MenuItemButton(
                  leadingIcon: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.route),
                  ),
                  closeOnActivate: false,
                  onPressed: wayPoints != null
                      ? () {
                          ref
                              .read(pathTrackingPointsProvider.notifier)
                              .update(wayPoints);
                        }
                      : null,
                  child: child,
                );
              },
            ),
        ],
      ],
    );
  }
}

/// A menu for loading a [Field] from saved fields.
class _LoadFieldMenu extends ConsumerWidget {
  /// A menu for loading a [Field] from saved fields.
  const _LoadFieldMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fields = ref.watch(savedFieldsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <Field>[],
          loading: () => <Field>[],
        )..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));

    if (fields.isEmpty) {
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load',
      icon: Icons.history,
      menuChildren: fields
          .map(
            (field) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: ListTile(
                onTap: () {
                  field.lastUsed = DateTime.now();

                  ref.read(activeFieldProvider.notifier).update(field);

                  ref.read(saveFieldProvider(field));
                },
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => Consumer(
                              builder: (context, ref, child) => DeleteDialog(
                                name: field.name,
                                onDelete: () async => await ref.watch(
                                  deleteFieldProvider(
                                    field,
                                  ).future,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete),
                      )
                    : null,
                title: Text(field.name, style: textStyle),
                subtitle: Text(
                  '''${(field.areaWithoutHoles / 1e4).toStringAsFixed(2)} ha''',
                ),
              ),
            ),
          )
          .toList(),
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
      onPressed: () => ref.read(importFieldProvider),
      child: Text('Import', style: textStyle),
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
        activeFieldProvider.select(
          (value) => value != null && value.name.isNotEmpty,
        ),
      )
          ? () => ref.watch(
                exportFieldProvider(
                  ref.watch(activeFieldProvider)!,
                ),
              )
          : null,
      child: Text('Export', style: textStyle),
    );
  }
}

/// A [MenuItemButton] for creating a [Field] from the recorded path.
class _CreateFieldButton extends ConsumerWidget {
  /// A [MenuItemButton] for creating a [Field] from the recorded path.
  const _CreateFieldButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuItemButton(
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.voicemail),
      ),
      closeOnActivate: false,
      onPressed: () {
        ref.read(enablePathRecorderProvider.notifier).update(value: true);
        ref
            .read(activePathRecordingTargetProvider.notifier)
            .update(PathRecordingTarget.field);
        ref.read(showPathRecordingMenuProvider.notifier).update(value: true);
      },
      child: Text(
        'Create field from recording',
        style: textStyle,
      ),
    );
  }
}

class _BufferDistancesDialog extends ConsumerWidget {
  const _BufferDistancesDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final distanceType = ref.watch(activeFieldBufferDistanceTypeProvider);
    final field = ref.watch(activeFieldProvider);

    return SimpleDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Buffer distances'),
          CloseButton(),
        ],
      ),
      contentPadding: const EdgeInsets.only(
        left: 24,
        top: 12,
        right: 24,
        bottom: 16,
      ),
      children: [
        SegmentedButton<FieldBufferDistanceType>(
          style: theme.segmentedButtonTheme.style?.copyWith(
            visualDensity: VisualDensity.compact,
          ),
          selected: {distanceType},
          onSelectionChanged: (values) => ref
              .read(
                activeFieldBufferDistanceTypeProvider.notifier,
              )
              .update(values.first),
          segments: FieldBufferDistanceType.values
              .map(
                (type) => ButtonSegment(
                  value: type,
                  icon: Icon(type.icon),
                  label: Text(type.tooltip),
                  tooltip: type.tooltip,
                ),
              )
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Consumer(
            builder: (context, ref, child) {
              final equipmentWidth = ref.read(
                allEquipmentsProvider.select(
                  (value) => value.values
                      .firstWhereOrNull((element) => element.width > 0)
                      ?.width,
                ),
              );
              final controller = TextEditingController(
                text: equipmentWidth != null &&
                        distanceType == FieldBufferDistanceType.equipmentWidths
                    ? (ref.read(fieldExteriorBufferDistanceProvider) /
                            equipmentWidth)
                        .toStringAsFixed(2)
                    : ref.read(fieldExteriorBufferDistanceProvider).toString(),
              );
              final startProcess =
                  RestartableTimer(const Duration(seconds: 1), () {
                final value = double.tryParse(controller.text);
                {
                  if (value != null) {
                    if (distanceType ==
                            FieldBufferDistanceType.equipmentWidths &&
                        equipmentWidth != null) {
                      ref
                          .read(
                            fieldExteriorBufferDistanceProvider.notifier,
                          )
                          .update(value * equipmentWidth);
                    } else {
                      ref
                          .read(
                            fieldExteriorBufferDistanceProvider.notifier,
                          )
                          .update(value);
                    }
                  }
                }
              })
                    ..cancel();
              controller.addListener(startProcess.reset);

              return TextFormField(
                decoration: InputDecoration(
                  labelText: 'Border buffer distance',
                  suffix: ListenableBuilder(
                    listenable: controller,
                    builder: (context, child) => Text(
                      equipmentWidth != null &&
                              distanceType ==
                                  FieldBufferDistanceType.equipmentWidths
                          ? '''x $equipmentWidth m = ${((double.tryParse(controller.text) ?? 0) * equipmentWidth).toStringAsFixed(2)} m'''
                          : 'm',
                    ),
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                controller: controller,
              );
            },
          ),
        ),
        if (field?.polygon.interior.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Consumer(
              builder: (context, ref, child) {
                final equipmentWidth = ref.read(
                  allEquipmentsProvider.select(
                    (value) => value.values
                        .firstWhereOrNull((element) => element.width > 0)
                        ?.width,
                  ),
                );
                final controller = TextEditingController(
                  text: equipmentWidth != null &&
                          distanceType ==
                              FieldBufferDistanceType.equipmentWidths
                      ? (ref.read(fieldInteriorBufferDistanceProvider) /
                              equipmentWidth)
                          .toStringAsFixed(2)
                      : ref
                          .read(fieldInteriorBufferDistanceProvider)
                          .toString(),
                );
                final startProcess =
                    RestartableTimer(const Duration(seconds: 1), () {
                  final value = double.tryParse(controller.text);
                  {
                    if (value != null) {
                      if (distanceType ==
                              FieldBufferDistanceType.equipmentWidths &&
                          equipmentWidth != null) {
                        ref
                            .read(
                              fieldInteriorBufferDistanceProvider.notifier,
                            )
                            .update(value * equipmentWidth);
                      } else {
                        ref
                            .read(
                              fieldInteriorBufferDistanceProvider.notifier,
                            )
                            .update(value);
                      }
                    }
                  }
                })
                      ..cancel();
                controller.addListener(startProcess.reset);

                return TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Interior border (holes) buffer distance',
                    suffix: ListenableBuilder(
                      listenable: controller,
                      builder: (context, child) => Text(
                        equipmentWidth != null &&
                                distanceType ==
                                    FieldBufferDistanceType.equipmentWidths
                            ? '''x $equipmentWidth m = ${((double.tryParse(controller.text) ?? 0) * equipmentWidth).toStringAsFixed(2)} m'''
                            : 'm',
                      ),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  controller: controller,
                );
              },
            ),
          ),
      ],
    );
  }
}
