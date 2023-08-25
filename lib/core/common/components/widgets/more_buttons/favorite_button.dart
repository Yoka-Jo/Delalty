import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/strings_manager.dart';
import 'build_button.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.favorite,
      subTitle: AppStrings.youCanAddYourProducts,
      icon: ImageAssets.favorite,
      onTap: () {
        context.router.push(const FavoriteRoute());
      },
    );
  }
}
