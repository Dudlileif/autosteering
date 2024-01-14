import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/field/providers/providers.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for configuring the [MiniMap].
class MiniMapMenu extends ConsumerWidget {
  /// A menu for configuring the [MiniMap].
  const MiniMapMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MenuButtonWithChildren(
        text: 'Mini map',
        icon: Icons.map,
        menuChildren: [
          const _ShowMiniMapTile(),
          if (ref.watch(showMiniMapProvider)) ...[
            const _MiniMapSizeTile(),
            const _MiniMapLockToFieldTile(),
          ],
        ],
      );
}

class _ShowMiniMapTile extends ConsumerWidget {
  const _ShowMiniMapTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) => CheckboxListTile(
        secondary: const Icon(Icons.map),
        title: Text(
          'Show mini map',
          style: Theme.of(context).menuButtonWithChildrenText,
        ),
        value: ref.watch(showMiniMapProvider),
        onChanged: (value) => value != null
            ? ref.read(showMiniMapProvider.notifier).update(value: value)
            : null,
      );
}

class _MiniMapSizeTile extends ConsumerWidget {
  const _MiniMapSizeTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).menuButtonWithChildrenText;
    final size = ref.watch(miniMapSizeProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Text(
            'Size: ${size.round()}',
            style: textTheme,
          ),
        ),
        Slider(
          value: size,
          onChanged: ref.read(miniMapSizeProvider.notifier).update,
          min: 100,
          max: 500,
          divisions: 16,
        ),
      ],
    );
  }
}

class _MiniMapLockToFieldTile extends ConsumerWidget {
  const _MiniMapLockToFieldTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(activeFieldProvider) != null
          ? CheckboxListTile(
              secondary: const Stack(
                children: [Icon(Icons.texture), Icon(Icons.square_outlined)],
              ),
              title: Text(
                'Lock to field',
                style: Theme.of(context).menuButtonWithChildrenText,
              ),
              value: ref.watch(miniMapLockToFieldProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(miniMapLockToFieldProvider.notifier)
                      .update(value: value)
                  : null,
            )
          : const SizedBox.shrink();
}
