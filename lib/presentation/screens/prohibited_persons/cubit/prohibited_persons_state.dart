part of 'prohibited_persons_cubit.dart';

sealed class ProhibitedPersonsState extends Equatable {
  const ProhibitedPersonsState();

  @override
  List<Object> get props => [];
}

final class ProhibitedPersonsInitial extends ProhibitedPersonsState {}

final class UnBlockUserLoading extends ProhibitedPersonsState {}

final class UnBlockUserSuccess extends ProhibitedPersonsState {}

final class UnBlockUserFailure extends ProhibitedPersonsState {
  final String message;

  const UnBlockUserFailure(this.message);
}
