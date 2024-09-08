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
import 'package:autosteering/src/features/graph/graph.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

/// A graphing widget for showing the change of different [GraphParameter]s
/// at the same time.
///
/// All values are normalized to the range [0,1] to be able to show multiple
/// parameters at once.
///
/// The actual values of the latest sample for each parameter is shown to
/// the right of the graph.
class Graph extends ConsumerWidget {
  /// A graphing widget for showing the change of different [GraphParameter]s
  /// at the same time.
  ///
  /// All values are normalized to the range [0,1] to be able to show multiple
  /// parameters at once.
  ///
  /// The actual values of the latest sample for each parameter is shown to
  /// the right of the graph.
  const Graph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final retainSeconds = ref.watch(graphRetainTimeSecondsProvider);
    final count = retainSeconds / 33e-3;
    final data = ref.watch(graphValuesProvider);

    return Row(
      children: [
        Expanded(
          child: LineChart(
            LineChartData(
              minY: 0,
              maxY: 1,
              minX: 0,
              maxX: count,
              borderData: FlBorderData(
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(),
                topTitles: const AxisTitles(),
                bottomTitles: const AxisTitles(),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 48,
                    getTitlesWidget: (value, meta) => Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        switch (value) {
                          1 => 'Max',
                          0.5 => 'Center',
                          0 => 'Min',
                          _ => ''
                        },
                      ),
                    ),
                    interval: 0.5,
                  ),
                ),
              ),
              gridData: FlGridData(
                checkToShowHorizontalLine: (value) => value == 0.5,
                checkToShowVerticalLine: (value) => (value / count) % 0.2 == 0,
              ),
              lineTouchData: const LineTouchData(
                enabled: false,
              ),
              lineBarsData: data.entries.mapIndexed(
                (index, entry) {
                  final evenlySpreadIndex = (Colors.primaries.length *
                          index /
                          (data.length.clamp(1, double.infinity)))
                      .round();
                  return LineChartBarData(
                    spots: entry.value
                        .mapIndexed(
                          (i, e) => switch (e) {
                            null => FlSpot.nullSpot,
                            _ => FlSpot(i.toDouble(), e.normalized)
                          },
                        )
                        .toList(),
                    dotData: FlDotData(
                      checkToShowDot: (spot, barData) =>
                          spot == barData.mostRightSpot,
                    ),
                    color: Colors
                        .primaries[evenlySpreadIndex % Colors.primaries.length],
                  );
                },
              ).toList(),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.entries.mapIndexed((index, entry) {
            final evenlySpreadIndex = (Colors.primaries.length *
                    index /
                    (data.length.clamp(1, double.infinity)))
                .round();
            var value = '';
            if (entry.value.last?.raw is double) {
              value = '${entry.value.last?.raw.toStringAsFixed(2).padLeft(6)}';
            } else if (entry.value.last?.raw is int) {
              value = '${entry.value.last?.raw}'.padLeft(6);
            }
            return TextWithStroke(
              value,
              style: GoogleFonts.robotoMono(
                color: Colors
                    .primaries[evenlySpreadIndex % Colors.primaries.length],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
