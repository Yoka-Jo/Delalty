import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:delalty/di.dart';
import 'package:delalty/presentation/screens/add_your_product/cubit/add_your_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/category.dart';
import 'widgets/widgets.dart';

@RoutePage()
class AddYourProductScreen extends StatelessWidget {
  final Category category;
  const AddYourProductScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (final input in category.inputs) {
      log(input.type);
      log(input.validations.toString());
      log("__________________");
    }

    return BlocProvider(
      create: (context) => getIt<AddYourProductCubit>(),
      child: Scaffold(
        body: AddYourProductBody(
          category: category,
        ),
      ),
    );
  }
}
