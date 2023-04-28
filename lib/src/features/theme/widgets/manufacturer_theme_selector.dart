import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManufacturerThemeSelector extends ConsumerWidget {
  const ManufacturerThemeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  color: Theme.of(context).brightness == Brightness.light
                      ? ManufacturerSchemes.scheme(scheme, Brightness.light)
                          .primary
                      : ManufacturerSchemes.scheme(scheme, Brightness.dark)
                          .primary,
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
              color: Theme.of(context).colorScheme.secondary,
              size: 40,
            ),
            Icon(
              Icons.color_lens,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
