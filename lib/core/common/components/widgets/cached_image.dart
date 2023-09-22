// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../resources/colors_manager.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? height, width, borderWidth;
  final BorderRadius? borderRadius;
  final ColorFilter? colorFilter;
  final Alignment? alignment;
  final Widget? child;
  final Widget? placeHolder;
  final Color? borderColor;
  final Color? bgColor;
  final BoxShape? boxShape;
  final bool haveRadius;
  const CachedImage({
    super.key,
    required this.url,
    this.fit,
    this.width,
    this.height,
    this.placeHolder,
    this.borderRadius,
    this.colorFilter,
    this.alignment,
    this.child,
    this.boxShape,
    this.borderColor,
    this.borderWidth,
    this.bgColor,
    this.haveRadius = true,
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return _ErrorImageWidget(
        width: width,
        height: height,
        bgColor: bgColor,
        haveRadius: haveRadius,
        borderRadius: borderRadius,
        borderColor: borderColor,
        boxShape: boxShape,
        placeHolder: placeHolder,
        child: child,
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.fill,
              colorFilter: colorFilter),
          borderRadius:
              haveRadius ? borderRadius ?? BorderRadius.circular(0) : null,
          shape: boxShape ?? BoxShape.rectangle,
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1),
        ),
        alignment: alignment ?? Alignment.center,
        child: child,
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius:
              haveRadius ? borderRadius ?? BorderRadius.circular(0) : null,
          border:
              Border.all(color: borderColor ?? Colors.transparent, width: 1),
          shape: boxShape ?? BoxShape.rectangle,
          color: bgColor ?? AppColors.primaryColor.withOpacity(.5),
        ),
        child: const SpinKitFadingCircle(
          color: AppColors.primaryColor,
          size: 30.0,
        ),
      ),
      errorWidget: (context, url, error) => _ErrorImageWidget(
        width: width,
        height: height,
        bgColor: bgColor,
        haveRadius: haveRadius,
        borderRadius: borderRadius,
        borderColor: borderColor,
        boxShape: boxShape,
        placeHolder: placeHolder,
        child: child,
      ),
    );
  }
}

class _ErrorImageWidget extends StatelessWidget {
  const _ErrorImageWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.bgColor,
    required this.haveRadius,
    required this.borderRadius,
    required this.borderColor,
    required this.boxShape,
    required this.placeHolder,
    required this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? bgColor;
  final bool haveRadius;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final BoxShape? boxShape;
  final Widget? placeHolder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.primaryColor.withOpacity(.5),
        borderRadius:
            haveRadius ? borderRadius ?? BorderRadius.circular(0) : null,
        border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
        shape: boxShape ?? BoxShape.rectangle,
      ),
      child: Stack(
        children: [
          placeHolder ?? child ?? Container(),
          child ?? Container(),
        ],
      ),
    );
  }
}
