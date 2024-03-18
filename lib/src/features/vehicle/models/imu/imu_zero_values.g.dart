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

part of 'imu_zero_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImuZeroValuesImpl _$$ImuZeroValuesImplFromJson(Map<String, dynamic> json) =>
    _$ImuZeroValuesImpl(
      bearingZero: json['bearingZero'] as num? ?? 0,
      pitchZero: json['pitchZero'] as num? ?? 0,
      rollZero: json['rollZero'] as num? ?? 0,
    );

Map<String, dynamic> _$$ImuZeroValuesImplToJson(_$ImuZeroValuesImpl instance) =>
    <String, dynamic>{
      'bearingZero': instance.bearingZero,
      'pitchZero': instance.pitchZero,
      'rollZero': instance.rollZero,
    };
