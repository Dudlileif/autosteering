// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer_schemes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManufacturerColorsImpl _$$ManufacturerColorsImplFromJson(
        Map<String, dynamic> json) =>
    _$ManufacturerColorsImpl(
      name: json['name'] as String,
      primary: const ColorSerializer().fromJson(json['primary'] as String),
      secondary: const ColorSerializer().fromJson(json['secondary'] as String),
      tertiary: _$JsonConverterFromJson<String, Color?>(
          json['tertiary'], const ColorSerializerNullable().fromJson),
      cabFrame: _$JsonConverterFromJson<String, Color?>(
          json['cabFrame'], const ColorSerializerNullable().fromJson),
      frame: _$JsonConverterFromJson<String, Color?>(
          json['frame'], const ColorSerializerNullable().fromJson),
      rims: _$JsonConverterFromJson<String, Color?>(
          json['rims'], const ColorSerializerNullable().fromJson),
      roof: _$JsonConverterFromJson<String, Color?>(
          json['roof'], const ColorSerializerNullable().fromJson),
    );

Map<String, dynamic> _$$ManufacturerColorsImplToJson(
        _$ManufacturerColorsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'primary': const ColorSerializer().toJson(instance.primary),
      'secondary': const ColorSerializer().toJson(instance.secondary),
      'tertiary': const ColorSerializerNullable().toJson(instance.tertiary),
      'cabFrame': const ColorSerializerNullable().toJson(instance.cabFrame),
      'frame': const ColorSerializerNullable().toJson(instance.frame),
      'rims': const ColorSerializerNullable().toJson(instance.rims),
      'roof': const ColorSerializerNullable().toJson(instance.roof),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
