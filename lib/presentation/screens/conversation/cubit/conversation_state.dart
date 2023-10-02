part of 'conversation_cubit.dart';

sealed class ConversationState extends Equatable {
  const ConversationState();

  @override
  List<Object> get props => [];
}

final class ConversationInitial extends ConversationState {}

final class ConversationOnMessageChange extends ConversationState {}

final class ConversationRemoveImageFromSelected extends ConversationState {}

final class ConversationSelectedImageChange extends ConversationState {}

final class ConversationAddNewMessage extends ConversationState {}

final class ConversationGetMessagesLoading extends ConversationState {}

final class ConversationGetMessagesSuccess extends ConversationState {}

final class ConversationGetMessagesFailure extends ConversationState {
  final String message;

  const ConversationGetMessagesFailure(this.message);
}

final class ConversationPickeImagesMoreThanAllowedError
    extends ConversationState {}

final class ConversationSendMessageSuccess extends ConversationState {}

final class ConversationSendMessageFailure extends ConversationState {
  final String message;

  const ConversationSendMessageFailure(this.message);
}

final class ConversationGetChatLoading extends ConversationState {}

final class ConversationGetChatSuccess extends ConversationState {}

final class ConversationGetChatFailure extends ConversationState {
  final String message;

  const ConversationGetChatFailure(this.message);
}
