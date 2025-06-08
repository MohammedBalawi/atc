import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/widgets/pop_cope_widget.dart';
import 'package:act_hub_mobile/features/home/presentation/controller/home_controller.dart';
import 'package:act_hub_mobile/features/home/presentation/view/widget/custom_banner.dart';
import 'package:act_hub_mobile/features/home/presentation/view/widget/custom_category.dart';
import 'package:act_hub_mobile/features/home/presentation/view/widget/custom_course.dart';
import 'package:act_hub_mobile/features/home/presentation/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/error_container.dart';
import '../../../../../core/widgets/shimmer/shimmer_category_list.dart';
import '../../../../../core/widgets/shimmer/shimmer_course_list.dart';
import '../../../../../core/widgets/shimmer/shimmer_resource_list.dart';
import '../../../../../routes/routes.dart';
import '../widget/home_app_bar.dart';
import '../widget/resource_item.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: Scaffold(
        backgroundColor: ManagerColors.backgroundForm,
        appBar: homeAppBar(),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return RefreshIndicator(
              color: ManagerColors.primaryColor,
              backgroundColor: ManagerColors.white,
              onRefresh: () async {
                controller.performRefresh();
              },
              child: controller.isLoading == 2
                  ? SingleChildScrollView(
                      child: errorContainer(
                        controller.errorMessage,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                        vertical: ManagerHeight.h20,
                        horizontal: ManagerWidth.w12,
                      ),
                      child: ListView(
                        children: [
                          Container(
                            height: ManagerHeight.h160,
                            child: CustomBanner(),
                          ),
                          SizedBox(height: ManagerHeight.h10),
                          CustomText(
                            name: ManagerStrings.categories,
                            nameButton: ManagerStrings.viewAll,
                            onPressed: () =>
                                controller.navigateToAllCategories(),
                            buttonColor: ManagerColors.primaryColor,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: ManagerHeight.h48,
                            child: controller.isLoading == 1
                                ? ListView.builder(
                                    itemCount: controller.categories.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return CustomCategory(
                                        name: controller.categories[index]
                                            .categoryAttributeModel!.name
                                            .toString(),
                                        imagePath: controller.categories[index]
                                            .categoryAttributeModel!.banner
                                            .toString(),
                                        index: index,
                                      );
                                    },
                                  )
                                : ShimmerCategoryList(),
                          ),
                          SizedBox(height: ManagerHeight.h24),
                          CustomText(
                            name: ManagerStrings.popularCourses,
                            nameButton: ManagerStrings.viewAll,
                            buttonColor: ManagerColors.primaryColor,
                            onPressed: () => Get.toNamed(Routes.all_courses),
                          ),
                          Container(
                            height: ManagerHeight.h340,
                            child: controller.isLoading == 1
                                ? ListView.builder(
                                    itemCount: controller.courses.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return CustomCourse(
                                        index: index,
                                        onTap: () => controller
                                            .performCourseDetails(index),
                                        controller: controller,
                                      );
                                    },
                                  )
                                : ShimmerCourseList(),
                          ),
                          SizedBox(
                            height: ManagerHeight.h20,
                          ),
                          CustomText(
                            name: ManagerStrings.recommendedWorkSpace,
                            nameButton: ManagerStrings.viewAll,
                            buttonColor: ManagerColors.primaryColor,
                            onPressed: () => Get.toNamed(Routes.resourcesView),
                          ),
                          Container(
                            height: ManagerHeight.h300,
                            child: controller.isLoading == 1
                                ? ListView.builder(
                                    itemCount:
                                        controller.resources.length.onNull(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return resourceItem(
                                        controller,
                                        index,
                                        () {
                                          controller
                                              .performResourceDetails(index);
                                        },
                                      );
                                    },
                                  )
                                : ShimmerResourceList(),
                          ),
                          SizedBox(
                            height: ManagerHeight.h20,
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
