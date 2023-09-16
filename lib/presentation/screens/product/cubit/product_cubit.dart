import 'package:delalty/data/requests/requests.dart';
import 'package:delalty/domain/usecases/get_product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/comment.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/get_product_comments_usecase.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._getProductUseCase, this._getProductCommentsUseCase)
      : super(ProductInitial());
  final GetProductUseCase _getProductUseCase;
  final GetProductCommentsUseCase _getProductCommentsUseCase;

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
        GetProductCommentsRequest(product_id: product.id));
    response.fold((l) => emit(GetProductCommentsFailure(l.message)),
        (comments) {
      this.comments = comments;
      emit(GetProductCommentsSuccess());
    });
  }
}
