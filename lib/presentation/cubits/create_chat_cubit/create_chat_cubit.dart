import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/services/socket/socket_cubit.dart';
import '../../../data/requests/requests.dart';
import '../../../domain/usecases/create_chat_usecase.dart';

part 'create_chat_state.dart';

@injectable
class CreateChatCubit extends Cubit<CreateChatState> {
  CreateChatCubit(this._createChatUseCase) : super(CreateChatInitial());
  final CreateChatUseCase _createChatUseCase;

  static CreateChatCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> createChat(
    CreateChatTypes createChatTypes,
    BuildContext context, {
    required String participantId,
    String? productId,
  }) async {
    emit(CreateChatLoading());
    if (productId != null) {
      final chat = SocketCubit.get(context).getChatByProductId(productId);
      if (chat != null) {
        emit(CreateChatSuccess(chat.id));
        return;
      }
    }

    final response = await _createChatUseCase(
      CreateChatRequest(
        recipientId: int.parse(participantId),
        type: createChatTypes.name,
        productId: productId == null ? null : int.parse(productId),
      ),
    );

    response.fold(
      (l) async {
        log('CREATE CHAT: [code: ${l.code}, message: ${l.message}]');
        emit(CreateChatFailure(l.message));
        if (createChatTypes == CreateChatTypes.DIRECT && l.code == 404) {
          emit(CreateChatFailureNotFriends(participantId));
        }
      },
      (r) => emit(CreateChatSuccess(r.id)),
    );
  }
}
