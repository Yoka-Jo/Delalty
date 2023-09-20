import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'dart:convert';
import 'dart:developer';
import 'package:delalty/core/models/responses.dart';
import 'package:delalty/domain/entities/relationship.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../di.dart';
import '../../../domain/entities/chat.dart';
import '../../user_secure_storage.dart';
import 'socket_events.dart';
part 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  SocketCubit() : super(SocketInitial());

  void initialzeSocket() {
    getIt<UserSecureStorage>().getUserToken().then((token) {
      _socket = WebSocketChannel.connect(
        Uri.parse('ws://node.delalty.com/?token=$token'),
      );
      _listen();
    });
  }

  static SocketCubit get(BuildContext context) => BlocProvider.of(context);

  late WebSocketChannel _socket;
  List<Chat> chats = [];
  List<RelationShip> relationships = [];

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
      switch (data['t']) {
        case SocketEvents.ready:
          {
            getReadyData(data);
            break;
          }
        case SocketEvents.chatCreated:
          {
            chatCreated(data);
            break;
          }
        case SocketEvents.messageCreated:
        case SocketEvents.chatUpdated:
        case SocketEvents.chatDeleted:
        case SocketEvents.hello:
          break;
        default:
      }
    });
  }

  void chatCreated(data) {
    emit(SocketInitial());
    chats.add(ChatResponse.fromJson(data['d']).toDomain());
    emit(SocketChatCreatedSuccess());
  }

  void getReadyData(data) {
    emit(SocketInitial());
    _getChats(data);
    _getRelationShips(data);
    emit(SocketGetReadyDataSuccess());
  }

  void _getRelationShips(data) {
    try {
      relationships = (data['d']['relationships'] as List)
          .map((e) => RelationShipResponse.fromJson(e).toDomain())
          .toList();
    } catch (e) {
      log(e.toString());
      relationships = [];
      emit(SocketGetRelationShipsError(e.toString()));
    }
  }

  void _getChats(data) {
    try {
      chats = (data['d']['chats'] as List)
          .map((e) => ChatResponse.fromJson(e).toDomain())
          .toList();
    } catch (e) {
      log(e.toString());
      chats = [];
      emit(SocketGetChatsError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _socket.sink.close();
    return super.close();
  }
}
