import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget socialAuth() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w40),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                  thickness: ManagerHeight.h0_5, color: ManagerColors.black),
            ),
            SizedBox(
              width: ManagerWidth.w5,
            ),
            Text(
              ManagerStrings.or,
              style: getRegularTextStyle(
                fontSize: ManagerFontSize.s12,
                color: ManagerColors.orLoginTextColor,
                fontFamily: ManagerFontFamily.roboto,

              ),
            ),
            Text(
              ManagerStrings.loginWith,
              style: getRegularTextStyle(
                fontSize: ManagerFontSize.s12,
                color: ManagerColors.orLoginTextColor,
                fontFamily: ManagerFontFamily.roboto,

              ),
            ),
            SizedBox(
              width: ManagerWidth.w5,
            ),
            Expanded(
              child: Divider(
                  thickness: ManagerHeight.h0_5, color: ManagerColors.black),
            ),
          ],
        ),
        SizedBox(
          height: ManagerHeight.h27,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: SvgPicture.asset(
                ManagerAssets.facebook,
              ),
              onTap: (){},
            ),
            InkWell(
              child: SvgPicture.asset(
                ManagerAssets.google,
              ),
              onTap: (){},
            ),
            InkWell(
              child: SvgPicture.asset(
                ManagerAssets.apple,
              ),
              onTap: (){},
            ),
            InkWell(
              child: SvgPicture.asset(
                ManagerAssets.twitter,
              ),
              onTap: (){},
            ),
          ],
        ),
      ],
    ),
  );
}
