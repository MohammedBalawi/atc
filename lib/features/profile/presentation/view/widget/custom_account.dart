import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_strings.dart';

class CustomAccount extends StatelessWidget {
  const CustomAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w16, vertical: ManagerHeight.h10),
      decoration: BoxDecoration(
        color: ManagerColors.backgroundForm,
        borderRadius: BorderRadius.circular(ManagerRadius.r16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: ManagerColors.greyLight,
            offset: Offset(0.0, 2.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w16, vertical: ManagerHeight.h10),
            child: Text(
              ManagerStrings.account,
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16, color: ManagerColors.black),
            ),
          ),
          Divider(
            color: ManagerColors.dividerColor,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ManagerWidth.w14,
              right: ManagerWidth.w14,
              bottom: ManagerHeight.h14,
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.edit_profile);
              },
              child: Row(
                children: [
                  Container(
                    width: ManagerWidth.w40,
                    height: ManagerHeight.h40,
                    padding: EdgeInsets.symmetric(
                        horizontal: ManagerWidth.w6,
                        vertical: ManagerHeight.h6),
                    decoration: BoxDecoration(
                        color: ManagerColors.white,
                        borderRadius: BorderRadius.circular(ManagerRadius.r10)),
                    child: SvgPicture.asset(ManagerAssets.edit),
                  ),
                  SizedBox(
                    width: ManagerWidth.w10,
                  ),
                  Text(
                    ManagerStrings.editProfile,
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.textColorProfile),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.edit_profile);
                    },
                    child: SvgPicture.asset(ManagerAssets.arrow_setting),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: ManagerColors.dividerColor,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ManagerWidth.w14,
              right: ManagerWidth.w14,
              bottom: ManagerHeight.h14,
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.change_password);
              },
              child: Row(
                children: [
                  Container(
                    width: ManagerWidth.w40,
                    height: ManagerHeight.h40,
                    padding: EdgeInsets.symmetric(
                        horizontal: ManagerWidth.w6,
                        vertical: ManagerHeight.h6),
                    decoration: BoxDecoration(
                        color: ManagerColors.white,
                        borderRadius: BorderRadius.circular(ManagerRadius.r10)),
                    child: SvgPicture.asset(ManagerAssets.key),
                  ),
                  SizedBox(
                    width: ManagerWidth.w10,
                  ),
                  Text(
                    ManagerStrings.changePassword,
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.textColorProfile),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.change_password);
                    },
                    child: SvgPicture.asset(ManagerAssets.arrow_setting),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
