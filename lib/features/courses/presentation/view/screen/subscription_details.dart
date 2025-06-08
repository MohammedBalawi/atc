import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/domain/models/subscription_attributes_model.dart';
import 'package:act_hub_mobile/features/courses/domain/models/subscription_model.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/subscriptions_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../core/widgets/custom_container.dart';

class SubscriptionDetails extends StatelessWidget {
  const SubscriptionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionsController>(
      builder: (controller) {
        SubscriptionModel subscriptionsUserModel =
            controller.currentSubscription()!;
        SubscriptionAttributesModel subscriptionsUserAttributeModel =
            subscriptionsUserModel.subscriptionAttributesModel!;
        return Scaffold(
          backgroundColor: ManagerColors.backgroundForm,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              ManagerStrings.subscriptionDetails,
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
                      image: subscriptionsUserAttributeModel.courseImage,
                    ),
                    visibleAllButton: false,
                    visibleButton: false,
                    cost: controller.costDollarFormat(
                      subscriptionsUserAttributeModel.reservationPrice.onNull(),
                    ),
                    title: subscriptionsUserAttributeModel.courseName.onNull(),
                    subTitle: subscriptionsUserAttributeModel.courseDescription
                        .onNull(),
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
                                  ManagerStrings.courseName,
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.black,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h4),
                                Text(
                                  subscriptionsUserAttributeModel.courseName
                                      .onNull(),
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.grey,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h20),
                                Text(
                                  ManagerStrings.courseStartDate,
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.black,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h4),
                                Text(
                                  subscriptionsUserAttributeModel
                                      .reservationStartDate
                                      .onNull(),
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.grey,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h20),
                                Text(
                                  ManagerStrings.courseEndDate,
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.black,
                                  ),
                                ),
                                SizedBox(height: ManagerHeight.h4),
                                Text(
                                  subscriptionsUserAttributeModel
                                      .reservationStartDate
                                      .onNull(),
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color: ManagerColors.grey,
                                  ),
                                ),
                              ],
                            ),
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
                                      subscriptionsUserAttributeModel
                                          .reservationPrice
                                          .onNull(),
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
                        SizedBox(height: ManagerHeight.h50),
                      ],
                    ),
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
