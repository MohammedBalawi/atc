import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

Widget checkBoxWidget({
  bool loginView = true,
  required bool status,
  void Function(bool?)? onChanged,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: ManagerWidth.w18,
          height: ManagerHeight.h18,
          margin: EdgeInsetsDirectional.only(
            end: ManagerWidth.w6,
          ),
          child: Checkbox(
            value: status,
            onChanged: onChanged,
            activeColor: ManagerColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ManagerRadius.r4,
              ),
            ),
            side: BorderSide(
              width: ManagerWidth.w1,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onChanged?.call(!status); // Toggle the checked status
          },
          child: loginView ? Text(ManagerStrings.rememberMe,
            style: getRegularTextStyle(fontSize: ManagerFontSize.s14,
                color: ManagerColors.rememberMe,
                fontFamily: ManagerFontFamily.roboto),) : Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: ManagerStrings.iAgreeToOur,
                  style: getRegularTextStyle(fontSize: ManagerFontSize.s14,
                      color: ManagerColors.textCheckBoxColor,
                      fontFamily: ManagerFontFamily.roboto),
                ),
                TextSpan(
                  text: ManagerStrings.termsOfService,
                  style: getRegularTextStyle(fontSize: ManagerFontSize.s14,
                    decoration: TextDecoration.underline,
                    color: ManagerColors.primaryColor,
                    fontFamily: ManagerFontFamily.roboto,
                  ),
                ),
                TextSpan(
                  text: ManagerStrings.and,
                  style: getRegularTextStyle(fontSize: ManagerFontSize.s14,
                      color: ManagerColors.textCheckBoxColor,
                      fontFamily: ManagerFontFamily.roboto),
                ),
                TextSpan(
                  text: ManagerStrings.privacyPolicy,
                  style: getRegularTextStyle(fontSize: ManagerFontSize.s14,
                      decoration: TextDecoration.underline,
                      color: ManagerColors.primaryColor,
                      fontFamily: ManagerFontFamily.roboto),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
