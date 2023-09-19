// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/app/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/assets_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';

import '../../../core/common/components/widgets/build_switch_button.dart';
import '../../../core/resources/colors_manager.dart';

@RoutePage()
class SetAlertsScreen extends StatelessWidget {
  const SetAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.setAlerts.tr(context: context),
        iconColor: AppColors.grey3,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            SimpleText(
              AppStrings.notificationsAboutYourAccount.tr(context: context),
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 15.sp,
              color: AppColors.grey3,
            ),
            SizedBox(height: 20.h),
            BuildSwitchButton(
              title: AppStrings.chatCheers.tr(context: context),
              icon: ImageAssets.bell,
              switchKey: Constants.chatCheersSwitchKey,
              isSelected: true,
              onToggle: (value) {},
            ),
            SizedBox(height: 20.h),
            BuildSwitchButton(
              title: AppStrings.statisticsAlerts.tr(context: context),
              icon: ImageAssets.chart,
              switchKey: Constants.statisticsAlertsSwitchKey,
              isSelected: true,
              onToggle: (value) {},
            ),
            SizedBox(height: 20.h),
            BuildSwitchButton(
              title: AppStrings.alertsAddToFavorites.tr(context: context),
              switchKey: Constants.alertsAddToFavoritesSwitchKey,
              icon: ImageAssets.favorite,
              isSelected: true,
              onToggle: (value) {},
            ),
            SizedBox(height: 20.h),
            BuildSwitchButton(
              title: AppStrings.messageAlerts.tr(context: context),
              icon: ImageAssets.message,
              switchKey: Constants.messageAlertsSwitchKey,
              isSelected: true,
              onToggle: (value) {},
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
