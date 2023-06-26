import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EquipmentDebugLayer extends ConsumerWidget {
  const EquipmentDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(mainVehicleProvider);

    return Stack(
      children: [
        PolygonLayer(
          polygons: [
            if (vehicle.hitchFrontFixedChild is Equipment)
              if ((vehicle.hitchFrontFixedChild! as Equipment).polygons != null)
                ...(vehicle.hitchFrontFixedChild! as Equipment).polygons!,
            if (vehicle.hitchRearFixedChild is Equipment)
              if ((vehicle.hitchRearFixedChild! as Equipment).polygons != null)
                ...(vehicle.hitchRearFixedChild! as Equipment).polygons!,
            if (vehicle.hitchRearTowbarChild is Equipment)
              if ((vehicle.hitchRearTowbarChild! as Equipment).polygons != null)
                ...(vehicle.hitchRearTowbarChild! as Equipment).polygons!
          ],
        )
      ],
    );
  }
}
