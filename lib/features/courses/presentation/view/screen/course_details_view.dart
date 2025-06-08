import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/widgets/pop_cope_widget.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/course_description_controller.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/widget/customized.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/widget/customized_bottom.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/widget/customized_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDescriptionView extends StatelessWidget {
  const CourseDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      onWillPop: () => Get.delete<CourseDescriptionController>(),
      child: GetBuilder<CourseDescriptionController>(
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
                await controller.courseDetails();
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  height: ManagerHeight.h812,
                  child: Column(
                    children: [
                      CustomImage(
                        image: controller.image(),
                      ),
                      CustomDescription(
                        name: controller.courseName,
                        description: controller.courseDescription,
                        hourTraining: controller.courseHourTraining,
                        lecturerName: controller.courseLecturerName,
                        rate: controller.courseRate.toString(),
                        initialRating: controller.courseRate,
                        isRated: controller.courseIsRated,
                        onRatingUpdate: (rating) {
                          controller.courseRating(
                            context: context,
                            value: rating,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: CustomBottom(
              price: controller.coursePrice,
              onPressed: () {
                controller.paymentSelection(context);
              },
            ),
          );
        },
      ),
    );
  }
}
