import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/features/appointment/presentation/controller/appointment_controller.dart';
import 'package:act_hub_mobile/core/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../domain/model/reservations_user_attribute_model.dart';
import '../../../domain/model/reservations_user_model.dart';

class FinishedTab extends StatelessWidget {
  final List<ReservationsUserModel> finished;

  FinishedTab({
    required this.finished,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(builder: (controller) {
      return RefreshIndicator(
        color: ManagerColors.primaryColor,
        backgroundColor: ManagerColors.white,
        onRefresh: () async {
          await controller.readAppointments();
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
                    ReservationsUserAttributeModel? item =
                        finished[index].reservationsUserAttributeModel;
                    return CustomContainer(
                      image: controller.image(image: item!.resourceImage!),
                      visibleButton: true,
                      buttonName: ManagerStrings.bookAgain,
                      onPressed1: () => controller.performResourceDetails(
                        item.resource_id.onNull(),
                      ),
                      onPressed2: () => controller.performReservationDetails(
                          finished[index].id.onNull()),
                      title: item.categoryName.onNull(),
                      subTitle: item.resourceName.onNull(),
                      cost: controller.costDollarFormat(
                        item.price.onNull(),
                      ),
                      paymentMethod: item.paymentMethod.onNull(),
                      isVerifiedPayment: item.isVerifiedPayment.onNull(),
                    );
                  },
                ),
              )
            : Center(
                child: Text(
                  ManagerStrings.thereAreNoFinishedReservations,
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: ManagerColors.black,
                  ),
                ),
              ),
      );
    });
  }
}
