import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

class TransferRejectedException implements Exception {
  final String message;
  TransferRejectedException(this.message);
  @override
  String toString() => 'TransferRejectedException: $message';
}

@LazySingleton()
class TransferClient {
  Future<void> sendFile(String address, int port, PlatformFile file) async {
    Socket? socket;
    try {
      debugPrint(
        'Transfer: Connecting to $address:$port to send ${file.name}...',
      );
      socket = await Socket.connect(address, port);

      // Protocol Part 1: [NameLength 4][Name N][Size 8]
      final fileNameBytes = utf8.encode(file.name);
      final fileNameLen = fileNameBytes.length;
      final fileSize = file.size;

      final header = BytesBuilder();
      final lenBytes = ByteData(4)..setInt32(0, fileNameLen);
      header.add(lenBytes.buffer.asUint8List());
      header.add(fileNameBytes);
      final sizeBytes = ByteData(8)..setInt64(0, fileSize);
      header.add(sizeBytes.buffer.asUint8List());

      socket.add(header.toBytes());
      await socket.flush();

      // Handshake: Wait for server response (1 byte)
      await for (final response in socket) {
        if (response.isNotEmpty) {
          final status = response[0];
          if (status == 1) {
            debugPrint('Transfer: Accepted by peer');
            break;
          } else {
            throw TransferRejectedException('The receiver rejected the file.');
          }
        }
      }

      // Protocol Part 2: [Data...]
      final path = file.path;
      Stream<List<int>> stream;

      if (path != null) {
        stream = File(path).openRead();
      } else if (file.bytes != null) {
        stream = Stream.value(file.bytes!);
      } else {
        throw Exception('File content not available');
      }

      await socket.addStream(stream);
      await socket.flush();
      debugPrint('Transfer: Sent ${file.name} successfully');
    } catch (e) {
      debugPrint('Transfer: Error sending file: $e');
      rethrow;
    } finally {
      await socket?.close();
    }
  }
}
