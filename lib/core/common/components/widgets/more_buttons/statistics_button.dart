import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/strings_manager.dart';
import 'build_button.dart';

class StatisticsButton extends StatelessWidget {
  const StatisticsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.statistics,
      subTitle: AppStrings.seeLatestStatistics,
      icon: ImageAssets.chart,
      onTap: () {},
    );
  }
}
