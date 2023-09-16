import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/strings_manager.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.grey1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SimpleText(
              AppStrings.or.tr(context: context),
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 17.sp,
            ),
          ),
          const Expanded(
            child: Divider(
              color: AppColors.grey1,
            ),
          ),
        ],
      ),
    );
  }
}
