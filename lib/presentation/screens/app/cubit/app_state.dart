part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

final class AppGetUserDataLoading extends AppState {}

final class AppGetUserDataSuccess extends AppState {}

final class AppGetUserDataFailure extends AppState {
  final String message;

  const AppGetUserDataFailure(this.message);

  @override
  List<Object> get props => [super.props, message];
}

final class AppBecomeSellerLoading extends AppState {}

final class AppBecomeSellerSuccess extends AppState {}

final class AppBecomeSellerFailure extends AppState {
  final String message;

  const AppBecomeSellerFailure(this.message);

  @override
  List<Object> get props => [super.props, message];
}
