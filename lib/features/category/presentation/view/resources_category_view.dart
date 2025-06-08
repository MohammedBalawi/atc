import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/widgets/CustomAppBar.dart';
import 'package:act_hub_mobile/core/widgets/pop_cope_widget.dart';
import 'package:act_hub_mobile/features/category/presentation/controller/category_details_controller.dart';
import 'package:act_hub_mobile/features/category/presentation/view/resource_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourcesCategoryView extends StatelessWidget {
  const ResourcesCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      onWillPop: () => Get.delete<CategoryDetailsController>(),
      child: GetBuilder<CategoryDetailsController>(
        builder: (controller) {
          return RefreshIndicator(
            color: ManagerColors.primaryColor,
            backgroundColor: ManagerColors.white,
            onRefresh: () async => await controller.read(),
            child: Scaffold(
              appBar: CustomAppBar(
                title: controller.name,
              ),
              body: controller.isEmptyResources() ??
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w20,
                    ),
                    child: ListView.builder(
                      itemCount: controller.resources.length.onNull(),
                      itemBuilder: (context, index) {
                        return resourceItem(
                          controller,
                          index,
                          () {
                            controller.navigateToReservation(
                              index,
                            );
                          },
                        );
                      },
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
