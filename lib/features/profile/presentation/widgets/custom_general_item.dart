import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes_util.dart';
import '../../../../core/resources/manager_styles.dart';

Widget custom_general_item({
  required String icon,
  required String title,
  Function()? onPressed,
  bool? isLanguage,
}) {
  return InkWell(
    onTap: onPressed.onNull(),
    child: Row(
      children: [
        Container(
          width: ManagerWidth.w40,
          height: ManagerHeight.h40,
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w6,
            vertical: ManagerHeight.h6,
          ),
          decoration: BoxDecoration(
            color: ManagerColors.white,
            borderRadius: BorderRadius.circular(
              ManagerRadius.r10,
            ),
          ),
          child: SvgPicture.asset(
            icon,
          ),
        ),
        SizedBox(
          width: ManagerWidth.w10,
        ),
        Text(
          title,
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s16,
              color: ManagerColors.textColorProfile),
        ),
        Spacer(),
        isLanguage == true ? SvgPicture.asset(ManagerAssets.arrow_down) : SvgPicture.asset(ManagerAssets.arrow_setting) ,
      ],
    ),
  );
}
