part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class AddSellerFriendLoading extends ProductState {}

final class AddSellerFriendSuccess extends ProductState {}

final class AddSellerFriendFailure extends ProductState {
  final String message;
  const AddSellerFriendFailure(this.message);
}

final class CreateChatLoading extends ProductState {}

final class CreateChatSuccess extends ProductState {
  final String chatId;

  const CreateChatSuccess(this.chatId);
}

final class CreateChatFailure extends ProductState {
  final String message;
  const CreateChatFailure(this.message);
}

final class CreateChatFailureNotFriends extends ProductState {}

final class GetProductLoading extends ProductState {}

final class GetProductSuccess extends ProductState {}

final class GetProductFailure extends ProductState {
  final String message;
  const GetProductFailure(this.message);
}

final class GetProductCommentsLoading extends ProductState {}

final class GetProductCommentsSuccess extends ProductState {}

final class GetProductCommentsFailure extends ProductState {
  final String message;
  const GetProductCommentsFailure(this.message);
}
