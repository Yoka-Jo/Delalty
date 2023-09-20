part of 'socket_cubit.dart';

sealed class SocketState extends Equatable {
  const SocketState();

  @override
  List<Object> get props => [];
}

final class SocketInitial extends SocketState {}

final class SocketMessageCreated extends SocketState {
  final Message message;

  const SocketMessageCreated(this.message);
}

final class SocketChatCreatedSuccess extends SocketState {}

final class SocketGetReadyDataSuccess extends SocketState {}

final class SocketGetRelationShipsError extends SocketState {
  final String message;

  const SocketGetRelationShipsError(this.message);
}

final class SocketGetChatsError extends SocketState {
  final String message;

  const SocketGetChatsError(this.message);
}
