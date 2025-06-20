import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

Widget mainButton({
  required void Function() onPressed,
  String? buttonName,
  double? minWidth,
  Widget? child,
  Color? color,
  double? height,
  ShapeBorder? shapeBorder,
  double? elevation,
  EdgeInsetsGeometry? padding,
}) {
  return MaterialButton(
    padding: padding,
    onPressed: onPressed,
    minWidth: minWidth.onNull(),
    height: height ?? ManagerHeight.h48,
    color: color ?? ManagerColors.primaryColor,
    elevation: elevation ?? 2,
    shape: shapeBorder ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
        ),
    child: child ??
        Text(
          buttonName.onNull(),
          style: getRegularTextStyle(
            fontSize: ManagerFontSize.s18,
            color: ManagerColors.white,
            fontFamily: ManagerFontFamily.roboto,
          ),
        ),
  );
}
