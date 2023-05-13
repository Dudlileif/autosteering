// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sentinel_layer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SentinelLayer _$SentinelLayerFromJson(Map<String, dynamic> json) {
  return _SentinelLayer.fromJson(json);
}

/// @nodoc
mixin _$SentinelLayer {
  /// The Coperincus dataspace instanceId api-key.
  /// Register a user at [https://dataspace.copernicus.eu/],
  /// go to [https://shapps.dataspace.copernicus.eu/dashboard/#/configurations]
  /// and create a new configuration, and copy the Id.
  String get instanceId => throw _privateConstructorUsedError;

  /// Which layer type this layer should contain info about.
  SentinelLayerType get layerType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SentinelLayerCopyWith<SentinelLayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentinelLayerCopyWith<$Res> {
  factory $SentinelLayerCopyWith(
          SentinelLayer value, $Res Function(SentinelLayer) then) =
      _$SentinelLayerCopyWithImpl<$Res, SentinelLayer>;
  @useResult
  $Res call({String instanceId, SentinelLayerType layerType});
}

/// @nodoc
class _$SentinelLayerCopyWithImpl<$Res, $Val extends SentinelLayer>
    implements $SentinelLayerCopyWith<$Res> {
  _$SentinelLayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instanceId = null,
    Object? layerType = null,
  }) {
    return _then(_value.copyWith(
      instanceId: null == instanceId
          ? _value.instanceId
          : instanceId // ignore: cast_nullable_to_non_nullable
              as String,
      layerType: null == layerType
          ? _value.layerType
          : layerType // ignore: cast_nullable_to_non_nullable
              as SentinelLayerType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SentinelLayerCopyWith<$Res>
    implements $SentinelLayerCopyWith<$Res> {
  factory _$$_SentinelLayerCopyWith(
          _$_SentinelLayer value, $Res Function(_$_SentinelLayer) then) =
      __$$_SentinelLayerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String instanceId, SentinelLayerType layerType});
}

/// @nodoc
class __$$_SentinelLayerCopyWithImpl<$Res>
    extends _$SentinelLayerCopyWithImpl<$Res, _$_SentinelLayer>
    implements _$$_SentinelLayerCopyWith<$Res> {
  __$$_SentinelLayerCopyWithImpl(
      _$_SentinelLayer _value, $Res Function(_$_SentinelLayer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instanceId = null,
    Object? layerType = null,
  }) {
    return _then(_$_SentinelLayer(
      instanceId: null == instanceId
          ? _value.instanceId
          : instanceId // ignore: cast_nullable_to_non_nullable
              as String,
      layerType: null == layerType
          ? _value.layerType
          : layerType // ignore: cast_nullable_to_non_nullable
              as SentinelLayerType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SentinelLayer extends _SentinelLayer {
  const _$_SentinelLayer({required this.instanceId, required this.layerType})
      : super._();

  factory _$_SentinelLayer.fromJson(Map<String, dynamic> json) =>
      _$$_SentinelLayerFromJson(json);

  /// The Coperincus dataspace instanceId api-key.
  /// Register a user at [https://dataspace.copernicus.eu/],
  /// go to [https://shapps.dataspace.copernicus.eu/dashboard/#/configurations]
  /// and create a new configuration, and copy the Id.
  @override
  final String instanceId;

  /// Which layer type this layer should contain info about.
  @override
  final SentinelLayerType layerType;

  @override
  String toString() {
    return 'SentinelLayer(instanceId: $instanceId, layerType: $layerType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SentinelLayer &&
            (identical(other.instanceId, instanceId) ||
                other.instanceId == instanceId) &&
            (identical(other.layerType, layerType) ||
                other.layerType == layerType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, instanceId, layerType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SentinelLayerCopyWith<_$_SentinelLayer> get copyWith =>
      __$$_SentinelLayerCopyWithImpl<_$_SentinelLayer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SentinelLayerToJson(
      this,
    );
  }
}

abstract class _SentinelLayer extends SentinelLayer {
  const factory _SentinelLayer(
      {required final String instanceId,
      required final SentinelLayerType layerType}) = _$_SentinelLayer;
  const _SentinelLayer._() : super._();

  factory _SentinelLayer.fromJson(Map<String, dynamic> json) =
      _$_SentinelLayer.fromJson;

  @override

  /// The Coperincus dataspace instanceId api-key.
  /// Register a user at [https://dataspace.copernicus.eu/],
  /// go to [https://shapps.dataspace.copernicus.eu/dashboard/#/configurations]
  /// and create a new configuration, and copy the Id.
  String get instanceId;
  @override

  /// Which layer type this layer should contain info about.
  SentinelLayerType get layerType;
  @override
  @JsonKey(ignore: true)
  _$$_SentinelLayerCopyWith<_$_SentinelLayer> get copyWith =>
      throw _privateConstructorUsedError;
}
