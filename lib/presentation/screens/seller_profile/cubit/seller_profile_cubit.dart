import '../../../../data/requests/requests.dart';
import '../../../../domain/usecases/get_user_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/entities/user.dart';
import '../../../../domain/usecases/change_relationship_type_usecase.dart';
import '../../../../domain/usecases/get_seller_products_usecase.dart';

part 'seller_profile_state.dart';

@injectable
class SellerProfileCubit extends Cubit<SellerProfileState> {
  SellerProfileCubit(
    this._getUserDataUseCase,
    this._getSellerProductsUseCase,
    this._changeRelationshipTypeUseCase,
  ) : super(SellerProfileInitial());

  final GetUserDataUseCase _getUserDataUseCase;
  final GetSellerProductsUseCase _getSellerProductsUseCase;
  final ChangeRelationshipTypeUseCase _changeRelationshipTypeUseCase;

  static SellerProfileCubit get(BuildContext context) =>
      BlocProvider.of(context);

  User? user;
  Future<void> getSeller(String sellerId) async {
    emit(GetSellerDataLoading());
    final response =
        await _getUserDataUseCase(GetUserDataRequest(id: sellerId));
    response.fold(
      (l) => emit(GetSellerDataFailure(l.message)),
      (seller) {
        user = seller;
        emit(GetSellerDataSuccess());
      },
    );
  }

  List<Product>? products;
  Future<void> getSellerProducts(String sellerId) async {
    emit(GetSellerProductsLoading());
    final response =
        await _getSellerProductsUseCase(GetSellerProductsRequest(id: sellerId));
    response.fold(
      (l) => emit(GetSellerProductsFailure(l.message)),
      (products) {
        this.products = products;
        emit(GetSellerProductsSuccess());
      },
    );
  }

  Future<void> blockSeller() async {
    emit(BlockSellerLoading());
    final response = await _changeRelationshipTypeUseCase(
      ChangeRelationshipTypeRequest(
        type: RelationShipType.BLOCK.name,
        target_id: int.parse(user!.id),
      ),
    );

    response.fold(
      (l) => emit(BlockSellerFailure(l.message)),
      (r) {
        emit(BlockSellerSuccess());
      },
    );
  }
}
