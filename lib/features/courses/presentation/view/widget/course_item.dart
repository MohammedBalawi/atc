import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../controller/courses_controller.dart';

class CourseItem extends StatelessWidget {
  final void Function()? onTap;
  final int index;
  final CoursesController controller;

  const CourseItem(
      {Key? key, this.onTap, required this.index, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: ManagerHeight.h110,
        decoration: BoxDecoration(
          color: ManagerColors.white,
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              child: controller.image(
                courseAvatar: controller
                    .courses[index].courseAttributesModel!.avatar
                    .toString(),
              ),
            ),
            SizedBox(
              width: ManagerWidth.w10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w6,
                    vertical: ManagerHeight.h6,
                  ),
                  margin: EdgeInsets.only(
                      top: ManagerHeight.h6, bottom: ManagerHeight.h8),
                  decoration: BoxDecoration(
                    color: ManagerColors.backgroundCourses,
                    borderRadius: BorderRadius.circular(
                      ManagerRadius.r4,
                    ),
                  ),
                  child: Text(
                    ManagerStrings.design,
                    style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: ManagerColors.primaryColor),
                  ),
                ),
                Text(
                  controller.courses[index].courseAttributesModel!.name
                      .toString(),
                  style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.black),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: ManagerHeight.h10),
                  child: Text(
                    controller.courseHoursFormat(index),
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s12,
                      color: ManagerColors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(
                top: ManagerHeight.h10,
                bottom: ManagerHeight.h10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // InkWell(
                  //   child: SvgPicture.asset(
                  //     ManagerAssets.save,
                  //   ),
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        ManagerAssets.star,
                        width: ManagerWidth.w20,
                        height: ManagerHeight.h20,
                      ),
                      SizedBox(
                        width: ManagerWidth.w2,
                      ),
                      Text(
                        ManagerStrings.rate,
                        textAlign: TextAlign.center,
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: ManagerColors.grey,
                        ),
                      ),
                      SizedBox(
                        width: ManagerWidth.w4,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
