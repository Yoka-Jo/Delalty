// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';

class RealEstateFeatures extends StatelessWidget {
  final int area;
  final int bedsNumber;
  final int bathroomsNumber;
  const RealEstateFeatures({
    Key? key,
    required this.area,
    required this.bedsNumber,
    required this.bathroomsNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Feature(title: area, icon: ImageAssets.area),
        SizedBox(width: 5.w),
        _Feature(title: bathroomsNumber, icon: ImageAssets.bathroom),
        SizedBox(width: 5.w),
        _Feature(title: bedsNumber, icon: ImageAssets.bed),
      ],
    );
  }
}

class _Feature extends StatelessWidget {
  final int title;
  final String icon;
  const _Feature({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SimpleText(
          "$title",
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 7.sp,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: 2.w),
        Image.asset(
          icon,
          height: 12.h,
          width: 12.w,
        ),
      ],
    );
  }
}
