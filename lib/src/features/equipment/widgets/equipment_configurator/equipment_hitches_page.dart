import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the equipment's hitches.
class EquipmentHitchesPage extends ConsumerWidget {
  /// A page for configuring the equipment's hitches.
  const EquipmentHitchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipment = ref.watch(configuredEquipmentProvider);

    final children = [
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Hitch to front fixed hitch distance',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.hitchToChildFrontFixedHitchLength?.toString(),
          ),
        ),
        onChanged: (value) {
          final distance = double.tryParse(value.replaceAll(',', '.'));

          ref.read(configuredEquipmentProvider.notifier).update(
                equipment..hitchToChildFrontFixedHitchLength = distance?.abs(),
              );
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Hitch to rear fixed hitch distance',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.hitchToChildRearFixedHitchLength?.toString(),
          ),
        ),
        onChanged: (value) {
          final distance = double.tryParse(value.replaceAll(',', '.'));

          ref.read(configuredEquipmentProvider.notifier).update(
                equipment..hitchToChildRearFixedHitchLength = distance?.abs(),
              );
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Hitch to rear towbar distance',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredEquipmentProvider.select(
            (value) => value.hitchToChildRearTowbarHitchLength?.toString(),
          ),
        ),
        onChanged: (value) {
          final distance = double.tryParse(value.replaceAll(',', '.'));

          ref.read(configuredEquipmentProvider.notifier).update(
                equipment..hitchToChildRearTowbarHitchLength = distance?.abs(),
              );
        },
      ),
    ];

    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: EquipmentConfiguratorPreviousButton(),
          ),
          ...children.map(
            (widget) => Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(width: 400, child: widget),
            ),
          ),
        ],
      ),
    );
  }
}
