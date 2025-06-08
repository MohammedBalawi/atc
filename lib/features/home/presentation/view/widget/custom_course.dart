import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';

class CustomCourse extends StatelessWidget {
  final void Function()? onTap;
  final int index;
  final HomeController controller;

  const CustomCourse({
    Key? key,
    this.onTap,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w12,
          end: ManagerWidth.w12,
          top: ManagerHeight.h10,
          bottom: ManagerHeight.h12,
        ),
        margin: EdgeInsetsDirectional.only(
          end: ManagerWidth.w14,
        ),
        width: ManagerWidth.w300,
        decoration: BoxDecoration(
          color: ManagerColors.white,
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ManagerHeight.h180,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  ManagerRadius.r10,
                ),
                child: controller.image(
                  courseAvatar: controller
                      .courses[index].courseAttributeModel.avatar
                      .toString(),
                ),
              ),
            ),
            SizedBox(
              height: ManagerHeight.h8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ManagerWidth.w6,
                        vertical: ManagerHeight.h6,
                      ),
                      decoration: BoxDecoration(
                        color: ManagerColors.backgroundCourses,
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r4,
                        ),
                      ),
                      child: Text(
                        controller.courses[index].courseAttributeModel.name
                            .toString(),
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.primaryColor,
                        ),
                        maxLines: 1,
                        // Set the maximum number of lines before ellipsis is shown
                        overflow: TextOverflow
                            .ellipsis, // Handle overflow with ellipsis
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      controller.priceFormat(
                        controller.courses[index].courseAttributeModel.price
                            .onNull(),
                      ),
                      style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.black,
                      ),
                      maxLines: 1,
                      // Set the maximum number of lines before ellipsis is shown
                      overflow: TextOverflow
                          .ellipsis, // Handle overflow with ellipsis
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              controller.courses[index].courseAttributeModel.description
                  .toString(),
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s14,
                color: ManagerColors.black,
              ),
              maxLines: 2,
              // Set the maximum number of lines before ellipsis is shown
              overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ManagerAssets.star,
                      width: ManagerWidth.w20,
                      height: ManagerHeight.h20,
                    ),
                    SizedBox(
                      width: ManagerWidth.w4,
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.only(
                        top: ManagerHeight.h4,
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        controller.courseRatingFormat(index),
                        textAlign: TextAlign.center,
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ManagerWidth.w4,
                    ),
                  ],
                ),
                SizedBox(width: ManagerWidth.w20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: ManagerWidth.w6,
                      height: ManagerHeight.h6,
                      decoration: BoxDecoration(
                        color: ManagerColors.greyLight,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: ManagerWidth.w8),
                    Container(
                      padding: EdgeInsetsDirectional.only(
                        top: ManagerHeight.h4,
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        controller.courseHoursFormat(index),
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
