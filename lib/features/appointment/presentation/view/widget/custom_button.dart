import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color buttonTextColor;
  final Color buttonColor;
  final void Function()? onPressed;

  const CustomButton(
      {Key? key,
      required this.buttonName,
      required this.buttonTextColor,
      this.onPressed,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s10, color: buttonTextColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ManagerRadius.r6),
            side: BorderSide(
              color: ManagerColors.primaryColor,
              width: ManagerWidth.w1,
            ),
          ),
        ),
      ),
    );
  }
}
