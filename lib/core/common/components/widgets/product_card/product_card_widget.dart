// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:delalty/core/common/components/widgets/simple_text.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/routes/app_router.dart';
import '../../../../resources/strings_manager.dart';
import '../cashed_image_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final String? image;
  final String title;
  final double? titleSize;
  final Color? titleColor;
  final Color? locationColor;
  final bool showLocationPin;
  final bool showfavouriteButton;
  final bool isFavorite;
  final double? priceSize;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final int? days;
  final Widget details;

  const ProductCardWidget({
    Key? key,
    this.image,
    required this.title,
    this.days = 2,
    this.titleSize,
    this.titleColor,
    this.width,
    this.isFavorite = false,
    this.height,
    this.locationColor,
    this.padding,
    this.showLocationPin = true,
    this.showfavouriteButton = true,
    this.priceSize,
    this.details = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 230.w,
      height: height ?? 203.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          InkWell(
            onTap: () {
              context.router.push(const ProductRoute());
            },
            child: SizedBox(
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: CashedImageWidget(
                  image: image ??
                      'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  alignment: Alignment.topCenter,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (showfavouriteButton)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(7.r),
                margin: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                child: SvgPicture.asset(
                  isFavorite ? ImageAssets.favoriteFull : ImageAssets.favourite,
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                context.router.push(const ProductRoute());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Container(
                  padding: padding ?? EdgeInsets.all(10.r),
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
                        fontSize: titleSize ?? 10.sp,
                        color: titleColor ?? AppColors.grey3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          SimpleText(
                            'EGP 1,000,000',
                            textStyle: TextStyleEnum.poppinsSemiBold,
                            fontSize: priceSize ?? 10.sp,
                          ),
                          const Spacer(),
                          details,
                        ],
                      ),
                      Row(
                        children: [
                          if (showLocationPin) ...[
                            Image.asset(
                              ImageAssets.locationPin,
                              color: AppColors.primaryColor,
                              width: 12.w,
                              height: 12.h,
                            ),
                            SizedBox(width: 5.w),
                          ],
                          SimpleText(
                            'Egypt . Cairo',
                            textStyle: TextStyleEnum.poppinsMedium,
                            fontSize: 8.sp,
                            color: locationColor ?? AppColors.primaryColor,
                          ),
                          if (days != null) ...[
                            const Spacer(),
                            SimpleText(
                              "$days ${AppStrings.days}",
                              textStyle: TextStyleEnum.poppinsMedium,
                              fontSize: 8.sp,
                              color: AppColors.grey3,
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
