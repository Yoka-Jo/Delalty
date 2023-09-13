// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delalty/core/common/components/widgets/simple_text.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/strings_manager.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String title;
  final double? height;
  final double? width;
  final double? iconHeight;
  final double? iconWidth;
  final double? titleSize;
  final double? iconSize;
  final double? subTitleSize;
  final TextStyleEnum? titleStyle;
  final TextStyleEnum? subTitleStyle;

  const CategoryWidget({
    Key? key,
    required this.image,
    required this.title,
    this.height,
    this.width,
    this.iconHeight,
    this.iconSize,
    this.iconWidth,
    this.titleSize,
    this.subTitleSize,
    this.titleStyle,
    this.subTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 172.w,
      height: height ?? 160.h,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: image.isEmpty ? AppColors.primaryColor.withOpacity(0.8) : null,
        borderRadius: BorderRadius.circular(8.r),
        image: image.isEmpty
            ? null
            : DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleText(
                  title,
                  textStyle: titleStyle ?? TextStyleEnum.poppinsMedium,
                  fontSize: 15.sp,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
                SimpleText(
                  AppStrings.findOut,
                  textStyle: subTitleStyle ?? TextStyleEnum.poppinsLight,
                  fontSize: 10.sp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            width: iconHeight ?? 25.w,
            height: iconWidth ?? 25.w,
            decoration: BoxDecoration(
              color: Colors.black45,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios_sharp,
                size: iconSize ?? 12.5.r,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
