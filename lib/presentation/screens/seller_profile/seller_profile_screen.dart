// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    return const Scaffold(
      body: ProfileBody(),
    );
  }
}
