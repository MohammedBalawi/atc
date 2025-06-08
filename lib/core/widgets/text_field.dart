import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';

Widget textField({
  String? labelText,
  bool? obSecure,
  required TextEditingController controller,
  validator,
  Widget? suffixIcon,
  Widget? prefixIcon,
  void Function()? onTap,
  onChange,
  TextInputType? textInputType,
  FocusNode? focusNode,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
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
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      labelText: labelText,
      labelStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.black,
        fontFamily: ManagerFontFamily.roboto,
      ),
    ),
  );
}
