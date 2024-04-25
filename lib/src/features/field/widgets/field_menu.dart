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
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/theme/theme.dart';
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
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

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
              Consumer(
                builder: (context, ref, child) {
                  var distance = ref.watch(fieldExteriorBufferDistanceProvider);

                  return StatefulBuilder(
                    builder: (context, setState) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '''Exterior buffer distance: ${distance.toStringAsFixed(1)} m''',
                          style: textStyle,
                        ),
                        Slider(
                          value: distance,
                          onChanged: (value) =>
                              setState(() => distance = value),
                          onChangeEnd: ref
                              .read(
                                fieldExteriorBufferDistanceProvider.notifier,
                              )
                              .update,
                          min: -20,
                          max: 20,
                          divisions: 80,
                        ),
                      ],
                    ),
                  );
                },
              ),
              if (ref.watch(activeFieldProvider)?.polygon.interior.isNotEmpty ??
                  false)
                Consumer(
                  builder: (context, ref, child) {
                    var distance =
                        ref.watch(fieldInteriorBufferDistanceProvider);

                    return StatefulBuilder(
                      builder: (context, setState) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '''Interior buffer distance: ${distance.toStringAsFixed(1)} m''',
                            style: textStyle,
                          ),
                          Slider(
                            value: distance,
                            onChanged: (value) =>
                                setState(() => distance = value),
                            onChangeEnd: ref
                                .read(
                                  fieldInteriorBufferDistanceProvider.notifier,
                                )
                                .update,
                            min: -10,
                            max: 10,
                            divisions: 40,
                          ),
                        ],
                      ),
                    );
                  },
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
                      ? () => ref.watch(
                            saveFieldProvider(
                              field.copyWith(
                                name: '${field.name} buffered',
                                lastUsed: DateTime.now(),
                              ),
                              overrideName: '${field.name} buffered',
                              downloadIfWeb: true,
                            ),
                          )
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
                            builder: (context) => SimpleDialog(
                              title: Text(
                                'Delete ${field.name}?',
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
                                                deleteFieldProvider(
                                                  field,
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
