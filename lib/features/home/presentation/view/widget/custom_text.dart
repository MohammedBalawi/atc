import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.name,
    required this.nameButton,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final String nameButton;
  final Color buttonColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: getMediumTextStyle(
            fontSize: ManagerFontSize.s16,
            color: ManagerColors.black,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            nameButton,
            style: getRegularTextStyle(
              fontSize: ManagerFontSize.s14,
              color: buttonColor,
            ),
          ),
        ),
        SvgPicture.asset(
          ManagerAssets.arrow,
        ),
      ],
    );
  }
}
