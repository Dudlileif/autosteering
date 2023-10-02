import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/network/network.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main scaffold widget surrounding the main content of the application.
class MainScaffold extends StatelessWidget {
  /// The main scaffold widget surrounding the main content of the application.
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Focus(
          canRequestFocus: false,
          descendantsAreFocusable: false,
          descendantsAreTraversable: false,
          child: MenuBar(
            children: [
              MapMenu(),
              FieldMenu(),
              GuidanceMenu(),
              VehicleMenu(),
              EquipmentMenu(),
              NetworkMenu(),
              SimCoreMenu(),
              ThemeMenu(),
            ],
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: _HWConnectionStatus(size: 32),
          ),
          if (!Device.isWeb)
            const Padding(
              padding: EdgeInsets.all(8),
              child: _GnssFixQualityStatus(size: 32),
            ),
        ],
      ),
      body: const MapAndGaugeStackView(),
    );
  }
}

class _HWConnectionStatus extends StatelessWidget {
  const _HWConnectionStatus({this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Tooltip(
        message: ref.watch(hardwareIsConnectedProvider)
            ? 'HW connected'
            : 'HW not connected',
        child: Icon(
          Icons.router,
          size: size,
          color: ref.watch(hardwareIsConnectedProvider)
              ? Colors.green
              : Colors.red,
          shadows: const [
            Shadow(offset: Offset(0, 1)),
          ],
        ),
      ),
    );
  }
}

class _GnssFixQualityStatus extends StatelessWidget {
  const _GnssFixQualityStatus({this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final fixQuality = ref.watch(gnssCurrentFixQualityProvider);
        final numSatellites = ref.watch(gnssCurrentNumSatellitesProvider) ?? 0;
        return Tooltip(
          message: fixQuality.name,
          child: Stack(
            children: [
              Align(
                child: Icon(
                  Icons.satellite_alt,
                  size: size,
                  color: switch (fixQuality) {
                    GnssFixQuality.rtk => Colors.green,
                    GnssFixQuality.floatRTK ||
                    GnssFixQuality.ppsFix =>
                      Colors.lime,
                    GnssFixQuality.differentialFix => Colors.yellow,
                    GnssFixQuality.fix => Colors.orange,
                    GnssFixQuality.notAvailable => Colors.red,
                    GnssFixQuality.manualInput => Colors.purple,
                    GnssFixQuality.simulation => Colors.blue,
                    GnssFixQuality.estimated => Colors.blueGrey,
                  },
                  shadows: const [
                    Shadow(offset: Offset(1, 0)),
                    Shadow(offset: Offset(0, 1)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Text('$numSatellites'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
