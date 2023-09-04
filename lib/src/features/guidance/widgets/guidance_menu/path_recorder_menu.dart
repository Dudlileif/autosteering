import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';

/// A menu button with attached submenu for working with the path recording
/// and editing feature.
class PathRecorderMenu extends StatelessWidget {
  /// A menu button with attached submenu for working with the path recording
  /// and editing feature.
  const PathRecorderMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Path recording',
      icon: Icons.route,
      menuChildren: [
        Consumer(
          child: Text(
            'Recording',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            final enabled = ref.watch(enablePathRecorderProvider);
            return CheckboxListTile(
              title: child,
              secondary: enabled
                  ? const Icon(Icons.stop)
                  : const Icon(Icons.play_arrow),
              value: enabled,
              onChanged: (value) => value != null
                  ? ref
                      .read(enablePathRecorderProvider.notifier)
                      .update(value: value)
                  : null,
            );
          },
        ),
        Consumer(
          child: Text(
            'Last recorded path',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            secondary: const Icon(Icons.route),
            value: ref.watch(showFinishedPathProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showFinishedPathProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: const SizedBox.square(
            dimension: 24,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.circle,
                    size: 8,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.circle,
                    size: 8,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.circle,
                    size: 8,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    Icons.circle,
                    size: 8,
                  ),
                ),
                Icon(
                  Icons.crop_square,
                ),
              ],
            ),
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: Text(
              'Last recorded path as polygon',
              style: textStyle,
            ),
            secondary: child,
            value: ref.watch(showFinishedPolygonProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showFinishedPolygonProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text(
            'Edit recorded path',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            secondary: const Icon(Icons.edit),
            value: ref.watch(editFinishedPathProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(editFinishedPathProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        const _CreateField(),
        Consumer(
          builder: (context, ref, child) => MenuItemButton(
            leadingIcon: const Icon(Icons.clear),
            onPressed:
                ref.read(finishedPathRecordingListProvider.notifier).clear,
            child: const Text('Clear recorded path'),
          ),
        ),
      ],
    );
  }
}

/// A [MenuItemButton] for creating a [Field] from the recorded path.
class _CreateField extends ConsumerWidget {
  /// A [MenuItemButton] for creating a [Field] from the recorded path.
  const _CreateField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuItemButton(
      leadingIcon: const Stack(
        children: [Icon(Icons.texture), Icon(Icons.square_outlined)],
      ),
      onPressed: () async {
        final points = ref.watch(finishedPathRecordingListProvider);
        if (points != null) {
          await showDialog<void>(
            context: context,
            builder: (context) {
              var name = '';
              return StatefulBuilder(
                builder: (context, setState) {
                  return SimpleDialog(
                    title: const Text('Name the field'),
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
                        validator: (value) => value != null &&
                                value.isNotEmpty &&
                                !value.startsWith(' ')
                            ? null
                            : '''No name entered! Please enter a name so that the field can be saved!''',
                      ),
                      Consumer(
                        child: const Text('Save field'),
                        builder: (context, ref, child) => FilledButton(
                          onPressed: () {
                            ref.read(activeFieldProvider.notifier).update(
                                  Field(
                                    name: name,
                                    polygon: Polygon([
                                      PositionArray.view(
                                        points
                                            .map(
                                              (e) => e.position.values,
                                            )
                                            .flattened,
                                      ),
                                    ]),
                                    boundingBox: GeoBox.from(
                                      points.map((e) => e.position),
                                    ),
                                  ),
                                );
                            Navigator.of(context).pop();
                          },
                          child: child,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        }
      },
      child: const Text('Create field from recorded path'),
    );
  }
}
