import 'package:delalty/core/resources/text/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../spacing.dart';
import 'properties/input_decoration_style.dart';

part 'dark_theme.dart';
part 'light_theme.dart';

const _dividerThemeData = DividerThemeData(
  space: 0,
);

// If the number of properties get too big, we can start grouping them in
// classes like Flutter does with TextTheme, ButtonTheme, etc, inside ThemeData.
abstract class AppThemeData {
  ThemeData get materialThemeData;

  double screenMargin = Spacing.mediumLarge;

  Color get selectedBottomSheetColor;
  Color get multiDropDownConfirmButtonTextColor;
  Color get multiDropDownCancelButtonTextColor;

  double gridSpacing = Spacing.mediumLarge;
  double textScaleFactor = 1.0;

  TextStyle textStyle = const TextStyle(
    fontFamily: 'Fondamento',
  );

  TextStyle formFieldTextStyle = const TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  InputDecoration inputDecoration(BuildContext context,
          {String? label,
          String? hint,
          String? error,
          Widget? prefixIcon,
          Color? hintColor,
          Color? fillColor,
          Widget? suffixIcon,
          Widget? suffixWidget,
          Widget? prefixWidget,
          EdgeInsets? padding,
          double? radius,
          Color? focusBorderColor,
          Color? enableColor,
          double? hintSize,
          bool? isFilled}) =>
      InputDecorationStyle(
        lang: context.locale.languageCode,
        labelTxt: label,
        hint: hint,
        errorText: error,
        prefixIcon: prefixIcon,
        hintColor: hintColor,
        customFillColor: fillColor,
        suffixIcon: suffixIcon,
        suffixWidget: suffixWidget,
        prefixWidget: prefixWidget,
        padding: padding,
        borderRaduis: radius,
        focusColor: focusBorderColor,
        enableColor: enableColor,
        hintSize: hintSize,
        isFilled: isFilled,
      );
}

extension on Color {
  Map<int, Color> _toSwatch() => {
        50: withOpacity(0.1),
        100: withOpacity(0.2),
        200: withOpacity(0.3),
        300: withOpacity(0.4),
        400: withOpacity(0.5),
        500: withOpacity(0.6),
        600: withOpacity(0.7),
        700: withOpacity(0.8),
        800: withOpacity(0.9),
        900: this,
      };

  MaterialColor toMaterialColor() => MaterialColor(
        value,
        _toSwatch(),
      );
}
