import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/colors_manager.dart';
import '../simple_text.dart';

class BuildButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final VoidCallback onTap;
  const BuildButton({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                child: icon.endsWith('.png')
                    ? Image.asset(
                        icon,
                        color: Colors.white,
                        width: 24.r,
                        height: 24.r,
                      )
                    : SvgPicture.asset(
                        icon,
                      )),
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleText(
                title,
                textStyle: TextStyleEnum.poppinsRegular,
                fontSize: 18.sp,
              ),
              SimpleText(
                subTitle,
                textStyle: TextStyleEnum.poppinsLight,
                fontSize: 12.sp,
                color: AppColors.grey3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
