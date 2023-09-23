import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../di.dart';
import '../../../domain/entities/chat.dart';
import '../../../domain/entities/message.dart';
import '../../../domain/entities/relationship.dart';
import '../../models/responses.dart';
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

  List<RelationShip> getBlockedUsers() =>
      relationships.where((element) => element.type == 'BLOCKED').toList();

  Chat? getChatByProductId(String id) {
    return chats.where((element) => element.productId == id).singleOrNull;
  }

  void unBlockUser(String id) {
    relationships.removeWhere((element) => element.user!.id == id);
  }

  bool isFriend(String id) => relationships
      .where((element) => (element.type == 'FRIEND' && element.user!.id == id))
      .isNotEmpty;

  bool hasSentFriendRequest(String id) => relationships
      .where(
          (element) => (element.type == 'OUTGOING' && element.user!.id == id))
      .isNotEmpty;

  void _listen() {
    _socket.stream.listen((message) {
      log("SOCKET: $message");

      final data = jsonDecode(message);
      switch (data['t']) {
        case SocketEvents.ready:
          _getReadyData(data);
          break;

        case SocketEvents.chatCreated:
          _chatCreated(data);
          break;

        case SocketEvents.messageCreated:
          _messageCreated(data);
          break;

        case SocketEvents.chatUpdated:
          break;
        case SocketEvents.chatDeleted:
          break;
        case SocketEvents.relationshipUpdate:
          _updateRelationship(data);
          break;
        case SocketEvents.relationshipRemove:
          _removeRelationship(data);
          break;
        case SocketEvents.hello:
          break;
        default:
      }
    }, onDone: () {
      initialzeSocket();
    }, onError: (e) {
      log("Socket Error: $e");
    });
  }

  void _removeRelationship(data) {
    relationships.removeWhere(
      (element) => element.user!.id == data['d']['id'],
    );
    emit(SocketRemoveRelationship());
  }

  void _updateRelationship(data) {
    log('Update Relationship');
    bool isInRelationships = relationships
        .where((element) => element.user!.id == data['d']['target']['id'])
        .isNotEmpty;
    if (isInRelationships) {
      relationships.map((e) {
        if (e.user!.id == data['d']['target']['id']) {
          return RelationShipResponse.fromJson(data['d']);
        }
      });
    } else {
      relationships.add(RelationShipResponse.fromJson(data['d']).toDomain());
    }
    emit(SocketUpdateRelationship());
  }

  void _messageCreated(data) {
    emit(SocketInitial());
    emit(
      SocketMessageCreated(
        MessageResponse.fromJson(data['d']).toDomain(),
      ),
    );
  }

  void _chatCreated(data) {
    emit(SocketInitial());
    chats.add(ChatResponse.fromJson(data['d']).toDomain());
    emit(SocketChatCreatedSuccess());
  }

  void _getReadyData(data) {
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

  void dispose() {
    _socket.sink.close();
  }
}
