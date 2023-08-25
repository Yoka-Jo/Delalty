import 'package:flutter/material.dart';

import 'font_manager.dart';

//put here font families
enum FontFamilies { montserrat, poppins, tajawal, alexandria }

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color? color, FontFamilies family) {
  //switch on family and return the appropriate TextStyle
  TextStyle textStyle =
      TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  switch (family) {
    case FontFamilies.montserrat:
      {
        return textStyle.copyWith(fontFamily: 'Montserrat');
      }
    case FontFamilies.alexandria:
      {
        return textStyle.copyWith(fontFamily: 'Alexandria');
      }
    case FontFamilies.poppins:
      {
        return textStyle.copyWith(fontFamily: 'Poppins');
      }
    case FontFamilies.tajawal:
      {
        return textStyle.copyWith(fontFamily: 'Tajawal');
      }
  }
}

//You can put here the default family

TextStyle getRegularStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, family);
}

TextStyle getMediumStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    Color? color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, family);
}

TextStyle getLightStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, family);
}

TextStyle getSemiBoldStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    Color? color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, family);
}

TextStyle getBoldStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, family);
}

TextStyle getExtraBoldStyle(
    {double fontSize = 12,
    FontFamilies family = FontFamilies.montserrat,
    required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color, family);
}
