import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../simple_text.dart';

class RadioButtonWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const RadioButtonWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.r,
            width: 21.r,
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: AppColors.switchButtonBorderColor,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: CircleAvatar(
              radius: 13.r,
              backgroundColor:
                  isSelected ? AppColors.primaryColor : Colors.white,
            ),
          ),
          SimpleText(
            title,
            textStyle: TextStyleEnum.poppinsRegular,
            fontSize: 18.sp,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
