import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';

/// The main scaffold widget surrounding the main content of the application.
class MainScaffold extends StatelessWidget {
  /// The main scaffold widget surrounding the main content of the application.
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Focus(
          canRequestFocus: false,
          descendantsAreFocusable: false,
          descendantsAreTraversable: false,    
          child: MenuBar(
            children: [
              const MapMenu(),
              const FieldMenu(),
              const GuidanceMenu(),
              const VehicleMenu(),
              const EquipmentMenu(),
              if (Device.isNative) const HardwareMenu(),
              const SimCoreMenu(),
              const ThemeMenu(),
            ],
          ),
        ),
        actions: [
          if (Device.isNative)
          const Padding(
            padding: EdgeInsets.all(8),
            child: HardwareStatusIcon(size: 32),
          ),
          
          if (Device.isNative)
          const Focus(
            canRequestFocus: false,
            descendantsAreFocusable: false,
            descendantsAreTraversable: false,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: MotorStatusIcon(size: 32),
            ),
          ),
          if (Device.isNative)
            const Focus(
              canRequestFocus: false,
              descendantsAreFocusable: false,
              descendantsAreTraversable: false,
              child: Padding(
              padding: EdgeInsets.all(8),
              child: GnssQualityStatusIcon(size: 32),
              ),
            ),
        ],
      ),
      body: const MapAndGaugeStackView(),
    );
  }
}
