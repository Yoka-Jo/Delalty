import 'package:auto_route/auto_route.dart';
import '../../../core/common/components/widgets/my_outlined_button.dart';
import '../../../core/resources/localization/cubit/change_language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/simple_text.dart';
import '../../../core/resources/routes/app_router.dart';
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
              'Choose Language',
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 20.sp,
            ),
            SizedBox(height: 58.h),
            MyOutlinedButton(
              onPressed: () {
                ChangeLanguageCubit.get(context)
                    .changeLanguage(context, isEnglish: false);
                context.router.push(const OnBoardingRoute());
              },
              title: AppStrings.arabic,
            ),
            SizedBox(height: 37.h),
            MyOutlinedButton(
              onPressed: () {
                ChangeLanguageCubit.get(context)
                    .changeLanguage(context, isEnglish: true);
                context.router.push(const OnBoardingRoute());
              },
              title: AppStrings.english,
            )
          ],
        ),
      ),
    );
  }
}
