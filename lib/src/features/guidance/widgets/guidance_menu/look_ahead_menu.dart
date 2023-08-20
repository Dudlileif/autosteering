import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for controlling the settings related to the look ahead distance.
class LookAheadMenu extends StatelessWidget {
  /// A menu for controlling the settings related to the look ahead distance.
  const LookAheadMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Look Ahead',
      menuChildren: [
        ListTile(
          title: Consumer(
            builder: (context, ref, child) {
              final lookAheadDistance = ref.watch(lookAheadDistanceProvider);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Look ahead distance: $lookAheadDistance m',
                    style: textStyle,
                  ),
                  Slider(
                    value: lookAheadDistance,
                    onChanged:
                        ref.read(lookAheadDistanceProvider.notifier).update,
                    max: 20,
                    min: 1,
                    divisions: 19,
                  ),
                ],
              );
            },
          ),
        ),
        ListTile(
          title: Consumer(
            builder: (context, ref, child) {
              final gain = ref.watch(lookAheadVelocityGainProvider);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Look ahead velocity gain: $gain',
                    style: textStyle,
                  ),
                  Slider(
                    value: gain,
                    onChanged:
                        ref.read(lookAheadVelocityGainProvider.notifier).update,
                    divisions: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
