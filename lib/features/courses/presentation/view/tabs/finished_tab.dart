import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/widgets/custom_container.dart';
import 'package:act_hub_mobile/features/courses/domain/models/subscription_attributes_model.dart';
import 'package:act_hub_mobile/features/courses/domain/models/subscription_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../controller/subscriptions_controller.dart';

class FinishedTab extends StatelessWidget {
  final List<SubscriptionModel> finished;

  FinishedTab({
    required this.finished,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionsController>(
      builder: (controller) {
        return RefreshIndicator(
          color: ManagerColors.primaryColor,
          backgroundColor: ManagerColors.white,
          onRefresh: () async {
            await controller.readSubscriptions();
          },
          child: finished.length != 0
              ? Padding(
                  padding: EdgeInsets.only(
                    left: ManagerWidth.w16,
                    right: ManagerWidth.w16,
                    top: ManagerHeight.h30,
                  ),
                  child: ListView.builder(
                    itemCount: finished.length,
                    itemBuilder: (context, index) {
                      SubscriptionAttributesModel? item =
                          finished[index].subscriptionAttributesModel;
                      return CustomContainer(
                        image: controller.image(image: item!.courseImage),
                        visibleButton: false,
                        buttonName: ManagerStrings.subscriptionAgain,
                        onPressed2: () => controller.performSubscriptionDetails(
                          finished[index].id.onNull(),
                        ),
                        title: item.courseName.onNull(),
                        subTitle: item.courseDescription.onNull(),
                        cost: controller.costDollarFormat(
                          item.reservationPrice.onNull(),
                        ),
                        paymentMethod: item.paymentMethod.onNull(),
                        isVerifiedPayment:
                            item.reservationIsVerifiedPayment.onNull(),
                        isReservationButton: false,
                      );
                    },
                  ),
                )
              : Center(
                  child: Text(
                    ManagerStrings.thereAreNoFinishedSubscriptions,
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s18,
                      color: ManagerColors.black,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
