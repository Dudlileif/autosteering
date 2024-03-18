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

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the equipment's hitches.
class EquipmentHitchesPage extends ConsumerWidget {
  /// A page for configuring the equipment's hitches.
  const EquipmentHitchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipment = ref.watch(configuredEquipmentProvider);

    final children = [
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Hitch to front fixed hitch distance',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.hitchToChildFrontFixedHitchLength?.toString(),
          ),
        ),
        onChanged: (value) {
          final distance = double.tryParse(value.replaceAll(',', '.'));

          ref.read(configuredEquipmentProvider.notifier).update(
                equipment..hitchToChildFrontFixedHitchLength = distance?.abs(),
              );
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Hitch to rear fixed hitch distance',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.hitchToChildRearFixedHitchLength?.toString(),
          ),
        ),
        onChanged: (value) {
          final distance = double.tryParse(value.replaceAll(',', '.'));

          ref.read(configuredEquipmentProvider.notifier).update(
                equipment..hitchToChildRearFixedHitchLength = distance?.abs(),
              );
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Hitch to rear towbar distance',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.hitchToChildRearTowbarHitchLength?.toString(),
          ),
        ),
        onChanged: (value) {
          final distance = double.tryParse(value.replaceAll(',', '.'));

          ref.read(configuredEquipmentProvider.notifier).update(
                equipment..hitchToChildRearTowbarHitchLength = distance?.abs(),
              );
        },
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: EquipmentConfiguratorPreviousButton(),
          ),
          ...children.map(
            (widget) => Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(width: 400, child: widget),
            ),
          ),
        ],
      ),
    );
  }
}
