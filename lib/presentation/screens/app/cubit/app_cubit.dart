import 'package:delalty/core/base_usecase.dart';
import 'package:delalty/core/models/no_data.dart';

import '../../../../core/user_secure_storage.dart';
import '../../../../data/requests/requests.dart';
import '../../../../di.dart';
import '../../../../domain/entities/user.dart';
import '../../../../domain/usecases/become_seller_usecase.dart';
import '../../../../domain/usecases/get_user_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit(this._getUserDataUseCase, this._becomeSellerUseCase)
      : super(AppInitial());
  final GetUserDataUseCase _getUserDataUseCase;
  final BecomeSellerUseCase _becomeSellerUseCase;

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  late User user;
  Future<void> getUserData() async {
    emit(AppGetUserDataLoading());
    final userId = await getIt<UserSecureStorage>().getUserID() ?? "19";
    final response = await _getUserDataUseCase(GetUserDataRequest(id: userId));
    response.fold(
      (failure) {
        emit(AppGetUserDataFailure(failure.message));
      },
      (user) {
        this.user = user;
        emit(AppGetUserDataSuccess());
      },
    );
  }

  Future<void> becomeSeller() async {
    emit(AppBecomeSellerLoading());
    final response = await _becomeSellerUseCase(NoParams());
    response.fold(
      (l) => emit(AppBecomeSellerFailure(l.message)),
      (_) async {
        await getUserData();
        emit(AppBecomeSellerSuccess());
      },
    );
  }
}
