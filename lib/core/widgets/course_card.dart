import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/stepper_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../features/courses/domain/models/course_description_attributes_model.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_sizes_util.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_styles.dart';

Container courseCard(
  CourseDescriptionAttributesModel attribute,
  Widget image,
) {
  return Container(
    height: ManagerHeight.h126,
    decoration: BoxDecoration(
      color: ManagerColors.white,
      borderRadius: BorderRadius.circular(
        ManagerRadius.r10,
      ),
    ),
    child: Padding(
      padding:  EdgeInsets.all(ManagerHeight.h10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: Constants.courseCardFirstPartFlex,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              child: image,
            ),
          ),
          SizedBox(
            width: ManagerWidth.w10,
          ),
          Expanded(
            flex: Constants.courseCardSecondPartFlex,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(child: SvgPicture.asset(ManagerAssets.save),onTap: (){},),
                  ],
                ),
                Text(
                  attribute.name.toString(),
                  style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s14, color: ManagerColors.black),
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: ManagerHeight.h10),
                        child: Text(
                          StepperController().courseHoursFormat(
                            attribute.hours.onNull(),
                          ),
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.grey,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: ManagerHeight.h10,
                          bottom: ManagerHeight.h10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
