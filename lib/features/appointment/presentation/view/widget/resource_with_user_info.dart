import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/features/appointment/presentation/view/widget/reservation_item.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_resource_model.dart';
import 'package:flutter/material.dart';

Container resourceWithUserInfo(CategoryDetailsResourceModel reservationDetails,
    AppSettingsPrefs _appSettingsPrefs) {
  return Container(
    alignment: AlignmentDirectional.centerStart,
    margin: EdgeInsets.symmetric(
      horizontal: ManagerWidth.w20,
    ),
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (BuildContext context, box) {
            return Container(
              height: ManagerHeight.h100,
              child: reservationItem(reservationDetails),
            );
          },
        ),
        SizedBox(height: ManagerHeight.h20),
        Text(
          ManagerStrings.personalInformation,
          style: getMediumTextStyle(
            fontSize: ManagerFontSize.s16,
            color: ManagerColors.black,
          ),
        ),
        SizedBox(height: ManagerHeight.h20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                '${ManagerStrings.name} : ',
                style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.black,
                ),
              ),
              Text(
                _appSettingsPrefs.getUserName(),
                style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s14,
                  color: ManagerColors.greyLight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: ManagerHeight.h10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                '${ManagerStrings.email} : ',
                style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.black,
                ),
              ),
              Text(
                _appSettingsPrefs.getEmail(),
                style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s14,
                  color: ManagerColors.greyLight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: ManagerHeight.h10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                '${ManagerStrings.phone} : ',
                style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.black,
                ),
              ),
              Text(
                _appSettingsPrefs.getUserPhone(),
                style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s14,
                  color: ManagerColors.greyLight,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
