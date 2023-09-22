import 'package:auto_route/auto_route.dart';
import '../../../../resources/routes/app_router.dart';
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
      onTap: () {
        context.router.push(const AdvertisingRoute());
      },
    );
  }
}
