// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/presentation/screens/view_product_section/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:delalty/core/common/components/widgets/appbar_widget.dart';

@RoutePage()
class ViewProductSectionScreen extends StatelessWidget {
  final bool isRealEstate;
  final String title;
  const ViewProductSectionScreen({
    Key? key,
    this.isRealEstate = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: title,
      ),
      body: ViewProductSectionBody(isRealEstate: isRealEstate),
    );
  }
}
