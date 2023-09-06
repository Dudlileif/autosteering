// ignore_for_file: public_member_api_docs

/// An enumerator for all the settings of the program.
enum SettingsKey {
  hardwareIPAdress('hardware.ip_address'),
  hardwareUDPReceivePort('hardware.udp_receive_port'),
  hardwareUDPSendPort('hardware.udp_send_port'),
  hardwareWebSocketPort('hardware.web_socket_port'),
  mapAllowDownload('map.allow_download'),
  copernicusInstanceId('map.copernicus_instance_id'),
  currentCountry('map.current_country'),
  enableMap3D('map.enable_3d'),
  mapPerspectiveAngle('map.3d_perspective_angle'),
  alwaysPointNorth('map.always_point_north'),
  centerMapOnVehicle('map.center_on_vehicle'),
  mapZoom('map.zoom'),
  homePosition('map.home_position'),
  mapCenterOffset2D('map.offset.2d'),
  mapCenterOffset3D('map.offset.3d'),
  showOpenStreetMap('map.layers.show_openstreetmap'),
  sortedAvailableCountryLayers('map.layers.country.sorted'),
  enabledCountryLayers('map.layers.country.enabled'),
  countryLayersOpacities('map.layers.country.opacities'),
  sortedAvailableSentinelLayers('map.layers.sentinel.sorted'),
  enabledSentinelLayers('map.layers.sentinel.enabled'),
  miniMapShow('mini_map.show'),
  miniMapAlwaysPointNorth('mini_map.always_point_north'),
  miniMapLockToField('mini_map.lock_to_field'),
  miniMapSize('mini_map.size'),
  sentinelLayersOpacities('map.layers.sentinel.opacities'),
  simAllowManualInput('sim.allow_manual_input'),
  simAutoCenterSteering('sim.auto_center_steering'),
  simAutoSlowDown('sim.auto_slow_down'),
  themeColorScheme('theme.color_scheme'),
  themeMode('theme.mode');

  const SettingsKey(this.name);

  /// The string that will be used when writing to/reading from the settings
  /// file.
  final String name;
}
