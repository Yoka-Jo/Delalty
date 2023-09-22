part of 'create_chat_cubit.dart';

sealed class CreateChatState extends Equatable {
  const CreateChatState();

  @override
  List<Object> get props => [];
}

final class CreateChatInitial extends CreateChatState {}

final class CreateChatLoading extends CreateChatState {}

final class CreateChatSuccess extends CreateChatState {
  final String chatId;

  const CreateChatSuccess(this.chatId);
}

final class CreateChatFailure extends CreateChatState {
  final String message;
  const CreateChatFailure(this.message);
}

final class CreateChatFailureNotFriends extends CreateChatState {
  final String id;

  const CreateChatFailureNotFriends(this.id);
}
