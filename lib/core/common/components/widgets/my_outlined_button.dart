import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const MyOutlinedButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165.w,
      height: 58.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        onPressed: onPressed,
        child: SimpleText(
          title,
          textStyle: TextStyleEnum.tajawalMedium,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
