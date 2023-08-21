import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../core/common/components/widgets/simple_text.dart';
import '../../../../core/resources/colors_manager.dart';

class BuildSwitchButton extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final void Function(bool value) onToggle;
  const BuildSwitchButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
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
          Container(
            height: 35.h,
            width: 35.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.primaryColor,
            ),
            child: Center(
              child: SvgPicture.asset(icon),
            ),
          ),
          SizedBox(width: 15.w),
          SimpleText(
            title,
            textStyle: TextStyleEnum.poppinsRegular,
            fontSize: 15.sp,
            color: AppColors.black,
          ),
          const Spacer(),
          FlutterSwitch(
            width: 55.w,
            valueFontSize: 25.0,
            height: 32.h,
            borderRadius: 30.0,
            value: isSelected,
            activeColor: AppColors.primaryColor,
            onToggle: onToggle,
          ),
        ],
      ),
    );
  }
}
