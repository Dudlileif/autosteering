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

import 'dart:math';

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A page for configuring the equipment's dimensions.
class EquipmentConnectorsPage extends ConsumerWidget {
  /// A page for configuring the equipment's dimensions.
  const EquipmentConnectorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final textTheme = TextTheme.of(context);
    final equipment = ref.watch(configuredEquipmentProvider);

    final children = [
      Text(
        strings.connectors(0),
        style: textTheme.titleLarge,
      ),
      ...equipment.connectors.map((c) => _ConnectorForm(connector: c)),
      ElevatedButton.icon(
        onPressed: () => ref
            .read(configuredEquipmentProvider.notifier)
            .update(
              equipment.copyWith(
                connectors: [
                  ...equipment.connectors,
                  Connector(
                    implementId: equipment.id,
                    lateralOffsetFromRef: 0,
                    longitudinalOffsetFromRef: 0,
                    type: .fixed,
                    relation: .parent,
                  ),
                ],
              ),
            ),
        label: Text(strings.addConnector),
        icon: const Icon(Symbols.add_rounded),
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: children
            .map(
              (widget) => ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: widget,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ConnectorForm extends ConsumerWidget {
  const _ConnectorForm({required this.connector});
  final Connector connector;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 8,
      children: [
        _ConnectorTypeSelector(onSelected: (type) {}, selected: connector.type),
      ],
    );
  }
}

/// The actual selector part of the page.
class _ConnectorTypeSelector extends StatelessWidget {
  /// The actual selector part of the page.
  const _ConnectorTypeSelector({
    required this.onSelected,
    required this.selected,
  });

  final void Function(ConnectorType type) onSelected;
  final ConnectorType selected;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) => SegmentedButton<ConnectorType>(
        showSelectedIcon: false,
        style: theme.segmentedButtonTheme.style?.copyWith(
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
          padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
          iconSize: WidgetStatePropertyAll(
            min(100, constraints.biggest.shortestSide / 4),
          ),
          iconColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return theme.primaryColor;
            }
            return null;
          }),
          textStyle: WidgetStatePropertyAll(
            theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onSelectionChanged: (values) => onSelected(values.first),
        selected: {selected},
        segments: [
          ButtonSegment(
            value: .fixed,
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  strings.connectorType(ConnectorType.fixed.name),
                  textAlign: TextAlign.center,
                ),
                // TODO(dudlileif): Make three point hitch drawing
                const Icon(Icons.workspaces),
              ],
            ),
          ),
          ButtonSegment(
            value: .drawbar,
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  strings.connectorType(ConnectorType.drawbar.name),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                // TODO(dudlileif): Make drawbar drawing
                const Icon(Icons.commit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
