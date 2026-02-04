import 'dart:async';
import 'dart:io';
import 'package:airdrop_flutter/features/discovery/presentation/discovery_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:airdrop_flutter/core/di/injection.dart'; 
import '../data/transfer_client.dart';
import '../data/transfer_server.dart';

part 'transfer_controller.g.dart';

class PendingTransfer {
  final String fileName;
  final int fileSize;
  final String senderIp;
  final Completer<bool> completer;

  PendingTransfer({
    required this.fileName,
    required this.fileSize,
    required this.senderIp,
    required this.completer,
  });
}

@riverpod
class TransferServerController extends _$TransferServerController {
  late final TransferServer _server;
  PendingTransfer? _pending;

  @override
  Stream<double> build() {
    _server = getIt<TransferServer>();
    _server.onConfirm = _handleConfirm;
    return _server.progress;
  }

  Future<bool> _handleConfirm(String name, int size, String ip) {
    if (_pending != null) _pending!.completer.complete(false);

    final completer = Completer<bool>();
    _pending = PendingTransfer(
      fileName: name,
      fileSize: size,
      senderIp: ip,
      completer: completer,
    );

    // We update a separate provider or use state to notify UI
    // For simplicity, let's use another provider for the popup
    ref.notifyListeners();
    return completer.future;
  }

  PendingTransfer? get pendingRequest => _pending;

  void acceptTransfer() {
    _pending?.completer.complete(true);
    _pending = null;
    ref.notifyListeners();
  }

  void rejectTransfer() {
    _pending?.completer.complete(false);
    _pending = null;
    ref.notifyListeners();
  }

  Future<void> startServer(int port) => _server.startServer(port);
  Future<void> stopServer() => _server.stopServer();
}

@riverpod
Future<void> airdropInitialization(Ref ref) async {
  final serverNotifier = ref.read(transferServerControllerProvider.notifier);
  final discoveryNotifier = ref.read(discoveryControllerProvider.notifier);

  // Auto-start services on app boot
  const port = 4000;
  await serverNotifier.startServer(port);
  await discoveryNotifier.startAdvertising(port, Platform.localHostname);
}

@riverpod
class TransferClientController extends _$TransferClientController {
  late final TransferClient _client;

  @override
  FutureOr<void> build() {
    _client = getIt<TransferClient>();
  }

  Future<void> sendFile(String ip, int port) async {
    state = const AsyncLoading();
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.isNotEmpty) {
        await _client.sendFile(ip, port, result.files.first);
        state = const AsyncData(null);
      } else {
        state = const AsyncData(null); // Cancelled
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
