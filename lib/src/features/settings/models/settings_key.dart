// ignore_for_file: public_member_api_docs

/// An enumerator for all the settings of the program.
enum SettingsKey {
  gaugesAverageCount('gauges.average_count'),
  hardwareAdress('hardware.network.address'),
  hardwareNetworkSendMessages('hardware.network.send_messages'),
  hardwareUDPReceivePort('hardware.network.udp.receive_port'),
  hardwareUDPSendPort('hardware.network.udp.send_port'),
  hardwareWebSocketPort('hardware.network.web.socket_port'),
  hardwareSerialBaudRate('hardware.serial.baud_rate'),
  hardwareSerialPort('hardware.serial.port'),
  logNumFiles('log.num_files'),
  mapAllowDownload('map.allow_download'),
  mapCopernicusInstanceId('map.copernicus_instance_id'),
  mapCurrentCountry('map.current_country'),
  mapEnable3D('map.enable_3d'),
  map3DPerspectiveAngle('map.3d_perspective_angle'),
  mapAlwaysPointNorth('map.always_point_north'),
  mapCenterMapOnVehicle('map.center_on_vehicle'),
  mapZoom('map.zoom'),
  mapHomePosition('map.home_position'),
  mapCenterOffset2D('map.offset.2d'),
  mapCenterOffset3D('map.offset.3d'),
  mapLayersShowOpenStreetMap('map.layers.show_openstreetmap'),
  mapLayersCountrySorted('map.layers.country.sorted'),
  mapLayersCountryEnabled('map.layers.country.enabled'),
  mapLayersCountryOpacities('map.layers.country.opacities'),
  mapLayersSentinelSorted('map.layers.sentinel.sorted'),
  mapLayersSentinelEnabled('map.layers.sentinel.enabled'),
  mapLayersSentinelOpacities('map.layers.sentinel.opacities'),
  miniMapShow('mini_map.show'),
  miniMapAlwaysPointNorth('mini_map.always_point_north'),
  miniMapLockToField('mini_map.lock_to_field'),
  miniMapSize('mini_map.size'),
  ntripEnabled('ntrip.enabled'),
  ntripHost('ntrip.host'),
  ntripPort('ntrip.port'),
  ntripMountPoint('ntrip.mount_point'),
  ntripUsername('ntrip.username'),
  ntripPassword('ntrip.password'),
  simAllowManualInput('sim.allow_manual_input'),
  simAllowInterpolation('sim.allow_interpolation'),
  simAutoCenterSteering('sim.auto_center_steering'),
  simAutoSlowDown('sim.auto_slow_down'),
  themeColorScheme('theme.color_scheme'),
  themeMode('theme.mode'),
  virtualLedBarConfig('virtual_led_bar.config'),
  virtualLedBarEnabled('virtual_led_bar.enabled');

  const SettingsKey(this.name);

  /// The string that will be used when writing to/reading from the settings
  /// file.
  final String name;
}
