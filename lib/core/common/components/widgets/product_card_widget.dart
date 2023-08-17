import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/strings_manager.dart';

class ProductCardWidget extends StatelessWidget {
  final String? image;
  final String title;
  final Widget details;
  const ProductCardWidget({
    super.key,
    this.image,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230.w,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 230.w,
              height: 140.h,
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        topRight: Radius.circular(5.r),
                      ),
                      child: Image.network(
                        image ??
                            'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        height: 140.h,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(10.h),
                      margin: EdgeInsets.all(5.h),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset(
                        ImageAssets.favourite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 125.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.white,
                    border: Border.all(width: 1, color: AppColors.grey4)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleText(
                      title,
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: 10.sp,
                      color: AppColors.grey3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        SimpleText(
                          'EGP 1,000,000',
                          textStyle: TextStyleEnum.poppinsSemiBold,
                          fontSize: 10.sp,
                        ),
                        const Spacer(),
                        details
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImageAssets.locationPin,
                          color: AppColors.primaryColor,
                          width: 12.w,
                          height: 15.h,
                        ),
                        SizedBox(width: 5.w),
                        SimpleText(
                          'Egypt . Cairo',
                          textStyle: TextStyleEnum.poppinsMedium,
                          fontSize: 8.sp,
                          color: AppColors.primaryColor,
                        ),
                        const Spacer(),
                        SimpleText(
                          "2 ${AppStrings.days}",
                          textStyle: TextStyleEnum.poppinsMedium,
                          fontSize: 8.sp,
                          color: AppColors.grey3,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
