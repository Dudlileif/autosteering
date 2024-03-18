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

part of 'was_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasConfigImpl _$$WasConfigImplFromJson(Map<String, dynamic> json) =>
    _$WasConfigImpl(
      useWas: json['useWas'] as bool? ?? true,
      invertInput: json['invertInput'] as bool? ?? false,
      bits: json['bits'] as int? ?? 12,
      min: json['min'] as int? ?? 100,
      max: json['max'] as int? ?? 4000,
      center: json['center'] as int? ?? 1500,
    );

Map<String, dynamic> _$$WasConfigImplToJson(_$WasConfigImpl instance) =>
    <String, dynamic>{
      'useWas': instance.useWas,
      'invertInput': instance.invertInput,
      'bits': instance.bits,
      'min': instance.min,
      'max': instance.max,
      'center': instance.center,
    };
