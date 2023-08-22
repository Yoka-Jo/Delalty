// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/widgets.dart';

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
          ProductImageAndDetails(
            width: width,
            height: height,
            image: image,
            padding: padding,
            title: title,
            titleSize: titleSize,
            titleColor: titleColor,
            priceSize: priceSize,
            details: details,
            showLocationPin: showLocationPin,
            locationColor: locationColor,
            days: days,
          ),
          if (showfavouriteButton) FavoriteIcon(isFavorite: isFavorite),
        ],
      ),
    );
  }
}
