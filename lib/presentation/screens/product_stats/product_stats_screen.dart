// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';

import 'widgets/widgets.dart';

@RoutePage()
class ProductStatsScreen extends StatelessWidget {
  const ProductStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.productStats,
        iconColor: AppColors.grey3,
      ),
      body: ProductStatsBody(),
    );
  }
}
