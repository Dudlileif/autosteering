import 'package:autosteering/src/features/common/widgets/text_with_stroke.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget for controlling the AB-line offset.
class ABTrackingControls extends ConsumerWidget {
  /// A widget for controlling the AB-line offset.
  const ABTrackingControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(activeABConfigProvider);

    final abTracking = ref.watch(displayABTrackingProvider);
    if (abTracking != null) {
      final theme = Theme.of(context);

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWithStroke(
            'Line: ${abTracking.currentOffset}',
            style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
            strokeWidth: 3.5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Consumer(
              builder: (context, ref, child) => FilterChip(
                label: TextWithStroke(
                  'SNAP',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                  strokeWidth: 3.5,
                ),
                selected: abTracking.snapToClosestLine,
                onSelected: (value) => ref
                    .read(aBSnapToClosestLineProvider.notifier)
                    .update(value: value),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(
                builder: (context, ref, child) => IconButton(
                  onPressed: () => ref
                      .read(simInputProvider.notifier)
                      .send((abMoveOffset: -1)),
                  icon: SizedBox.square(
                    dimension: 40,
                    child: Transform.flip(
                      flipX: true,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/arrow_move_right.svg',
                            height: 46,
                            width: 46,
                          ),
                          SvgPicture.asset(
                            'assets/icons/arrow_move_right.svg',
                            height: 40,
                            width: 40,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, child) => IconButton(
                  onPressed: () => ref
                      .read(simInputProvider.notifier)
                      .send((abMoveOffset: 1)),
                  icon: SizedBox.square(
                    dimension: 40,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/arrow_move_right.svg',
                          height: 46,
                          width: 46,
                        ),
                        SvgPicture.asset(
                          'assets/icons/arrow_move_right.svg',
                          height: 40,
                          width: 40,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (ref.watch(
            displayABTrackingProvider.select(
              (value) => value?.limitMode != ABLimitMode.unlimited,
            ),
          ))
            Consumer(
              builder: (context, ref, child) => IconButton(
                onPressed:
                    ref.read(aBOffsetOppositeTurnProvider.notifier).toggle,
                icon: const Icon(
                  Icons.compare_arrows,
                  color: Colors.white,
                  size: 50,
                  shadows: [Shadow(offset: Offset(2, 2))],
                ),
              ),
            ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
