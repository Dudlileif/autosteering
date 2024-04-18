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
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the equipment type and set a name for the equipment.
class EquipmentTypeSelectorPage extends StatelessWidget {
  /// A page for configuring the equipment type and set a name for the
  /// equipment.
  const EquipmentTypeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: _EquipmentTypeSelector(),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 500,
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null &&
                              value.isNotEmpty &&
                              !value.startsWith(' ')
                          ? null
                          : '''No name entered! Please enter a name so that the config can be saved!''',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Consumer(
              builder: (context, ref, child) => EquipmentConfiguratorNextButton(
                enabled: ref.watch(
                  configuredEquipmentProvider.select(
                    (value) =>
                        value.name != null && (value.name ?? '').isNotEmpty,
                  ),
                ),
              ),
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

    return SizedBox(
      height: 220,
      child: Material(
        type: MaterialType.transparency,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 200,
                height: 200,
                child: ListTile(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Text(
                          'Three point hitch\n(fixed hitch)',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 18,
                        // TODO(dudlileif): Make three point hitch icon
                        child: Icon(Icons.workspaces, size: 100),
                      ),
                    ],
                  ),
                  selected: equipment.hitchType == HitchType.fixed,
                  selectedTileColor: theme.toggleButtonsTheme.splashColor,
                  onTap: () {
                    ref.read(configuredEquipmentProvider.notifier).update(
                          Equipment(hitchType: HitchType.fixed),
                        );
                    ref.invalidate(
                      configuredEquipmentNameTextControllerProvider,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 200,
                height: 200,
                child: ListTile(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Text(
                          'Towbar hitch',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 18,
                        // TODO(dudlileif): Make towbar hitch icon
                        child: Icon(Icons.commit, size: 100),
                      ),
                    ],
                  ),
                  selected: equipment.hitchType == HitchType.towbar,
                  selectedTileColor: theme.toggleButtonsTheme.splashColor,
                  onTap: () {
                    ref.read(configuredEquipmentProvider.notifier).update(
                          Equipment(hitchType: HitchType.towbar),
                        );
                    ref.invalidate(
                      configuredEquipmentNameTextControllerProvider,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
