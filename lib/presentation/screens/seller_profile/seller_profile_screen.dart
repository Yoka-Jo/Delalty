// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di.dart';
import 'cubit/seller_profile_cubit.dart';
import 'widgets/widgets.dart';

@RoutePage()
class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({
    Key? key,
    required this.sellerId,
  }) : super(key: key);

  final String sellerId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SellerProfileCubit>()
        ..getSeller(sellerId)
        ..getSellerProducts(sellerId),
      child: const Scaffold(
        body: ProfileBody(),
      ),
    );
  }
}
