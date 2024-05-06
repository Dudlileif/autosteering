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
            'Sections',
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.left,
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
        if (equipment.sections.length >= 2)
          Center(
            child: Column(
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    IntrinsicWidth(
                      child: CheckboxListTile(
                        value:
                            ref.watch(configuredEquipmentEqualWidthsProvider),
                        enabled: equipment.sections.length >= 2,
                        onChanged: (value) => value != null
                            ? ref
                                .read(
                                  configuredEquipmentEqualWidthsProvider
                                      .notifier,
                                )
                                .update(value: value)
                            : null,
                        title: const Text('Equal widths'),
                      ),
                    ),
                    IntrinsicWidth(
                      child: CheckboxListTile(
                        value: ref.watch(
                          configuredEquipmentEqualWorkingWidthsProvider,
                        ),
                        enabled: equipment.sections.length >= 2,
                        onChanged: (value) => value != null
                            ? ref
                                .read(
                                  configuredEquipmentEqualWorkingWidthsProvider
                                      .notifier,
                                )
                                .update(value: value)
                            : null,
                        title: const Text('Equal working widths'),
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (ref.watch(configuredEquipmentEqualWidthsProvider))
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: TextFormField(
                          controller: TextEditingController(
                            text: '${equipment.sections.first.width}',
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Section width',
                            suffixText: 'm',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onFieldSubmitted: (value) {
                            final newWidth = double.tryParse(
                              value.replaceAll(',', '.'),
                            )?.abs();

                            if (newWidth != null) {
                              ref
                                  .read(
                                    configuredEquipmentProvider.notifier,
                                  )
                                  .update(
                                    equipment.copyWith(
                                      sections: equipment.sections
                                          .map(
                                            (section) =>
                                                section..width = newWidth,
                                          )
                                          .toList(),
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                    if (ref
                        .watch(configuredEquipmentEqualWorkingWidthsProvider))
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: TextFormField(
                          controller: TextEditingController(
                            text: '${equipment.sections.first.workingWidth}',
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Section working width',
                            suffixText: 'm',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onFieldSubmitted: (value) {
                            final newWidth = double.tryParse(
                              value.replaceAll(',', '.'),
                            )?.abs();

                            if (newWidth != null) {
                              ref
                                  .read(
                                    configuredEquipmentProvider.notifier,
                                  )
                                  .update(
                                    equipment.copyWith(
                                      sections: equipment.sections
                                          .map(
                                            (section) => section
                                              ..workingWidth = newWidth,
                                          )
                                          .toList(),
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                  ],
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
                            // cacheExtent: equipment.sections.length * 300,
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

    return SingleChildScrollView(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              if (!ref.watch(configuredEquipmentEqualWidthsProvider))
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
              if (!ref.watch(configuredEquipmentEqualWorkingWidthsProvider))
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
                menuStyle: const MenuStyle(alignment: Alignment.topCenter),
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
                      value: color.shade500,
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
                      value: color.shade500,
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
