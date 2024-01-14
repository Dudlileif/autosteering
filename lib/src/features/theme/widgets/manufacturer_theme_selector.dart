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

    return PopupMenuButton<ManufacturerColor>(
      onSelected: (ManufacturerColor scheme) =>
          ref.read(manufacturerProvider.notifier).update(scheme),
      initialValue: ref.read(manufacturerProvider),
      itemBuilder: (BuildContext context) => ManufacturerColor.values
          .map(
            (scheme) => PopupMenuItem<ManufacturerColor>(
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
