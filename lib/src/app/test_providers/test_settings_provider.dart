import 'dart:convert';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_settings_provider.g.dart';

/// Apply test settings from 'assets/test_settings.json'.
@riverpod
Future<void> applyTestSettings(ApplyTestSettingsRef ref) async {
  final testSettings =
      await rootBundle.loadStructuredData<Map<String, dynamic>>(
    'assets/test_settings.json',
    (value) async => Map<String, dynamic>.from(jsonDecode(value) as Map),
  );

  final initPosition = LatLng.fromJson(
    Map<String, dynamic>.from(testSettings['init_position'] as Map),
  );
  final initHeading = testSettings['init_heading'] as double;
  final copernicusInstanceId =
      testSettings['copernicus_instance_id'] as String?;

  ref.read(homePositionProvider.notifier).update(initPosition);
  ref.read(mainVehicleProvider.notifier).update(
        ref
            .read(mainVehicleProvider)
            .copyWith(position: initPosition, heading: initHeading),
      );
  ref.read(sentinelInstanceIdProvider.notifier).update(copernicusInstanceId);

  if (testSettings.containsKey('show_osm_layer')) {
    final showOSMLayer = testSettings['show_osm_layer'] as bool;
    ref.read(showOSMLayerProvider.notifier).update(value: showOSMLayer);
  }

  if (testSettings.containsKey('country_layers')) {
    final countryMap = Map<String, dynamic>.from(
      testSettings['country_layers'] as Map,
    );
    ref.listen(currentCountryProvider, (previous, next) {
      if (next != null) {
        final country = next;
        if (countryMap.containsKey(country.name)) {
          Map<String, double>.from(countryMap[country.name] as Map)
              .forEach((name, opacity) {
            final layer = country.layer(name);
            if (layer != null) {
              ref
                  .read(countryLayerOpacitiesProvider.notifier)
                  .update(layer, opacity);
              ref.read(selectedCountryLayersProvider.notifier).add(layer);
            }
          });
        }
      }
    });
  }
}
