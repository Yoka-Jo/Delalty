import 'package:auto_route/annotations.dart';
import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/common/components/widgets/my_elevated_button.dart';
import 'package:delalty/core/common/components/widgets/user_image.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/simple_text.dart';

@RoutePage()
class ProhibitedPersonsScreen extends StatelessWidget {
  const ProhibitedPersonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.prohibitedPersons.tr(context: context),
        iconColor: AppColors.grey3,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.fromLTRB(5.w, 10.h, 10.w, 10.h),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xff111111).withOpacity(0.05),
              ),
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.grey7,
            ),
            child: Row(
              children: [
                UserImage(
                  image:
                      'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  borderWidth: 0.0,
                  circleSize: 50.r,
                  showIconOnImage: false,
                ),
                SizedBox(width: 20.w),
                SimpleText(
                  'Naim al-Hamami',
                  textStyle: TextStyleEnum.poppinsRegular,
                  fontSize: 15.sp,
                ),
                const Spacer(),
                MyElevatedButton(
                  title: AppStrings.unblock,
                  height: 32.h,
                  verticalPadding: 0.0,
                  horizontalPadding: 8.w,
                  titleSize: 13.sp,
                  backgroundColor: AppColors.grey3,
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: 3,
      ),
    );
  }
}
