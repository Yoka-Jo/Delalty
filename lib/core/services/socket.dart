// ignore: library_prefixes
import 'dart:async';
import 'dart:developer';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../di.dart';
import '../user_secure_storage.dart';

class Socket {
  Socket() {
    getIt<UserSecureStorage>().getUserToken().then((token) {
      _socket = WebSocketChannel.connect(
        Uri.parse('ws://node.delalty.com/?token=$token'),
      );
      _listen();
    });
  }
  late WebSocketChannel _socket;
  final StreamController<String> stream = StreamController<String>();

  void send(String key, String data) {
    _socket.sink.add(data);
  }

  void _listen() {
    _socket.stream.listen((message) {
      log(message.toString());
    });
  }

  void dispose() {
    _socket.sink.close();
    stream.close();
  }
}
