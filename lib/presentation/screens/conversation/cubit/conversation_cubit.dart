import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/socket/socket_cubit.dart';
import '../../../../domain/entities/chat.dart';

part 'conversation_state.dart';

@injectable
class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit() : super(ConversationInitial());

  static ConversationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  late Chat chat;

  Future<void> getChat(String id, BuildContext context) async {
    emit(ConversationGetChatLoading());
    chat = SocketCubit.get(context)
        .chats
        .firstWhere((element) => element.id == id);
    emit(ConversationGetChatSuccess());
  }
}
