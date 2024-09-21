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

import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

/// A simple gauge for showing the worked area of the first registered
/// equipment in the [EquipmentWorkedArea] provider.
class EquipmentWorkedAreaGauge extends ConsumerWidget {
  /// A simple gauge for showing the worked area of the first registered
  /// equipment in the [EquipmentWorkedArea] provider.
  const EquipmentWorkedAreaGauge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldArea = ref
        .watch(activeFieldProvider.select((value) => value?.areaWithoutHoles));

    final area = ref.watch(
      equipmentWorkedAreaProvider.select(
        (value) => value.entries.firstOrNull?.value,
      ),
    );
    if (area != null || fieldArea != null) {
      return ListTile(
        leading: const Icon(
          Icons.square_foot,
          color: Colors.white,
          shadows: [Shadow(offset: Offset(2, 2))],
        ),
        title: TextWithStroke(
          switch (fieldArea != null) {
            true =>
              '''
${area != null ? (area / 1e4).toStringAsFixed(2) : '-'} / ${(fieldArea! / 1e4).toStringAsFixed(2)} ha
${area != null ? '${clampDouble(100 * area / fieldArea,0, 100).toStringAsFixed(1)}%' : ''}''',
            false => '${(area! / 1e4).toStringAsFixed(2)} ha',
          },
          style: GoogleFonts.robotoMono(
            color: Colors.white,
            textStyle: Theme.of(context).textTheme.titleMedium,
          ),
          strokeWidth: 3.5,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
