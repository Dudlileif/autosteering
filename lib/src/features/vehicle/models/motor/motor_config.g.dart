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

part of 'motor_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MotorConfigImpl _$$MotorConfigImplFromJson(Map<String, dynamic> json) =>
    _$MotorConfigImpl(
      invertOutput: json['invertOutput'] as bool? ?? false,
      maxRPM: json['maxRPM'] as int? ?? 200,
      thresholdVelocity:
          (json['thresholdVelocity'] as num?)?.toDouble() ?? 0.05,
    );

Map<String, dynamic> _$$MotorConfigImplToJson(_$MotorConfigImpl instance) =>
    <String, dynamic>{
      'invertOutput': instance.invertOutput,
      'maxRPM': instance.maxRPM,
      'thresholdVelocity': instance.thresholdVelocity,
    };
