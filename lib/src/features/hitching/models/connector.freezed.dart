// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Connector {

/// The longitudinal offset from the reference point of the [Hitchable]
/// parent.
 double get longitudinalOffsetFromRef;/// The lateral offset from the reference point of the [Hitchable].
 double get lateralOffsetFromRef;/// Which type of connector this is, i.e. fixed or drawbar/trailed.
 ConnectorType get type;/// Which relation this connector will have with another connector.
 ConnectorRelation get relation;/// The id of the parent [Vehicle].
 int? get vehicleId;/// The id of the parent [Equipment].
 int? get implementId;/// The local database id of this.
 int? get id;/// The vertical offset from the reference point of the [Hitchable].
 double get verticalOffsetFromRef;/// The angle of this relative to the normal forward direction.
 double get angle;@DateTimeSerializer() DateTime? get createdAt;@DateTimeSerializer() DateTime? get lastUpdatedAt;
/// Create a copy of Connector
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectorCopyWith<Connector> get copyWith => _$ConnectorCopyWithImpl<Connector>(this as Connector, _$identity);

  /// Serializes this Connector to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Connector&&(identical(other.longitudinalOffsetFromRef, longitudinalOffsetFromRef) || other.longitudinalOffsetFromRef == longitudinalOffsetFromRef)&&(identical(other.lateralOffsetFromRef, lateralOffsetFromRef) || other.lateralOffsetFromRef == lateralOffsetFromRef)&&(identical(other.type, type) || other.type == type)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.implementId, implementId) || other.implementId == implementId)&&(identical(other.id, id) || other.id == id)&&(identical(other.verticalOffsetFromRef, verticalOffsetFromRef) || other.verticalOffsetFromRef == verticalOffsetFromRef)&&(identical(other.angle, angle) || other.angle == angle)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUpdatedAt, lastUpdatedAt) || other.lastUpdatedAt == lastUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,longitudinalOffsetFromRef,lateralOffsetFromRef,type,relation,vehicleId,implementId,id,verticalOffsetFromRef,angle,createdAt,lastUpdatedAt);

@override
String toString() {
  return 'Connector(longitudinalOffsetFromRef: $longitudinalOffsetFromRef, lateralOffsetFromRef: $lateralOffsetFromRef, type: $type, relation: $relation, vehicleId: $vehicleId, implementId: $implementId, id: $id, verticalOffsetFromRef: $verticalOffsetFromRef, angle: $angle, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt)';
}


}

