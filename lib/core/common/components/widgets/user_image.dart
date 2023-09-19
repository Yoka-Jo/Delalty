import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';
import 'cached_image.dart';

class UserImage extends StatelessWidget {
  final String image;
  final Widget? onImageWidget;
  final bool showIconOnImage;
  final String? icon;
  final Color? borderColor;
  final Widget? iconWidget;
  final double? circleSize;
  final double? borderWidth;
  final bool isVerified;
  final bool isEdit;
  const UserImage({
    Key? key,
    required this.image,
    this.icon,
    this.showIconOnImage = true,
    this.isVerified = false,
    this.isEdit = false,
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
            color: !isVerified ? null : borderColor ?? AppColors.primaryColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(95.r),
            child: image.isNotEmpty
                ? CachedImage(
                    url: image,
                    fit: BoxFit.cover,
                  )
                : Container(color: AppColors.grey7),
          ),
        ),
        if ((showIconOnImage && isVerified) || isEdit) ...[
          if (iconWidget != null)
            iconWidget!
          else
            Positioned(
              right: (circleSize) * 0.05,
              bottom: (circleSize) * 0.05,
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
