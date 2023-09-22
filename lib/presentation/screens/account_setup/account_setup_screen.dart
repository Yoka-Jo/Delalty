import 'package:auto_route/auto_route.dart';
import '../../../core/resources/strings_manager.dart';
import 'widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/resources/colors_manager.dart';

@RoutePage()
class AccountSetupScreen extends StatelessWidget {
  const AccountSetupScreen({super.key});

  final List<Widget> buttons = const [
    SetAlertsButton(),
    EditProfileButton(),
    PrivacyButton(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.accountSetup.tr(context: context),
        iconColor: AppColors.grey3,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            ...buttons
                .map(
                  (button) => Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: button,
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
