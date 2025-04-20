// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_log_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EquipmentLogRecord {

/// Time stamp of this.
@DateTimeSerializer() DateTime get time;/// List of the section indices for the active sections only.
 List<int> get activeSections;/// [WayPoint] for position and bearing of the equipment.
 WayPoint get wayPoint;
/// Create a copy of EquipmentLogRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquipmentLogRecordCopyWith<EquipmentLogRecord> get copyWith => _$EquipmentLogRecordCopyWithImpl<EquipmentLogRecord>(this as EquipmentLogRecord, _$identity);

  /// Serializes this EquipmentLogRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentLogRecord&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other.activeSections, activeSections)&&(identical(other.wayPoint, wayPoint) || other.wayPoint == wayPoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,const DeepCollectionEquality().hash(activeSections),wayPoint);

@override
String toString() {
  return 'EquipmentLogRecord(time: $time, activeSections: $activeSections, wayPoint: $wayPoint)';
}


}

/// @nodoc
abstract mixin class $EquipmentLogRecordCopyWith<$Res>  {
  factory $EquipmentLogRecordCopyWith(EquipmentLogRecord value, $Res Function(EquipmentLogRecord) _then) = _$EquipmentLogRecordCopyWithImpl;
@useResult
$Res call({
@DateTimeSerializer() DateTime time, List<int> activeSections, WayPoint wayPoint
});




}
/// @nodoc
class _$EquipmentLogRecordCopyWithImpl<$Res>
    implements $EquipmentLogRecordCopyWith<$Res> {
  _$EquipmentLogRecordCopyWithImpl(this._self, this._then);

  final EquipmentLogRecord _self;
  final $Res Function(EquipmentLogRecord) _then;

/// Create a copy of EquipmentLogRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? activeSections = null,Object? wayPoint = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,activeSections: null == activeSections ? _self.activeSections : activeSections // ignore: cast_nullable_to_non_nullable
as List<int>,wayPoint: null == wayPoint ? _self.wayPoint : wayPoint // ignore: cast_nullable_to_non_nullable
as WayPoint,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EquipmentLogRecord implements EquipmentLogRecord {
  const _EquipmentLogRecord({@DateTimeSerializer() required this.time, required final  List<int> activeSections, required this.wayPoint}): _activeSections = activeSections;
  factory _EquipmentLogRecord.fromJson(Map<String, dynamic> json) => _$EquipmentLogRecordFromJson(json);

/// Time stamp of this.
@override@DateTimeSerializer() final  DateTime time;
/// List of the section indices for the active sections only.
 final  List<int> _activeSections;
/// List of the section indices for the active sections only.
@override List<int> get activeSections {
  if (_activeSections is EqualUnmodifiableListView) return _activeSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeSections);
}

/// [WayPoint] for position and bearing of the equipment.
@override final  WayPoint wayPoint;

/// Create a copy of EquipmentLogRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EquipmentLogRecordCopyWith<_EquipmentLogRecord> get copyWith => __$EquipmentLogRecordCopyWithImpl<_EquipmentLogRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EquipmentLogRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EquipmentLogRecord&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other._activeSections, _activeSections)&&(identical(other.wayPoint, wayPoint) || other.wayPoint == wayPoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,const DeepCollectionEquality().hash(_activeSections),wayPoint);

@override
String toString() {
  return 'EquipmentLogRecord(time: $time, activeSections: $activeSections, wayPoint: $wayPoint)';
}


}

/// @nodoc
abstract mixin class _$EquipmentLogRecordCopyWith<$Res> implements $EquipmentLogRecordCopyWith<$Res> {
  factory _$EquipmentLogRecordCopyWith(_EquipmentLogRecord value, $Res Function(_EquipmentLogRecord) _then) = __$EquipmentLogRecordCopyWithImpl;
@override @useResult
$Res call({
@DateTimeSerializer() DateTime time, List<int> activeSections, WayPoint wayPoint
});




}
/// @nodoc
class __$EquipmentLogRecordCopyWithImpl<$Res>
    implements _$EquipmentLogRecordCopyWith<$Res> {
  __$EquipmentLogRecordCopyWithImpl(this._self, this._then);

  final _EquipmentLogRecord _self;
  final $Res Function(_EquipmentLogRecord) _then;

/// Create a copy of EquipmentLogRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? activeSections = null,Object? wayPoint = null,}) {
  return _then(_EquipmentLogRecord(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,activeSections: null == activeSections ? _self._activeSections : activeSections // ignore: cast_nullable_to_non_nullable
as List<int>,wayPoint: null == wayPoint ? _self.wayPoint : wayPoint // ignore: cast_nullable_to_non_nullable
as WayPoint,
  ));
}


}

// dart format on
