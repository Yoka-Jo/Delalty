// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../simple_text.dart';
import 'widgets/widgets.dart';

class ProductStatisticsInfo extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String location;
  final int numberOfViews;
  final int numberOfFavorites;
  final int numberOfMessages;
  final bool showMoreButton;
  final bool showStatusButton;
  final bool isActive;
  const ProductStatisticsInfo({
    Key? key,
    required this.image,
    required this.title,
    this.showMoreButton = false,
    this.showStatusButton = false,
    this.isActive = true,
    required this.price,
    required this.location,
    required this.numberOfViews,
    required this.numberOfFavorites,
    required this.numberOfMessages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xff111111).withOpacity(0.05),
        ),
        borderRadius: BorderRadius.circular(5.r),
        color: AppColors.grey,
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 15.w,
                  top: showStatusButton ? 10.h : 0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImage(image: image),
                    SizedBox(width: 12.w),
                    ProductInfo(title: title, price: price, location: location),
                    if (showMoreButton) ...[
                      const Spacer(),
                      const ProductMoreButton(),
                    ]
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              ProductStatistics(
                numberOfViews: numberOfViews,
                numberOfFavorites: numberOfFavorites,
                numberOfMessages: numberOfMessages,
              ),
              SizedBox(height: 5.h),
            ],
          ),
          if (showStatusButton)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.black15,
                  width: isActive ? 0 : 1,
                ),
                borderRadius: BorderRadius.circular(2.r),
                color: isActive ? AppColors.primaryColor : AppColors.grey2,
              ),
              child: SimpleText(
                isActive ? AppStrings.active : AppStrings.sold,
                textStyle: TextStyleEnum.poppinsMedium,
                fontSize: 10.sp,
                color: isActive ? Colors.white : AppColors.primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
