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

import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button for toggling the OpenStreetMap layer.
class OSMLayerButton extends StatelessWidget {
  /// A menu button for toggling the OpenStreetMap layer.
  const OSMLayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      child: Text(
        'OpenStreetMap',
        softWrap: false,
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
      builder: (context, ref, child) {
        return CheckboxListTile(
          value: ref.watch(showOSMLayerProvider),
          onChanged: (value) => value != null
              ? ref.read(showOSMLayerProvider.notifier).update(value: value)
              : null,
          secondary: child,
        );
      },
    );
  }
}
