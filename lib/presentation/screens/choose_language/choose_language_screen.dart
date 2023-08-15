import 'package:auto_route/annotations.dart';
import 'package:delalty/core/common/components/widgets/my_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/simple_text.dart';
import '../../../core/resources/strings_manager.dart';

@RoutePage()
class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SimpleText(
              AppStrings.appName,
              textStyle: TextStyleEnum.montserratExtraBold,
              fontSize: 36.sp,
            ),
            SizedBox(height: 15.h),
            SimpleText(
              AppStrings.chooseLanguage,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 20.sp,
            ),
            SizedBox(height: 58.h),
            MyOutlinedButton(
              onPressed: () {},
              title: AppStrings.arabic,
            ),
            SizedBox(height: 37.h),
            MyOutlinedButton(
              onPressed: () {},
              title: AppStrings.english,
            )
          ],
        ),
      ),
    );
  }
}
