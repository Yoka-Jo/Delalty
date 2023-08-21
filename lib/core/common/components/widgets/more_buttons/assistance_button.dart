import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/strings_manager.dart';
import 'build_button.dart';

class AssistanceButton extends StatelessWidget {
  const AssistanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.assistance,
      subTitle: AppStrings.doYouWantToHelp,
      icon: ImageAssets.warning,
      onTap: () {},
    );
  }
}
