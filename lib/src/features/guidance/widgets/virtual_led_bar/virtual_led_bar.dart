// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:async';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/providers/virtual_led_bar_providers.dart';
import 'package:autosteering/src/features/guidance/widgets/virtual_led_bar/virtual_led.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A virtuial LED bar for showing the user how far off track they are.
///
/// If the shown number has a `.` in it, it means the distance is in meters,
/// otherwise it is in centimeters.
class VirtualLedBar extends ConsumerStatefulWidget {
  /// A virtuial LED bar for showing the user how far off track they are.
  ///
  /// [showEvenIfNoTrackingAvailable] can be used to always show the
  /// virtual led bar, typically used to test the bar.
  const VirtualLedBar({
    super.key,
    this.showEvenIfNoTrackingAvailable = false,
  });

  /// Whether the led bar should be shown even when there is no active tracking
  /// or testing distance set.
  final bool showEvenIfNoTrackingAvailable;

  @override
  ConsumerState<VirtualLedBar> createState() => _VirtualLedBarState();
}

class _VirtualLedBarState extends ConsumerState<VirtualLedBar> {
  /// Variables for initial animation.
  Map<int, bool>? initAnimationMap;
  Timer? initAnimationTimer;
  int? initAnimationFrame;

  @override
  void initState() {
    super.initState();

    final config = ref.read(virtualLedBarConfigurationProvider);
    initAnimationFrame = 0;
    initAnimationMap = {};
    initAnimationTimer =
        Timer.periodic(const Duration(milliseconds: 25), (timer) {
      if (timer.tick > config.totalCount * 2.5) {
        setState(() {
          initAnimationTimer?.cancel();
          initAnimationTimer = null;
          initAnimationFrame = null;
          initAnimationMap = null;
        });
        return;
      }

      setState(() {
        // 3. Split from center to edges, then come back to center.
        if (initAnimationFrame! >= config.totalCount * 1.5) {
          for (var i = 0; i < config.totalCount; i++) {
            initAnimationMap![i] = (timer.tick % config.totalCount) == i ||
                (-(timer.tick + 1) % config.totalCount) == i;
          }
        }
        // 2. Right to middle.
        else if (initAnimationFrame! >= config.totalCount) {
          for (var i = 0; i < config.totalCount; i++) {
            initAnimationMap![i] = (-timer.tick % config.totalCount) == i;
          }
        }
        // 1. Left to right.
        else {
          for (var i = 0; i < config.totalCount; i++) {
            initAnimationMap![i] = timer.tick == i;
          }
        }
        initAnimationFrame = (initAnimationFrame ?? 0) + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(virtualLedBarConfigurationProvider);

    var perpendicularDistance =
        ref.watch(virtualLedBarPerpendicularDistanceProvider);

    if (!widget.showEvenIfNoTrackingAvailable &&
        perpendicularDistance == null) {
      return const SizedBox.shrink();
    }
    perpendicularDistance ??= 0;

    final activeMap =
        initAnimationMap ?? config.activeForDistance(perpendicularDistance);

    final leftEndLeds = List.generate(
      config.endCount,
      (index) => VirtualLed(
        color: config.endColor,
        active: activeMap[index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    var cumulativeIndex = leftEndLeds.length;

    final leftIntermediateLeds = List.generate(
      config.intermediateCount,
      (index) => VirtualLed(
        color: config.intermediateColor,
        active: activeMap[cumulativeIndex + index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    cumulativeIndex += leftIntermediateLeds.length;

    final leftCenterLeds = List.generate(
      config.centerCount,
      (index) => VirtualLed(
        color: config.centerColor,
        active: activeMap[cumulativeIndex + index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    cumulativeIndex += leftCenterLeds.length;

    final rightCenterLeds = List.generate(
      config.centerCount,
      (index) => VirtualLed(
        color: config.centerColor,
        active: activeMap[cumulativeIndex + index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    cumulativeIndex += rightCenterLeds.length;

    final rightIntermediateLeds = List.generate(
      config.intermediateCount,
      (index) => VirtualLed(
        color: config.intermediateColor,
        active: activeMap[cumulativeIndex + index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    cumulativeIndex += rightIntermediateLeds.length;

    final rightEndLeds = List.generate(
      config.endCount,
      (index) => VirtualLed(
        color: config.endColor,
        active: activeMap[cumulativeIndex + index] ?? false,
        size: config.ledSize,
      ),
      growable: false,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: config.barWidth,
        maxHeight: config.ledSize + 22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...leftEndLeds,
          ...leftIntermediateLeds,
          ...leftCenterLeds,
          SizedBox(
            width: 80,
            child: Center(
              child: Consumer(
                builder: (context, ref, child) {
                  var distance = (config.reverseBar ? 1 : -1) *
                      (perpendicularDistance ?? 0);
                  if (!distance.isFinite) {
                    distance = 0;
                  }

                  var number = (distance.abs() * 100)
                      .truncate()
                      .clamp(-99, 99)
                      .toString();
                  if (distance.abs() >= 1) {
                    number = distance.abs().clamp(0, 99).toStringAsFixed(1);
                  }
                  if (distance.abs() >= 10) {
                    number =
                        '''${distance.abs().clamp(0, 99).toStringAsFixed(0)}.''';
                  }
                  if (distance.abs() >= 0.01) {
                    number = distance.isNegative ? '⊲ $number ' : ' $number ⊳';
                  }
                  return TextWithStroke(
                    number,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: 
                            config.colorFromDistance(
                            perpendicularDistance ?? 0,
                          ),
                          fontFamily: 'Noto Sans Mono',
                          fontWeight: FontWeight.bold,
                        ),
                    strokeWidth: 4,
                  );
                },
              ),
            ),
          ),
          ...rightCenterLeds,
          ...rightIntermediateLeds,
          ...rightEndLeds,
        ],
      ),
    );
  }
}
