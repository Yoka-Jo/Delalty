import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/constants.dart';
import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/common/components/widgets/build_switch_button.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/strings_manager.dart';

@RoutePage()
class UserPrivacyScreen extends StatelessWidget {
  const UserPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.privacy.tr(context: context),
        iconColor: AppColors.grey3,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            BuildSwitchButton(
              title: AppStrings.seePhoneNumber.tr(context: context),
              icon: ImageAssets.phone,
              switchKey: Constants.seePhoneNumberSwitchKey,
              isSelected: true,
              onToggle: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
