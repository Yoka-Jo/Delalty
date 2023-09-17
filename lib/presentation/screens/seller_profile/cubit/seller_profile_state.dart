part of 'seller_profile_cubit.dart';

sealed class SellerProfileState extends Equatable {
  const SellerProfileState();

  @override
  List<Object> get props => [];
}

final class SellerProfileInitial extends SellerProfileState {}

final class GetSellerDataLoading extends SellerProfileState {}

final class GetSellerDataSuccess extends SellerProfileState {}

final class GetSellerDataFailure extends SellerProfileState {
  final String message;

  const GetSellerDataFailure(this.message);
}
