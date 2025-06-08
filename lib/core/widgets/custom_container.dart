import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/appointment/presentation/view/widget/custom_button.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget image;
  final String buttonName;
  final bool visibleButton;
  final bool visibleAllButton;
  final String cost;
  final String title;
  final String subTitle;
  final void Function()? onPressed1;
  final void Function()? onPressed2;
  final String paymentMethod;
  final bool isVerifiedPayment;
  final bool isReservationButton;

  CustomContainer({
    Key? key,
    required this.image,
    this.buttonName = '',
    required this.visibleButton,
    this.visibleAllButton = true,
    this.onPressed1,
    this.onPressed2,
    required this.cost,
    required this.title,
    required this.subTitle,
    this.paymentMethod = 'Cache',
    this.isVerifiedPayment = false,
    this.isReservationButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: ManagerHeight.h20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w10,
        vertical: ManagerHeight.h10,
      ),
      decoration: BoxDecoration(
        color: ManagerColors.white,
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ManagerWidth.w140,
                height: ManagerHeight.h115,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ManagerRadius.r6,
                  ),
                  child: image,
                ),
              ),
              SizedBox(
                width: ManagerWidth.w10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: ManagerHeight.h8,
                    ),
                    Text(
                      subTitle,
                      style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: ManagerColors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: ManagerHeight.h12,
                    ),
                    Row(
                      children: [
                        Text(
                          '${ManagerStrings.payment}: ',
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.textColorAppoint,
                          ),
                        ),
                        Text(
                          paymentMethod,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.textColorAppoint,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ManagerHeight.h12,
                    ),
                    Row(
                      children: [
                        Text(
                          cost,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: ManagerWidth.w16,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: ManagerWidth.w76,
                          height: ManagerHeight.h30,
                          decoration: BoxDecoration(
                            color: isVerifiedPayment
                                ? ManagerColors.verifiedStatus
                                : ManagerColors.notVerifiedStatus,
                            borderRadius: BorderRadius.circular(
                              ManagerRadius.r6,
                            ),
                          ),
                          child: Text(
                            isVerifiedPayment
                                ? ManagerStrings.verified
                                : ManagerStrings.notVerified,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s10,
                              color: ManagerColors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),

          Visibility(
            visible: visibleAllButton,
            child: Column(
              children: [
                Divider(
                  color: ManagerColors.greyLight,
                ),
                Visibility(
                  visible: visibleButton,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: onPressed1,
                        buttonName: buttonName,
                        buttonColor: ManagerColors.white,
                        buttonTextColor: ManagerColors.primaryColor,
                      ),
                      SizedBox(
                        width: ManagerWidth.w40,
                      ),
                      CustomButton(
                        onPressed: onPressed2,
                        buttonName: isReservationButton
                            ? ManagerStrings.reservationView
                            : ManagerStrings.subscriptionDetails,
                        buttonColor: ManagerColors.primaryColor,
                        buttonTextColor: ManagerColors.white,
                      ),
                    ],
                  ),
                  replacement: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: onPressed2,
                        buttonName: isReservationButton
                            ? ManagerStrings.reservationView
                            : ManagerStrings.subscriptionDetails,
                        buttonColor: ManagerColors.primaryColor,
                        buttonTextColor: ManagerColors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
