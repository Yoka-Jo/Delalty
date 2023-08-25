import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmerWidget extends StatelessWidget {
  final double? width;
  final double height;
  final double? borderRadius;
  final BoxShape? boxShape;
  final EdgeInsets? margin;
  final bool hasMargin;

  const BuildShimmerWidget(
      {Key? key,
      this.width,
      this.boxShape,
      this.margin,
      this.hasMargin = true,
      required this.height,
      this.borderRadius})
      : super(key: key);

  final baseColor = const Color(0xffF2F2F2);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: Colors.white,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        margin: hasMargin ? (margin ?? const EdgeInsets.symmetric(vertical: 5)) : EdgeInsets.zero,
        decoration: BoxDecoration(
            color: baseColor,
            shape: boxShape ?? BoxShape.rectangle,
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r)),
      ),
    );
  }
}
