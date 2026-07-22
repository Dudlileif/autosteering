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
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiver/strings.dart';

/// A page for configuring the equipment type and set a name for the equipment.
class EquipmentNamePage extends ConsumerStatefulWidget {
  /// A page for configuring the equipment type and set a name for the
  /// equipment.
  const EquipmentNamePage({super.key});

  @override
  ConsumerState<EquipmentNamePage> createState() => _EquipmentNamePageState();
}

class _EquipmentNamePageState extends ConsumerState<EquipmentNamePage> {
  late final nameController = TextEditingController(
    text: ref.watch(configuredEquipmentProvider.select((value) => value.name)),
  );

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      return TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.label_outline),
                          labelText: strings.name,
                        ),
                        controller: nameController,
                        onFieldSubmitted: ref
                            .read(configuredEquipmentProvider.notifier)
                            .updateName,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) => isBlank(value)
                            ? strings.noNameEnteredValue(
                                strings.equipment.toLowerCase(),
                              )
                            : null,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) => switch (ref.watch(
              configuredEquipmentProvider.select(
                (value) => isBlank(value.name),
              ),
            )) {
              true => child ?? const SizedBox.shrink(),
              false => const SizedBox.shrink(),
            },
            child: Text(
              'Please enter a name so that the equipment can be saved!',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
