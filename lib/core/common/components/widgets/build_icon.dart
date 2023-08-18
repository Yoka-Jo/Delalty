import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildSuffixIcon extends StatelessWidget {
  final double? scale;
  final String asset;
  final Color? assetColor;

  const BuildSuffixIcon(
      {Key? key, this.scale, required this.asset, this.assetColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          asset,
          fit: BoxFit.scaleDown,
        ),
      ],
    );
  }
}
