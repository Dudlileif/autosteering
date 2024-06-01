// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

// ignore_for_file: public_member_api_docs


/// An enumerator for all the settings of the program.
enum SettingsKey {
  audioVolumeAutosteeringDisabled('audio.volume.autosteering_disabled'),
  audioVolumeAutosteeringEnabled('audio.volume.autosteering_enabled'),
  audioVolumeAutosteeringStandby('audio.volume.autosteering_standby'),
  audioVolumeRTKLostAlarm('audio.volume.rtk_lost_alarm'),
  gaugesAverageCount('gauges.average_count'),
  hardwareAdress('hardware.network.address'),
  hardwareUDPReceivePort('hardware.network.udp.receive_port'),
  hardwareUDPSendPort('hardware.network.udp.send_port'),
  hardwareSerialBaudRate('hardware.serial.baud_rate'),
  hardwareSerialPort('hardware.serial.port'),
  logDaysToKeep('log.days_to_keep'),
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
  mapLayersCountrySorted('map.layers.country.sorted'),
  mapLayersCountryEnabled('map.layers.country.enabled'),
  mapLayersCountryOpacities('map.layers.country.opacities'),
  mapLayersSentinelSorted('map.layers.sentinel.sorted'),
  mapLayersSentinelEnabled('map.layers.sentinel.enabled'),
  mapLayersSentinelOpacities('map.layers.sentinel.opacities'),
  mapLayersShowGrid('map.layers.show_grid'),
  mapLayersShowOpenStreetMap('map.layers.show_openstreetmap'),
  mapSentinelMaxCloudCoveragePercent('map.sentinel_max_cloud_coverage_percent'),
  mapShowGridSizeIndicator('map.show_grid_size_indicator'),
  miniMapShow('mini_map.show'),
  miniMapAlwaysPointNorth('mini_map.always_point_north'),
  miniMapLockToField('mini_map.lock_to_field'),
  miniMapSize('mini_map.size'),
  ntripEnabled('ntrip.enabled'),
  ntripActiveProfile('ntrip.active_profile'),
  ntripProfiles('ntrip.profiles'),
  pathRecordingSettings('path_recording_settings'),
  remoteControlAddress('remote_control.address'),
  remoteControlButtonActions('remote_control.button_actions'),
  simAllowManualInput('sim.allow_manual_input'),
  simAllowInterpolation('sim.allow_interpolation'),
  simAutoCenterSteering('sim.auto_center_steering'),
  simAutoSlowDown('sim.auto_slow_down'),
  simTargetUpdateHz('sim.target_update_hz'),
  themeColorScheme('theme.color_scheme'),
  themeColorSchemeCustom('theme.color_scheme_custom'),
  themeColorSchemeInheritFromVehicle('theme.color_sheme.inherit_from_vehicle'),
  themeMode('theme.mode'),
  uiAutosteeringConfiguratorOffset('ui.autosteering_configurator_offset'),
  uiImuConfiguratorOffset('ui.imu_configurator_offset'),
  uiNudgningControlsOffset('ui.nudgning_controls_offset'),
  uiPathRecordingMenuOffset('ui.path_recording_menu_offset'),
  uiSteeringHardwareConfiguratorOffset(
    'ui.steering_hardware_configurator_offset',
  ),
  virtualLedBarConfig('virtual_led_bar.config'),
  virtualLedBarEnabled('virtual_led_bar.enabled');

  const SettingsKey(this.name);

  /// The string that will be used when writing to/reading from the settings
  /// file.
  final String name;

  static const List<SettingsKey> canContainSensitiveData = [
    mapCopernicusInstanceId,
    mapHomePosition,
    ntripProfiles,
    ntripActiveProfile,
  ];
}
