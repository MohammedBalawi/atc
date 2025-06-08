import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/courses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/widgets/error_container.dart';
import '../../../../../core/widgets/shimmer/shimmer_all_courses_list.dart';
import '../widget/course_item.dart';

class AllCoursesView extends StatefulWidget {
  const AllCoursesView({super.key});

  @override
  State<AllCoursesView> createState() => _AllCoursesViewState();
}

class _AllCoursesViewState extends State<AllCoursesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.backgroundForm,
      appBar: AppBar(
        backgroundColor: ManagerColors.backgroundForm,
        title: Text(
          ManagerStrings.courses,
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s18, color: ManagerColors.black),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<CoursesController>(
        builder: (controller) {
          return RefreshIndicator(
            color: ManagerColors.primaryColor,
            backgroundColor: ManagerColors.white,
            onRefresh: () async {
              controller.performRefresh();
            },
            child: controller.isLoading == 0
                ? ShimmerAllCoursesList()
                : controller.isLoading == 1
                    ? Container(
                        margin: EdgeInsets.symmetric(
                          vertical: ManagerHeight.h16,
                          horizontal: ManagerWidth.w16,
                        ),
                        child: ListView.builder(
                          physics: ScrollPhysics(),
                          itemCount: controller.courses.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CourseItem(
                                  index: index,
                                  onTap: () =>
                                      controller.performCourseDetails(index),
                                  controller: controller,
                                ),
                                SizedBox(height: ManagerHeight.h16),
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
    disposeAllCourses();
    super.dispose();
  }
}
