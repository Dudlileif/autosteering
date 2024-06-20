// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_log_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipmentLogRecord _$EquipmentLogRecordFromJson(Map<String, dynamic> json) {
  return _EquipmentLogRecord.fromJson(json);
}

/// @nodoc
mixin _$EquipmentLogRecord {
  /// Time stamp of this.
  @DateTimeSerializer()
  DateTime get time => throw _privateConstructorUsedError;

  /// List of the section indices for the active sections only.
  List<int> get activeSections => throw _privateConstructorUsedError;

  /// [WayPoint] for position and bearing of the equipment.
  WayPoint get wayPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipmentLogRecordCopyWith<EquipmentLogRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipmentLogRecordCopyWith<$Res> {
  factory $EquipmentLogRecordCopyWith(
          EquipmentLogRecord value, $Res Function(EquipmentLogRecord) then) =
      _$EquipmentLogRecordCopyWithImpl<$Res, EquipmentLogRecord>;
  @useResult
  $Res call(
      {@DateTimeSerializer() DateTime time,
      List<int> activeSections,
      WayPoint wayPoint});
}

/// @nodoc
class _$EquipmentLogRecordCopyWithImpl<$Res, $Val extends EquipmentLogRecord>
    implements $EquipmentLogRecordCopyWith<$Res> {
  _$EquipmentLogRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? activeSections = null,
    Object? wayPoint = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activeSections: null == activeSections
          ? _value.activeSections
          : activeSections // ignore: cast_nullable_to_non_nullable
              as List<int>,
      wayPoint: null == wayPoint
          ? _value.wayPoint
          : wayPoint // ignore: cast_nullable_to_non_nullable
              as WayPoint,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipmentLogRecordImplCopyWith<$Res>
    implements $EquipmentLogRecordCopyWith<$Res> {
  factory _$$EquipmentLogRecordImplCopyWith(_$EquipmentLogRecordImpl value,
          $Res Function(_$EquipmentLogRecordImpl) then) =
      __$$EquipmentLogRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateTimeSerializer() DateTime time,
      List<int> activeSections,
      WayPoint wayPoint});
}

/// @nodoc
class __$$EquipmentLogRecordImplCopyWithImpl<$Res>
    extends _$EquipmentLogRecordCopyWithImpl<$Res, _$EquipmentLogRecordImpl>
    implements _$$EquipmentLogRecordImplCopyWith<$Res> {
  __$$EquipmentLogRecordImplCopyWithImpl(_$EquipmentLogRecordImpl _value,
      $Res Function(_$EquipmentLogRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? activeSections = null,
    Object? wayPoint = null,
  }) {
    return _then(_$EquipmentLogRecordImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activeSections: null == activeSections
          ? _value._activeSections
          : activeSections // ignore: cast_nullable_to_non_nullable
              as List<int>,
      wayPoint: null == wayPoint
          ? _value.wayPoint
          : wayPoint // ignore: cast_nullable_to_non_nullable
              as WayPoint,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipmentLogRecordImpl implements _EquipmentLogRecord {
  const _$EquipmentLogRecordImpl(
      {@DateTimeSerializer() required this.time,
      required final List<int> activeSections,
      required this.wayPoint})
      : _activeSections = activeSections;

  factory _$EquipmentLogRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$EquipmentLogRecordImplFromJson(json);

  /// Time stamp of this.
  @override
  @DateTimeSerializer()
  final DateTime time;

  /// List of the section indices for the active sections only.
  final List<int> _activeSections;

  /// List of the section indices for the active sections only.
  @override
  List<int> get activeSections {
    if (_activeSections is EqualUnmodifiableListView) return _activeSections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeSections);
  }

  /// [WayPoint] for position and bearing of the equipment.
  @override
  final WayPoint wayPoint;

  @override
  String toString() {
    return 'EquipmentLogRecord(time: $time, activeSections: $activeSections, wayPoint: $wayPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EquipmentLogRecordImpl &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality()
                .equals(other._activeSections, _activeSections) &&
            (identical(other.wayPoint, wayPoint) ||
                other.wayPoint == wayPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time,
      const DeepCollectionEquality().hash(_activeSections), wayPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipmentLogRecordImplCopyWith<_$EquipmentLogRecordImpl> get copyWith =>
      __$$EquipmentLogRecordImplCopyWithImpl<_$EquipmentLogRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipmentLogRecordImplToJson(
      this,
    );
  }
}

abstract class _EquipmentLogRecord implements EquipmentLogRecord {
  const factory _EquipmentLogRecord(
      {@DateTimeSerializer() required final DateTime time,
      required final List<int> activeSections,
      required final WayPoint wayPoint}) = _$EquipmentLogRecordImpl;

  factory _EquipmentLogRecord.fromJson(Map<String, dynamic> json) =
      _$EquipmentLogRecordImpl.fromJson;

  @override

  /// Time stamp of this.
  @DateTimeSerializer()
  DateTime get time;
  @override

  /// List of the section indices for the active sections only.
  List<int> get activeSections;
  @override

  /// [WayPoint] for position and bearing of the equipment.
  WayPoint get wayPoint;
  @override
  @JsonKey(ignore: true)
  _$$EquipmentLogRecordImplCopyWith<_$EquipmentLogRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
