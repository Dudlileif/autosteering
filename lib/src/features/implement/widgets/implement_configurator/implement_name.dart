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

import 'package:autosteering/src/features/implement/implement.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiver/strings.dart';

/// A widget for setting the name on an implement.
class ImplementName extends ConsumerStatefulWidget {
  /// A widget setting the name on an implement.
  const ImplementName({super.key});

  @override
  ConsumerState<ImplementName> createState() => _ImplementNameState();
}

class _ImplementNameState extends ConsumerState<ImplementName> {
  late final nameController = TextEditingController(
    text: ref.watch(configuredImplementProvider.select((value) => value.name)),
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

    return Padding(
      padding: const .all(8),
      child: Column(
        spacing: 8,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
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
                      onChanged: ref
                          .read(configuredImplementProvider.notifier)
                          .updateName,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.always,
                    );
                  },
                ),
              ],
            ),
          ),
          Consumer(
            builder: (context, ref, child) => AnimatedSize(
              duration: Durations.medium2,
              curve: Easing.standard,
              child: switch (ref.watch(
                configuredImplementProvider.select((i) => isBlank(i.name)),
              )) {
                true => child ?? const SizedBox.shrink(),
                false => const SizedBox(
                  width: double.maxFinite,
                ),
              },
            ),
            child: Text(
              strings.noNameEnteredValue(
                strings.implementDetermined.toLowerCase(),
              ),
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
