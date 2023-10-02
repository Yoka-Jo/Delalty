// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/common/components/widgets/cached_image.dart';
import '../../../core/common/components/widgets/my_elevated_button.dart';
import '../../../core/common/components/widgets/simple_text.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../domain/entities/product.dart';

@RoutePage()
class ConfirmationOfSaleScreen extends StatelessWidget {
  const ConfirmationOfSaleScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.addYourProduct.tr(context: context),
        iconColor: AppColors.grey3,
      ),
      body: Column(
        children: [
          CachedImage(
            url: product.mainImage,
            fit: BoxFit.cover,
            height: 320.h,
          ),
          SizedBox(height: 42.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SimpleText(
                  AppStrings.yourAdHasBeenSuccessfullyAdded
                      .tr(context: context),
                  textStyle: TextStyleEnum.poppinsSemiBold,
                  fontSize: 18.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 22.h),
                SimpleText(
                  AppStrings.reviewUnderway.tr(context: context),
                  textStyle: TextStyleEnum.poppinsLight,
                  fontSize: 13.sp,
                  color: AppColors.grey3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 55.h),
                MyElevatedButton(
                  title: AppStrings.followUpOnRequests.tr(context: context),
                  height: 50.h,
                  onPressed: () {
                    context.router.pop();
                    context.router.push(const NotificationsRoute());
                  },
                ),
                SizedBox(height: 17.h),
                MyElevatedButton(
                  title: AppStrings.theMainPage.tr(context: context),
                  height: 50.h,
                  onPressed: () {
                    context.router.pop();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
