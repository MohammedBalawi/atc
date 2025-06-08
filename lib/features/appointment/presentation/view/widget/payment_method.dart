import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/widgets/main_button.dart';
import 'package:act_hub_mobile/features/payment/domain/model/payments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container paymentMethod(bool isCurrentPaymentMethod(int index),
    PaymentsModel _paymentsModel, void setPaymentMethod(int index)) {
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
        Text(
          ManagerStrings.choosePayment,
          style: getMediumTextStyle(
            fontSize: ManagerFontSize.s16,
            color: ManagerColors.black,
          ),
        ),
        SizedBox(height: ManagerHeight.h20),
        Container(
          height: ManagerHeight.h240,
          child: ListView.builder(
            itemCount: _paymentsModel.data!.length,
            itemBuilder: (context, index) {
              return mainButton(
                onPressed: () => setPaymentMethod(
                  index,
                ),
                child: Container(
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
                        _paymentsModel.data![index].name,
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
                            color: isCurrentPaymentMethod(index)
                                ? ManagerColors.primaryColor
                                : ManagerColors.paymentSelectorBorderSide,
                          ),
                          color: ManagerColors.transparent,
                        ),
                        child: isCurrentPaymentMethod(index)
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ManagerColors.primaryColor,
                                ),
                              )
                            : Container(),
                      ),
                      SizedBox(width: ManagerWidth.w8),
                    ],
                  ),
                ),
                color: ManagerColors.transparent,
                elevation: Constants.paymentElevation,
                padding: EdgeInsets.zero,
              );
            },
          ),
        )
      ],
    ),
  );
}
