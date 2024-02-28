import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/ab_common_menu.dart';
import 'package:autosteering/src/features/theme/utils/menu_button_text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for working with the [ABCurve]
/// guidance feature.
class ABCurveMenu extends ConsumerWidget {
  /// A menu button with attached submenu for working with the [ABCurve]
  /// guidance feature.
  const ABCurveMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..watch(activeABConfigProvider)
      ..watch(aBCurveDebugProvider);

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'AB curve',
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            final enabled = ref.watch(enablePathRecorderProvider);
            return MenuItemButton(
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

                if (enabled == true) {
                  ref
                      .read(aBCurvePointsProvider.notifier)
                      .updateFromRecording();
                }
              },
              closeOnActivate: false,
              child: Text(
                enabled ? 'Recording, tap to finish' : 'Record curve',
                style: Theme.of(context).menuButtonWithChildrenText,
              ),
            );
          },
        ),
        const ABCommonMenu(),
        Consumer(
          child: Text('Recalc bounded lines', style: textStyle),
          builder: (context, ref, child) => MenuItemButton(
            closeOnActivate: false,
            child: child,
            onPressed: () => ref.invalidate(aBCurveDebugProvider),
          ),
        ),
      ],
    );
  }
}
