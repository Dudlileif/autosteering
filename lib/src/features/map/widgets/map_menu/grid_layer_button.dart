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

/// A menu button for toggling the grid layer.
class GridLayerButton extends StatelessWidget {
  /// A menu button for toggling the grid layer.
  const GridLayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return Consumer(
      child: Text(
        'Show grid',
        softWrap: false,
        style: textStyle,
      ),
      builder: (context, ref, child) {
        final showLayerButton = CheckboxListTile(
          value: ref.watch(showGridLayerProvider),
          onChanged: (value) => value != null
              ? ref.read(showGridLayerProvider.notifier).update(value: value)
              : null,
          title: child,
          secondary: const Icon(Icons.grid_3x3),
        );
        if (ref.watch(showGridLayerProvider)) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showLayerButton,
              CheckboxListTile(
                value: ref.watch(showGridSizeIndicatorProvider),
                onChanged: (value) => value != null
                    ? ref
                        .read(showGridSizeIndicatorProvider.notifier)
                        .update(value: value)
                    : null,
                title: Text(
                  'Show size indicator',
                  style: textStyle,
                ),
                secondary: const Icon(Icons.grid_3x3),
              ),
            ],
          );
        }
        return showLayerButton;
      },
    );
  }
}
