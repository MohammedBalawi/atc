import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/reservations_user_attribute_model.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/reservations_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../controller/appointment_controller.dart';
import '../../../../../core/widgets/custom_container.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(
      builder: (controller) {
        ReservationsUserModel reservationsUserModel =
            controller.currentReservation()!;
        ReservationsUserAttributeModel reservationsUserAttributeModel =
            reservationsUserModel.reservationsUserAttributeModel!;
        return Scaffold(
          backgroundColor: ManagerColors.backgroundForm,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              ManagerStrings.reservationDetails,
              style: getRegularTextStyle(
                fontSize: ManagerFontSize.s18,
                color: ManagerColors.black,
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsetsDirectional.only(
              start: ManagerWidth.w16,
              end: ManagerWidth.w16,
              top: ManagerHeight.h36,
              bottom: ManagerHeight.h100,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: ManagerColors.greyLight,
              ),
              borderRadius: BorderRadius.circular(
                ManagerRadius.r4,
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  CustomContainer(
                    image: controller.image(
                        image: reservationsUserAttributeModel.resourceImage!),
                    visibleButton: false,
                    cost: controller.costDollarFormat(
                      reservationsUserAttributeModel.price.onNull(),
                    ),
                    title: reservationsUserAttributeModel.categoryName.onNull(),
                    subTitle:
                        reservationsUserAttributeModel.resourceName.onNull(),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: ManagerHeight.h16,
                      horizontal: ManagerWidth.w16,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ManagerStrings.resourcesName,
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.black,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h4),
                                Text(
                                  reservationsUserAttributeModel.resourceName
                                      .onNull(),
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.grey,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h12),
                                Text(
                                  ManagerStrings.reservationStartDate,
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.black,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h4),
                                Text(
                                  reservationsUserAttributeModel.start_date
                                      .onNull(),
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ManagerStrings.category,
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.black,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h4),
                                Text(
                                  reservationsUserAttributeModel.categoryName
                                      .onNull(),
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.grey,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h12),
                                Text(
                                  ManagerStrings.reservationEndDate,
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.black,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h4),
                                Text(
                                  reservationsUserAttributeModel.end_date
                                      .onNull(),
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: ManagerHeight.h50),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: ManagerWidth.w12,
                            vertical: ManagerHeight.h12,
                          ),
                          child: Column(
                            children: [
                              Text(
                                ManagerStrings.price,
                                style: getMediumTextStyle(
                                  fontSize: ManagerFontSize.s24,
                                  color: ManagerColors.black,
                                ),
                              ),
                              SizedBox(height: ManagerHeight.h4),
                              Text(
                                controller.costDollarFormat(
                                  reservationsUserAttributeModel.price.onNull(),
                                ),
                                style: getMediumTextStyle(
                                  fontSize: ManagerFontSize.s26,
                                  color: ManagerColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
