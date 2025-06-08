import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/resources/presentation/view/resource_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/widgets/error_container.dart';
import '../../../../core/widgets/shimmer/shimmer_all_resources_list.dart';
import '../controller/resources_controller.dart';

class ResourcesView extends StatefulWidget {
  const ResourcesView({super.key});

  @override
  State<ResourcesView> createState() => _ResourcesViewState();
}

class _ResourcesViewState extends State<ResourcesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.backgroundForm,
      appBar: AppBar(
        backgroundColor: ManagerColors.backgroundForm,
        title: Text(
          ManagerStrings.resources,
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s18, color: ManagerColors.black),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ResourcesController>(
        builder: (controller) {
          return RefreshIndicator(
            color: ManagerColors.primaryColor,
            backgroundColor: ManagerColors.white,
            onRefresh: () async {
              controller.performRefresh();
            },
            child: controller.isLoading == 0
                ? ShimmerAllResourceList()
                : controller.isLoading == 1
                    ? Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ManagerWidth.w20,
                        ),
                        child: ListView.builder(
                          physics: ScrollPhysics(),
                          itemCount: controller.resources.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                resourceItem(
                                  controller,
                                  index,
                                  () {
                                    controller.performResourceDetails(index);
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    : SingleChildScrollView(
                        child: errorContainer(
                          controller.errorMessage,
                        ),
                      ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    disposeResources();
    super.dispose();
  }
}
