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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImuReadingImpl _$$ImuReadingImplFromJson(Map<String, dynamic> json) =>
    _$ImuReadingImpl(
      receiveTime: DateTime.parse(json['receiveTime'] as String),
      yaw: json['yaw'] as num? ?? 0,
      pitch: json['pitch'] as num? ?? 0,
      roll: json['roll'] as num? ?? 0,
      accelerationX: json['accelerationX'] as num? ?? 0,
      accelerationY: json['accelerationY'] as num? ?? 0,
      accelerationZ: json['accelerationZ'] as num? ?? 0,
    );

Map<String, dynamic> _$$ImuReadingImplToJson(_$ImuReadingImpl instance) =>
    <String, dynamic>{
      'receiveTime': instance.receiveTime.toIso8601String(),
      'yaw': instance.yaw,
      'pitch': instance.pitch,
      'roll': instance.roll,
      'accelerationX': instance.accelerationX,
      'accelerationY': instance.accelerationY,
      'accelerationZ': instance.accelerationZ,
    };
