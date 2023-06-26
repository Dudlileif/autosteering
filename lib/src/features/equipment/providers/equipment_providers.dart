import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/simulator/providers/providers.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'equipment_providers.g.dart';

@Riverpod(keepAlive: true)
class ShowEquipment extends _$ShowEquipment {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state = !state);
}

@Riverpod(keepAlive: true)
class ConfiguredEquipment extends _$ConfiguredEquipment {
  @override
  Equipment build() => Equipment(hitchType: HitchType.fixed);

  void update(Equipment equipment) => Future(() => state = equipment);

  void attachToVehicle() => Future(
        () {
          state = state.copyWith(hitchParent: ref.watch(mainVehicleProvider));
          ref.read(simVehicleInputProvider.notifier).send(
                ref
                    .watch(mainVehicleProvider)
                    .copyWith(hitchRearFixedChild: state),
              );
        },
      );
}
