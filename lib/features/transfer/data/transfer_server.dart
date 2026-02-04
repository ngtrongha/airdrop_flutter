import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

/// Callback to request user confirmation for an incoming file.
/// Should return true to accept, false to reject.
typedef TransferConfirmCallback =
    Future<bool> Function(String fileName, int fileSize, String senderIp);

@LazySingleton()
class TransferServer {
  ServerSocket? _serverSocket;
  TransferConfirmCallback? onConfirm;

  // Stream for transfer progress updates
  final _progressController = StreamController<double>.broadcast();
  Stream<double> get progress => _progressController.stream;

  Future<void> startServer(int port) async {
    try {
      if (_serverSocket != null) return;
      _serverSocket = await ServerSocket.bind(InternetAddress.anyIPv4, port);
      debugPrint('Transfer: Server listening on port $port');

      _serverSocket!.listen((Socket socket) {
        _handleConnection(socket);
      });
    } catch (e) {
      debugPrint('Transfer: Error starting server: $e');
      rethrow;
    }
  }

  Future<void> stopServer() async {
    await _serverSocket?.close();
    _serverSocket = null;
  }

  void _handleConnection(Socket socket) async {
    debugPrint(
      'Transfer: Connection accepted from ${socket.remoteAddress.address}',
    );

    try {
      int? fileNameLength;
      String? fileName;
      int? fileSize;
      int bytesReceived = 0;
      IOSink? fileSink;
      bool? isAccepted;

      final buffer = <int>[];

      socket.listen(
        (data) async {
          buffer.addAll(data);

          // 1. Read Metadata
          if (fileNameLength == null) {
            if (buffer.length >= 4) {
              final lenBytes = Uint8List.fromList(buffer.take(4).toList());
              fileNameLength = ByteData.sublistView(lenBytes).getInt32(0);
              buffer.removeRange(0, 4);
            }
          }

          if (fileNameLength != null && fileName == null) {
            if (buffer.length >= fileNameLength!) {
              final nameBytes = buffer.take(fileNameLength!).toList();
              fileName = utf8.decode(nameBytes);
              buffer.removeRange(0, fileNameLength!);
            }
          }

          if (fileName != null && fileSize == null) {
            if (buffer.length >= 8) {
              final sizeBytes = Uint8List.fromList(buffer.take(8).toList());
              fileSize = ByteData.sublistView(sizeBytes).getInt64(0);
              buffer.removeRange(0, 8);

              debugPrint('Transfer: Request for $fileName ($fileSize bytes)');

              // 2. Handshake: Request Confirmation
              if (onConfirm != null) {
                isAccepted = await onConfirm!(
                  fileName!,
                  fileSize!,
                  socket.remoteAddress.address,
                );
              } else {
                isAccepted = true; // Auto-accept if no callback
              }

              // Send response byte: 1 for Accept, 0 for Reject
              socket.add([isAccepted! ? 1 : 0]);
              await socket.flush();

              if (isAccepted!) {
                // Prepare file
                final dir = await _getSaveDirectory();
                final savePath = '${dir.path}/$fileName';
                fileSink = File(savePath).openWrite();
              } else {
                debugPrint('Transfer: Rejected by user');
                socket.destroy();
                return;
              }
            }
          }

          // 3. Receive Data
          if (isAccepted == true && fileSize != null && buffer.isNotEmpty) {
            fileSink?.add(buffer);
            bytesReceived += buffer.length;
            buffer.clear();

            if (fileSize! > 0) {
              _progressController.add(bytesReceived / fileSize!);
            }

            if (bytesReceived >= fileSize!) {
              debugPrint('Transfer: Completed');
              await fileSink?.flush();
              await fileSink?.close();
              fileSink = null;
              socket.destroy();
            }
          }
        },
        onError: (e) {
          debugPrint('Transfer: Error receiving data: $e');
          fileSink?.close();
          socket.destroy();
        },
        onDone: () {
          fileSink?.close();
        },
      );
    } catch (e) {
      debugPrint('Transfer: Connection handler error: $e');
      socket.destroy();
    }
  }

  Future<Directory> _getSaveDirectory() async {
    if (Platform.isWindows) {
      // Standard Windows Downloads folder
      final userProfile = Platform.environment['USERPROFILE'];
      if (userProfile != null) {
        final downloads = Directory('$userProfile\\Downloads');
        if (await downloads.exists()) return downloads;
      }
    }
    return getApplicationDocumentsDirectory();
  }
}
