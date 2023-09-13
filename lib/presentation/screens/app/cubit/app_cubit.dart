import 'package:delalty/core/user_secure_storage.dart';
import 'package:delalty/data/requests/requests.dart';
import 'package:delalty/di.dart';
import 'package:delalty/domain/usecases/get_user_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit(this._useCase) : super(AppInitial());
  final GetUserDataUseCase _useCase;

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getUserData() async {
    emit(AppGetUserDataSuccess());
    final userId = await getIt<UserSecureStorage>().getUserID() ?? "19";
    final response = await _useCase(GetUserDataRequest(id: userId));
    response.fold(
      (failure) {
        emit(AppGetUserDataFailure(failure.message));
      },
      (user) {
        emit(AppGetUserDataSuccess());
      },
    );
  }
}
