// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sentinel_layer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SentinelLayer {

/// The Coperincus dataspace instanceId api-key.
/// Register a user at [https://dataspace.copernicus.eu/],
/// go to [https://shapps.dataspace.copernicus.eu/dashboard/#/configurations]
/// and create a new configuration, and copy the Id.
 String get instanceId;/// Which layer type this layer should contain info about.
 SentinelLayerType get layerType;
/// Create a copy of SentinelLayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SentinelLayerCopyWith<SentinelLayer> get copyWith => _$SentinelLayerCopyWithImpl<SentinelLayer>(this as SentinelLayer, _$identity);

  /// Serializes this SentinelLayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SentinelLayer&&(identical(other.instanceId, instanceId) || other.instanceId == instanceId)&&(identical(other.layerType, layerType) || other.layerType == layerType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,instanceId,layerType);

@override
String toString() {
  return 'SentinelLayer(instanceId: $instanceId, layerType: $layerType)';
}


}

/// @nodoc
abstract mixin class $SentinelLayerCopyWith<$Res>  {
  factory $SentinelLayerCopyWith(SentinelLayer value, $Res Function(SentinelLayer) _then) = _$SentinelLayerCopyWithImpl;
@useResult
$Res call({
 String instanceId, SentinelLayerType layerType
});




}
/// @nodoc
class _$SentinelLayerCopyWithImpl<$Res>
    implements $SentinelLayerCopyWith<$Res> {
  _$SentinelLayerCopyWithImpl(this._self, this._then);

  final SentinelLayer _self;
  final $Res Function(SentinelLayer) _then;

/// Create a copy of SentinelLayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? instanceId = null,Object? layerType = null,}) {
  return _then(_self.copyWith(
instanceId: null == instanceId ? _self.instanceId : instanceId // ignore: cast_nullable_to_non_nullable
as String,layerType: null == layerType ? _self.layerType : layerType // ignore: cast_nullable_to_non_nullable
as SentinelLayerType,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SentinelLayer extends SentinelLayer {
  const _SentinelLayer({required this.instanceId, required this.layerType}): super._();
  factory _SentinelLayer.fromJson(Map<String, dynamic> json) => _$SentinelLayerFromJson(json);

/// The Coperincus dataspace instanceId api-key.
/// Register a user at [https://dataspace.copernicus.eu/],
/// go to [https://shapps.dataspace.copernicus.eu/dashboard/#/configurations]
/// and create a new configuration, and copy the Id.
@override final  String instanceId;
/// Which layer type this layer should contain info about.
@override final  SentinelLayerType layerType;

/// Create a copy of SentinelLayer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SentinelLayerCopyWith<_SentinelLayer> get copyWith => __$SentinelLayerCopyWithImpl<_SentinelLayer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SentinelLayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SentinelLayer&&(identical(other.instanceId, instanceId) || other.instanceId == instanceId)&&(identical(other.layerType, layerType) || other.layerType == layerType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,instanceId,layerType);

@override
String toString() {
  return 'SentinelLayer(instanceId: $instanceId, layerType: $layerType)';
}


}

/// @nodoc
abstract mixin class _$SentinelLayerCopyWith<$Res> implements $SentinelLayerCopyWith<$Res> {
  factory _$SentinelLayerCopyWith(_SentinelLayer value, $Res Function(_SentinelLayer) _then) = __$SentinelLayerCopyWithImpl;
@override @useResult
$Res call({
 String instanceId, SentinelLayerType layerType
});




}
/// @nodoc
class __$SentinelLayerCopyWithImpl<$Res>
    implements _$SentinelLayerCopyWith<$Res> {
  __$SentinelLayerCopyWithImpl(this._self, this._then);

  final _SentinelLayer _self;
  final $Res Function(_SentinelLayer) _then;

/// Create a copy of SentinelLayer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? instanceId = null,Object? layerType = null,}) {
  return _then(_SentinelLayer(
instanceId: null == instanceId ? _self.instanceId : instanceId // ignore: cast_nullable_to_non_nullable
as String,layerType: null == layerType ? _self.layerType : layerType // ignore: cast_nullable_to_non_nullable
as SentinelLayerType,
  ));
}


}

// dart format on
