import 'dart:async';
import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';
import 'package:universal_io/io.dart';

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
        if (activeField != null)
          MenuItemButton(
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.clear),
            ),
            onPressed: () => ref.invalidate(activeFieldProvider),
            child: const Text('Close'),
          ),
        if (activeField == null) ...[
          const _LoadFieldMenu(),
          const _CreateFieldButton(),
          Consumer(
            child: Text(
              'Import field',
              style: textStyle,
            ),
            builder: (context, ref, child) => ListTile(
              leading: const Icon(Icons.file_open),
              title: child,
              onTap: () async {
                final result = await FilePicker.platform.pickFiles(
                  initialDirectory: Device.isNative
                      ? [
                          ref.watch(fileDirectoryProvider).requireValue.path,
                          '/fields',
                        ].join()
                      : null,
                  dialogTitle: 'Open field json file',
                  allowedExtensions: ['json'],
                  type: FileType.custom,
                );
                if (result != null) {
                  if (Device.isWeb) {
                    final data = result.files.first.bytes;
                    if (data != null) {
                      final json = jsonDecode(String.fromCharCodes(data));
                      if (json is Map) {
                        ref.read(activeFieldProvider.notifier).update(
                              Field.fromJson(Map<String, dynamic>.from(json)),
                            );
                      }
                    }
                  } else {
                    final path = result.paths.first;
                    if (path != null) {
                      final json = jsonDecode(File(path).readAsStringSync());
                      if (json is Map) {
                        ref.read(activeFieldProvider.notifier).update(
                              Field.fromJson(Map<String, dynamic>.from(json)),
                            );
                      }
                    }
                  }
                }
              },
            ),
          ),
        ],
        if (activeField != null) ...[
          Consumer(
            child: Text(
              'Show field',
              style: textStyle,
            ),
            builder: (context, ref, child) => CheckboxListTile(
              secondary: child,
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
                secondary: child,
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
                secondary: child,
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
                secondary: child,
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
                  secondary: child,
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
                          min: -10,
                          max: 10,
                          divisions: 20,
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
          Consumer(
            child: Text(
              'Save field',
              style: textStyle,
            ),
            builder: (context, ref, child) {
              final field = ref.watch(activeFieldProvider);

              return ListTile(
                title: child,
                leading: const Icon(Icons.save),
                onTap: field != null
                    ? () => ref.watch(
                          saveFieldProvider(field..lastUsed = DateTime.now()),
                        )
                    : null,
              );
            },
          ),
          if (ref.watch(showBufferedFieldProvider))
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

                return ListTile(
                  title: child,
                  leading: const Icon(Icons.save),
                  onTap: field != null
                      ? () => ref.watch(
                            saveFieldProvider(
                              field.copyWith(
                                name: '${field.name} buffered',
                                lastUsed: DateTime.now(),
                              ),
                              overrideName: '${field.name} buffered',
                            ),
                          )
                      : null,
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
  /// A menu for loading an [Field] from saved fields.
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

    return MenuButtonWithChildren(
      text: 'Load',
      icon: Icons.history,
      menuChildren: fields
          .map(
            (field) => MenuItemButton(
              child: Text(field.name),
              onPressed: () {
                field.lastUsed = DateTime.now();

                ref.read(activeFieldProvider.notifier).update(field);

                ref.read(saveFieldProvider(field));
              },
            ),
          )
          .toList(),
    );
  }
}

/// A [MenuItemButton] for creating a [Field] from the recorded path.
class _CreateFieldButton extends ConsumerWidget {
  /// A [MenuItemButton] for creating a [Field] from the recorded path.
  const _CreateFieldButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recording = ref.watch(enablePathRecorderProvider);

    if (recording) {
      return MenuItemButton(
        leadingIcon: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator(),
          ),
        ),
        onPressed: () {
          ref.read(enablePathRecorderProvider.notifier).update(value: false);

          unawaited(
            showDialog<void>(
              context: context,
              builder: (context) {
                var name = '';
                return StatefulBuilder(
                  builder: (context, setState) {
                    return SimpleDialog(
                      title: const Text('Name the field'),
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
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 8,
                          ),
                          child: Consumer(
                            child: const Text('Save field'),
                            builder: (context, ref, child) => FilledButton(
                              onPressed: () {
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  final points = ref
                                      .read(finishedPathRecordingListProvider)!;

                                  final field = Field(
                                    name: name,
                                    polygon: Polygon([
                                      PositionSeries.view(
                                        points
                                            .map(
                                              (e) => e.position.values,
                                            )
                                            .flattened
                                            .toList(),
                                      ),
                                    ]),
                                    boundingBox: GeoBox.from(
                                      points.map((e) => e.position),
                                    ),
                                  );
                                  ref.read(saveFieldProvider(field));
                                  ref
                                      .read(activeFieldProvider.notifier)
                                      .update(field);
                                });
                                Navigator.of(context).pop();
                              },
                              child: child,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
        child: const Text('Recording, tap to finish'),
      );
    }

    return MenuItemButton(
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Stack(
          children: [Icon(Icons.texture), Icon(Icons.square_outlined)],
        ),
      ),
      child: Text(
        'Create field from recording',
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
      onPressed: () {
        ref.read(enablePathRecorderProvider.notifier).update(value: true);
      },
    );
  }
}
