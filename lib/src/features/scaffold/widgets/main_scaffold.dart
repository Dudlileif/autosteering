import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/network/widgets/widgets.dart';
import 'package:agopengps_flutter/src/features/scaffold/widgets/debug_menu.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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
              const GuidanceMenu(),
              const VehicleMenu(),
              if (!Device.isWeb) const NetworkMenu(),
              const DebugMenu(),
              const SimMenu(),
              const ThemeMenu(),
            ],
          ),
        ),
      ),
      body: const MapAndGaugeStackView(),
    );
  }
}
