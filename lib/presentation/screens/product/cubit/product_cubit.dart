import 'package:delalty/data/requests/requests.dart';
import 'package:delalty/domain/usecases/get_product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._getProductUseCase) : super(ProductInitial());
  final GetProductUseCase _getProductUseCase;
  // final GetProductUseCase _getProductUseCase;

  late Product product;
  Future<void> getProduct(String id) async {
    emit(GetProductLoading());
    final response = await _getProductUseCase(GetProductRequest(id: id));
    response.fold((l) => emit(GetProductFailure(l.message)), (product) {
      this.product = product;
      emit(GetProductSuccess());
    });
  }

  Future<void> getComments(String id) async {
    emit(GetProductLoading());
    final response = await _getProductUseCase(GetProductRequest(id: id));
    response.fold((l) => emit(GetProductFailure(l.message)), (product) {
      this.product = product;
      emit(GetProductSuccess());
    });
  }
}
