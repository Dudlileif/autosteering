// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamepad_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GamepadConfig _$GamepadConfigFromJson(Map<String, dynamic> json) =>
    _GamepadConfig(
      analogMaxValue: (json['analogMaxValue'] as num?)?.toInt() ?? 65535,
      analogDeadZoneMax:
          (json['analogDeadZoneMax'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              $enumDecode(_$GamepadAnalogInputEnumMap, k),
              (e as num).toDouble(),
            ),
          ) ??
          const {},
      analogDeadZoneMin:
          (json['analogDeadZoneMin'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              $enumDecode(_$GamepadAnalogInputEnumMap, k),
              (e as num).toDouble(),
            ),
          ) ??
          const {},
    );

Map<String, dynamic> _$GamepadConfigToJson(_GamepadConfig instance) =>
    <String, dynamic>{
      'analogMaxValue': instance.analogMaxValue,
      'analogDeadZoneMax': instance.analogDeadZoneMax.map(
        (k, e) => MapEntry(_$GamepadAnalogInputEnumMap[k]!, e),
      ),
      'analogDeadZoneMin': instance.analogDeadZoneMin.map(
        (k, e) => MapEntry(_$GamepadAnalogInputEnumMap[k]!, e),
      ),
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
