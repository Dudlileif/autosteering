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

part of 'was_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasReadingImpl _$$WasReadingImplFromJson(Map<String, dynamic> json) =>
    _$WasReadingImpl(
      receiveTime: DateTime.parse(json['receiveTime'] as String),
      value: json['value'] as int? ?? 0,
    );

Map<String, dynamic> _$$WasReadingImplToJson(_$WasReadingImpl instance) =>
    <String, dynamic>{
      'receiveTime': instance.receiveTime.toIso8601String(),
      'value': instance.value,
    };
