import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  String? hintText,
  bool? obSecure,
  required TextEditingController controller,
  Widget? suffixIcon,
  Widget? prefixIcon,
  Color? hintColor,
  void Function()? onTap,
  onChange,
  TextInputType? textInputType,
  FocusNode? focusNode,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obSecure.onNull(),
    keyboardType: textInputType,
    onTap: onTap,
    focusNode: focusNode,
    onChanged: onChange ?? (val) {},
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: ManagerHeight.h10,
        horizontal: ManagerWidth.w10,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r10,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r10,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r10,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          ManagerRadius.r10,
        ),
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
      ),
      filled: true,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      fillColor: ManagerColors.white,
      hintText: hintText,
      hintStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: hintColor == null ? ManagerColors.greyLight : hintColor ,
      ),
    ),
  );
}