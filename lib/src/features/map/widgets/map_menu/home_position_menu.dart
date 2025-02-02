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

import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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

              return SelectableText.rich(
                TextSpan(
                  text: 'Lat:',
                  style: GoogleFonts.robotoMono(textStyle: textStyle),
                  children: [
                    TextSpan(
                      text:
                          '''${position.latitude.toStringAsFixed(9).padLeft(14)}°''',
                      style: GoogleFonts.robotoMono(textStyle: textStyle),
                    ),
                    TextSpan(
                      text: '\nLon:',
                      style: GoogleFonts.robotoMono(textStyle: textStyle),
                      children: [
                        TextSpan(
                          text:
                              '''${position.longitude.toStringAsFixed(9).padLeft(14)}°''',
                          style: GoogleFonts.robotoMono(textStyle: textStyle),
                        ),
                      ],
                    ),
                  ],
                ),
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
      ref.watch(homePositionProvider.select((value) => value.latitude));
  late double? lon =
      ref.watch(homePositionProvider.select((value) => value.longitude));

  @override
  Widget build(BuildContext context) => SimpleDialog(
      title: const Text('Enter home position'),
      contentPadding:
          const EdgeInsets.only(left: 24, top: 12, right: 24, bottom: 16),
      children: [
        Consumer(
            builder: (context, ref, child) {
              return TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.navigation),
                  labelText: 'Latitude (N/S)',
                  suffixText: '°',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                initialValue: (lat ?? 0).toStringAsFixed(9),
                onChanged: (value) {
                  final updated =
                      clampDouble(
                    double.tryParse(value.replaceAll(',', '.')) ?? 0,
                    -90,
                    90,
                  );
                  setState(() => lat = updated);
                },
              );
            },
          ),
        
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Consumer(
            builder: (context, ref, child) {
              return TextFormField(
                decoration: const InputDecoration(
                  icon: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.navigation),
                  ),
                  labelText: 'Longitude (E/W)',
                  suffixText: '°',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                initialValue: (lon ?? 0).toStringAsFixed(9),
                onChanged: (value) {
                  final updated =
                        clampDouble(
                      double.tryParse(value.replaceAll(',', '.')) ?? 0,
                      -180,
                      180,
                    );
                  setState(() => lon = updated);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
            children: [
                ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.clear),
                  label: const Text('Cancel'),
              ),
              Consumer(
                  builder: (context, ref, child) => FilledButton.icon(
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
                    icon: const Icon(Icons.check),
                    label: const Text('Use entered position'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      );
}
