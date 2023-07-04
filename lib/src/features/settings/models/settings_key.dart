enum SettingsKey {
  copernicusInstanceId('map.copernicus_instance_id'),
  currentCountry('map.current_country'),
  enableMap3D('map.enable_3d'),
  mapPerspectiveAngle('map.3d_perspective_angle'),
  alwaysPointNorth('map.always_point_north'),
  centerMapOnVehicle('map.center_on_vehicle'),
  homePosition('map.home_position'),
  mapCenterOffset2D('map.offset.2d'),
  mapCenterOffset3D('map.offset.3d'),
  showOpenStreetMap('map.layers.show_openstreetmap'),
  sortedAvailableCountryLayers('map.layers.country.sorted'),
  enabledCountryLayers('map.layers.country.enabled'),
  countryLayersOpacities('map.layers.country.opacities'),
  sortedAvailableSentinelLayers('map.layers.sentinel.sorted'),
  enabledSentinelLayers('map.layers.sentinel.enabled'),
  sentinelLayersOpacities('map.layers.sentinel.opacities'),
  simAutoCenterSteering('sim.auto_center_steering'),
  simAutoSlowDown('sim.auto_slow_down');

  const SettingsKey(this.name);

  final String name;
}
