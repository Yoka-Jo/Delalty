// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/colors_manager.dart';

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? titleColor;
  final double? titleSize;
  final TextStyleEnum? titleStyle;
  final EdgeInsets? padding;
  final Color? borderColor;
  final double? borderRadius;

  const MyOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.titleColor,
    this.borderColor,
    this.titleSize,
    this.borderRadius,
    this.titleStyle,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165.w,
      height: 58.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0)),
          padding: padding,
          side: BorderSide(
            color: borderColor ?? AppColors.primaryColor,
            width: 1,
          ),
        ),
        onPressed: onPressed,
        child: SimpleText(
          title,
          textStyle: titleStyle ?? TextStyleEnum.tajawalMedium,
          fontSize: titleSize ?? 18.sp,
          color: titleColor ?? Colors.black,
        ),
      ),
    );
  }
}
