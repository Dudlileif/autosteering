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

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the equipment's dimensions.
class EquipmentDimensionsPage extends ConsumerWidget {
  /// A page for configuring the equipment's dimensions.
  const EquipmentDimensionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final textTheme = TextTheme.of(context);
    final equipment = ref.watch(configuredEquipmentProvider);

    final children = [
      Text(
        strings.dimensions(0),
        style: textTheme.titleLarge,
      ),
      TextFormField(
        decoration: InputDecoration(
          icon: const Icon(Icons.expand),
          labelText: strings.equipmentDrawbarLength,
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.drawbarLength.toString(),
          ),
        ),
        onFieldSubmitted: (value) {
          final length = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment.copyWith(drawbarLength: length?.abs()));
        },
      ),
      TextFormField(
        decoration: InputDecoration(
          icon: const Icon(Icons.expand),
          labelText: strings.workingAreaLength,
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.workingAreaLength.toString(),
          ),
        ),
        onFieldSubmitted: (value) {
          final width = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment.copyWith(workingAreaLength: width?.abs()));
        },
      ),

      TextFormField(
        decoration: InputDecoration(
          icon: const Icon(Icons.expand),
          labelText: strings.recordingPositionFromWorkingAreaStart,
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) =>
                ((1 - value.recordingPositionFraction) *
                        value.workingAreaLength)
                    .toString(),
          ),
        ),
        onFieldSubmitted: (value) {
          final length = clampDouble(
            double.tryParse(value.replaceAll(',', '.')) ?? 0,
            0,
            equipment.workingAreaLength,
          );

          final fraction = equipment.workingAreaLength > 0
              ? 1 - (length / equipment.workingAreaLength)
              : 1.0;
          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment.copyWith(recordingPositionFraction: fraction));
        },
      ),
      TextFormField(
        decoration: InputDecoration(
          icon: const RotatedBox(quarterTurns: 1, child: Icon(Icons.expand)),
          labelText: strings.sidewaysOffsetLeftRight,
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        ),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.sidewaysOffset.toString(),
          ),
        ),
        onFieldSubmitted: (value) {
          final offset = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment.copyWith(sidewaysOffset: offset));
        },
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: children
            .map(
              (widget) => ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: widget,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
