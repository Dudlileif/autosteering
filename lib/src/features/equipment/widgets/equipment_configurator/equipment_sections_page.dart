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

    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Center(child: EquipmentConfiguratorPreviousButton()),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Number of sections',
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.numbers),
                  labelText: 'Number of sections',
                ),
                keyboardType: TextInputType.number,
                initialValue: ref.read(
                  configuredEquipmentProvider
                      .select((value) => value.sections.length.toString()),
                ),
                onChanged: (value) {
                  final sections =
                      int.tryParse(value.replaceAll(',', '.')) ?? 1;

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
        ),
        if (equipment.sections.isNotEmpty) ...[
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Section widths',
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid.extent(
            maxCrossAxisExtent: 130,
            childAspectRatio: 1.8,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: equipment.sections
                .map(
                  (section) => TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Section ${section.index + 1} width',
                      suffixText: 'm',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    initialValue: section.width.toString(),
                    onChanged: (value) {
                      final newWidth =
                          double.tryParse(value.replaceAll(',', '.'));

                      if (newWidth != null) {
                        section.width = newWidth;
                        ref
                            .read(
                              configuredEquipmentProvider.notifier,
                            )
                            .update(equipment.copyWith());
                      }
                    },
                  ),
                )
                .toList(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Section working widths',
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid.extent(
            maxCrossAxisExtent: 130,
            childAspectRatio: 1.8,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: equipment.sections
                .map(
                  (section) => TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Section ${section.index + 1} width',
                      suffixText: 'm',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    initialValue: section.workingWidth.toString(),
                    onChanged: (value) {
                      final newWidth =
                          double.tryParse(value.replaceAll(',', '.'));

                      if (newWidth != null) {
                        section.workingWidth = newWidth;
                        ref
                            .read(
                              configuredEquipmentProvider.notifier,
                            )
                            .update(equipment.copyWith());
                      }
                    },
                  ),
                )
                .toList(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Button colors',
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid.extent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4.5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: equipment.sections
                .map(
                  (section) => DropdownMenu(

                    label: Text('Section ${section.index + 1} button color'),
                    leadingIcon: Icon(
                      Icons.color_lens,
                      color: section.color ?? Colors.green,
                    ),
                    initialSelection: section.color,
                    onSelected: (color) {
                      section.color = color;
                      ref.read(configuredEquipmentProvider.notifier).update(
                            equipment.copyWith(),
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
                        trailingIcon: section.color == null
                            ? const Icon(Icons.check)
                            : null,
                      ),
                      ...Colors.primaries.mapIndexed(
                        (index, color) => DropdownMenuEntry(
                          value: color,
                          label: PrimaryColorNamesExtension
                              .primaryColorNames[index],
                          leadingIcon: Icon(Icons.color_lens, color: color),
                          trailingIcon: section.color == color
                              ? const Icon(Icons.check)
                              : null,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Worked path colors',
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid.extent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4.5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: equipment.sections
                .map(
                  (section) => DropdownMenu(
                    label: Text('Section ${section.index + 1} path color'),
                    leadingIcon: Icon(
                      Icons.color_lens,
                      color: section.workedPathColor ?? theme.primaryColor,
                    ),
                    initialSelection: section.workedPathColor,
                    onSelected: (color) {
                      section.workedPathColor = color;
                      ref.read(configuredEquipmentProvider.notifier).update(
                            equipment.copyWith(),
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
                            ? const Icon(Icons.check)
                            : null,
                      ),
                      ...Colors.primaries.mapIndexed(
                        (index, color) => DropdownMenuEntry(
                          value: color,
                          label: PrimaryColorNamesExtension
                              .primaryColorNames[index],
                          leadingIcon: Icon(Icons.color_lens, color: color),
                          trailingIcon: section.workedPathColor == color
                              ? const Icon(Icons.check)
                              : null,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: EquipmentConfiguratorNextButton()),
          ),
        ),
      ],
    );
  }
}
