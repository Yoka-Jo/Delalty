import 'package:delalty/core/common/components/widgets/more_buttons/account_verification_button.dart';
import 'package:delalty/core/common/components/widgets/more_buttons/assistance_button.dart';
import 'package:delalty/core/common/components/widgets/more_buttons/favorite_button.dart';
import 'package:delalty/core/common/components/widgets/more_buttons/privacy_policy_button.dart';
import 'package:delalty/core/common/components/widgets/more_buttons/prohibited_button.dart';
import 'package:delalty/core/common/components/widgets/my_elevated_button.dart';
import 'package:delalty/core/resources/assets_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/components/widgets/more_buttons/account_setup_button.dart';
import '../../../../../core/common/components/widgets/more_buttons/advertising_button.dart';
import '../../../../../core/common/components/widgets/more_buttons/language_button.dart';
import '../../../../../core/common/components/widgets/more_buttons/statistics_button.dart';
import '../../../../../core/resources/colors_manager.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  final List<Widget> buttons = const [
    AdvertisingButton(),
    StatisticsButton(),
    FavoriteButton(),
    LanguageButton(),
    AccountSetupButton(),
    AccountVerificationButton(),
    ProhibitedButton(),
    PrivaceyPolicyButton(),
    AssistanceButton(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
            title: const Text(
              AppStrings.more,
            ),
            centerTitle: true,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              itemBuilder: (context, index) {
                if (index == buttons.length) {
                  return Column(
                    children: [
                      MyElevatedButton(
                        title: AppStrings.signout,
                        onPressed: () {},
                        icon: ImageAssets.signout,
                        backgroundColor: AppColors.red,
                        borderRadius: 5.r,
                        reverseChild: true,
                      ),
                      SizedBox(height: 50.h),
                    ],
                  );
                }
                return buttons[index];
              },
              separatorBuilder: (context, index) => SizedBox(height: 35.h),
              itemCount: buttons.length + 1,
            ),
          ),
        ],
      ),
    );
  }
}
