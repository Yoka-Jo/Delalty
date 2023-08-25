import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/strings_manager.dart';
import 'build_button.dart';

class AccountVerificationButton extends StatelessWidget {
  const AccountVerificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.accountVerification,
      subTitle: AppStrings.youCanDocumentYourAccount,
      icon: ImageAssets.verify,
      onTap: () {
        context.router.push(const AccountVerificationRoute());
      },
    );
  }
}
