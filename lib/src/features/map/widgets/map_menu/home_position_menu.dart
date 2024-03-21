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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

/// A menu for showing and updating the default home position.
class HomePositionMenu extends StatelessWidget {
  /// A menu for showing and updating the default home position.
  const HomePositionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      icon: Icons.home,
      text: 'Home',
      menuChildren: [
        Center(
          child: Consumer(
            builder: (context, ref, child) {
              final position = ref.watch(homePositionProvider);

              return SelectableText(
                '''
Lat: ${position.latitude.toStringAsFixed(9).padLeft(14)}°
Lon: ${position.longitude.toStringAsFixed(9).padLeft(14)}°''',
                style: textStyle?.copyWith(fontFamily: 'Monospace'),
              );
            },
          ),
        ),
        Consumer(
          child: Text(
            'Set to screen center',
            style: textStyle,
          ),
          builder: (context, ref, child) => MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Icon(Icons.map),
            onPressed: () {
              ref.read(homePositionProvider.notifier).update(
                    ref.watch(
                      mainMapControllerProvider
                          .select((value) => value.camera.center),
                    ),
                  );
              ref.read(currentCountryProvider.notifier).update();
            },
            child: child,
          ),
        ),
        MenuItemButton(
          closeOnActivate: false,
          leadingIcon: const Icon(Icons.edit),
          onPressed: () => showDialog<void>(
            context: context,
            builder: (context) => const _EnterHomePositionDialog(),
          ),
          child: Text(
            'Enter home position',
            style: textStyle,
          ),
        ),
      ],
    );
  }
}

class _EnterHomePositionDialog extends ConsumerStatefulWidget {
  const _EnterHomePositionDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnterHomePositionDialogState();
}

class _EnterHomePositionDialogState
    extends ConsumerState<_EnterHomePositionDialog> {
  late double? lat =
      ref.read(homePositionProvider.select((value) => value.latitude));
  late double? lon =
      ref.read(homePositionProvider.select((value) => value.longitude));

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return SimpleDialog(
      title: const Text('Enter home position'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) {
              return TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.navigation),
                  labelText: 'Latitude (N/S)',
                  suffixText: '°',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                initialValue: (lat ?? 0).toStringAsFixed(9),
                onChanged: (value) {
                  final updated =
                      (double.tryParse(value.replaceAll(',', '.')) ?? 0)
                          .clamp(-90.0, 90.0);
                  setState(() => lat = updated);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) {
              return TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.navigation),
                  labelText: 'Longitude (E/W)',
                  suffixText: '°',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                initialValue: (lon ?? 0).toStringAsFixed(9),
                onChanged: (value) {
                  final updated =
                      (double.tryParse(value.replaceAll(',', '.')) ?? 0)
                          .clamp(-180.0, 180.0);
                  setState(() => lon = updated);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: textStyle,
                ),
              ),
              Consumer(
                builder: (context, ref, child) => SimpleDialogOption(
                  onPressed: lat != null && lon != null
                      ? () {
                          if (lat != null && lon != null) {
                            ref
                                .read(homePositionProvider.notifier)
                                .update(LatLng(lat!, lon!));
                          }
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.check),
                      ),
                      Text(
                        'Use entered position',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
