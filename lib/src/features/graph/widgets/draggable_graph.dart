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

import 'package:autosteering/src/features/common/widgets/widgets.dart';
import 'package:autosteering/src/features/graph/graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A graph widget with a dropdown selector for which data to show.
class GraphWithSelector extends ConsumerWidget {
  /// A graph widget with a dropdown selector for which data to show.

  const GraphWithSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      color: Colors.transparent,
      child: SizedBox.square(
        dimension: 400,
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.7),
          appBar: AppBar(
            primary: false,
            title: const Text('Graph'),
            actions: [
              MenuAnchor(
                builder: (context, menuController, child) => IconButton(
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  onPressed: () => switch (menuController.isOpen) {
                    true => menuController.close(),
                    false => menuController.open()
                  },
                ),
                menuChildren: GraphParameter.values.map(
                  (parameter) {
                    final data = ref.watch(
                      graphActiveParametersProvider.select(
                        (value) => (
                          index: value.toList().indexOf(parameter),
                          length: value.length
                        ),
                      ),
                    );
                    final evenlySpreadIndex = (Colors.primaries.length *
                            data.index /
                            (data.length.clamp(1, double.infinity)))
                        .round();
                    return CheckboxListTile(
                      value: data.index >= 0,
                      selected: data.index >= 0,
                      onChanged: (value) => ref
                          .read(graphActiveParametersProvider.notifier)
                          .updateParameter(parameter, value: value),
                      title: Text(parameter.name),
                      activeColor: Colors.primaries[
                          evenlySpreadIndex % Colors.primaries.length],
                    );
                  },
                ).toList(),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return CloseButton(
                    onPressed: () => ref
                        .read(
                          showDraggableGraphProvider.notifier,
                        )
                        .update(value: false),
                  );
                },
              ),
            ],
          ),
          body: const Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: SizedBox.square(child: Graph()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A draggable version of [GraphWithSelector], typically used as a child of
/// a [Stack] that is a child of a [LayoutBuilder].
class DraggableGraph extends ConsumerWidget {
  /// A draggable version of [GraphWithSelector], typically used as a child of
  /// a [Stack] that is a child of a [LayoutBuilder].
  ///
  /// [constraints] are used to layout the widget.

  const DraggableGraph({required this.constraints, super.key});

  /// Constraints used to layout this widget.
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) => DynamicDraggableWidget(
        offset: ref.watch(draggableGraphUiOffsetProvider),
        constraints: constraints,
        onDragEnd: ref.read(draggableGraphUiOffsetProvider.notifier).update,
        child: const GraphWithSelector(),
      );
}
