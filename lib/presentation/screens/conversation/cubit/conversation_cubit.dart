import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../data/requests/requests.dart';
import '../../../../domain/usecases/create_message_usecase.dart';
import '../../../../domain/usecases/get_messages_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/socket/socket_cubit.dart';
import '../../../../domain/entities/chat.dart';
import '../../../../domain/entities/message.dart';

part 'conversation_state.dart';

@injectable
class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit(this._createMessageUseCase, this._getMessagesUseCase)
      : super(ConversationInitial());
  final CreateMessageUseCase _createMessageUseCase;
  final GetMessagesUseCase _getMessagesUseCase;

  static ConversationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final messageController = TextEditingController();
  late Chat chat;

  String get participantId => chat.participants[1].user!.id;

  Future<void> getChat(String id, BuildContext context) async {
    emit(ConversationGetChatLoading());

    final chat = SocketCubit.get(context)
        .chats
        .where((element) => element.id == id)
        .singleOrNull;
    if (chat == null) {
      emit(const ConversationGetChatFailure("Can't Load Chat."));
      return;
    }
    this.chat = chat;
    emit(ConversationGetChatSuccess());
    await _getMessagaes();
  }

  final ImagePicker picker = ImagePicker();
  List<File> images = [];
  Future<void> pickImages(BuildContext context) async {
    emit(ConversationInitial());
    images = (await picker.pickMultiImage())
        .map((e) => File(e.path))
        .toList(); // await getImageFile(context, allowMultiple: true);
    if (images.isEmpty) {
      return;
    }
    if (images.length > 5) {
      images = [];
      emit(ConversationPickeImagesMoreThanAllowedError());
      return;
    }
    emit(ConversationSelectedImageChange());
  }

  void removeImage(int index) {
    emit(ConversationInitial());

    images.removeAt(index);
    emit(ConversationRemoveImageFromSelected());
  }

  Future<void> sendMessage() async {
    final response = await _createMessageUseCase(
      CreateMessageRequest(
        chatId: chat.id,
        content: messageController.text,
        files: images,
      ),
    );

    response.fold(
      (l) => emit(ConversationSendMessageFailure(l.message)),
      (r) {
        messageController.clear();
        emit(ConversationSendMessageSuccess());
      },
    );
  }

  List<Message> messages = [];
  Future<void> _getMessagaes() async {
    emit(ConversationGetMessagesLoading());
    final response = await _getMessagesUseCase(
      GetMessagesRequest(
        query: {
          'chat_id': chat.id,
        },
      ),
    );
    response.fold((l) => emit(ConversationGetMessagesFailure(l.message)),
        (messages) {
      this.messages = messages;
      emit(ConversationGetMessagesSuccess());
    });
  }

  void addMessage(Message message) {
    emit(ConversationInitial());
    messages.insert(0, message);
    emit(ConversationAddNewMessage());
  }

  @override
  Future<void> close() {
    messageController.dispose();
    return super.close();
  }
}
