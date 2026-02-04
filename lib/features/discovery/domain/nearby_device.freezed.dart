// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyDevice {

 String get id; String get name; String get ipAddress; int get port; DeviceType get type;
/// Create a copy of NearbyDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyDeviceCopyWith<NearbyDevice> get copyWith => _$NearbyDeviceCopyWithImpl<NearbyDevice>(this as NearbyDevice, _$identity);

  /// Serializes this NearbyDevice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyDevice&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.port, port) || other.port == port)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,ipAddress,port,type);

@override
String toString() {
  return 'NearbyDevice(id: $id, name: $name, ipAddress: $ipAddress, port: $port, type: $type)';
}


}

/// @nodoc
abstract mixin class $NearbyDeviceCopyWith<$Res>  {
  factory $NearbyDeviceCopyWith(NearbyDevice value, $Res Function(NearbyDevice) _then) = _$NearbyDeviceCopyWithImpl;
@useResult
$Res call({
 String id, String name, String ipAddress, int port, DeviceType type
});




}
/// @nodoc
class _$NearbyDeviceCopyWithImpl<$Res>
    implements $NearbyDeviceCopyWith<$Res> {
  _$NearbyDeviceCopyWithImpl(this._self, this._then);

  final NearbyDevice _self;
  final $Res Function(NearbyDevice) _then;

/// Create a copy of NearbyDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? ipAddress = null,Object? port = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,
  ));
}

}


/// Adds pattern-matching-related methods to [NearbyDevice].
extension NearbyDevicePatterns on NearbyDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyDevice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyDevice value)  $default,){
final _that = this;
switch (_that) {
case _NearbyDevice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyDevice value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyDevice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String ipAddress,  int port,  DeviceType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyDevice() when $default != null:
return $default(_that.id,_that.name,_that.ipAddress,_that.port,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String ipAddress,  int port,  DeviceType type)  $default,) {final _that = this;
switch (_that) {
case _NearbyDevice():
return $default(_that.id,_that.name,_that.ipAddress,_that.port,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String ipAddress,  int port,  DeviceType type)?  $default,) {final _that = this;
switch (_that) {
case _NearbyDevice() when $default != null:
return $default(_that.id,_that.name,_that.ipAddress,_that.port,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearbyDevice implements NearbyDevice {
  const _NearbyDevice({required this.id, required this.name, required this.ipAddress, required this.port, this.type = DeviceType.unknown});
  factory _NearbyDevice.fromJson(Map<String, dynamic> json) => _$NearbyDeviceFromJson(json);

@override final  String id;
@override final  String name;
@override final  String ipAddress;
@override final  int port;
@override@JsonKey() final  DeviceType type;

/// Create a copy of NearbyDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyDeviceCopyWith<_NearbyDevice> get copyWith => __$NearbyDeviceCopyWithImpl<_NearbyDevice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyDeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyDevice&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.port, port) || other.port == port)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,ipAddress,port,type);

@override
String toString() {
  return 'NearbyDevice(id: $id, name: $name, ipAddress: $ipAddress, port: $port, type: $type)';
}


}

/// @nodoc
abstract mixin class _$NearbyDeviceCopyWith<$Res> implements $NearbyDeviceCopyWith<$Res> {
  factory _$NearbyDeviceCopyWith(_NearbyDevice value, $Res Function(_NearbyDevice) _then) = __$NearbyDeviceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String ipAddress, int port, DeviceType type
});




}
/// @nodoc
class __$NearbyDeviceCopyWithImpl<$Res>
    implements _$NearbyDeviceCopyWith<$Res> {
  __$NearbyDeviceCopyWithImpl(this._self, this._then);

  final _NearbyDevice _self;
  final $Res Function(_NearbyDevice) _then;

/// Create a copy of NearbyDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? ipAddress = null,Object? port = null,Object? type = null,}) {
  return _then(_NearbyDevice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,
  ));
}


}

// dart format on
