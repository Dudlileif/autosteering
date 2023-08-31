import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the equipment's sections.
class EquipmentSectionsPage extends ConsumerWidget {
  /// A page for configuring the equipment's sections.
  const EquipmentSectionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipment = ref.watch(configuredEquipmentProvider);

    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: EquipmentConfiguratorPreviousButton(),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 400,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.numbers),
                  labelText: 'Number of sections',
                ),
                keyboardType: TextInputType.number,
                initialValue: ref.read(
                  configuredEquipmentProvider
                      .select((value) => value.sections.toString()),
                ),
                onChanged: (value) {
                  final sections = int.tryParse(value.replaceAll(',', '.'));

                  ref.read(configuredEquipmentProvider.notifier).update(
                        equipment.copyWith(
                          sections: sections?.abs() ?? 1,
                          sectionWidths:
                              List.generate(sections?.abs() ?? 1, (index) => 3),
                        ),
                      );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 400,
                child: GridView.extent(
                  maxCrossAxisExtent: 130,
                  childAspectRatio: 1.8,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: equipment.sectionWidths
                      .mapIndexed(
                        (section, width) => TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Section ${section + 1} width',
                            suffixText: 'm',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          initialValue:
                              equipment.sectionWidths[section].toString(),
                          onChanged: (value) {
                            final newWidth =
                                double.tryParse(value.replaceAll(',', '.'));

                            ref
                                .read(configuredEquipmentProvider.notifier)
                                .update(
                                  equipment.copyWith(
                                    sectionWidths: equipment.sectionWidths
                                      ..replaceRange(
                                        section,
                                        section + 1,
                                        [newWidth ?? width],
                                      ),
                                  ),
                                );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: EquipmentConfiguratorNextButton(),
          ),
        ],
      ),
    );
  }
}
