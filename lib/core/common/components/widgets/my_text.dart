import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/localization/language_manager.dart';
import '../../../resources/theme/app_theme.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final double? letterSpace;
  final double? wordSpace;
  final String? fontFamily;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const MyText(
      {super.key,
      required this.title,
      required this.color,
      required this.size,
      this.alien,
      this.fontFamily,
      this.decoration,
      this.letterSpace,
      this.wordSpace,
      this.overflow,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Text(
      title,
      textAlign: alien ?? TextAlign.start,
      textScaleFactor: theme.textScaleFactor,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size ?? 16,
        letterSpacing: letterSpace,
        wordSpacing: wordSpace,
        decoration: decoration ?? TextDecoration.none,
        fontWeight: fontWeight ??
            (context.locale == arabicLocal ? FontWeight.w500 : FontWeight.w200),
        fontFamily: fontFamily ?? theme.textStyle.fontFamily,
      ),
      overflow: overflow,
    );
  }
}
