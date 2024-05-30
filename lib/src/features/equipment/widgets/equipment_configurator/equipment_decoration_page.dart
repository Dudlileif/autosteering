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

/// A page for configuring the equipment's decoration.
class EquipmentDecorationPage extends ConsumerWidget {
  /// A page for configuring the equipment's decoratoin.
  const EquipmentDecorationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipment = ref.watch(configuredEquipmentProvider);

    final children = [
      Text(
        'Decoration',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Hitch to decoration start',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.hitchToDecorationStartLength?.toString(),
          ),
        ),
        onFieldSubmitted: (value) {
          final length = double.tryParse(value.replaceAll(',', '.'));

          ref.read(configuredEquipmentProvider.notifier).update(
                equipment..hitchToDecorationStartLength = length,
              );
        },
          
        
      ),
    
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Decoration length',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider
              .select((value) => value.decorationLength?.toString()),
        ),
        onFieldSubmitted: (value) {
          final length = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment..decorationLength = length?.abs());
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: RotatedBox(quarterTurns: 1, child: Icon(Icons.expand)),
          labelText: 'Decoration width',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider
              .select((value) => value.decorationWidth?.toString()),
        ),
        onFieldSubmitted: (value) {
          final length = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment..decorationWidth = length?.abs());
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: RotatedBox(quarterTurns: 1, child: Icon(Icons.expand)),
          labelText: 'Decoration sideways offset (-left / +right)',
          suffixText: 'm',
        ),
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: true),
        initialValue: ref.read(
          configuredEquipmentProvider
              .select((value) => value.decorationSidewaysOffset?.toString()),
        ),
        onFieldSubmitted: (value) {
          final offset = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment..decorationSidewaysOffset = offset);
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
