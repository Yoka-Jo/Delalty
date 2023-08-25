import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors_manager.dart';
import '../build_shimmer_widget.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({
    super.key,
    required this.width,
    required this.height,
    required this.padding,
  });

  final double? width;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BuildShimmerWidget(
          width: width ?? 230.w,
          height: height ?? 203.h,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
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
                  BuildShimmerWidget(
                    height: 10.h,
                    margin: EdgeInsets.zero,
                  ),
                  SizedBox(height: 5.h),
                  BuildShimmerWidget(
                    height: 10.h,
                    width: 120.w,
                    margin: EdgeInsets.zero,
                  ),
                  SizedBox(height: 5.h),
                  BuildShimmerWidget(
                    height: 10.h,
                    width: 100.w,
                    margin: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
