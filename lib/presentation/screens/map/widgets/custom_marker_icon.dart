// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/components/widgets/simple_text.dart';
import '../../../../core/resources/colors_manager.dart';

class CustomMarkerIcon extends StatelessWidget {
  final String title;
  const CustomMarkerIcon({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(ImageAssets.mapPin),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              ImageAssets.mapPin,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 100.w,
              child: SimpleText(
                'Town House for sale in Sheikh Zayed',
                textStyle: TextStyleEnum.poppinsRegular,
                fontSize: 8.sp,
                color: AppColors.grey3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
