import 'dart:convert';
import 'dart:io';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu with attached submenu for debugging the field feature.
class FieldDebugMenu extends ConsumerWidget {
  const FieldDebugMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Field',
      icon: Icons.waves,
      menuChildren: [
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
        if (ref.watch(showBufferedTestFieldProvider)) ...[
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
              final distance = ref.watch(testFieldBufferDistanceProvider);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Buffer distance: ${distance.toStringAsFixed(1)} m'),
                  Slider(
                    value: distance,
                    onChanged: ref
                        .read(testFieldBufferDistanceProvider.notifier)
                        .update,
                    min: -10,
                    max: 10,
                  )
                ],
              );
            },
          ),
          if (ref.watch(testFieldProvider)?.holes != null)
            Consumer(
              builder: (context, ref, child) {
                final distance = ref.watch(testFieldHoleBufferDistanceProvider);

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hole buffer distance: ${distance.toStringAsFixed(1)} m ',
                    ),
                    Slider(
                      value: distance,
                      onChanged: ref
                          .read(testFieldHoleBufferDistanceProvider.notifier)
                          .update,
                      min: -10,
                      max: 10,
                    )
                  ],
                );
              },
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
                      final path = [
                        ref.watch(fileDirectoryProvider).requireValue.path,
                        '/fields/test.json'
                      ].join();

                      final file = File(path);
                      if (!file.existsSync()) {
                        await file.create(recursive: true);
                      }
                      await file.writeAsString(
                        const JsonEncoder.withIndent('    ').convert(field),
                      );
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
                        final path = [
                          ref.watch(fileDirectoryProvider).requireValue.path,
                          '/fields/test_buffered.json'
                        ].join();

                        final file = File(path);
                        if (!file.existsSync()) {
                          await file.create(recursive: true);
                        }
                        await file.writeAsString(
                          const JsonEncoder.withIndent('    ').convert(field),
                        );
                      }
                    : null,
              );
            },
          )
      ],
    );
  }
}
