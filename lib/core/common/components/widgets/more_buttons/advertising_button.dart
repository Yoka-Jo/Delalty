import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/strings_manager.dart';
import 'build_button.dart';

class AdvertisingButton extends StatelessWidget {
  const AdvertisingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.advertising,
      subTitle: AppStrings.adsYouHaveCreated,
      icon: ImageAssets.advertising,
      onTap: () {},
    );
  }
}
