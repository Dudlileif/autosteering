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
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

/// Basic vehicle gauges to show the travelled distance (clearable), velocity
/// and bearing.
class BasicVehicleGauges extends StatelessWidget {
  /// Basic vehicle gauges to show the travelled distance (clearable), velocity
  /// and bearing.
  const BasicVehicleGauges({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final unit = ref.watch(uiUnitDistanceProvider);
            final distance = unit.fromUnit(
              ref.watch(gaugeTravelledDistanceProvider),
            );
            return Material(
              type: .transparency,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                leading: const Icon(
                  Icons.straighten,
                  color: Colors.white,
                  shadows: [Shadow(offset: Offset(2, 2))],
                ),
                onLongPress: () => ref
                  ..invalidate(gaugeTravelledDistanceProvider)
                  ..invalidate(debugVehicleTravelledPathListProvider),
                title: TextWithStroke(
                  '''${distance.toStringAsFixed(1).padLeft(5)} ${unit.symbol}''',
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                    textStyle: theme.textTheme.titleMedium,
                  ),
                  strokeWidth: 3.5,
                ),
                subtitle: TextWithStroke(
                  'Hold to reset',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
                  strokeWidth: 2,
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.speed,
            color: Colors.white,
            shadows: [Shadow(offset: Offset(2, 2))],
          ),
          title: Consumer(
            builder: (context, ref, child) {
              final unit = ref.watch(uiUnitVelocityProvider);
              final velocity = unit.fromUnit(ref.watch(gaugeVelocityProvider));

              return TextWithStroke(
                '''${velocity.toStringAsFixed(1).padLeft(5)} ${unit.symbol}''',
                style: GoogleFonts.robotoMono(
                  color: Colors.white,
                  textStyle: theme.textTheme.titleMedium,
                ),
                strokeWidth: 3.5,
              );
            },
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.navigation,
            color: Colors.white,
            shadows: [Shadow(offset: Offset(2, 2))],
          ),
          title: Consumer(
            builder: (context, ref, child) => TextWithStroke(
              '''${ref.watch(gaugeBearingProvider).toStringAsFixed(1).padLeft(5)}º''',
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                textStyle: theme.textTheme.titleMedium,
              ),
              strokeWidth: 3.5,
            ),
          ),
        ),
      ],
    );
  }
}
