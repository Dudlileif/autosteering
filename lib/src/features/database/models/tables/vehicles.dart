// Copyright (C) 2026 Gaute Hagen
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

import 'package:autosteering/src/features/database/models/tables/tables.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/models/models.dart';
import 'package:drift/drift.dart';

/// A table for representing vehicles. Several [Connectors] can be have bindings
/// to a vehicle.
@UseRowClass(Vehicle, constructor: 'fromDatabase')
class Vehicles extends Table {
  /// The local database ID of this.
  late final Column<int> id = integer().autoIncrement()();

  /// Which type of vehicle this is.
  late final Column<String> type = textEnum<VehicleType>()();

  /// The name of this.
  late final Column<String> name = text().nullable()();

  /// A [VehicleGeometry] object that describes the geometry of this.
  late final Column<String> geometry = text().map(
    VehicleGeometryConverter.converter,
  )();

  /// A [GnssAntennaConfig] object that describes the GNSS antenna/receiver
  /// config of this.
  late final Column<String> gnssAntennaConfig = text()
      .map(GnssAntennaConfigConverter.converter)
      .nullable()();

  /// An [ImuConfig] object that describes the IMU config of this.
  late final Column<String> imuConfig = text()
      .map(ImuConfigConverter.converter)
      .nullable()();

  /// A [WasConfig] object that describes the WAS config of this.
  late final Column<String> wasConfig = text()
      .map(WasConfigConverter.converter)
      .nullable()();

  /// A [SteeringHardwareConfig] object that describes the steering hardware
  /// config of this.
  late final Column<String> steeringHardwareConfig = text()
      .map(SteeringHardwareConfigConverter.converter)
      .nullable()();

  /// A [VehicleThresholds] object that describes the guidance
  /// thresholds config of this.
  late final Column<String> thresholds = text()
      .map(VehicleThresholdsConverter.converter)
      .nullable()();

  /// A [PathTrackingParameters] object that describes the path tracking
  /// parameters of this.
  late final Column<String> pathTrackingParameters = text()
      .map(PathTrackingParametersConverter.converter)
      .nullable()();

  /// A [ManufacturerColors] object that describes the color scheme of this.
  late final Column<String> colorScheme = text()
      .map(ManufacturerColorsConverter.converter)
      .nullable()();

  /// When this was last used.
  late final Column<DateTime> lastUsedAt = dateTime().nullable()();

  /// When this was created.
  late final Column<DateTime> createdAt = dateTime().clientDefault(
    DateTime.now,
  )();

  /// When this was last updated.
  late final Column<DateTime> lastUpdatedAt = dateTime().nullable()();
}

/// An SQL converter for [GnssAntennaConfig].
extension GnssAntennaConfigConverter on GnssAntennaConfig {
  /// An SQL converter for [GnssAntennaConfig].
  static JsonTypeConverter2<GnssAntennaConfig, String, Object?> converter =
      TypeConverter.json2(
        fromJson: (json) => .fromJson(json! as Map<String, dynamic>),
        toJson: (config) => config.toJson(),
      );
}

/// An SQL converter for [ImuConfig].
extension ImuConfigConverter on ImuConfig {
  /// An SQL converter for [ImuConfig].
  static JsonTypeConverter2<ImuConfig, String, Object?> converter =
      TypeConverter.json2(
        fromJson: (json) => .fromJson(json! as Map<String, dynamic>),
        toJson: (config) => config.toJson(),
      );
}

/// An SQL converter for [WasConfig].
extension WasConfigConverter on WasConfig {
  /// An SQL converter for [WasConfig].
  static JsonTypeConverter2<WasConfig, String, Object?> converter =
      TypeConverter.json2(
        fromJson: (json) => .fromJson(json! as Map<String, dynamic>),
        toJson: (config) => config.toJson(),
      );
}

/// An SQL converter for [SteeringHardwareConfig].
extension SteeringHardwareConfigConverter on SteeringHardwareConfig {
  /// An SQL converter for [SteeringHardwareConfig].
  static JsonTypeConverter2<SteeringHardwareConfig, String, Object?> converter =
      TypeConverter.json2(
        fromJson: (json) => .fromJson(json! as Map<String, dynamic>),
        toJson: (config) => config.toJson(),
      );
}

/// An SQL converter for [VehicleGeometry].
extension VehicleGeometryConverter on VehicleGeometry {
  /// An SQL converter for [VehicleGeometry].
  static JsonTypeConverter2<VehicleGeometry, String, Object?> converter =
      TypeConverter.json2(
        fromJson: (json) => .fromJson(json! as Map<String, dynamic>),
        toJson: (config) => config.toJson(),
      );
}

/// An SQL converter for [VehicleThresholds].
extension VehicleThresholdsConverter on VehicleThresholds {
  /// An SQL converter for [VehicleThresholds].
  static JsonTypeConverter2<VehicleThresholds, String, Object?> converter =
      TypeConverter.json2(
        fromJson: (json) => .fromJson(json! as Map<String, dynamic>),
        toJson: (config) => config.toJson(),
      );
}

/// An SQL converter for [PathTrackingParameters].
extension PathTrackingParametersConverter on PathTrackingParameters {
  /// An SQL converter for [PathTrackingParameters].
  static JsonTypeConverter2<PathTrackingParameters, String, Object?> converter =
      TypeConverter.json2(
        fromJson: (json) => .fromJson(json! as Map<String, dynamic>),
        toJson: (config) => config.toJson(),
      );
}

/// An SQL converter for [ManufacturerColors].
extension ManufacturerColorsConverter on ManufacturerColors {
  /// An SQL converter for [ManufacturerColors].
  static JsonTypeConverter2<ManufacturerColors, String, Object?> converter =
      TypeConverter.json2(
        fromJson: (json) => .fromJson(json! as Map<String, dynamic>),
        toJson: (config) => config.toJson(),
      );
}
