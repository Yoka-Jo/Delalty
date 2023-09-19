// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:delalty/core/common/components/widgets/simple_text.dart';

import '../../../resources/colors_manager.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final String? icon;
  final Color? iconColor;
  final double? height;
  final double? width;
  final double? titleSize;
  final double? iconSize;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final bool hasElevation;
  final bool spaceBetweenTextAndIcon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool reverseChild;
  final TextStyleEnum? textStyle;
  const MyElevatedButton({
    Key? key,
    required this.title,
    this.icon,
    this.iconColor,
    this.titleSize,
    this.height,
    this.width,
    this.iconSize,
    this.verticalPadding,
    this.reverseChild = false,
    this.horizontalPadding,
    this.borderRadius,
    this.textStyle,
    this.backgroundColor = AppColors.primaryColor,
    this.hasElevation = true,
    this.spaceBetweenTextAndIcon = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [
      SimpleText(
        title,
        textStyle: textStyle ?? TextStyleEnum.poppinsRegular,
        fontSize: titleSize ?? 14.sp,
        color: AppColors.grey2,
        textAlign: TextAlign.center,
      ),
      if (spaceBetweenTextAndIcon) SizedBox(width: 5.w),
      if (icon != null)
        SvgPicture.asset(
          icon!,
          color: iconColor,
        )
    ];
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: hasElevation ? null : 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8.r)),
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 10.h,
            horizontal: horizontalPadding ?? 0,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: reverseChild ? rowChildren.reversed.toList() : rowChildren,
        ),
      ),
    );
  }
}
