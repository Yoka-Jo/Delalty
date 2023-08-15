import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(BuildContext context) => BlocProvider.of(context);

  int currentPosition = 0;

  void changeCurrentPosition(int index) {
    emit(OnboardingInitial());
    currentPosition = index;
    emit(OnboardingChangeIndex());
  }
}
