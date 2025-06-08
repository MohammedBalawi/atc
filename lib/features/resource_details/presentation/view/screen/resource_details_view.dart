import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/widget/customized_bottom.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/widget/customized_image.dart';
import 'package:act_hub_mobile/features/resource_details/presentation/controller/resource_details_controller.dart';
import 'package:act_hub_mobile/features/resource_details/presentation/view/widget/customized_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourceDetailsView extends StatelessWidget {
  const ResourceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.delete<ResourceDetailsController>(),
      child: GetBuilder<ResourceDetailsController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: Constants.elevation,
              backgroundColor: ManagerColors.transparent,
              iconTheme: IconThemeData(
                color: ManagerColors.white,
                size: ManagerIconSize.s30,
              ),
            ),
            extendBodyBehindAppBar: true,
            body: RefreshIndicator(
              color: ManagerColors.primaryColor,
              backgroundColor: ManagerColors.white,
              onRefresh: () async {
                await controller.resourceDetails();
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  height: ManagerHeight.h812,
                  child: Column(
                    children: [
                      CustomImage(
                        image: controller.image(),
                      ),
                      CustomResourceDescription(
                        name: controller.name,
                        description: controller.description,
                        numberSites: controller.numberSeats,
                        onPressed: () {
                          Get.defaultDialog(
                              title: ManagerStrings.allPrices,
                              backgroundColor: ManagerColors.white,
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        ManagerStrings.by,
                                        style: getMediumTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: ManagerHeight.h6,
                                      ),
                                      Text(
                                        ManagerStrings.hour,
                                        style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.grey,
                                        ),
                                      ),
                                      Text(
                                        ManagerStrings.day,
                                        style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.grey,
                                        ),
                                      ),
                                      Text(
                                        ManagerStrings.week,
                                        style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.grey,
                                        ),
                                      ),
                                      Text(
                                        ManagerStrings.month,
                                        style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        ManagerStrings.price,
                                        style: getMediumTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: ManagerHeight.h6,
                                      ),
                                      Text(
                                        controller.hour,
                                        style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.grey,
                                        ),
                                      ),
                                      Text(
                                        controller.day,
                                        style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.grey,
                                        ),
                                      ),
                                      Text(
                                        controller.week,
                                        style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.grey,
                                        ),
                                      ),
                                      Text(
                                        controller.month,
                                        style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s14,
                                          color: ManagerColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ));
                        },
                        initialRating: 0,
                        isRated: false,
                        onRatingUpdate: (double) {},
                        rate: '0.0',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: CustomBottom(
              price: controller.priceByHour,
              onPressed: () {
                controller.navigateToPayment();
              },
              buttonName: ManagerStrings.reserveNow,
            ),
          );
        },
      ),
    );
  }
}
