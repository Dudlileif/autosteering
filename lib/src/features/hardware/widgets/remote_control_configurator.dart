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

import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A dialog for configuring which [RemoteControlButtonAction] should map to
/// each button.
class RemoteControlConfigurator extends ConsumerWidget {
  /// A dialog for configuring which [RemoteControlButtonAction] should map to
  /// each button.
  const RemoteControlConfigurator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = ref.watch(remoteControlButtonActionsProvider);
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(
        left: 24,
        top: 12,
        right: 24,
        bottom: 16,
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Remote control configurator',
              softWrap: true,
            ),
          ),
          CloseButton(),
        ],
      ),
      children: [

        ...actions
            .map(
              (button, action) => MapEntry(
                button,
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownMenu<RemoteControlButtonAction?>(
                          expandedInsets: const EdgeInsets.all(8),
                          label: Text('Button ${button + 1}'.padRight(9)),
                          initialSelection: actions[button],
                          leadingIcon: Icon(
                            actions[button]?.icon ?? Icons.clear,
                            fill: 1,
                            weight: 1000,
                          ),
                          dropdownMenuEntries:
                              [null, ...RemoteControlButtonAction.values]
                                  .map(
                                    (action) => DropdownMenuEntry(
                                      value: action,
                                      label: action?.description ?? 'No action',
                                      leadingIcon: Icon(
                                        action?.icon ?? Icons.clear,
                                        fill: 1,
                                        weight: 1000,
                                      ),
                                      trailingIcon: action == actions[button]
                                          ? const Icon(Icons.check)
                                          : null,
                                    ),
                                  )
                                  .toList(),
                          onSelected: (action) => ref
                              .read(remoteControlButtonActionsProvider.notifier)
                              .updateButton(button, action),
                        ),
                      ),
                      IconButton(
                        onPressed: actions.length - 1 == button
                            ? () => ref
                                .read(
                                  remoteControlButtonActionsProvider.notifier,
                                )
                                .update(actions..remove(button))
                            : null,
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .values,
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ElevatedButton.icon(
            onPressed: () =>
                ref.read(remoteControlButtonActionsProvider.notifier).update(
                      actions
                        ..update(
                          actions.length,
                          (value) => null,
                          ifAbsent: () => null,
                        ),
                    ),
            icon: const Icon(Icons.add),
            label: const Text('Add button'),
          ),
        ),
      ],
          
        
    
    );
  }
}
