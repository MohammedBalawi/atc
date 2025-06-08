import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

Widget displayInfoField({
  required TextEditingController controller,
}) {
  return TextFormField(
    readOnly: true,
    controller: controller,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: ManagerHeight.h10,
        horizontal: ManagerWidth.w10,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.textFieldColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.textFieldColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      labelText: ManagerStrings.userName,

      labelStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.black,
        fontFamily: ManagerFontFamily.roboto,
      ),
    ),
  );

}