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

class UpComingTab extends StatelessWidget {
  final List<ReservationsUserModel> upComing;

  UpComingTab({
    required this.upComing,
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
        child: upComing.length != 0
            ? Padding(
                padding: EdgeInsets.only(
                  left: ManagerWidth.w16,
                  right: ManagerWidth.w16,
                  top: ManagerHeight.h30,
                ),
                child: ListView.builder(
                  itemCount: upComing.length,
                  itemBuilder: (context, index) {
                    ReservationsUserAttributeModel? item =
                        upComing[index].reservationsUserAttributeModel;
                    return CustomContainer(
                      image: controller.image(image: item!.resourceImage!),
                      buttonName: ManagerStrings.cancel,
                      visibleButton: true,
                      onPressed1: () {
                        cancelReservation(upComing[index].id ?? -1);
                      },
                      onPressed2: () => controller.performReservationDetails(
                        upComing[index].id.onNull(),
                      ),
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
                  ManagerStrings.thereAreNoUpcomingReservations,
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
