import 'package:delalty/data/requests/requests.dart';
import 'package:delalty/domain/usecases/get_user_data_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user.dart';

part 'seller_profile_state.dart';

@injectable
class SellerProfileCubit extends Cubit<SellerProfileState> {
  SellerProfileCubit(this._getUserDataUseCase) : super(SellerProfileInitial());
  final GetUserDataUseCase _getUserDataUseCase;

  late final User seller;
  Future<void> getSeller(String sellerId) async {
    emit(GetSellerDataLoading());
    final response =
        await _getUserDataUseCase(GetUserDataRequest(id: sellerId));
    response.fold(
      (l) => emit(GetSellerDataFailure(l.message)),
      (seller) {
        this.seller = seller;
        emit(GetSellerDataSuccess());
      },
    );
  }
}
