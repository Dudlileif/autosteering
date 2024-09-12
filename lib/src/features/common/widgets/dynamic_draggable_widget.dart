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

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A draggable widget that is constrained in size, typically used as a child
/// of a [Stack] that is a child of a [LayoutBuilder].
class DynamicDraggableWidget extends ConsumerWidget {
  /// A draggable widget that is constrained in size, typically used as a child
  /// of a [Stack] that is a child of a [LayoutBuilder].
  ///
  /// [constraints] are used to layout the widget.
  /// [offset] describes the position of the [child] in the [Stack].
  /// [maxHeight] and [maxWidth] are the maximum sizes in each direction for
  /// the [child].
  /// [maxHeightFraction] and [maxWidthFraction] says how much of the available
  /// space of [constraints] that [child] can occupy in each direction.

  const DynamicDraggableWidget({
    required this.constraints,
    required this.child,
    required this.onDragEnd,
    this.offset = Offset.zero,
    this.maxHeight = 500,
    this.maxWidth = 500,
    this.maxHeightFraction = 0.5,
    this.maxWidthFraction = 0.5,
    super.key,
  });

  /// Constraints used to layout this widget.
  final BoxConstraints constraints;

  /// The callback for updating the [child]'s [offset] in the [Stack].
  final void Function(Offset offset) onDragEnd;

  /// The maximum height of [child].
  final double maxHeight;

  /// The maximum width of [child].
  final double maxWidth;

  /// The maximum usable height fraction of [constraints].
  final double maxHeightFraction;

  /// The maximum usable width fraction of [constraints].
  final double maxWidthFraction;

  /// The current offset of [child] in the parent [Stack].
  final Offset offset;

  /// The widget below this in the widget tree.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var spareWidth = constraints.maxWidth -
        clampDouble(maxWidth, 0, constraints.maxWidth / 2);
    var spareHeight = constraints.maxHeight -
        clampDouble(maxHeight, 0, constraints.maxHeight / 2);

    if (spareWidth <= 0) {
      spareWidth = 1;
    }
    if (spareHeight <= 0) {
      spareHeight = 1;
    }

    return Positioned(
      left: clampDouble(
        offset.dx,
        0,
        spareWidth,
      ),
      top: clampDouble(
        offset.dy,
        0,
        spareHeight,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: min(
            clampDouble(
              maxHeight,
              0,
              constraints.maxHeight * maxHeightFraction,
            ),
            constraints.maxHeight - clampDouble(offset.dy, 0, spareHeight),
          ),
          width: clampDouble(
            maxWidth,
            0,
            constraints.maxWidth * maxWidthFraction,
          ),
          child: LongPressDraggable(
            onDragEnd: (details) {
              onDragEnd(
                Offset(
                  clampDouble(details.offset.dx, 0, spareWidth),
                  clampDouble(details.offset.dy, 0, spareHeight),
                ),
              );
            },
            childWhenDragging: const SizedBox.shrink(),
            feedback: Opacity(
              opacity: 0.7,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: clampDouble(
                    maxHeight,
                    0,
                    constraints.maxHeight * maxHeightFraction,
                  ),
                  width: clampDouble(
                    maxWidth,
                    0,
                    constraints.maxWidth * maxWidthFraction,
                  ),
                  child: child,
                ),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
