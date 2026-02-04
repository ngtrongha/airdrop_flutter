// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyDevice _$NearbyDeviceFromJson(Map<String, dynamic> json) =>
    _NearbyDevice(
      id: json['id'] as String,
      name: json['name'] as String,
      ipAddress: json['ipAddress'] as String,
      port: (json['port'] as num).toInt(),
      type:
          $enumDecodeNullable(_$DeviceTypeEnumMap, json['type']) ??
          DeviceType.unknown,
    );

Map<String, dynamic> _$NearbyDeviceToJson(_NearbyDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ipAddress': instance.ipAddress,
      'port': instance.port,
      'type': _$DeviceTypeEnumMap[instance.type]!,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.mobile: 'mobile',
  DeviceType.desktop: 'desktop',
  DeviceType.unknown: 'unknown',
};
