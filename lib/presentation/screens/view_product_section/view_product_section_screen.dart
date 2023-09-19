// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/domain/entities/category.dart';
import 'package:delalty/presentation/screens/view_product_section/cubit/view_product_section_cubit.dart';
import 'package:delalty/presentation/screens/view_product_section/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';

@RoutePage()
class ViewProductSectionScreen extends StatelessWidget {
  final bool isRealEstate;
  final Category category;
  const ViewProductSectionScreen({
    Key? key,
    this.isRealEstate = false,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ViewProductSectionCubit>()
        ..getProducts(categoryId: category.id),
      child: Scaffold(
        appBar: AppBarWidget(
          title: category.name,
        ),
        body: ViewProductSectionBody(isRealEstate: isRealEstate),
      ),
    );
  }
}
