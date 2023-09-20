// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';

class CenteredCircularProgressIndicaotr extends StatelessWidget {
  const CenteredCircularProgressIndicaotr({
    Key? key,
    this.color = AppColors.primaryColor,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: color,
        )
      ],
    );
  }
}
