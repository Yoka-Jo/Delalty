import 'package:auto_route/auto_route.dart';
import 'widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';
import 'cubit/product_cubit.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>(),
      child: Scaffold(
        body: ProductBody(
          productId: productId,
        ),
      ),
    );
  }
}
