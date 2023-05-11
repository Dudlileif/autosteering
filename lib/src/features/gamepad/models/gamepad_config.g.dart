// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamepad_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GamepadConfig _$$_GamepadConfigFromJson(Map<String, dynamic> json) =>
    _$_GamepadConfig(
      analogMaxValue: json['analogMaxValue'] as int,
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

Map<String, dynamic> _$$_GamepadConfigToJson(_$_GamepadConfig instance) =>
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
