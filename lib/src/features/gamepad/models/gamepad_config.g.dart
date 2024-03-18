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

part of 'gamepad_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GamepadConfigImpl _$$GamepadConfigImplFromJson(Map<String, dynamic> json) =>
    _$GamepadConfigImpl(
      analogMaxValue: json['analogMaxValue'] as int? ?? 65535,
      analogDeadZoneMax:
          (json['analogDeadZoneMax'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry($enumDecode(_$GamepadAnalogInputEnumMap, k),
                    (e as num).toDouble()),
              ) ??
              const {},
      analogDeadZoneMin:
          (json['analogDeadZoneMin'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry($enumDecode(_$GamepadAnalogInputEnumMap, k),
                    (e as num).toDouble()),
              ) ??
              const {},
    );

Map<String, dynamic> _$$GamepadConfigImplToJson(_$GamepadConfigImpl instance) =>
    <String, dynamic>{
      'analogMaxValue': instance.analogMaxValue,
      'analogDeadZoneMax': instance.analogDeadZoneMax
          .map((k, e) => MapEntry(_$GamepadAnalogInputEnumMap[k]!, e)),
      'analogDeadZoneMin': instance.analogDeadZoneMin
          .map((k, e) => MapEntry(_$GamepadAnalogInputEnumMap[k]!, e)),
    };

const _$GamepadAnalogInputEnumMap = {
  GamepadAnalogInput.leftStickX: 'leftStickX',
  GamepadAnalogInput.leftStickY: 'leftStickY',
  GamepadAnalogInput.rightStickX: 'rightStickX',
  GamepadAnalogInput.rightStickY: 'rightStickY',
  GamepadAnalogInput.rightTrigger: 'rightTrigger',
  GamepadAnalogInput.leftTrigger: 'leftTrigger',
  GamepadAnalogInput.pov: 'pov',
  GamepadAnalogInput.unknown: 'unknown',
};
