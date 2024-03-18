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

part of 'pid_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PidParametersImpl _$$PidParametersImplFromJson(Map<String, dynamic> json) =>
    _$PidParametersImpl(
      p: (json['p'] as num?)?.toDouble() ?? 20,
      i: (json['i'] as num?)?.toDouble() ?? 0.130,
      d: (json['d'] as num?)?.toDouble() ?? 0.063,
    );

Map<String, dynamic> _$$PidParametersImplToJson(_$PidParametersImpl instance) =>
    <String, dynamic>{
      'p': instance.p,
      'i': instance.i,
      'd': instance.d,
    };
