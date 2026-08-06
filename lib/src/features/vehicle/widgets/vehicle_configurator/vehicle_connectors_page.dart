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
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A page for configuring the vehicle's dimensions.
class VehicleConnectorsPage extends ConsumerWidget {
  /// A page for configuring the vehicle's dimensions.
  const VehicleConnectorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    final vehicle = ref.watch(configuredVehicleProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const .all(8),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  strings.connectors(0),
                  style: textTheme.titleLarge,
                ),
              ),
            ),
          ),
          SliverList.separated(
            itemCount: vehicle.connectors.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => ExpansionTile(
              backgroundColor: colorScheme.surfaceContainerHighest,
              title: Text('${strings.connectors(1)} ${index + 1}'),
              children: [
                _ConnectorForm(
                  connector: vehicle.connectors[index],
                  index: index,
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const .only(top: 16),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () => ref
                      .read(configuredVehicleProvider.notifier)
                      .update(
                        vehicle.copyWith(
                          connectors: [
                            ...vehicle.connectors,
                            Connector(
                              vehicleId: vehicle.id,
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
              ),
            ),
          ),
        ],
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

    final numberFormatter = NumberFormat.decimalPatternDigits(
      locale: strings.localeName,
      decimalDigits: 2,
    ).format;

    return Column(
      spacing: 8,
      children: [
        Column(
          crossAxisAlignment: .stretch,
          spacing: 8,
          children: [
            _ConnectorTypeSelector(
              onSelected: (type) => ref
                  .read(configuredVehicleProvider.notifier)
                  .updateConnector(
                    connector.copyWith(type: type),
                    index: index,
                  ),
              selected: connector.type,
            ),
            Flex(
              spacing: 8,
              direction: .horizontal,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(
                      text: numberFormatter(connector.lateralOffsetFromRef),
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
                      if (double.tryParse(value.numberInput)
                          case final lateralOffset?) {
                        ref
                            .read(configuredVehicleProvider.notifier)
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
                      text: numberFormatter(
                        connector.longitudinalOffsetFromRef,
                      ),
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
                      if (double.tryParse(value.numberInput)
                          case final longitudinalOffset?) {
                        ref
                            .read(configuredVehicleProvider.notifier)
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
              .read(configuredVehicleProvider.notifier)
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
          foregroundColor: const WidgetStateProperty.fromMap(
            <WidgetState, Color>{.selected: Colors.black},
          ),
          iconColor: const WidgetStateProperty.fromMap(
            <WidgetState, Color>{.selected: Colors.black},
          ),
          backgroundColor: WidgetStateProperty.fromMap(<WidgetState, Color>{
            .selected: switch (selected) {
              .fixed => Colors.blueAccent,
              .drawbar => Colors.orangeAccent,
            },
          }),
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
