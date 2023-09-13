import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';

class CenteredCircularProgressIndicaotr extends StatelessWidget {
  const CenteredCircularProgressIndicaotr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: AppColors.primaryColor,
        )
      ],
    );
  }
}
