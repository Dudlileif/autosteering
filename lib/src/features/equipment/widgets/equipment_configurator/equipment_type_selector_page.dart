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

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the equipment type and set a name for the equipment.
class EquipmentTypeSelectorPage extends ConsumerWidget {
  /// A page for configuring the equipment type and set a name for the
  /// equipment.
  const EquipmentTypeSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: _EquipmentTypeSelector(),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) => TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.label_outline),
                        labelText: 'Name',
                      ),
                      controller: ref.watch(
                        configuredEquipmentNameTextControllerProvider,
                      ),
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) => value == null ||
                              (value.isEmpty || value.startsWith(' '))
                          ? 'No name entered!'
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) => switch (ref.watch(
              configuredEquipmentProvider.select(
                (value) =>
                    value.name == null ||
                    (value.name!.isEmpty || value.name!.startsWith(' ')),
              ),
            )) {
              true => child ?? const SizedBox.shrink(),
              false => const SizedBox.shrink(),
            },
            child: Text(
              'Please enter a name so that the config can be saved!',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}

/// The actual selector part of the page.
class _EquipmentTypeSelector extends ConsumerWidget {
  /// The actual selector part of the page.
  const _EquipmentTypeSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final equipment = ref.watch(configuredEquipmentProvider);

    return LayoutBuilder(
      builder: (context, constraints) => SegmentedButton<HitchType>(
        showSelectedIcon: false,
        style: theme.segmentedButtonTheme.style?.copyWith(
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
          padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
          iconSize: WidgetStatePropertyAll(
            min(
              100,
              constraints.biggest.shortestSide / 4,
            ),
          ),
          iconColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return theme.primaryColor;
            }
            return null;
          }),
          textStyle: WidgetStatePropertyAll(
            theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onSelectionChanged: (values) {
          ref.read(configuredEquipmentProvider.notifier).update(
                Equipment(hitchType: values.first),
              );
          ref.invalidate(
            configuredEquipmentNameTextControllerProvider,
          );
        },
        selected: {equipment.hitchType},
        segments: [
          const ButtonSegment(
            value: HitchType.fixed,
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Fixed hitch',
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.workspaces,
                ),
              ],
            ),
          ),
          ButtonSegment(
            value: HitchType.towbar,
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Towbar hitch',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const Icon(
                  Icons.commit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
