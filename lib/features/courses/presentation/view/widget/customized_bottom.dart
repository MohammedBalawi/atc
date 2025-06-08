import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final void Function() onPressed;
  final String? price;
  final String? buttonName;

  const CustomBottom(
      {Key? key, required this.onPressed, this.price, this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
      height: ManagerHeight.h70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ManagerColors.greyLight,
            spreadRadius: 1,
            blurRadius: 20,
          )
        ],
        color: ManagerColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            ManagerRadius.r10,
          ),
          topRight: Radius.circular(
            ManagerRadius.r10,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$$price",
            style: getBoldTextStyle(
              fontSize: ManagerFontSize.s22,
              color: ManagerColors.black,
              fontFamily: ManagerFontFamily.roboto,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ManagerHeight.h10),
            child: mainButton(
              onPressed: onPressed,
              buttonName: buttonName ?? ManagerStrings.subscriptNow,
            ),
          )
        ],
      ),
    );
  }
}
