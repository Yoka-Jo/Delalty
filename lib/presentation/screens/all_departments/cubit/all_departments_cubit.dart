import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'all_departments_state.dart';

@injectable
class AllDepartmentsCubit extends Cubit<AllDepartmentsState> {
  AllDepartmentsCubit() : super(AllDepartmentsInitial());
  static AllDepartmentsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  String selectedDepartment = '';

  void changeSelectedDepartment(String department) {
    emit(AllDepartmentsInitial());
    if (selectedDepartment == department) {
      emit(ConfirmChoosenCategory());
    } else {
      selectedDepartment = department;
      emit(const AllDepartmentsChangeSelectedDepartment());
    }
  }
}
