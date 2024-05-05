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
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/theme/utils/utils.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the equipment's sections.
class EquipmentSectionsPage extends ConsumerWidget {
  /// A page for configuring the equipment's sections.
  const EquipmentSectionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final equipment = ref.watch(configuredEquipmentProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Number of sections',
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: TextFormField(
              controller: TextEditingController(
                text: ref.read(
                  configuredEquipmentProvider
                      .select((value) => value.sections.length.toString()),
                ),
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.numbers),
                labelText: 'Number of sections',
              ),
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                final sections = int.tryParse(value.replaceAll(',', '.')) ?? 1;

                ref.read(configuredEquipmentProvider.notifier).update(
                      equipment.copyWith(
                        sections: List.generate(
                          sections,
                          (index) => Section(index: index),
                        ),
                      ),
                    );
              },
            ),
          ),
        ),
        Center(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              IntrinsicWidth(
                child: CheckboxListTile(
                  value: ref.read(
                    configuredEquipmentProvider.select(
                      (value) =>
                          value.sections.isNotEmpty &&
                          value.sections.every(
                            (element) =>
                                element.width == value.sections.first.width,
                          ),
                    ),
                  ),
                  enabled: equipment.sections.length >= 2,
                  onChanged: (value) => value != null
                      ? ref.read(configuredEquipmentProvider.notifier).update(
                            equipment.copyWith(
                              sections: equipment.sections
                                  .map(
                                    (section) => section.copyWith(
                                      width: equipment.sections.first.width,
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                      : null,
                  title: const Text('Equal widths'),
                ),
              ),
              IntrinsicWidth(
                child: CheckboxListTile(
                  value: ref.read(
                    configuredEquipmentProvider.select(
                      (value) =>
                          value.sections.isNotEmpty &&
                          value.sections.every(
                            (element) =>
                                element.workingWidth ==
                                value.sections.first.workingWidth,
                          ),
                    ),
                  ),
                  enabled: equipment.sections.length >= 2,
                  onChanged: (value) => value != null
                      ? ref.read(configuredEquipmentProvider.notifier).update(
                            equipment.copyWith(
                              sections: equipment.sections
                                  .map(
                                    (section) => section.copyWith(
                                      workingWidth:
                                          equipment.sections.first.workingWidth,
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                      : null,
                  title: const Text('Equal working widths'),
                ),
              ),
            ],
          ),
        ),
        if (equipment.sections.isNotEmpty)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Builder(
                builder: (context) {
                  final controller = ScrollController();
                  return Column(
                    children: [
                      ListenableBuilder(
                        listenable: controller,
                        builder: (context, child) => switch ((controller
                                    .positions.firstOrNull?.maxScrollExtent ??
                                0) >
                            0) {
                          true => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () => controller.animateTo(
                                    0,
                                    duration: Durations.long4,
                                    curve: Curves.easeInOutCubicEmphasized,
                                  ),
                                  child: const Text('1'),
                                ),
                                TextButton(
                                  onPressed: () => controller.animateTo(
                                    controller.positions.first.maxScrollExtent /
                                        2,
                                    duration: Durations.long4,
                                    curve: Curves.easeInOutCubicEmphasized,
                                  ),
                                  child: Text(
                                    '${(equipment.sections.length / 2).ceil()}',
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.animateTo(
                                      controller
                                          .positions.first.maxScrollExtent,
                                      duration: Durations.long4,
                                      curve: Curves.easeInOutCubicEmphasized,
                                    );
                                  },
                                  child: Text('${equipment.sections.length}'),
                                ),
                              ],
                            ),
                          false => const SizedBox.shrink(),
                        },
                      ),
                      Expanded(
                        child: Scrollbar(
                          scrollbarOrientation: ScrollbarOrientation.top,
                          controller: controller,
                          interactive: Device.isDesktop || Device.isWeb,
                          thumbVisibility: Device.isDesktop || Device.isWeb,
                          trackVisibility: Device.isDesktop || Device.isWeb,
                          radius: const Radius.circular(8),
                          child: CustomScrollView(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            slivers: [
                              SliverList.builder(
                                itemCount: equipment.sections.length,
                                itemBuilder: (context, index) {
                                  return _SectionConfigurator(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

class _SectionConfigurator extends ConsumerWidget {
  const _SectionConfigurator(this.index);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section = ref.watch(
      configuredEquipmentProvider
          .select((value) => value.sections.elementAtOrNull(index)),
    );
    if (section == null) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: TextEditingController(text: '${section.width}'),
                    decoration: InputDecoration(
                      labelText: 'Section ${section.index + 1} width',
                      suffixText: 'm',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                onFieldSubmitted: (value) {
                      final newWidth =
                          double.tryParse(value.replaceAll(',', '.'));

                      if (newWidth != null) {
                        section.width = newWidth;
                        ref
                            .read(
                              configuredEquipmentProvider.notifier,
                            )
                        .updateSection(
                          section,
                        );
                      }
                    },
              ),

              TextFormField(
                controller:
                    TextEditingController(text: '${section.workingWidth}'),
                    decoration: InputDecoration(
                      labelText: 'Section ${section.index + 1} width',
                      suffixText: 'm',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                onFieldSubmitted: (value) {
                  final newWidth = double.tryParse(
                    value.replaceAll(',', '.'),
                  );
                  
                      if (newWidth != null) {
                        section.workingWidth = newWidth;
                        ref
                            .read(
                              configuredEquipmentProvider.notifier,
                            )
                        .updateSection(
                          section,
                        );
                      }
                    },
                  
              ),
              DropdownMenu(
                label: Text(
                  'Section ${section.index + 1} button color',
                ),
                leadingIcon: Icon(
                  Icons.color_lens,
                  color: section.color ?? Colors.green,
                ),
                initialSelection: section.color,
                onSelected: (color) {
                  section.color = color;
                  ref
                      .read(
                        configuredEquipmentProvider.notifier,
                      )
                      .updateSection(
                        section,
                      );
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    value: null,
                    label: 'Default',
                    leadingIcon: const Icon(
                      Icons.color_lens,
                      color: Colors.green,
                    ),
                    trailingIcon:
                        section.color == null ? const Icon(Icons.check) : null,
                  ),
                  ...Colors.primaries.mapIndexed(
                    (index, color) => DropdownMenuEntry(
                      value: color,
                      label:
                          PrimaryColorNamesExtension.primaryColorNames[index],
                      leadingIcon: Icon(
                        Icons.color_lens,
                        color: color,
                      ),
                      trailingIcon: section.color == color
                          ? const Icon(
                              Icons.check,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
              DropdownMenu(
                label: Text(
                  'Section ${section.index + 1} path color',
                ),
                leadingIcon: Icon(
                  Icons.color_lens,
                  color: section.workedPathColor ?? theme.primaryColor,
                ),
                initialSelection: section.workedPathColor,
                onSelected: (color) {
                  section.workedPathColor = color;
                  ref
                      .read(
                        configuredEquipmentProvider.notifier,
                      )
                      .updateSection(
                        section,
                      );
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    value: null,
                    label: 'Default',
                    leadingIcon: Icon(
                      Icons.color_lens,
                      color: theme.primaryColor,
                    ),
                    trailingIcon: section.workedPathColor == null
                        ? const Icon(
                            Icons.check,
                          )
                        : null,
                  ),
                  ...Colors.primaries.mapIndexed(
                    (index, color) => DropdownMenuEntry(
                      value: color,
                      label:
                          PrimaryColorNamesExtension.primaryColorNames[index],
                      leadingIcon: Icon(
                        Icons.color_lens,
                        color: color,
                      ),
                      trailingIcon: section.workedPathColor == color
                          ? const Icon(
                              Icons.check,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ]
                .map(
                  (child) => Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: child,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
