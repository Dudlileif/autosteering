import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/scaffold/widgets/debug_menu.dart';
import 'package:agopengps_flutter/src/features/scaffold/widgets/sim_menu.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';

/// The main scaffold widget surrounding the main content of the application.
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  // Whether to show the main map widget as the body.
  bool showMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Focus(
            canRequestFocus: false,
            descendantsAreFocusable: false,
            descendantsAreTraversable: false,
            child: MenuBar(
              children: [
                MapMenu(),
                GuidanceMenu(),
                DebugMenu(),
                SimMenu(),
              ],
            ),
          ),
          Focus(
            canRequestFocus: false,
            descendantsAreFocusable: false,
            descendantsAreTraversable: false,
            child: ManufacturerThemeSelector(),
          ),
          Focus(
            canRequestFocus: false,
            descendantsAreFocusable: false,
            descendantsAreTraversable: false,
            child: ThemeModeButton(),
          ),
        ],
      ),
      body: showMap
          ? const MapAndGaugeStackView()
          : Center(
              child: ElevatedButton.icon(
                onPressed: () => setState(() {
                  showMap = true;
                }),
                icon: const Icon(Icons.map),
                label: const Text('Show map'),
              ),
            ),
    );
  }
}
