import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/strings_manager.dart';
import 'build_button.dart';

class ProhibitedButton extends StatelessWidget {
  const ProhibitedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.prohibited,
      subTitle: AppStrings.blockAnnoyingPeople,
      icon: ImageAssets.userBlock,
      onTap: () {},
    );
  }
}
