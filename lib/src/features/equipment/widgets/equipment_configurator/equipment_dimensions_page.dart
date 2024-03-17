import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the equipment's dimensions.
class EquipmentDimensionsPage extends ConsumerWidget {
  /// A page for configuring the equipment's dimensions.
  const EquipmentDimensionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipment = ref.watch(configuredEquipmentProvider);

    final children = [
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Equipment tow/drawbar length',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider
              .select((value) => value.drawbarLength.toString()),
        ),
        onChanged: (value) {
          final length = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment.copyWith(drawbarLength: length?.abs()));
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Working area length',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider
              .select((value) => value.workingAreaLength.toString()),
        ),
        onChanged: (value) {
          final width = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment.copyWith(workingAreaLength: width?.abs()));
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: RotatedBox(quarterTurns: 1, child: Icon(Icons.expand)),
          labelText: 'Sideways offset (-left / +right)',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider
              .select((value) => value.sidewaysOffset.toString()),
        ),
        onChanged: (value) {
          final offset = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredEquipmentProvider.notifier)
              .update(equipment.copyWith(sidewaysOffset: offset));
        },
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: EquipmentConfiguratorPreviousButton(),
          ),
          ...children.map(
            (widget) => Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(width: 400, child: widget),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: EquipmentConfiguratorNextButton(),
          ),
        ],
      ),
    );
  }
}
