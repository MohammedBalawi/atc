import 'package:act_hub_mobile/config/localization/locales.dart';
import 'package:act_hub_mobile/core/util/size_util.dart';
import 'package:flutter/material.dart';

class ManagerFontFamily {
  static String fontFamily =
  localeSettings.defaultLocale.toString() == "ar" ? tajawal : comfortaa;
  static String tajawal = 'Tajawal';
  static String roboto = 'Roboto';
  static String comfortaa = 'Comfortaa';
}

class ManagerFontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}

class ManagerFontSize {
  static double s2 = SizeUtil.setFontSize(2.0);
  static double s4 = SizeUtil.setFontSize(4.0);
  static double s6 = SizeUtil.setFontSize(6.0);
  static double s8 = SizeUtil.setFontSize(8.0);
  static double s10 = SizeUtil.setFontSize(10.0);
  static double s11 = SizeUtil.setFontSize(11.0);
  static double s12 = SizeUtil.setFontSize(12.0);
  static double s14 = SizeUtil.setFontSize(14.0);
  static double s15 = SizeUtil.setFontSize(15.0);
  static double s16 = SizeUtil.setFontSize(16.0);
  static double s18 = SizeUtil.setFontSize(18.0);
  static double s20 = SizeUtil.setFontSize(20.0);
  static double s22 = SizeUtil.setFontSize(22.0);
  static double s24 = SizeUtil.setFontSize(24.0);
  static double s25 = SizeUtil.setFontSize(25.0);
  static double s26 = SizeUtil.setFontSize(26.0);
  static double s28 = SizeUtil.setFontSize(28.0);
  static double s30 = SizeUtil.setFontSize(30.0);
  static double s35 = SizeUtil.setFontSize(35.0);
  static double s40 = SizeUtil.setFontSize(40.0);
  static double s80 = SizeUtil.setFontSize(80.0);
  static double s100 = SizeUtil.setFontSize(100.0);
}
