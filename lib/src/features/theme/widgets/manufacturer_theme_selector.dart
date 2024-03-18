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

import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A button for selecting which color theme to apply.
///
/// Shows a popu menu with the alternatives when tapped.
class ManufacturerThemeSelector extends ConsumerWidget {
  /// A button for selecting which color theme to apply.
  ///
  /// Shows a popu menu with the alternatives when tapped.
  const ManufacturerThemeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return PopupMenuButton<ManufacturerColors>(
      onSelected: (ManufacturerColors scheme) =>
          ref.read(manufacturerProvider.notifier).update(scheme),
      initialValue: ref.read(manufacturerProvider),
      itemBuilder: (BuildContext context) => ManufacturerColors.values
          .map(
            (scheme) => PopupMenuItem<ManufacturerColors>(
              value: scheme,
              child: ListTile(
                leading: Icon(
                  Icons.lens,
                  color: ManufacturerSchemes.scheme(
                    scheme,
                    theme.brightness,
                  ).primary,
                  size: 35,
                ),
                title: Text(scheme.name),
              ),
            ),
          )
          .toList(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.lens,
              color: theme.colorScheme.secondary,
              size: 40,
            ),
            Icon(
              Icons.color_lens,
              color: theme.primaryColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
