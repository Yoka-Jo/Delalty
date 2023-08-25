import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/common/components/widgets/my_elevated_button.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';

@RoutePage()
class ConfirmationOfSaleScreen extends StatelessWidget {
  const ConfirmationOfSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: AppStrings.addYourProduct,
        iconColor: AppColors.grey3,
      ),
      body: Column(
        children: [
          Image.network(
            'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            fit: BoxFit.cover,
            height: 320.h,
          ),
          SizedBox(height: 42.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SimpleText(
                  AppStrings.yourAdHasBeenSuccessfullyAdded,
                  textStyle: TextStyleEnum.poppinsSemiBold,
                  fontSize: 18.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 22.h),
                SimpleText(
                  AppStrings.reviewUnderway,
                  textStyle: TextStyleEnum.poppinsLight,
                  fontSize: 13.sp,
                  color: AppColors.grey3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 55.h),
                MyElevatedButton(
                  title: AppStrings.followUpOnRequests,
                  height: 50.h,
                  onPressed: () {},
                ),
                SizedBox(height: 17.h),
                MyElevatedButton(
                  title: AppStrings.theMainPage,
                  height: 50.h,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
