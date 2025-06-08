import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/appointment/presentation/controller/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.backgroundForm,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              ManagerStrings.myReservations,
              style: getRegularTextStyle(
                fontSize: ManagerFontSize.s18,
                color: ManagerColors.black,
              ),
            ),
            bottom: TabBar(
              controller: controller.tabController,
              dividerColor: ManagerColors.greyLight,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: [
                Tab(
                  child: Text(
                    ManagerStrings.upcoming,
                    style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s15,
                      color: ManagerColors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    ManagerStrings.finished,
                    style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s15,
                      color: ManagerColors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    ManagerStrings.cancelled,
                    style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s15,
                      color: ManagerColors.black,
                    ),
                  ),
                ),
              ],
              indicatorColor: ManagerColors.primaryColor,
            ),
          ),
          body: TabBarView(
            physics: ClampingScrollPhysics(),
            controller: controller.tabController,
            children: controller.screens,
          ),
        );
      },
    );
  }
}
