// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:delalty/core/common/components/widgets/simple_text.dart';

import '../../../resources/assets_manager.dart';

class UserRating extends StatelessWidget {
  final int rating;
  const UserRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          rating,
          (index) => SvgPicture.asset(
            ImageAssets.star,
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 2.5.h,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: Colors.black.withOpacity(0.22)),
          child: SimpleText(
            rating.toDouble().toString(),
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 8.sp,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
