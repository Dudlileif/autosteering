// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_geometry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
VehicleGeometry _$VehicleGeometryFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'axle_steered':
          return AxleSteeredVehicleGeometry.fromJson(
            json
          );
                case 'articulated':
          return ArticulatedVehicleGeometry.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'VehicleGeometry',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$VehicleGeometry {

/// The length of the vehicle excluding wheels, in meters.
 double get length;/// The width of the vehicle excluding wheels, in meters.
 double get width;/// The best/minimum turning radius, in meters.
 double get minTurningRadius;/// The maximum angle that the steering wheels can turn, in degrees.
 double get steeringAngleMax;/// The distance between the centers of the wheels on the solid axle.
 double get trackWidth;/// The distance between the twin/triple etc. wheels.
 double get wheelSpacing;/// The number of wheels, i.e. twin/triples etc...
 int get numWheels;
/// Create a copy of VehicleGeometry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleGeometryCopyWith<VehicleGeometry> get copyWith => _$VehicleGeometryCopyWithImpl<VehicleGeometry>(this as VehicleGeometry, _$identity);

  /// Serializes this VehicleGeometry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleGeometry&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.minTurningRadius, minTurningRadius) || other.minTurningRadius == minTurningRadius)&&(identical(other.steeringAngleMax, steeringAngleMax) || other.steeringAngleMax == steeringAngleMax)&&(identical(other.trackWidth, trackWidth) || other.trackWidth == trackWidth)&&(identical(other.wheelSpacing, wheelSpacing) || other.wheelSpacing == wheelSpacing)&&(identical(other.numWheels, numWheels) || other.numWheels == numWheels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,length,width,minTurningRadius,steeringAngleMax,trackWidth,wheelSpacing,numWheels);

@override
String toString() {
  return 'VehicleGeometry(length: $length, width: $width, minTurningRadius: $minTurningRadius, steeringAngleMax: $steeringAngleMax, trackWidth: $trackWidth, wheelSpacing: $wheelSpacing, numWheels: $numWheels)';
}


}

