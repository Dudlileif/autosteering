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
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A settings menu for map, sim core and theme settings.
class SettingsMenu extends StatelessWidget {
  /// A settings menu for map, sim core and theme settings.
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuButtonWithChildren(
      icon: Icons.settings,
      text: 'Settings',
      menuChildren: [
        MapMenu(),
        SimCoreMenu(),
        ThemeMenu(),
        _ExportLogsButton(),
        _LicenseButton(),
      ],
    );
  }
}

class _ExportLogsButton extends ConsumerWidget {
  const _ExportLogsButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuItemButton(
      onPressed: () => ref.read(exportLogsProvider),
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Symbols.export_notes),
      ),
      child: Text(
        'Export logs',
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
    );
  }
}

class _LicenseButton extends StatelessWidget {
  const _LicenseButton();

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      closeOnActivate: false,
      leadingIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Symbols.info),
      ),
      child: Text(
        'About',
        style: Theme.of(context).menuButtonWithChildrenText,
      ),
      onPressed: () => showAboutDialog(
        context: context,
        applicationName: 'Autosteering',
        applicationVersion: '0.1.0',
        applicationLegalese: '''
Copyright (C) 2024 Gaute Hagen

Autosteering is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Autosteering is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Autosteering. If not, see https://www.gnu.org/licenses/.
''',
      ),
    );
  }
}
