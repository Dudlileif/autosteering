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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/implement/implement.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A page for configuring the implement's dimensions.
class ImplementConnectorsPage extends ConsumerWidget {
  /// A page for configuring the implement's dimensions.
  const ImplementConnectorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    final implement = ref.watch(configuredImplementProvider);

    final children = [
      Text(
        strings.connectors(0),
        style: textTheme.titleLarge,
      ),
      Column(
        children: ListTile.divideTiles(
          context: context,
          tiles: implement.connectors.mapIndexed(
            (index, connector) => ExpansionTile(
              backgroundColor: colorScheme.surfaceContainerHighest,
              title: Text('${strings.connectors(1)} ${index + 1}'),
              children: [_ConnectorForm(connector: connector, index: index)],
            ),
          ),
        ).toList(),
      ),
      ElevatedButton.icon(
        onPressed: () => ref
            .read(configuredImplementProvider.notifier)
            .update(
              implement.copyWith(
                connectors: [
                  ...implement.connectors,
                  Connector(
                    implementId: implement.id,
                    lateralOffsetFromRef: 0,
                    longitudinalOffsetFromRef: 0,
                    type: .fixed,
                    relation: .child,
                  ),
                ],
              ),
            ),
        label: Text(strings.addConnector),
        icon: const Icon(Symbols.add_rounded),
      ),
    ];

    return SingleChildScrollView(
      padding: const .all(8),
      child: Column(
        spacing: 8,
        children: children
            .map(
              (widget) => ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: widget,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ConnectorForm extends ConsumerWidget {
  const _ConnectorForm({required this.connector, required this.index});
  final Connector connector;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    return Column(
      spacing: 8,
      children: [
        Column(
          crossAxisAlignment: .stretch,
          spacing: 8,
          children: [
            _ConnectorTypeSelector(
              onSelected: (type) => ref
                  .read(configuredImplementProvider.notifier)
                  .updateConnector(
                    connector.copyWith(type: type),
                    index: index,
                  ),
              selected: connector.type,
            ),
            _ConnectorRelationSelector(
              onSelected: (relation) => ref
                  .read(configuredImplementProvider.notifier)
                  .updateConnector(
                    connector.copyWith(relation: relation),
                    index: index,
                  ),
              selected: connector.relation,
            ),
            Flex(
              spacing: 8,
              direction: .horizontal,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(
                      text: NumberFormat.decimalPatternDigits(
                        locale: strings.localeName,
                        decimalDigits: 2,
                      ).format(connector.lateralOffsetFromRef),
                    ),
                    textAlign: .end,
                    decoration: InputDecoration(
                      labelText: strings.lateralOffset,
                      suffixText: 'm',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                    onFieldSubmitted: (value) {
                      final lateralOffset = double.tryParse(value.numberInput);

                      if (lateralOffset != null) {
                        ref
                            .read(configuredImplementProvider.notifier)
                            .updateConnector(
                              connector.copyWith(
                                lateralOffsetFromRef: lateralOffset,
                              ),
                              index: index,
                            );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(
                      text: NumberFormat.decimalPatternDigits(
                        locale: strings.localeName,
                        decimalDigits: 2,
                      ).format(connector.longitudinalOffsetFromRef),
                    ),
                    textAlign: .end,
                    decoration: InputDecoration(
                      labelText: strings.longitudinalOffset,
                      suffixText: 'm',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                    onFieldSubmitted: (value) {
                      final longitudinalOffset = double.tryParse(
                        value.numberInput,
                      );

                      if (longitudinalOffset != null) {
                        ref
                            .read(configuredImplementProvider.notifier)
                            .updateConnector(
                              connector.copyWith(
                                longitudinalOffsetFromRef: longitudinalOffset,
                              ),
                              index: index,
                            );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () => ref
              .read(configuredImplementProvider.notifier)
              .removeConnector(index),
          label: Text(
            strings.deleteValue(strings.connectors(1).toLowerCase()),
          ),
          icon: const Icon(Symbols.delete_forever_rounded),
        ),
      ],
    );
  }
}

/// A [SegmentedButton] for selecting [ConnectorType].
class _ConnectorTypeSelector extends StatelessWidget {
  /// A [SegmentedButton] for selecting [ConnectorType].
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
              borderRadius: .all(.circular(16)),
            ),
          ),
          padding: const WidgetStatePropertyAll(.all(8)),
          iconSize: WidgetStatePropertyAll(
            min(40, constraints.biggest.shortestSide / 4),
          ),
          textStyle: WidgetStatePropertyAll(
            theme.textTheme.bodyLarge?.copyWith(
              fontWeight: .bold,
            ),
          ),
        ),
        onSelectionChanged: (values) => onSelected(values.first),
        selected: {selected},
        segments: [
          ButtonSegment(
            value: .fixed,
            label: Column(
              mainAxisSize: .min,
              children: [
                Text(
                  strings.connectorType(ConnectorType.fixed.name),
                  textAlign: .center,
                ),
                // TODO(dudlileif): Make three point hitch drawing
                const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Symbols.share_rounded),
                ),
              ],
            ),
          ),
          ButtonSegment(
            value: .drawbar,
            label: Column(
              mainAxisSize: .min,
              children: [
                Text(
                  strings.connectorType(ConnectorType.drawbar.name),
                  textAlign: .center,
                ),
                // TODO(dudlileif): Make drawbar drawing
                const Icon(Symbols.line_start_circle_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A [SegmentedButton] for selecting [ConnectorRelation].
class _ConnectorRelationSelector extends StatelessWidget {
  /// A [SegmentedButton] for selecting [ConnectorRelation].
  const _ConnectorRelationSelector({
    required this.onSelected,
    required this.selected,
  });

  final void Function(ConnectorRelation type) onSelected;
  final ConnectorRelation selected;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) => SegmentedButton<ConnectorRelation>(
        showSelectedIcon: false,
        style: theme.segmentedButtonTheme.style?.copyWith(
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: .all(.circular(16)),
            ),
          ),
          padding: const WidgetStatePropertyAll(.all(8)),
          iconSize: WidgetStatePropertyAll(
            min(40, constraints.biggest.shortestSide / 4),
          ),
          textStyle: WidgetStatePropertyAll(
            theme.textTheme.bodyLarge?.copyWith(
              fontWeight: .bold,
            ),
          ),
          foregroundColor: const WidgetStateProperty.fromMap(
            <WidgetState, Color>{.selected: Colors.black},
          ),
          iconColor: const WidgetStateProperty.fromMap(
            <WidgetState, Color>{.selected: Colors.black},
          ),
          backgroundColor: WidgetStateProperty.fromMap(<WidgetState, Color>{
            .selected: switch (selected) {
              .parent => Colors.blueAccent,
              .child => Colors.yellowAccent,
            },
          }),
        ),
        onSelectionChanged: (values) => onSelected(values.first),
        selected: {selected},
        segments: [
          ButtonSegment(
            value: .parent,
            label: Column(
              mainAxisSize: .min,
              children: [
                Text(
                  strings.connectorRelation(ConnectorRelation.parent.name),
                  textAlign: .center,
                ),
                const Icon(Symbols.switch_right_rounded),
              ],
            ),
          ),
          ButtonSegment(
            value: .child,
            label: Column(
              mainAxisSize: .min,
              children: [
                Text(
                  strings.connectorRelation(ConnectorRelation.child.name),
                  textAlign: .center,
                ),
                const Icon(Symbols.switch_left_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