/// @nodoc
abstract mixin class $VehicleGeometryCopyWith<$Res>  {
  factory $VehicleGeometryCopyWith(VehicleGeometry value, $Res Function(VehicleGeometry) _then) = _$VehicleGeometryCopyWithImpl;
@useResult
$Res call({
 double length, double width, double minTurningRadius, double steeringAngleMax, double trackWidth, double wheelSpacing, int numWheels
});




}
/// @nodoc
class _$VehicleGeometryCopyWithImpl<$Res>
    implements $VehicleGeometryCopyWith<$Res> {
  _$VehicleGeometryCopyWithImpl(this._self, this._then);

  final VehicleGeometry _self;
  final $Res Function(VehicleGeometry) _then;

/// Create a copy of VehicleGeometry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? length = null,Object? width = null,Object? minTurningRadius = null,Object? steeringAngleMax = null,Object? trackWidth = null,Object? wheelSpacing = null,Object? numWheels = null,}) {
  return _then(_self.copyWith(
length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,minTurningRadius: null == minTurningRadius ? _self.minTurningRadius : minTurningRadius // ignore: cast_nullable_to_non_nullable
as double,steeringAngleMax: null == steeringAngleMax ? _self.steeringAngleMax : steeringAngleMax // ignore: cast_nullable_to_non_nullable
as double,trackWidth: null == trackWidth ? _self.trackWidth : trackWidth // ignore: cast_nullable_to_non_nullable
as double,wheelSpacing: null == wheelSpacing ? _self.wheelSpacing : wheelSpacing // ignore: cast_nullable_to_non_nullable
as double,numWheels: null == numWheels ? _self.numWheels : numWheels // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleGeometry].
extension VehicleGeometryPatterns on VehicleGeometry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AxleSteeredVehicleGeometry value)?  axleSteered,TResult Function( ArticulatedVehicleGeometry value)?  articulated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AxleSteeredVehicleGeometry() when axleSteered != null:
return axleSteered(_that);case ArticulatedVehicleGeometry() when articulated != null:
return articulated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AxleSteeredVehicleGeometry value)  axleSteered,required TResult Function( ArticulatedVehicleGeometry value)  articulated,}){
final _that = this;
switch (_that) {
case AxleSteeredVehicleGeometry():
return axleSteered(_that);case ArticulatedVehicleGeometry():
return articulated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AxleSteeredVehicleGeometry value)?  axleSteered,TResult? Function( ArticulatedVehicleGeometry value)?  articulated,}){
final _that = this;
switch (_that) {
case AxleSteeredVehicleGeometry() when axleSteered != null:
return axleSteered(_that);case ArticulatedVehicleGeometry() when articulated != null:
return articulated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double length,  double width,  double minTurningRadius,  double steeringAngleMax,  double trackWidth,  double wheelBase,  double steeringAxleWheelDiameter,  double solidAxleWheelDiameter,  double steeringAxleWheelWidth,  double solidAxleWheelWidth,  double solidAxleToFrontDistance,  double? solidAxleToFrontHitchDistance,  double? solidAxleToRearHitchDistance,  double? solidAxleToRearDrawbarDistance,  double wheelSpacing,  int numWheels,  double ackermannSteeringRatio,  double ackermannPercentage)?  axleSteered,TResult Function( double length,  double width,  double minTurningRadius,  double steeringAngleMax,  double trackWidth,  double pivotToFrontAxle,  double pivotToRearAxle,  double frontAxleToFrontDistance,  double rearAxleToHitchDistance,  double rearAxleToDrawbarDistance,  double rearAxleToEndDistance,  double wheelDiameter,  double wheelWidth,  double? frontAxleToHitchDistance,  double wheelSpacing,  int numWheels)?  articulated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AxleSteeredVehicleGeometry() when axleSteered != null:
return axleSteered(_that.length,_that.width,_that.minTurningRadius,_that.steeringAngleMax,_that.trackWidth,_that.wheelBase,_that.steeringAxleWheelDiameter,_that.solidAxleWheelDiameter,_that.steeringAxleWheelWidth,_that.solidAxleWheelWidth,_that.solidAxleToFrontDistance,_that.solidAxleToFrontHitchDistance,_that.solidAxleToRearHitchDistance,_that.solidAxleToRearDrawbarDistance,_that.wheelSpacing,_that.numWheels,_that.ackermannSteeringRatio,_that.ackermannPercentage);case ArticulatedVehicleGeometry() when articulated != null:
return articulated(_that.length,_that.width,_that.minTurningRadius,_that.steeringAngleMax,_that.trackWidth,_that.pivotToFrontAxle,_that.pivotToRearAxle,_that.frontAxleToFrontDistance,_that.rearAxleToHitchDistance,_that.rearAxleToDrawbarDistance,_that.rearAxleToEndDistance,_that.wheelDiameter,_that.wheelWidth,_that.frontAxleToHitchDistance,_that.wheelSpacing,_that.numWheels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double length,  double width,  double minTurningRadius,  double steeringAngleMax,  double trackWidth,  double wheelBase,  double steeringAxleWheelDiameter,  double solidAxleWheelDiameter,  double steeringAxleWheelWidth,  double solidAxleWheelWidth,  double solidAxleToFrontDistance,  double? solidAxleToFrontHitchDistance,  double? solidAxleToRearHitchDistance,  double? solidAxleToRearDrawbarDistance,  double wheelSpacing,  int numWheels,  double ackermannSteeringRatio,  double ackermannPercentage)  axleSteered,required TResult Function( double length,  double width,  double minTurningRadius,  double steeringAngleMax,  double trackWidth,  double pivotToFrontAxle,  double pivotToRearAxle,  double frontAxleToFrontDistance,  double rearAxleToHitchDistance,  double rearAxleToDrawbarDistance,  double rearAxleToEndDistance,  double wheelDiameter,  double wheelWidth,  double? frontAxleToHitchDistance,  double wheelSpacing,  int numWheels)  articulated,}) {final _that = this;
switch (_that) {
case AxleSteeredVehicleGeometry():
return axleSteered(_that.length,_that.width,_that.minTurningRadius,_that.steeringAngleMax,_that.trackWidth,_that.wheelBase,_that.steeringAxleWheelDiameter,_that.solidAxleWheelDiameter,_that.steeringAxleWheelWidth,_that.solidAxleWheelWidth,_that.solidAxleToFrontDistance,_that.solidAxleToFrontHitchDistance,_that.solidAxleToRearHitchDistance,_that.solidAxleToRearDrawbarDistance,_that.wheelSpacing,_that.numWheels,_that.ackermannSteeringRatio,_that.ackermannPercentage);case ArticulatedVehicleGeometry():
return articulated(_that.length,_that.width,_that.minTurningRadius,_that.steeringAngleMax,_that.trackWidth,_that.pivotToFrontAxle,_that.pivotToRearAxle,_that.frontAxleToFrontDistance,_that.rearAxleToHitchDistance,_that.rearAxleToDrawbarDistance,_that.rearAxleToEndDistance,_that.wheelDiameter,_that.wheelWidth,_that.frontAxleToHitchDistance,_that.wheelSpacing,_that.numWheels);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double length,  double width,  double minTurningRadius,  double steeringAngleMax,  double trackWidth,  double wheelBase,  double steeringAxleWheelDiameter,  double solidAxleWheelDiameter,  double steeringAxleWheelWidth,  double solidAxleWheelWidth,  double solidAxleToFrontDistance,  double? solidAxleToFrontHitchDistance,  double? solidAxleToRearHitchDistance,  double? solidAxleToRearDrawbarDistance,  double wheelSpacing,  int numWheels,  double ackermannSteeringRatio,  double ackermannPercentage)?  axleSteered,TResult? Function( double length,  double width,  double minTurningRadius,  double steeringAngleMax,  double trackWidth,  double pivotToFrontAxle,  double pivotToRearAxle,  double frontAxleToFrontDistance,  double rearAxleToHitchDistance,  double rearAxleToDrawbarDistance,  double rearAxleToEndDistance,  double wheelDiameter,  double wheelWidth,  double? frontAxleToHitchDistance,  double wheelSpacing,  int numWheels)?  articulated,}) {final _that = this;
switch (_that) {
case AxleSteeredVehicleGeometry() when axleSteered != null:
return axleSteered(_that.length,_that.width,_that.minTurningRadius,_that.steeringAngleMax,_that.trackWidth,_that.wheelBase,_that.steeringAxleWheelDiameter,_that.solidAxleWheelDiameter,_that.steeringAxleWheelWidth,_that.solidAxleWheelWidth,_that.solidAxleToFrontDistance,_that.solidAxleToFrontHitchDistance,_that.solidAxleToRearHitchDistance,_that.solidAxleToRearDrawbarDistance,_that.wheelSpacing,_that.numWheels,_that.ackermannSteeringRatio,_that.ackermannPercentage);case ArticulatedVehicleGeometry() when articulated != null:
return articulated(_that.length,_that.width,_that.minTurningRadius,_that.steeringAngleMax,_that.trackWidth,_that.pivotToFrontAxle,_that.pivotToRearAxle,_that.frontAxleToFrontDistance,_that.rearAxleToHitchDistance,_that.rearAxleToDrawbarDistance,_that.rearAxleToEndDistance,_that.wheelDiameter,_that.wheelWidth,_that.frontAxleToHitchDistance,_that.wheelSpacing,_that.numWheels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class AxleSteeredVehicleGeometry implements VehicleGeometry {
  const AxleSteeredVehicleGeometry({required this.length, required this.width, required this.minTurningRadius, required this.steeringAngleMax, required this.trackWidth, required this.wheelBase, required this.steeringAxleWheelDiameter, required this.solidAxleWheelDiameter, required this.steeringAxleWheelWidth, required this.solidAxleWheelWidth, required this.solidAxleToFrontDistance, this.solidAxleToFrontHitchDistance, this.solidAxleToRearHitchDistance, this.solidAxleToRearDrawbarDistance, this.wheelSpacing = 0.05, this.numWheels = 1, this.ackermannSteeringRatio = 1, this.ackermannPercentage = 100, final  String? $type}): $type = $type ?? 'axle_steered';
  factory AxleSteeredVehicleGeometry.fromJson(Map<String, dynamic> json) => _$AxleSteeredVehicleGeometryFromJson(json);

/// The length of the vehicle excluding wheels, in meters.
@override final  double length;
/// The width of the vehicle excluding wheels, in meters.
@override final  double width;
/// The best/minimum turning radius, in meters.
@override final  double minTurningRadius;
/// The maximum angle that the steering wheels can turn, in degrees.
@override final  double steeringAngleMax;
/// The distance between the centers of the wheels on the solid axle.
@override final  double trackWidth;
/// The distance between the wheel axles.
 final  double wheelBase;
/// The diameter of the steering axle wheels.
 final  double steeringAxleWheelDiameter;
/// The diameter of the solid axle wheels
 final  double solidAxleWheelDiameter;
/// The width of the steering axle wheels.
 final  double steeringAxleWheelWidth;
/// The width of the solid axle wheels.
 final  double solidAxleWheelWidth;
/// The distance from the solid axle position to the frontmost part of the
/// vehicle, typically the bonnet or the frame.
///
/// Used to draw the vehicle in correct proportions.
 final  double solidAxleToFrontDistance;
/// The distance to the front hitch point from the solid axle.
 final  double? solidAxleToFrontHitchDistance;
/// The distance to the rear hitch point from the solid axle.
 final  double? solidAxleToRearHitchDistance;
/// The distance to the rear drawbar hitch point from the solid axle.
 final  double? solidAxleToRearDrawbarDistance;
/// The distance between the twin/triple etc. wheels.
@override@JsonKey() final  double wheelSpacing;
/// The number of wheels, i.e. twin/triples etc...
@override@JsonKey() final  int numWheels;
/// A modifier ratio for the Ackermann central angle. Defaults to 1.
///
/// A higher value will cause a sharper turn, and a lower value a looser
/// turn.
///
/// ```ackermannAngle = steeringAngleInput / ackermannSteeringRatio```
@JsonKey() final  double ackermannSteeringRatio;
/// A modifier to adjust the outside wheel angle by
/// ```outsideAngle = innerAngle -
///   ackermannPercentage*(innerAngle-ackermannAngle)```
@JsonKey() final  double ackermannPercentage;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of VehicleGeometry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AxleSteeredVehicleGeometryCopyWith<AxleSteeredVehicleGeometry> get copyWith => _$AxleSteeredVehicleGeometryCopyWithImpl<AxleSteeredVehicleGeometry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AxleSteeredVehicleGeometryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AxleSteeredVehicleGeometry&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.minTurningRadius, minTurningRadius) || other.minTurningRadius == minTurningRadius)&&(identical(other.steeringAngleMax, steeringAngleMax) || other.steeringAngleMax == steeringAngleMax)&&(identical(other.trackWidth, trackWidth) || other.trackWidth == trackWidth)&&(identical(other.wheelBase, wheelBase) || other.wheelBase == wheelBase)&&(identical(other.steeringAxleWheelDiameter, steeringAxleWheelDiameter) || other.steeringAxleWheelDiameter == steeringAxleWheelDiameter)&&(identical(other.solidAxleWheelDiameter, solidAxleWheelDiameter) || other.solidAxleWheelDiameter == solidAxleWheelDiameter)&&(identical(other.steeringAxleWheelWidth, steeringAxleWheelWidth) || other.steeringAxleWheelWidth == steeringAxleWheelWidth)&&(identical(other.solidAxleWheelWidth, solidAxleWheelWidth) || other.solidAxleWheelWidth == solidAxleWheelWidth)&&(identical(other.solidAxleToFrontDistance, solidAxleToFrontDistance) || other.solidAxleToFrontDistance == solidAxleToFrontDistance)&&(identical(other.solidAxleToFrontHitchDistance, solidAxleToFrontHitchDistance) || other.solidAxleToFrontHitchDistance == solidAxleToFrontHitchDistance)&&(identical(other.solidAxleToRearHitchDistance, solidAxleToRearHitchDistance) || other.solidAxleToRearHitchDistance == solidAxleToRearHitchDistance)&&(identical(other.solidAxleToRearDrawbarDistance, solidAxleToRearDrawbarDistance) || other.solidAxleToRearDrawbarDistance == solidAxleToRearDrawbarDistance)&&(identical(other.wheelSpacing, wheelSpacing) || other.wheelSpacing == wheelSpacing)&&(identical(other.numWheels, numWheels) || other.numWheels == numWheels)&&(identical(other.ackermannSteeringRatio, ackermannSteeringRatio) || other.ackermannSteeringRatio == ackermannSteeringRatio)&&(identical(other.ackermannPercentage, ackermannPercentage) || other.ackermannPercentage == ackermannPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,length,width,minTurningRadius,steeringAngleMax,trackWidth,wheelBase,steeringAxleWheelDiameter,solidAxleWheelDiameter,steeringAxleWheelWidth,solidAxleWheelWidth,solidAxleToFrontDistance,solidAxleToFrontHitchDistance,solidAxleToRearHitchDistance,solidAxleToRearDrawbarDistance,wheelSpacing,numWheels,ackermannSteeringRatio,ackermannPercentage);

@override
String toString() {
  return 'VehicleGeometry.axleSteered(length: $length, width: $width, minTurningRadius: $minTurningRadius, steeringAngleMax: $steeringAngleMax, trackWidth: $trackWidth, wheelBase: $wheelBase, steeringAxleWheelDiameter: $steeringAxleWheelDiameter, solidAxleWheelDiameter: $solidAxleWheelDiameter, steeringAxleWheelWidth: $steeringAxleWheelWidth, solidAxleWheelWidth: $solidAxleWheelWidth, solidAxleToFrontDistance: $solidAxleToFrontDistance, solidAxleToFrontHitchDistance: $solidAxleToFrontHitchDistance, solidAxleToRearHitchDistance: $solidAxleToRearHitchDistance, solidAxleToRearDrawbarDistance: $solidAxleToRearDrawbarDistance, wheelSpacing: $wheelSpacing, numWheels: $numWheels, ackermannSteeringRatio: $ackermannSteeringRatio, ackermannPercentage: $ackermannPercentage)';
}


}

/// @nodoc
abstract mixin class $AxleSteeredVehicleGeometryCopyWith<$Res> implements $VehicleGeometryCopyWith<$Res> {
  factory $AxleSteeredVehicleGeometryCopyWith(AxleSteeredVehicleGeometry value, $Res Function(AxleSteeredVehicleGeometry) _then) = _$AxleSteeredVehicleGeometryCopyWithImpl;
@override @useResult
$Res call({
 double length, double width, double minTurningRadius, double steeringAngleMax, double trackWidth, double wheelBase, double steeringAxleWheelDiameter, double solidAxleWheelDiameter, double steeringAxleWheelWidth, double solidAxleWheelWidth, double solidAxleToFrontDistance, double? solidAxleToFrontHitchDistance, double? solidAxleToRearHitchDistance, double? solidAxleToRearDrawbarDistance, double wheelSpacing, int numWheels, double ackermannSteeringRatio, double ackermannPercentage
});




}
/// @nodoc
class _$AxleSteeredVehicleGeometryCopyWithImpl<$Res>
    implements $AxleSteeredVehicleGeometryCopyWith<$Res> {
  _$AxleSteeredVehicleGeometryCopyWithImpl(this._self, this._then);

  final AxleSteeredVehicleGeometry _self;
  final $Res Function(AxleSteeredVehicleGeometry) _then;

/// Create a copy of VehicleGeometry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? length = null,Object? width = null,Object? minTurningRadius = null,Object? steeringAngleMax = null,Object? trackWidth = null,Object? wheelBase = null,Object? steeringAxleWheelDiameter = null,Object? solidAxleWheelDiameter = null,Object? steeringAxleWheelWidth = null,Object? solidAxleWheelWidth = null,Object? solidAxleToFrontDistance = null,Object? solidAxleToFrontHitchDistance = freezed,Object? solidAxleToRearHitchDistance = freezed,Object? solidAxleToRearDrawbarDistance = freezed,Object? wheelSpacing = null,Object? numWheels = null,Object? ackermannSteeringRatio = null,Object? ackermannPercentage = null,}) {
  return _then(AxleSteeredVehicleGeometry(
length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,minTurningRadius: null == minTurningRadius ? _self.minTurningRadius : minTurningRadius // ignore: cast_nullable_to_non_nullable
as double,steeringAngleMax: null == steeringAngleMax ? _self.steeringAngleMax : steeringAngleMax // ignore: cast_nullable_to_non_nullable
as double,trackWidth: null == trackWidth ? _self.trackWidth : trackWidth // ignore: cast_nullable_to_non_nullable
as double,wheelBase: null == wheelBase ? _self.wheelBase : wheelBase // ignore: cast_nullable_to_non_nullable
as double,steeringAxleWheelDiameter: null == steeringAxleWheelDiameter ? _self.steeringAxleWheelDiameter : steeringAxleWheelDiameter // ignore: cast_nullable_to_non_nullable
as double,solidAxleWheelDiameter: null == solidAxleWheelDiameter ? _self.solidAxleWheelDiameter : solidAxleWheelDiameter // ignore: cast_nullable_to_non_nullable
as double,steeringAxleWheelWidth: null == steeringAxleWheelWidth ? _self.steeringAxleWheelWidth : steeringAxleWheelWidth // ignore: cast_nullable_to_non_nullable
as double,solidAxleWheelWidth: null == solidAxleWheelWidth ? _self.solidAxleWheelWidth : solidAxleWheelWidth // ignore: cast_nullable_to_non_nullable
as double,solidAxleToFrontDistance: null == solidAxleToFrontDistance ? _self.solidAxleToFrontDistance : solidAxleToFrontDistance // ignore: cast_nullable_to_non_nullable
as double,solidAxleToFrontHitchDistance: freezed == solidAxleToFrontHitchDistance ? _self.solidAxleToFrontHitchDistance : solidAxleToFrontHitchDistance // ignore: cast_nullable_to_non_nullable
as double?,solidAxleToRearHitchDistance: freezed == solidAxleToRearHitchDistance ? _self.solidAxleToRearHitchDistance : solidAxleToRearHitchDistance // ignore: cast_nullable_to_non_nullable
as double?,solidAxleToRearDrawbarDistance: freezed == solidAxleToRearDrawbarDistance ? _self.solidAxleToRearDrawbarDistance : solidAxleToRearDrawbarDistance // ignore: cast_nullable_to_non_nullable
as double?,wheelSpacing: null == wheelSpacing ? _self.wheelSpacing : wheelSpacing // ignore: cast_nullable_to_non_nullable
as double,numWheels: null == numWheels ? _self.numWheels : numWheels // ignore: cast_nullable_to_non_nullable
as int,ackermannSteeringRatio: null == ackermannSteeringRatio ? _self.ackermannSteeringRatio : ackermannSteeringRatio // ignore: cast_nullable_to_non_nullable
as double,ackermannPercentage: null == ackermannPercentage ? _self.ackermannPercentage : ackermannPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ArticulatedVehicleGeometry implements VehicleGeometry {
  const ArticulatedVehicleGeometry({required this.length, required this.width, required this.minTurningRadius, required this.steeringAngleMax, required this.trackWidth, required this.pivotToFrontAxle, required this.pivotToRearAxle, required this.frontAxleToFrontDistance, required this.rearAxleToHitchDistance, required this.rearAxleToDrawbarDistance, required this.rearAxleToEndDistance, required this.wheelDiameter, required this.wheelWidth, this.frontAxleToHitchDistance, this.wheelSpacing = 0.05, this.numWheels = 1, final  String? $type}): $type = $type ?? 'articulated';
  factory ArticulatedVehicleGeometry.fromJson(Map<String, dynamic> json) => _$ArticulatedVehicleGeometryFromJson(json);

/// The length of the vehicle excluding wheels, in meters.
@override final  double length;
/// The width of the vehicle excluding wheels, in meters.
@override final  double width;
/// The minimum turning radius of the front axle.
@override final  double minTurningRadius;
/// The maximum angle that the steering pivot can turn, in degrees.
@override final  double steeringAngleMax;
/// The distance between the centers of the wheels on the rear axle.
@override final  double trackWidth;
/// The distance from the vehicle articulation pivot point to the front
/// axle center position.
 final  double pivotToFrontAxle;
/// The distance from the vehicle articulation pivot point to the rear
/// axle center position.
 final  double pivotToRearAxle;
/// The distance from the front axle position to the frontmost part of the
/// vehicle, typically the bonnet or the frame.
 final  double frontAxleToFrontDistance;
/// The distance from the rear axle to the rear fixed hitch point.
 final  double rearAxleToHitchDistance;
/// The distance from the rear axle to the rear drawbar hitch point.
 final  double rearAxleToDrawbarDistance;
/// The distance from the rear axle position to the rearmost part of the
/// vehicle, excluding hitches, typically wheel fenders.
 final  double rearAxleToEndDistance;
/// The diameter of the wheels.
 final  double wheelDiameter;
/// The width of the wheels.
 final  double wheelWidth;
/// The distance from the front axle to the front fixed hitch point.
 final  double? frontAxleToHitchDistance;
/// The distance between the twin/triple etc. wheels.
@override@JsonKey() final  double wheelSpacing;
/// The number of wheels, i.e. twin/triples etc...
@override@JsonKey() final  int numWheels;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of VehicleGeometry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticulatedVehicleGeometryCopyWith<ArticulatedVehicleGeometry> get copyWith => _$ArticulatedVehicleGeometryCopyWithImpl<ArticulatedVehicleGeometry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticulatedVehicleGeometryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticulatedVehicleGeometry&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.minTurningRadius, minTurningRadius) || other.minTurningRadius == minTurningRadius)&&(identical(other.steeringAngleMax, steeringAngleMax) || other.steeringAngleMax == steeringAngleMax)&&(identical(other.trackWidth, trackWidth) || other.trackWidth == trackWidth)&&(identical(other.pivotToFrontAxle, pivotToFrontAxle) || other.pivotToFrontAxle == pivotToFrontAxle)&&(identical(other.pivotToRearAxle, pivotToRearAxle) || other.pivotToRearAxle == pivotToRearAxle)&&(identical(other.frontAxleToFrontDistance, frontAxleToFrontDistance) || other.frontAxleToFrontDistance == frontAxleToFrontDistance)&&(identical(other.rearAxleToHitchDistance, rearAxleToHitchDistance) || other.rearAxleToHitchDistance == rearAxleToHitchDistance)&&(identical(other.rearAxleToDrawbarDistance, rearAxleToDrawbarDistance) || other.rearAxleToDrawbarDistance == rearAxleToDrawbarDistance)&&(identical(other.rearAxleToEndDistance, rearAxleToEndDistance) || other.rearAxleToEndDistance == rearAxleToEndDistance)&&(identical(other.wheelDiameter, wheelDiameter) || other.wheelDiameter == wheelDiameter)&&(identical(other.wheelWidth, wheelWidth) || other.wheelWidth == wheelWidth)&&(identical(other.frontAxleToHitchDistance, frontAxleToHitchDistance) || other.frontAxleToHitchDistance == frontAxleToHitchDistance)&&(identical(other.wheelSpacing, wheelSpacing) || other.wheelSpacing == wheelSpacing)&&(identical(other.numWheels, numWheels) || other.numWheels == numWheels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,length,width,minTurningRadius,steeringAngleMax,trackWidth,pivotToFrontAxle,pivotToRearAxle,frontAxleToFrontDistance,rearAxleToHitchDistance,rearAxleToDrawbarDistance,rearAxleToEndDistance,wheelDiameter,wheelWidth,frontAxleToHitchDistance,wheelSpacing,numWheels);

@override
String toString() {
  return 'VehicleGeometry.articulated(length: $length, width: $width, minTurningRadius: $minTurningRadius, steeringAngleMax: $steeringAngleMax, trackWidth: $trackWidth, pivotToFrontAxle: $pivotToFrontAxle, pivotToRearAxle: $pivotToRearAxle, frontAxleToFrontDistance: $frontAxleToFrontDistance, rearAxleToHitchDistance: $rearAxleToHitchDistance, rearAxleToDrawbarDistance: $rearAxleToDrawbarDistance, rearAxleToEndDistance: $rearAxleToEndDistance, wheelDiameter: $wheelDiameter, wheelWidth: $wheelWidth, frontAxleToHitchDistance: $frontAxleToHitchDistance, wheelSpacing: $wheelSpacing, numWheels: $numWheels)';
}


}

/// @nodoc
abstract mixin class $ArticulatedVehicleGeometryCopyWith<$Res> implements $VehicleGeometryCopyWith<$Res> {
  factory $ArticulatedVehicleGeometryCopyWith(ArticulatedVehicleGeometry value, $Res Function(ArticulatedVehicleGeometry) _then) = _$ArticulatedVehicleGeometryCopyWithImpl;
@override @useResult
$Res call({
 double length, double width, double minTurningRadius, double steeringAngleMax, double trackWidth, double pivotToFrontAxle, double pivotToRearAxle, double frontAxleToFrontDistance, double rearAxleToHitchDistance, double rearAxleToDrawbarDistance, double rearAxleToEndDistance, double wheelDiameter, double wheelWidth, double? frontAxleToHitchDistance, double wheelSpacing, int numWheels
});




}
/// @nodoc
class _$ArticulatedVehicleGeometryCopyWithImpl<$Res>
    implements $ArticulatedVehicleGeometryCopyWith<$Res> {
  _$ArticulatedVehicleGeometryCopyWithImpl(this._self, this._then);

  final ArticulatedVehicleGeometry _self;
  final $Res Function(ArticulatedVehicleGeometry) _then;

/// Create a copy of VehicleGeometry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? length = null,Object? width = null,Object? minTurningRadius = null,Object? steeringAngleMax = null,Object? trackWidth = null,Object? pivotToFrontAxle = null,Object? pivotToRearAxle = null,Object? frontAxleToFrontDistance = null,Object? rearAxleToHitchDistance = null,Object? rearAxleToDrawbarDistance = null,Object? rearAxleToEndDistance = null,Object? wheelDiameter = null,Object? wheelWidth = null,Object? frontAxleToHitchDistance = freezed,Object? wheelSpacing = null,Object? numWheels = null,}) {
  return _then(ArticulatedVehicleGeometry(
length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,minTurningRadius: null == minTurningRadius ? _self.minTurningRadius : minTurningRadius // ignore: cast_nullable_to_non_nullable
as double,steeringAngleMax: null == steeringAngleMax ? _self.steeringAngleMax : steeringAngleMax // ignore: cast_nullable_to_non_nullable
as double,trackWidth: null == trackWidth ? _self.trackWidth : trackWidth // ignore: cast_nullable_to_non_nullable
as double,pivotToFrontAxle: null == pivotToFrontAxle ? _self.pivotToFrontAxle : pivotToFrontAxle // ignore: cast_nullable_to_non_nullable
as double,pivotToRearAxle: null == pivotToRearAxle ? _self.pivotToRearAxle : pivotToRearAxle // ignore: cast_nullable_to_non_nullable
as double,frontAxleToFrontDistance: null == frontAxleToFrontDistance ? _self.frontAxleToFrontDistance : frontAxleToFrontDistance // ignore: cast_nullable_to_non_nullable
as double,rearAxleToHitchDistance: null == rearAxleToHitchDistance ? _self.rearAxleToHitchDistance : rearAxleToHitchDistance // ignore: cast_nullable_to_non_nullable
as double,rearAxleToDrawbarDistance: null == rearAxleToDrawbarDistance ? _self.rearAxleToDrawbarDistance : rearAxleToDrawbarDistance // ignore: cast_nullable_to_non_nullable
as double,rearAxleToEndDistance: null == rearAxleToEndDistance ? _self.rearAxleToEndDistance : rearAxleToEndDistance // ignore: cast_nullable_to_non_nullable
as double,wheelDiameter: null == wheelDiameter ? _self.wheelDiameter : wheelDiameter // ignore: cast_nullable_to_non_nullable
as double,wheelWidth: null == wheelWidth ? _self.wheelWidth : wheelWidth // ignore: cast_nullable_to_non_nullable
as double,frontAxleToHitchDistance: freezed == frontAxleToHitchDistance ? _self.frontAxleToHitchDistance : frontAxleToHitchDistance // ignore: cast_nullable_to_non_nullable
as double?,wheelSpacing: null == wheelSpacing ? _self.wheelSpacing : wheelSpacing // ignore: cast_nullable_to_non_nullable
as double,numWheels: null == numWheels ? _self.numWheels : numWheels // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
