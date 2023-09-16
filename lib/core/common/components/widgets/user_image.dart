// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';

class UserImage extends StatelessWidget {
  final String image;
  final Widget? onImageWidget;
  final bool showIconOnImage;
  final String? icon;
  final Color? borderColor;
  final Widget? iconWidget;
  final double? circleSize;
  final double? borderWidth;
  const UserImage({
    Key? key,
    required this.image,
    this.icon,
    this.showIconOnImage = true,
    this.onImageWidget,
    this.iconWidget,
    this.circleSize,
    this.borderWidth,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final circleSize = this.circleSize ?? 95.w;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: EdgeInsets.all(borderWidth ?? 3.r),
          height: circleSize,
          width: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: borderColor ?? AppColors.primaryColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(95.r),
            child: image.isNotEmpty
                ? Image.network(
                    image,
                    fit: BoxFit.cover,
                  )
                : Container(color: AppColors.black),
          ),
        ),
        if (showIconOnImage) ...[
          if (iconWidget != null)
            iconWidget!
          else
            Positioned(
              right: (circleSize) * 0.045,
              bottom: (circleSize) * 0.045,
              child: onImageWidget == null
                  ? Image.asset(
                      icon ?? ImageAssets.verifyFull,
                      height: 18.w,
                      width: 18.w,
                    )
                  : onImageWidget!,
            ),
        ]
      ],
    );
  }
}
