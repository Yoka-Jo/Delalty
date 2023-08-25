// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/colors_manager.dart';

class BottomSheetElementWidget extends StatelessWidget {
  final String title;
  final Color titleColor;
  final TextStyleEnum? titleStyle;
  final String icon;
  final Color backgroundColor;
  final VoidCallback onTap;
  const BottomSheetElementWidget({
    Key? key,
    required this.title,
    this.titleStyle,
    this.titleColor = Colors.black,
    required this.icon,
    this.backgroundColor = AppColors.primaryColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 35.w,
            height: 35.w,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: backgroundColor,
            ),
            child: SvgPicture.asset(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10.w),
          SimpleText(
            title,
            textStyle: titleStyle ?? TextStyleEnum.poppinsRegular,
            fontSize: 15.sp,
            color: titleColor,
          ),
        ],
      ),
    );
  }
}
