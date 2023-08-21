import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/assets_manager.dart';
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
          Image.asset(
            isSelected
                ? ImageAssets.radioSelected
                : ImageAssets.radioUnSelected,
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
