import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nsd/nsd.dart' as nsd;
import 'package:uuid/uuid.dart';
import '../domain/nearby_device.dart';

abstract class DiscoveryRepository {
  Future<void> startDiscovery();
  Future<void> stopDiscovery();
  Future<void> startAdvertising(int port, String username);
  Future<void> stopAdvertising();
  Stream<List<NearbyDevice>> get devices;
}

@LazySingleton(as: DiscoveryRepository)
class DiscoveryRepositoryImpl implements DiscoveryRepository {
  final _devicesController = StreamController<List<NearbyDevice>>.broadcast();
  nsd.Discovery? _discovery;
  nsd.Registration? _registration;
  final List<NearbyDevice> _discoveredDevices = [];
  static const String _serviceType = '_airdrop._tcp';

  @override
  Stream<List<NearbyDevice>> get devices => _devicesController.stream;

  @override
  Future<void> startAdvertising(int port, String username) async {
    if (_registration != null) return;

    try {
      final serviceName = '$username-${const Uuid().v4().substring(0, 4)}';

      _registration = await nsd.register(
        nsd.Service(
          name: serviceName,
          type: _serviceType,
          port: port,
          txt: {
            'platform': Uint8List.fromList(
              utf8.encode(Platform.operatingSystem),
            ),
          },
        ),
      );
      debugPrint('Core: Started advertising as $serviceName on port $port');
    } catch (e) {
      debugPrint('Core: Error starting advertising: $e');
      rethrow;
    }
  }

  @override
  Future<void> stopAdvertising() async {
    if (_registration != null) {
      await nsd.unregister(_registration!);
      _registration = null;
    }
  }

  @override
  Future<void> startDiscovery() async {
    if (_discovery != null) return;

    try {
      _discovery = await nsd.startDiscovery(_serviceType, autoResolve: true);
      _discovery!.addServiceListener((service, status) {
        if (status == nsd.ServiceStatus.found) {
          _addDevice(service);
        } else if (status == nsd.ServiceStatus.lost) {
          _removeDevice(service);
        }
      });
      debugPrint('Core: Started discovery for $_serviceType');
    } catch (e) {
      debugPrint('Core: Error starting discovery: $e');
      rethrow;
    }
  }

  @override
  Future<void> stopDiscovery() async {
    if (_discovery != null) {
      await nsd.stopDiscovery(_discovery!);
      _discovery = null;
      _discoveredDevices.clear();
      _devicesController.add([]);
    }
  }

  void _addDevice(nsd.Service service) {
    if (service.host == null) return;

    final idx = _discoveredDevices.indexWhere((d) => d.name == service.name);
    if (idx != -1) return;

    var type = DeviceType.unknown;
    final platformBytes = service.txt?['platform'];
    if (platformBytes != null) {
      final platform = utf8.decode(platformBytes).toLowerCase();
      if (platform.contains('android') || platform.contains('ios')) {
        type = DeviceType.mobile;
      } else if (platform.contains('windows') ||
          platform.contains('macos') ||
          platform.contains('linux')) {
        type = DeviceType.desktop;
      }
    }

    final device = NearbyDevice(
      id: service.name ?? const Uuid().v4(),
      name: service.name ?? 'Unknown',
      ipAddress: service.host!,
      port: service.port ?? 0,
      type: type,
    );

    _discoveredDevices.add(device);
    _devicesController.add(List.from(_discoveredDevices));
  }

  void _removeDevice(nsd.Service service) {
    _discoveredDevices.removeWhere((d) => d.name == service.name);
    _devicesController.add(List.from(_discoveredDevices));
  }
}
