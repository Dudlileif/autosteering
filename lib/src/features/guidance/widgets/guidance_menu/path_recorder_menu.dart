import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for working with the path recording
/// and editing feature.
class PathRecorderMenu extends ConsumerWidget {
  /// A menu button with attached submenu for working with the path recording
  /// and editing feature.
  const PathRecorderMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Path recording',
      icon: Icons.voicemail,
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            final enabled = ref.watch(enablePathRecorderProvider);
            return MenuItemButton(
              closeOnActivate: false,

              leadingIcon: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: enabled
                    ? const SizedBox.square(
                        dimension: 24,
                        child: CircularProgressIndicator(),
                      )
                    : const Icon(Icons.play_arrow),
              ),
              onPressed: () {
                ref
                    .read(enablePathRecorderProvider.notifier)
                    .update(value: !enabled);
                if (enabled) {
                  ref
                      .read(showFinishedPathProvider.notifier)
                      .update(value: true);
                }
              },
              child: Text(
                enabled ? 'Recording, tap to finish' : 'Record',
                style: textStyle,
              ),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final distance = ref.watch(pathRecordingMaxDistanceProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Straight max distance: ${distance.toStringAsFixed(1)} m',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: distance,
                  onChanged: ref
                      .read(pathRecordingMaxDistanceProvider.notifier)
                      .update,
                  min: 1,
                  max: 100,
                  divisions: 99,
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final distance = ref.watch(pathRecordingTurnMinDistanceProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Turn min distance: ${distance.toStringAsFixed(1)} m',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: distance,
                  onChanged: ref
                      .read(pathRecordingTurnMinDistanceProvider.notifier)
                      .update,
                  min: 0.1,
                  max: 2,
                  divisions: 19,
                ),
              ],
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final angle = ref.watch(pathRecordingTriggerAngleProvider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Turn trigger angle: ${angle.toStringAsFixed(1)}°',
                  style: textStyle,
                ),
                Slider.adaptive(
                  value: angle,
                  onChanged: ref
                      .read(pathRecordingTriggerAngleProvider.notifier)
                      .update,
                  min: 0.1,
                  max: 2,
                  divisions: 19,
                ),
              ],
            );
          },
        ),
        if (ref.watch(
          finishedPathRecordingListProvider
              .select((value) => value?.isNotEmpty ?? false),
        )) ...[
          Consumer(
            child: Text(
              'Show last recorded path',
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
            builder: (context, ref, child) => MenuItemButton(
              leadingIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.clear),
              ),
              onPressed:
                  ref.read(finishedPathRecordingListProvider.notifier).clear,
              child: Text(
                'Clear recorded path',
                style: textStyle,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
