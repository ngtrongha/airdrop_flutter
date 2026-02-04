import 'package:airdrop_flutter/core/di/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/discovery_repository.dart';
import '../domain/nearby_device.dart';

part 'discovery_provider.g.dart';

@riverpod
class DiscoveryController extends _$DiscoveryController {
  late final DiscoveryRepository _repository;

  @override
  Stream<List<NearbyDevice>> build() {
    _repository = getIt<DiscoveryRepository>();

    // Auto-start discovery when this provider is watched
    _repository.startDiscovery();

    // Dispose/Stop when provider is destroyed
    ref.onDispose(() {
      _repository.stopDiscovery();
    });

    return _repository.devices;
  }

  Future<void> startAdvertising(int port, String username) async {
    await _repository.startAdvertising(port, username);
  }

  Future<void> stopAdvertising() async {
    await _repository.stopAdvertising();
  }
}
