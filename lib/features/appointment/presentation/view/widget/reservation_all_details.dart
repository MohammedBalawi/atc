import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/features/appointment/presentation/view/widget/reservation_item.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_resource_model.dart';
import 'package:act_hub_mobile/features/payment/domain/model/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container reservationAllDetails(PaymentModel _paymentModel, AppSettingsPrefs _appSettingsPrefs,
    CategoryDetailsResourceModel reservationDetails) {
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
        // courseCard(attribute),
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
        SizedBox(height: ManagerHeight.h30),
        Container(
          alignment: AlignmentDirectional.centerStart,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ManagerStrings.choosePayment,
                style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.black,
                ),
              ),
              SizedBox(height: ManagerHeight.h20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ManagerRadius.r10,
                  ),
                  color: ManagerColors.white,
                ),
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w10,
                  vertical: ManagerHeight.h10,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: ManagerHeight.h10,
                ),
                height: ManagerHeight.h54,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ManagerAssets.cashPayment,
                      width: ManagerWidth.w36,
                      height: ManagerHeight.h36,
                    ),
                    SizedBox(width: ManagerWidth.w8),
                    Text(
                      _paymentModel.name,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.greyLight,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: ManagerWidth.w16,
                      height: ManagerHeight.h16,
                      padding: EdgeInsets.symmetric(
                        horizontal: ManagerWidth.w2,
                        vertical: ManagerHeight.h2,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: ManagerHeight.h1,
                            color: ManagerColors.primaryColor),
                        color: ManagerColors.transparent,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: ManagerWidth.w8),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
