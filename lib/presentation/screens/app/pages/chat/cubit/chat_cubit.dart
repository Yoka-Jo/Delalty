import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/services/socket/socket_cubit.dart';
import '../../../../../../domain/entities/chat.dart';

part 'chat_state.dart';

enum ChatsType { buy, sale, all }

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(BuildContext context) => BlocProvider.of(context);

  List<Chat> chats = [];
  ChatsType currentFilter = ChatsType.all;

  void getChats(BuildContext context) {
    chats = SocketCubit.get(context).chats;
  }

  void search(String value, BuildContext context) {
    emit(ChatInitial());
    if (value.isEmpty) {
      _getChatsFor(context, currentFilter);
    } else {
      chats = chats.where((chat) {
        return chat.participants[1].user!.name
            .toLowerCase()
            .contains(value.trim().toLowerCase());
      }).toList();
    }
    emit(SearchSuccess());
  }

  void filterForBuy(BuildContext context) {
    _getChatsFor(context, ChatsType.buy);
  }

  void filterForSale(BuildContext context) {
    _getChatsFor(context, ChatsType.sale);
  }

  void filterForAll(BuildContext context) {
    _getChatsFor(context, ChatsType.all);
  }

  void _getChatsFor(BuildContext context, ChatsType chatsType) {
    emit(ChatInitial());
    if (chatsType == ChatsType.all) {
      chats = SocketCubit.get(context).chats;
    } else {
      chats = SocketCubit.get(context).chats.where((chat) {
        final sellerId = chat.product?.seller?.id;
        final participantId = chat.participants[1].user?.id;
        if (sellerId == null || participantId == null) {
          return false;
        }
        late bool condition;
        if (chatsType == ChatsType.buy) {
          condition = chat.product!.seller!.id != chat.participants[1].user!.id;
        }
        if (chatsType == ChatsType.sale) {
          condition = chat.product!.seller!.id == chat.participants[1].user!.id;
        }
        return condition;
      }).toList();
    }
    currentFilter = chatsType;
    emit(FilterChatsSuccess());
  }
}
