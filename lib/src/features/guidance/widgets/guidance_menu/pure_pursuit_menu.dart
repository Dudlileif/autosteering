import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for working with the pure pursuit
/// path tracking feature.
class PurePursuitMenu extends ConsumerWidget {
  const PurePursuitMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pursuitMode = ref.watch(pursuitModeProvider);
    final loopMode = ref.watch(purePursuitLoopProvider);

    return MenuButtonWithChildren(
      text: 'Pure pursuit',
      menuChildren: [
        CheckboxListTile(
          secondary: Text(
            'Enable',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
          value: ref.watch(enablePurePursuitProvider),
          onChanged: (value) => value != null
              ? ref
                  .read(enablePurePursuitProvider.notifier)
                  .update(value: value)
              : null,
        ),
        CheckboxListTile(
          secondary: Text(
            'Show',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
          value: ref.watch(debugPurePursuitProvider),
          onChanged: (value) => value != null
              ? ref.read(debugPurePursuitProvider.notifier).update(value: value)
              : null,
        ),
        ListTile(
          title: Text(
            'Loop',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
          trailing: ToggleButtons(
            isSelected: PurePursuitLoopMode.values
                .map((mode) => mode == loopMode)
                .toList(),
            onPressed: (index) => ref
                .read(purePursuitLoopProvider.notifier)
                .update(PurePursuitLoopMode.values[index]),
            children: PurePursuitLoopMode.values
                .map(
                  (mode) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(mode.name.capitalize),
                  ),
                )
                .toList(),
          ),
        ),
        ListTile(
          title: Text(
            'Pursuit mode',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
          trailing: ToggleButtons(
            onPressed: (index) => ref
                .read(pursuitModeProvider.notifier)
                .update(PurePursuitMode.values[index]),
            isSelected: PurePursuitMode.values
                .map((mode) => mode == pursuitMode)
                .toList(),
            children: PurePursuitMode.values
                .map(
                  (mode) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      mode.name.capitalize,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Look ahead distance: ${ref.watch(lookAheadDistanceProvider)} m',
                style: Theme.of(context).menuButtonWithChildrenText,
              ),
              Slider(
                value: ref.watch(lookAheadDistanceProvider),
                onChanged: ref.read(lookAheadDistanceProvider.notifier).update,
                max: 20,
                min: 1,
                divisions: 19,
              )
            ],
          ),
        )
      ],
    );
  }
}
