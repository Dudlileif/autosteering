import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/scaffold/widgets/debug_menu.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScaffold extends ConsumerStatefulWidget {
  const MainScaffold({super.key});

  @override
  ConsumerState<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  bool showMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgOpenGPS'),
        actions: const [
          MenuBar(
            children: [
              MapLayerMenu(),
              DebugMenu(),
            ],
          ),
          ManufacturerThemeSelector(),
          ThemeModeButton(),
        ],
      ),
      body: showMap
          ? const MapView()
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
