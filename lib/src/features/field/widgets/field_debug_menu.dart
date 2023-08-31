import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart';

/// A menu with attached submenu for debugging the field feature.
class FieldDebugMenu extends ConsumerWidget {
  /// A menu with attached submenu for debugging the field feature.
  const FieldDebugMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Field',
      iconOverrideWidget: const Stack(
        children: [Icon(Icons.texture), Icon(Icons.square_outlined)],
      ),
      menuChildren: [
        Consumer(
          child: Text(
            'Open field',
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
                      ref.read(testFieldProvider.notifier).update(
                            Field.fromJson(Map<String, dynamic>.from(json)),
                          );
                    }
                  }
                } else {
                  final path = result.paths.first;
                  if (path != null) {
                    final json = jsonDecode(File(path).readAsStringSync());
                    if (json is Map) {
                      ref.read(testFieldProvider.notifier).update(
                            Field.fromJson(Map<String, dynamic>.from(json)),
                          );
                    }
                  }
                }
              }
            },
          ),
        ),
        Consumer(
          child: Text(
            'Show test field',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: child,
            value: ref.watch(showTestFieldProvider),
            onChanged: (value) => value != null
                ? ref.read(showTestFieldProvider.notifier).update(value: value)
                : null,
          ),
        ),
        if (ref.watch(showTestFieldProvider))
          Consumer(
            child: Text(
              'Show bounding box',
              style: textStyle,
            ),
            builder: (context, ref, child) => CheckboxListTile(
              secondary: child,
              value: ref.watch(showTestFieldBoundingBoxProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(showTestFieldBoundingBoxProvider.notifier)
                      .update(value: value)
                  : null,
            ),
          ),
        Consumer(
          child: Text(
            'Show buffered test field',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: child,
            value: ref.watch(showBufferedTestFieldProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showBufferedTestFieldProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        if (ref.watch(showTestFieldProvider)) ...[
          Consumer(
            child: Text(
              'Show buffered bounding box',
              style: textStyle,
            ),
            builder: (context, ref, child) => CheckboxListTile(
              secondary: child,
              value: ref.watch(showBufferedTestFieldBoundingBoxProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(showBufferedTestFieldBoundingBoxProvider.notifier)
                      .update(value: value)
                  : null,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final distance =
                  ref.watch(testFieldExteriorBufferDistanceProvider);

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
                        .read(testFieldExteriorBufferDistanceProvider.notifier)
                        .update,
                    min: -10,
                    max: 10,
                    divisions: 20,
                  ),
                ],
              );
            },
          ),
          if (ref.watch(testFieldProvider)?.polygon.interior.isNotEmpty ??
              false)
            Consumer(
              builder: (context, ref, child) {
                final distance =
                    ref.watch(testFieldInteriorBufferDistanceProvider);

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
                            testFieldInteriorBufferDistanceProvider.notifier,
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
          if (ref.watch(showBufferedTestFieldProvider))
            Consumer(
              builder: (context, ref, child) {
                final activeMode =
                    ref.watch(testFieldExteriorBufferJoinProvider);
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
                                    testFieldExteriorBufferJoinProvider
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
          if (ref.watch(showBufferedTestFieldProvider) &&
              (ref.watch(testFieldProvider)?.polygon.interior.isNotEmpty ??
                  false))
            Consumer(
              builder: (context, ref, child) {
                final activeMode =
                    ref.watch(testFieldInteriorBufferJoinProvider);
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
                                    testFieldInteriorBufferJoinProvider
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
              value: ref.watch(testFieldBufferGetRawPointsProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(testFieldBufferGetRawPointsProvider.notifier)
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
            final field = ref.watch(testFieldProvider);

            return ListTile(
              title: child,
              leading: const Icon(Icons.save),
              onTap: field != null
                  ? () async {
                      if (Device.isWeb) {
                        html.AnchorElement()
                          ..href = '${Uri.dataFromString(
                            const JsonEncoder.withIndent('    ')
                                .convert(field.toJson()),
                            mimeType: 'text/plain',
                            encoding: utf8,
                          )}'
                          ..download = '${field.name}.json'
                          ..style.display = 'none'
                          ..click();
                      } else {
                        final path = [
                          ref.watch(fileDirectoryProvider).requireValue.path,
                          '/fields/test.json',
                        ].join();

                        final file = File(path);
                        if (!file.existsSync()) {
                          await file.create(recursive: true);
                        }
                        await file.writeAsString(
                          const JsonEncoder.withIndent('    ').convert(field),
                        );
                      }
                    }
                  : null,
            );
          },
        ),
        if (ref.watch(showBufferedTestFieldProvider))
          Consumer(
            child: Text(
              'Save buffered field',
              style: textStyle,
            ),
            builder: (context, ref, child) {
              final field = ref.watch(bufferedTestFieldProvider);

              return ListTile(
                title: child,
                leading: const Icon(Icons.save),
                onTap: field != null
                    ? () async {
                        if (Device.isWeb) {
                          html.AnchorElement()
                            ..href = '${Uri.dataFromString(
                              const JsonEncoder.withIndent('    ')
                                  .convert(field.toJson()),
                              mimeType: 'text/plain',
                              encoding: utf8,
                            )}'
                            ..download = '${field.name}.json'
                            ..style.display = 'none'
                            ..click();
                        } else {
                          final path = [
                            ref.watch(fileDirectoryProvider).requireValue.path,
                            '/fields/test_buffered.json',
                          ].join();

                          final file = File(path);
                          if (!file.existsSync()) {
                            await file.create(recursive: true);
                          }
                          await file.writeAsString(
                            const JsonEncoder.withIndent('    ').convert(field),
                          );
                        }
                      }
                    : null,
              );
            },
          ),
      ],
    );
  }
}
