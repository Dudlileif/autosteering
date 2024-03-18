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
Lat: ${position.latitude.toStringAsFixed(6)}
Lon: ${position.longitude.toStringAsFixed(6)}''',
                style: textStyle,
              );
            },
          ),
        ),
        Consumer(
          child: Text(
            'Set to screen center',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            title: child,
            onTap: () {
              ref.read(homePositionProvider.notifier).update(
                    ref.watch(
                      mainMapControllerProvider
                          .select((value) => value.camera.center),
                    ),
                  );
              ref.read(currentCountryProvider.notifier).update();
            },
          ),
        ),
      ],
    );
  }
}
