import 'package:flutter/material.dart';
import 'manager_fonts.dart';
import 'package:act_hub_mobile/config/localization/locales.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
  TextDecoration decoration,
  dynamic overflow,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: localeSettings.defaultLocale.toString() == "ar"
        ? ManagerFontFamily.tajawal
        : fontFamily,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
    overflow: overflow,
  );
}

// Regular TextStyle
TextStyle getRegularTextStyle({
  required double fontSize,
  required Color color,
  dynamic overflow = TextOverflow.visible,
  TextDecoration decoration = TextDecoration.none,
  String? fontFamily,
}) {
  return _getTextStyle(
    fontSize,
    fontFamily ?? ManagerFontFamily.fontFamily,
    ManagerFontWeight.regular,
    color,
    decoration,
    overflow,
  );
}

// Medium TextStyle
TextStyle getMediumTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  dynamic overflow = TextOverflow.visible,
  String? fontFamily,
}) {
  return _getTextStyle(
    fontSize,
    fontFamily ?? ManagerFontFamily.fontFamily,
    ManagerFontWeight.medium,
    color,
    decoration,
    overflow,
  );
}

// Bold TextStyle
TextStyle getBoldTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
  dynamic overflow = TextOverflow.visible,
  String? fontFamily,
}) {
  return _getTextStyle(
    fontSize,
    fontFamily ?? ManagerFontFamily.fontFamily,
    ManagerFontWeight.bold,
    color,
    decoration,
    overflow,
  );
}
