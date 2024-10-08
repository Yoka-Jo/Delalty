import '../../../text/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors_manager.dart';

class InputDecorationStyle extends InputDecoration {
  final String lang;
  final String? labelTxt;
  final String? hint;
  final Color? enableColor;
  final Color? hintColor;
  final Color? customFillColor;
  final double? borderRaduis;
  final double? hintSize;
  final EdgeInsets? padding;
  final bool? isFilled;

  const InputDecorationStyle({
    required this.lang,
    this.hint,
    this.labelTxt,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? focusColor,
    Widget? suffixWidget,
    Widget? prefixWidget,
    String? errorText,
    this.hintColor,
    this.customFillColor,
    this.enableColor,
    this.borderRaduis,
    this.hintSize,
    this.padding,
    this.isFilled,
  }) : super(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusColor: focusColor,
          errorText: errorText,
          suffix: suffixWidget,
          prefix: prefixWidget,
          filled: isFilled,
        );

  @override
  InputBorder get enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(
            color: enableColor ?? AppColors.fromFieldBorderColor, width: .7),
        borderRadius: BorderRadius.circular(borderRaduis ?? 10.r),
      );

  @override
  InputBorder get focusedBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRaduis ?? 10.r),
      borderSide: BorderSide(
          color: focusColor ?? AppColors.fromFieldBorderColor, width: 1));

  @override
  InputBorder get errorBorder => OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: .5),
      borderRadius: BorderRadius.circular(borderRaduis ?? 10.r));

  @override
  InputBorder get focusedErrorBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRaduis ?? 10.r),
      borderSide: const BorderSide(color: Colors.red, width: 2));

  @override
  TextStyle get errorStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 12)
      : GoogleFonts.cairo(fontSize: 10);

  @override
  String? get hintText => hint;

  @override
  Widget? get label => labelTxt == null
      ? super.label
      : Text(
          labelTxt ?? "",
          style: labelStyle,
        );

  @override
  TextStyle get labelStyle => lang != "ar"
      ? GoogleFonts.roboto(fontSize: 16, color: hintColor ?? Colors.black54)
      : GoogleFonts.cairo(fontSize: 14, color: hintColor ?? Colors.black54);

  @override
  TextStyle get hintStyle => getLightStyle(
      color: hintColor ?? Colors.black54,
      family: FontFamilies.poppins,
      fontSize: hintSize ?? 14);

  @override
  EdgeInsetsGeometry get contentPadding =>
      padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 15.h);

  @override
  bool get filled => true;

  @override
  Color get fillColor => customFillColor ?? Colors.transparent;

  @override
  bool get alignLabelWithHint => true;
}
