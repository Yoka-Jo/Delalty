// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';

class UserImage extends StatelessWidget {
  final String image;
  final String? icon;
  final Color? borderColor;
  final Widget? iconWidget;
  final double? circleSize;
  final double? borderWidth;
  const UserImage({
    Key? key,
    required this.image,
    this.icon,
    this.iconWidget,
    this.circleSize,
    this.borderWidth,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: EdgeInsets.all(borderWidth ?? 3.r),
          height: circleSize ?? 95.w,
          width: circleSize ?? 95.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: borderColor ?? AppColors.primaryColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(95.r),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (iconWidget != null)
          iconWidget!
        else
          Positioned(
            right: 6.r,
            bottom: 6.r,
            child: Image.asset(
              icon ?? ImageAssets.verify,
              height: 18.w,
              width: 18.w,
            ),
          ),
      ],
    );
  }
}
