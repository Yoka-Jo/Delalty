import 'simple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colors_manager.dart';

class BuildOptionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;
  const BuildOptionButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? AppColors.primaryColor : null,
        side: const BorderSide(color: AppColors.primaryColor, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.all(
          10.r,
        ),
      ),
      onPressed: onPressed,
      child: SimpleText(
        title,
        textStyle: TextStyleEnum.poppinsRegular,
        fontSize: 13.sp,
        color: isSelected ? Colors.white : AppColors.primaryColor,
      ),
    );
  }
}
