import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_device.freezed.dart';
part 'nearby_device.g.dart';

@freezed
abstract class NearbyDevice with _$NearbyDevice {
  const factory NearbyDevice({
    required String id,
    required String name,
    required String ipAddress,
    required int port,
    @Default(DeviceType.unknown) DeviceType type,
  }) = _NearbyDevice;

  factory NearbyDevice.fromJson(Map<String, dynamic> json) =>
      _$NearbyDeviceFromJson(json);
}

enum DeviceType { mobile, desktop, unknown }
