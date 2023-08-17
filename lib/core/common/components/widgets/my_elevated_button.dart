// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:delalty/core/common/components/widgets/simple_text.dart';

import '../../../resources/colors_manager.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final String icon;
  final double? titleSize;
  final double? iconSize;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final bool hasElevation;
  final bool spaceBetweenTextAndIcon;
  final VoidCallback onPressed;
  const MyElevatedButton({
    Key? key,
    required this.title,
    required this.icon,
    this.titleSize,
    this.iconSize,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius,
    this.hasElevation = true,
    this.spaceBetweenTextAndIcon = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        elevation: hasElevation ? null : 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r)),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 10.h,
          horizontal: horizontalPadding ?? 0,
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SimpleText(
            title,
            textStyle: TextStyleEnum.poppinsRegular,
            fontSize: titleSize ?? 14.sp,
            color: AppColors.grey2,
          ),
          if (spaceBetweenTextAndIcon) SizedBox(width: 5.w),
          SvgPicture.asset(
            icon,
          )
        ],
      ),
    );
  }
}
