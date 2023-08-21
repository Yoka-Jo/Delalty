import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/strings_manager.dart';
import 'build_button.dart';

class PrivaceyPolicyButton extends StatelessWidget {
  const PrivaceyPolicyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.privacyPolicies,
      subTitle: AppStrings.readApplicationPolicyandPrivacy,
      icon: ImageAssets.privacy,
      onTap: () {},
    );
  }
}
