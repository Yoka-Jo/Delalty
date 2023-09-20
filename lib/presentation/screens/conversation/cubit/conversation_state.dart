part of 'conversation_cubit.dart';

sealed class ConversationState extends Equatable {
  const ConversationState();

  @override
  List<Object> get props => [];
}

final class ConversationInitial extends ConversationState {}

final class ConversationGetChatLoading extends ConversationState {}

final class ConversationGetChatSuccess extends ConversationState {}
