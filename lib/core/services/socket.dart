// ignore: library_prefixes
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:delalty/core/models/responses.dart';
import 'package:delalty/domain/entities/relationship.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../di.dart';
import '../../domain/entities/chat.dart';
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
  static List<Chat> chats = [];
  static List<RelationShip> relationships = [];

  void send(String key, String data) {
    _socket.sink.add(data);
  }

  void sentData() {
    _socket.sink.add('changed');
  }

  void _listen() {
    _socket.stream.listen((message) {
      log("Message: $message");
      final data = jsonDecode(message);
      getChats(data);
      getRelationShips(data);
    });
  }

  void getRelationShips(data) {
    try {
      relationships = (data['d']['relationships'] as List)
          .map((e) => RelationShipResponse.fromJson(e).toDomain())
          .toList();
    } catch (e) {
      log(e.toString());
      relationships = [];
      rethrow;
    }
  }

  void getChats(data) {
    try {
      chats = (data['d']['chats'] as List)
          .map((e) => ChatResponse.fromJson(e).toDomain())
          .toList();
    } catch (e) {
      log(e.toString());
      chats = [];
    }
  }

  void dispose() {
    _socket.sink.close();
    stream.close();
  }
}
