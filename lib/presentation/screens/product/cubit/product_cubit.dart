import 'dart:developer';

import 'package:delalty/data/requests/requests.dart';
import 'package:delalty/domain/usecases/get_product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/socket/socket_cubit.dart';
import '../../../../domain/entities/comment.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/change_relationship_type_usecase.dart';
import '../../../../domain/usecases/create_chat_usecase.dart';
import '../../../../domain/usecases/get_product_comments_usecase.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this._getProductUseCase,
    this._getProductCommentsUseCase,
    this._createChatUseCase,
    this._changeRelationshipTypeUseCase,
  ) : super(ProductInitial());
  final GetProductUseCase _getProductUseCase;
  final GetProductCommentsUseCase _getProductCommentsUseCase;
  final CreateChatUseCase _createChatUseCase;
  final ChangeRelationshipTypeUseCase _changeRelationshipTypeUseCase;

  static ProductCubit get(BuildContext context) => BlocProvider.of(context);

  late Product product;
  Future<void> getProduct(String id) async {
    emit(GetProductLoading());
    final response = await _getProductUseCase(GetProductRequest(id: id));
    response.fold((l) => emit(GetProductFailure(l.message)), (product) {
      this.product = product;
      emit(GetProductSuccess());
    });
  }

  List<Comment>? comments;

  Future<void> getComments() async {
    emit(GetProductCommentsLoading());
    final response = await _getProductCommentsUseCase(
        GetProductCommentsRequest(product_id: int.parse(product.id)));
    response.fold((l) => emit(GetProductCommentsFailure(l.message)),
        (comments) {
      this.comments = comments;
      emit(GetProductCommentsSuccess());
    });
  }

  Future<void> createChat(
      CreateChatTypes createChatTypes, BuildContext context) async {
    emit(CreateChatLoading());
    final chat = SocketCubit.get(context).getChatByProductId(product.id);
    if (chat != null) {
      emit(CreateChatSuccess(chat.id));
      return;
    }

    final response = await _createChatUseCase(
      CreateChatRequest(
        recipientId: int.parse(product.seller!.id),
        type: createChatTypes.name,
        productId: int.parse(product.id),
      ),
    );

    response.fold(
      (l) async {
        log('code: ${l.code}, message: ${l.message}');
        emit(CreateChatFailure(l.message));
        if (createChatTypes == CreateChatTypes.DIRECT && l.code == 404) {
          emit(CreateChatFailureNotFriends());
        }
      },
      (r) => emit(CreateChatSuccess(r.id)),
    );
  }

  Future<void> addFriend() async {
    emit(AddSellerFriendLoading());
    final response = await _changeRelationshipTypeUseCase(
      ChangeRelationshipTypeRequest(
        target_id: int.parse(product.seller!.id),
        type: RelationShipType.ADD_FRIEND.name,
      ),
    );

    response.fold(
      (l) => emit(AddSellerFriendFailure(l.message)),
      (r) {
        log('successf32df123d123f1d');
        emit(AddSellerFriendSuccess());
      },
    );
  }
}
