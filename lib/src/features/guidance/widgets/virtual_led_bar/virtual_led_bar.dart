import 'package:agopengps_flutter/src/features/guidance/providers/virtual_led_bar_providers.dart';
import 'package:agopengps_flutter/src/features/guidance/widgets/virtual_led_bar/virtual_led.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A virtuial LED bar for showing the user how far off track they are.
class VirtualLedBar extends ConsumerWidget {
  /// A virtuial LED bar for showing the user how far off track they are.
  ///
  /// [showEvenIfNoTrackingAvailable] can be used to always show the
  /// virtual led bar.

  const VirtualLedBar({
    super.key,
    this.showEvenIfNoTrackingAvailable = false,
  });

  /// Whether the led bar should be shown even when there is no active tracking
  /// or testing distance set.
  final bool showEvenIfNoTrackingAvailable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(virtualLedBarConfigurationProvider);

    var perpendicularDistance = 
        ref.watch(virtualLedBarPerpendicularDistanceProvider);

    if (!showEvenIfNoTrackingAvailable &&
        perpendicularDistance == null) {
      return const SizedBox.shrink();
    }
    perpendicularDistance ??= 0;

    final activeMap = config.activeForDistance(perpendicularDistance);

    final leftEndLeds = List.generate(
      config.leftEndCount,
      (index) =>
          VirtualLed(
        color: Color(config.endColor),
        active: activeMap[index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    var cumulativeIndex = leftEndLeds.length;

    final leftIntermediateLeds = List.generate(
      config.leftIntermediateCount,
      (index) => VirtualLed(
        color: Color(config.intermediateColor),
        active: activeMap[cumulativeIndex + index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    cumulativeIndex += leftIntermediateLeds.length;

    final centerLeds = List.generate(
      config.centerCount,
      (index) => VirtualLed(
        color: Color(config.centerColor),
        active: activeMap[cumulativeIndex + index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    cumulativeIndex += centerLeds.length;

    final rightIntermediateLeds = List.generate(
      config.rightIntermediateCount,
      (index) => VirtualLed(
        color: Color(config.intermediateColor),
        active: activeMap[cumulativeIndex + index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    cumulativeIndex += rightIntermediateLeds.length;

    final rightEndLeds = List.generate(
      config.rightEndCount,
      (index) => VirtualLed(
        color: Color(config.endColor),
        active: activeMap[cumulativeIndex + index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...leftEndLeds,
          ...leftIntermediateLeds,
          ...centerLeds,
          ...rightIntermediateLeds,
          ...rightEndLeds,
        ],
      ),
    );
  }
}
