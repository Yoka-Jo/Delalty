part of 'all_departments_cubit.dart';

sealed class AllDepartmentsState extends Equatable {
  const AllDepartmentsState();

  @override
  List<Object> get props => [];
}

final class AllDepartmentsInitial extends AllDepartmentsState {}

final class ConfirmChoosenCategory extends AllDepartmentsState {}

final class AllDepartmentsChangeSelectedDepartment extends AllDepartmentsState {
  const AllDepartmentsChangeSelectedDepartment();
}
