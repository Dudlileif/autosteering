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
                )
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
        Consumer(
          child: Text(
            'Make test field of recorded path',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            title: child,
            leading: const Icon(Icons.waves),
            onTap: () {
              final points = ref.watch(finishedPathRecordingListProvider);
              if (points != null) {
                ref.read(testFieldProvider.notifier).update(
                      Field(
                        name: 'Test',
                        polygon: Polygon([
                          PositionArray.view(
                            points.map((e) => e.position.values).flattened,
                          )
                        ]),
                        boundingBox: GeoBox.from(points.map((e) => e.position)),
                      ),
                    );
              }
            },
          ),
        ),
        Consumer(
          child: Text(
            'Clear recorded path',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            title: child,
            leading: const Icon(Icons.clear),
            onTap: ref.read(finishedPathRecordingListProvider.notifier).clear,
          ),
        ),
      ],
    );
  }
}
