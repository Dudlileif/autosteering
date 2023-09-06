import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        const _LoadFieldMenu(),
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
                initialDirectory: Device.isWeb
                    ? null
                    : [
                        ref.watch(fileDirectoryProvider).requireValue.path,
                        '/fields',
                      ].join(),
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
              'Show buffered  field',
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
                final distance = ref.watch(fieldExteriorBufferDistanceProvider);

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '''Exterior buffer distance: ${distance.toStringAsFixed(1)} m''',
                      style: textStyle,
                    ),
                    Slider(
                      value: distance,
                      onChanged: ref
                          .read(fieldExteriorBufferDistanceProvider.notifier)
                          .update,
                      min: -10,
                      max: 10,
                      divisions: 20,
                    ),
                  ],
                );
              },
            ),
            if (ref.watch(activeFieldProvider)?.polygon.interior.isNotEmpty ??
                false)
              Consumer(
                builder: (context, ref, child) {
                  final distance =
                      ref.watch(fieldInteriorBufferDistanceProvider);

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '''Interior buffer distance: ${distance.toStringAsFixed(1)} m''',
                        style: textStyle,
                      ),
                      Slider(
                        value: distance,
                        onChanged: ref
                            .read(
                              fieldInteriorBufferDistanceProvider.notifier,
                            )
                            .update,
                        min: -10,
                        max: 10,
                        divisions: 40,
                      ),
                    ],
                  );
                },
              ),
            if (ref.watch(showBufferedFieldProvider))
              Consumer(
                builder: (context, ref, child) {
                  final activeMode = ref.watch(fieldExteriorBufferJoinProvider);
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
                                      fieldExteriorBufferJoinProvider.notifier,
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
                (ref.watch(activeFieldProvider)?.polygon.interior.isNotEmpty ??
                    false))
              Consumer(
                builder: (context, ref, child) {
                  final activeMode = ref.watch(fieldInteriorBufferJoinProvider);
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
                                      fieldInteriorBufferJoinProvider.notifier,
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
