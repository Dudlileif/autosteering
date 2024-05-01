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
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Remote control configurator'),
          CloseButton(),
        ],
      ),
      children: [
        ...List.generate(
          actions.length,
          (i) => DropdownButtonFormField<RemoteControlButtonAction>(
            decoration: InputDecoration(prefixText: 'Button $i'.padRight(11)),
            padding: const EdgeInsets.all(8),
            value: actions[i],
            items: [null, ...RemoteControlButtonAction.values]
                .map(
                  (action) => DropdownMenuItem(
                    value: action,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          action?.icon ?? Icons.clear,
                          fill: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(action?.description ?? 'No action'),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            onChanged: (action) => ref
                .read(remoteControlButtonActionsProvider.notifier)
                .updateButton(i, action),
          ),
        ),
      ],
    );
  }
}
