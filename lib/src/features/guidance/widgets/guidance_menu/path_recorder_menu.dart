import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for working with the path recording
/// and editing feature.
class PathRecorderMenu extends ConsumerWidget {
  const PathRecorderMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuButtonWithChildren(
      text: 'Path recording',
      icon: Icons.route,
      menuChildren: [
        CheckboxListTile(
          title: Text(
            'Recording',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          secondary: ref.watch(enablePathRecorderProvider)
              ? const Icon(Icons.stop)
              : const Icon(Icons.play_arrow),
          value: ref.watch(enablePathRecorderProvider),
          onChanged: (value) => value != null
              ? ref
                  .read(enablePathRecorderProvider.notifier)
                  .update(value: value)
              : null,
        ),
        CheckboxListTile(
          title: Text(
            'Last recorded path',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          secondary: const Icon(Icons.route),
          value: ref.watch(showFinishedPathProvider),
          onChanged: (value) => value != null
              ? ref.read(showFinishedPathProvider.notifier).update(value: value)
              : null,
        ),
        CheckboxListTile(
          title: Text(
            'Last recorded path as polygon',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          secondary: const SizedBox.square(
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
          value: ref.watch(showFinishedPolygonProvider),
          onChanged: (value) => value != null
              ? ref
                  .read(showFinishedPolygonProvider.notifier)
                  .update(value: value)
              : null,
        ),
        CheckboxListTile(
          title: Text(
            'Edit recorded path',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          secondary: const Icon(Icons.edit),
          value: ref.watch(editFinishedPathProvider),
          onChanged: (value) => value != null
              ? ref.read(editFinishedPathProvider.notifier).update(value: value)
              : null,
        ),
        ListTile(
          title: Text(
            'Clear recorded path',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          leading: const Icon(Icons.clear),
          onTap: ref.read(finishedPathRecordingListProvider.notifier).clear,
        ),
      ],
    );
  }
}
