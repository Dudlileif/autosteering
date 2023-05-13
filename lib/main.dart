import 'dart:convert';

import 'package:agopengps_flutter/src/app/agopengps.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: AgOpenGps(
        loading: true,
      ),
    ),
  );

  await FastCachedImageConfig.init(subDir: 'AgOpenGPS_flutter/image_cache/');

  final container = ProviderContainer();

  await applyTestSettings(container);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const AgOpenGps(),
    ),
  );
}

/// Apply test settings from 'assets/test_settings.json'.
Future<void> applyTestSettings(ProviderContainer container) async {
  final testSettings =
      await rootBundle.loadStructuredData<Map<String, dynamic>>(
    'assets/test_settings.json',
    (value) async => Map<String, dynamic>.from(jsonDecode(value) as Map),
  );

  final initPosition = LatLng.fromJson(
    Map<String, dynamic>.from(testSettings['init_position'] as Map),
  );
  final initHeading = testSettings['init_heading'] as double;
  final copernicusInstanceId = testSettings['copernicus_instance_id'] as String;

  container.read(homePositionProvider.notifier).update(initPosition);
  container.read(mainVehicleProvider.notifier).update(
        container
            .read(mainVehicleProvider)
            .copyWith(position: initPosition, heading: initHeading),
      );
  container
      .read(sentinelInstanceIdProvider.notifier)
      .update(copernicusInstanceId);

  if (testSettings.containsKey('show_osm_layer')) {
    final showOSMLayer = testSettings['show_osm_layer'] as bool;
    container.read(showOSMLayerProvider.notifier).update(value: showOSMLayer);
  }

  if (testSettings.containsKey('country_layers')) {
    final countryMap = Map<String, dynamic>.from(
      testSettings['country_layers'] as Map,
    );
    container.listen(currentCountryProvider, (previous, next) {
      if (next != null) {
        final country = next;
        if (countryMap.containsKey(country.name)) {
          Map<String, double>.from(countryMap[country.name] as Map)
              .forEach((name, opacity) {
            final layer = country.layer(name);
            if (layer != null) {
              container
                  .read(countryLayerOpacitiesProvider.notifier)
                  .update(layer, opacity);
              container.read(selectedCountryLayersProvider.notifier).add(layer);
            }
          });
        }
      }
    });
  }
}
