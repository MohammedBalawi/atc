import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../controller/subscriptions_controller.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.backgroundForm,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              ManagerStrings.mySubscriptions,
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
