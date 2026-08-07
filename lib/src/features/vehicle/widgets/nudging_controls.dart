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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A set of widgets to control sideways nudging of the vehicle.
class NudgingControls extends StatelessWidget {
  /// A set of widgets to control sideways nudging of the vehicle.
  const NudgingControls({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final mediaSize = MediaQuery.sizeOf(context);

    final numberFormatter = NumberFormat.decimalPatternDigits(
      locale: strings.localeName,
      decimalDigits: 1,
    ).format;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor.withValues(alpha: 0.7),
      primary: false,
      appBar: AppBar(
        title: Text(
          strings.nudgeControls,
          style: theme.textTheme.titleLarge,
        ),
        scrolledUnderElevation: 4,
        primary: false,
        actions: [
          Consumer(
            builder: (context, ref, child) => CloseButton(
              onPressed: () => ref
                  .read(showNudgingControlsProvider.notifier)
                  .update(value: false),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                spacing: 8,
                mainAxisAlignment: .spaceBetween,
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      final distance = ref.watch(
                        mainVehicleProvider.select(
                          (value) => value.nudgeDistance,
                        ),
                      );
                      var text = '${strings.current}: ';
                      if (distance.abs() >= 1) {
                        text += '${numberFormatter(distance)} m'.padLeft(
                          7,
                        );
                      } else {
                        text += '${(distance * 100).round()} cm'.padLeft(7);
                      }
                      return TextWithStroke(
                        text,
                        style: GoogleFonts.robotoMono(
                          color: Colors.white,
                          textStyle: theme.textTheme.titleMedium,
                        ),
                        strokeWidth: 3.5,
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) => switch (mediaSize.width) {
                      < 600 => IconButton.filled(
                        onPressed: () =>
                            ref.read(simInputProvider.notifier).send(
                              (nudgeDistance: 0),
                            ),
                        icon: const Icon(Symbols.clear),
                      ),
                      _ => FilledButton(
                        onPressed: () =>
                            ref.read(simInputProvider.notifier).send(
                              (nudgeDistance: 0),
                            ),
                        child: TextWithStroke(
                          strings.reset,
                          style: GoogleFonts.robotoMono(
                            color: Colors.white,
                            textStyle: theme.textTheme.titleMedium,
                          ),
                          strokeWidth: 3.5,
                        ),
                      ),
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  TextWithStroke(
                    'cm',
                    style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      textStyle: theme.textTheme.titleMedium,
                    ),
                    strokeWidth: 3.5,
                  ),
                  Consumer(
                    builder: (context, ref, child) => SegmentedButton<double>(
                      segments: [
                        ButtonSegment(
                          value: 0.01,
                          label: TextWithStroke(
                            '1'.padLeft(2),
                            style: GoogleFonts.robotoMono(
                              color: Colors.white,
                              textStyle: theme.textTheme.titleMedium,
                            ),
                            strokeWidth: 3.5,
                          ),
                        ),
                        ButtonSegment(
                          value: 0.05,
                          label: TextWithStroke(
                            '5'.padLeft(2),
                            style: GoogleFonts.robotoMono(
                              color: Colors.white,
                              textStyle: theme.textTheme.titleMedium,
                            ),
                            strokeWidth: 3.5,
                          ),
                        ),
                        ButtonSegment(
                          value: 0.10,
                          label: TextWithStroke(
                            '10',
                            style: GoogleFonts.robotoMono(
                              color: Colors.white,
                              textStyle: theme.textTheme.titleMedium,
                            ),
                            strokeWidth: 3.5,
                          ),
                        ),
                      ],
                      selected: {ref.watch(nudgeStepSizeProvider)},
                      onSelectionChanged: (values) => ref
                          .read(nudgeStepSizeProvider.notifier)
                          .update(values.first),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Consumer(
                builder: (context, ref, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                      icon: const Icon(
                        Icons.keyboard_double_arrow_left,
                      ),
                      onPressed: () => ref.read(simInputProvider.notifier).send(
                        (
                          nudgeIncrement: 2 * -ref.watch(nudgeStepSizeProvider),
                        ),
                      ),
                    ),

                    IconButton.filled(
                      icon: const Icon(Icons.keyboard_arrow_left),
                      onPressed: () =>
                          ref.read(simInputProvider.notifier).send((
                            nudgeIncrement: -ref.watch(
                              nudgeStepSizeProvider,
                            ),
                          )),
                    ),
                    IconButton.filled(
                      icon: const Icon(Icons.keyboard_arrow_right),
                      onPressed: () =>
                          ref.read(simInputProvider.notifier).send((
                            nudgeIncrement: ref.watch(
                              nudgeStepSizeProvider,
                            ),
                          )),
                    ),
                    IconButton.filled(
                      icon: const Icon(
                        Icons.keyboard_double_arrow_right,
                      ),
                      onPressed: () => ref.read(simInputProvider.notifier).send(
                        (
                          nudgeIncrement: 2 * ref.watch(nudgeStepSizeProvider),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                var currentDistance =
                    ref.watch(abTrackingPerpendicularDistanceProvider) ??
                    ref.watch(pathTrackingPerpendicularDistanceProvider);
                if (currentDistance != null && currentDistance.isFinite) {
                  currentDistance += ref.watch(
                    mainVehicleProvider.select(
                      (value) => value.nudgeDistance,
                    ),
                  );
                  var text = '${strings.toLine}: ';
                  if (currentDistance.abs() >= 1) {
                    text += '${numberFormatter(currentDistance)} m'.padLeft(7);
                  } else {
                    text += '${(currentDistance * 100).round()} cm'.padLeft(
                      7,
                    );
                  }

                  return FilledButton(
                    onPressed: () => ref.read(simInputProvider.notifier).send((
                      nudgeDistance: currentDistance!,
                    )),
                    child: TextWithStroke(
                      text,
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        textStyle: theme.textTheme.titleMedium,
                      ),
                      strokeWidth: 3.5,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// A draggable version of [NudgingControls], typically used as a child of
/// a [Stack] that is a child of a [LayoutBuilder].
class DraggableNudgingControls extends ConsumerWidget {
  /// A draggable version of [NudgingControls], typically used as a child of
  /// a [Stack] that is a child of a [LayoutBuilder].
  ///
  /// [constraints] are used to layout the widget.
  const DraggableNudgingControls({required this.constraints, super.key});

  /// Constraints used to layout this widget.
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaSize = MediaQuery.sizeOf(context);
    return DynamicDraggableWidget(
      offset: ref.watch(nudgingControlsUiOffsetProvider),
      constraints: constraints,
      maxWidth: switch (mediaSize.width) {
        < 600 => 300,
        _ => 400,
      },
      maxHeight: 325,
      maxWidthFraction: 1,
      onDragEnd: ref.read(nudgingControlsUiOffsetProvider.notifier).update,
      child: const Card(
        color: Colors.transparent,
        child: NudgingControls(),
      ),
    );
  }
}
