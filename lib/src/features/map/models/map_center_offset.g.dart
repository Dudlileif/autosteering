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

part of 'map_center_offset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapCenterOffsetImpl _$$MapCenterOffsetImplFromJson(
        Map<String, dynamic> json) =>
    _$MapCenterOffsetImpl(
      x: (json['x'] as num?)?.toDouble() ?? 0,
      y: (json['y'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$MapCenterOffsetImplToJson(
        _$MapCenterOffsetImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