/// @nodoc
abstract mixin class $ConnectorCopyWith<$Res>  {
  factory $ConnectorCopyWith(Connector value, $Res Function(Connector) _then) = _$ConnectorCopyWithImpl;
@useResult
$Res call({
 double longitudinalOffsetFromRef, double lateralOffsetFromRef, ConnectorType type, ConnectorRelation relation, int? vehicleId, int? implementId, int? id, double verticalOffsetFromRef, double angle,@DateTimeSerializer() DateTime? createdAt,@DateTimeSerializer() DateTime? lastUpdatedAt
});




}
/// @nodoc
class _$ConnectorCopyWithImpl<$Res>
    implements $ConnectorCopyWith<$Res> {
  _$ConnectorCopyWithImpl(this._self, this._then);

  final Connector _self;
  final $Res Function(Connector) _then;

/// Create a copy of Connector
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? longitudinalOffsetFromRef = null,Object? lateralOffsetFromRef = null,Object? type = null,Object? relation = null,Object? vehicleId = freezed,Object? implementId = freezed,Object? id = freezed,Object? verticalOffsetFromRef = null,Object? angle = null,Object? createdAt = freezed,Object? lastUpdatedAt = freezed,}) {
  return _then(_self.copyWith(
longitudinalOffsetFromRef: null == longitudinalOffsetFromRef ? _self.longitudinalOffsetFromRef : longitudinalOffsetFromRef // ignore: cast_nullable_to_non_nullable
as double,lateralOffsetFromRef: null == lateralOffsetFromRef ? _self.lateralOffsetFromRef : lateralOffsetFromRef // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConnectorType,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as ConnectorRelation,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int?,implementId: freezed == implementId ? _self.implementId : implementId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,verticalOffsetFromRef: null == verticalOffsetFromRef ? _self.verticalOffsetFromRef : verticalOffsetFromRef // ignore: cast_nullable_to_non_nullable
as double,angle: null == angle ? _self.angle : angle // ignore: cast_nullable_to_non_nullable
as double,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdatedAt: freezed == lastUpdatedAt ? _self.lastUpdatedAt : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Connector].
extension ConnectorPatterns on Connector {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Connector value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connector() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Connector value)  $default,){
final _that = this;
switch (_that) {
case _Connector():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Connector value)?  $default,){
final _that = this;
switch (_that) {
case _Connector() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double longitudinalOffsetFromRef,  double lateralOffsetFromRef,  ConnectorType type,  ConnectorRelation relation,  int? vehicleId,  int? implementId,  int? id,  double verticalOffsetFromRef,  double angle, @DateTimeSerializer()  DateTime? createdAt, @DateTimeSerializer()  DateTime? lastUpdatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connector() when $default != null:
return $default(_that.longitudinalOffsetFromRef,_that.lateralOffsetFromRef,_that.type,_that.relation,_that.vehicleId,_that.implementId,_that.id,_that.verticalOffsetFromRef,_that.angle,_that.createdAt,_that.lastUpdatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double longitudinalOffsetFromRef,  double lateralOffsetFromRef,  ConnectorType type,  ConnectorRelation relation,  int? vehicleId,  int? implementId,  int? id,  double verticalOffsetFromRef,  double angle, @DateTimeSerializer()  DateTime? createdAt, @DateTimeSerializer()  DateTime? lastUpdatedAt)  $default,) {final _that = this;
switch (_that) {
case _Connector():
return $default(_that.longitudinalOffsetFromRef,_that.lateralOffsetFromRef,_that.type,_that.relation,_that.vehicleId,_that.implementId,_that.id,_that.verticalOffsetFromRef,_that.angle,_that.createdAt,_that.lastUpdatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double longitudinalOffsetFromRef,  double lateralOffsetFromRef,  ConnectorType type,  ConnectorRelation relation,  int? vehicleId,  int? implementId,  int? id,  double verticalOffsetFromRef,  double angle, @DateTimeSerializer()  DateTime? createdAt, @DateTimeSerializer()  DateTime? lastUpdatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Connector() when $default != null:
return $default(_that.longitudinalOffsetFromRef,_that.lateralOffsetFromRef,_that.type,_that.relation,_that.vehicleId,_that.implementId,_that.id,_that.verticalOffsetFromRef,_that.angle,_that.createdAt,_that.lastUpdatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Connector extends Connector {
  const _Connector({required this.longitudinalOffsetFromRef, required this.lateralOffsetFromRef, required this.type, required this.relation, this.vehicleId, this.implementId, this.id, this.verticalOffsetFromRef = 0, this.angle = 0, @DateTimeSerializer() this.createdAt, @DateTimeSerializer() this.lastUpdatedAt}): super._();
  factory _Connector.fromJson(Map<String, dynamic> json) => _$ConnectorFromJson(json);

/// The longitudinal offset from the reference point of the [Hitchable]
/// parent.
@override final  double longitudinalOffsetFromRef;
/// The lateral offset from the reference point of the [Hitchable].
@override final  double lateralOffsetFromRef;
/// Which type of connector this is, i.e. fixed or drawbar/trailed.
@override final  ConnectorType type;
/// Which relation this connector will have with another connector.
@override final  ConnectorRelation relation;
/// The id of the parent [Vehicle].
@override final  int? vehicleId;
/// The id of the parent [Equipment].
@override final  int? implementId;
/// The local database id of this.
@override final  int? id;
/// The vertical offset from the reference point of the [Hitchable].
@override@JsonKey() final  double verticalOffsetFromRef;
/// The angle of this relative to the normal forward direction.
@override@JsonKey() final  double angle;
@override@DateTimeSerializer() final  DateTime? createdAt;
@override@DateTimeSerializer() final  DateTime? lastUpdatedAt;

/// Create a copy of Connector
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectorCopyWith<_Connector> get copyWith => __$ConnectorCopyWithImpl<_Connector>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connector&&(identical(other.longitudinalOffsetFromRef, longitudinalOffsetFromRef) || other.longitudinalOffsetFromRef == longitudinalOffsetFromRef)&&(identical(other.lateralOffsetFromRef, lateralOffsetFromRef) || other.lateralOffsetFromRef == lateralOffsetFromRef)&&(identical(other.type, type) || other.type == type)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.implementId, implementId) || other.implementId == implementId)&&(identical(other.id, id) || other.id == id)&&(identical(other.verticalOffsetFromRef, verticalOffsetFromRef) || other.verticalOffsetFromRef == verticalOffsetFromRef)&&(identical(other.angle, angle) || other.angle == angle)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUpdatedAt, lastUpdatedAt) || other.lastUpdatedAt == lastUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,longitudinalOffsetFromRef,lateralOffsetFromRef,type,relation,vehicleId,implementId,id,verticalOffsetFromRef,angle,createdAt,lastUpdatedAt);

@override
String toString() {
  return 'Connector(longitudinalOffsetFromRef: $longitudinalOffsetFromRef, lateralOffsetFromRef: $lateralOffsetFromRef, type: $type, relation: $relation, vehicleId: $vehicleId, implementId: $implementId, id: $id, verticalOffsetFromRef: $verticalOffsetFromRef, angle: $angle, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt)';
}


}

/// @nodoc
abstract mixin class _$ConnectorCopyWith<$Res> implements $ConnectorCopyWith<$Res> {
  factory _$ConnectorCopyWith(_Connector value, $Res Function(_Connector) _then) = __$ConnectorCopyWithImpl;
@override @useResult
$Res call({
 double longitudinalOffsetFromRef, double lateralOffsetFromRef, ConnectorType type, ConnectorRelation relation, int? vehicleId, int? implementId, int? id, double verticalOffsetFromRef, double angle,@DateTimeSerializer() DateTime? createdAt,@DateTimeSerializer() DateTime? lastUpdatedAt
});




}
/// @nodoc
class __$ConnectorCopyWithImpl<$Res>
    implements _$ConnectorCopyWith<$Res> {
  __$ConnectorCopyWithImpl(this._self, this._then);

  final _Connector _self;
  final $Res Function(_Connector) _then;

/// Create a copy of Connector
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? longitudinalOffsetFromRef = null,Object? lateralOffsetFromRef = null,Object? type = null,Object? relation = null,Object? vehicleId = freezed,Object? implementId = freezed,Object? id = freezed,Object? verticalOffsetFromRef = null,Object? angle = null,Object? createdAt = freezed,Object? lastUpdatedAt = freezed,}) {
  return _then(_Connector(
longitudinalOffsetFromRef: null == longitudinalOffsetFromRef ? _self.longitudinalOffsetFromRef : longitudinalOffsetFromRef // ignore: cast_nullable_to_non_nullable
as double,lateralOffsetFromRef: null == lateralOffsetFromRef ? _self.lateralOffsetFromRef : lateralOffsetFromRef // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConnectorType,relation: null == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as ConnectorRelation,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int?,implementId: freezed == implementId ? _self.implementId : implementId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,verticalOffsetFromRef: null == verticalOffsetFromRef ? _self.verticalOffsetFromRef : verticalOffsetFromRef // ignore: cast_nullable_to_non_nullable
as double,angle: null == angle ? _self.angle : angle // ignore: cast_nullable_to_non_nullable
as double,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdatedAt: freezed == lastUpdatedAt ? _self.lastUpdatedAt : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
