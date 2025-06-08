import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/course_description_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomDescription extends StatelessWidget {
  final void Function(double) onRatingUpdate;
  final String name;
  final bool isRated;
  final String rate;
  final String hourTraining;
  final String lecturerName;
  final String description;
  final double initialRating;

  const CustomDescription({
    Key? key,
    required this.onRatingUpdate,
    required this.isRated,
    required this.name,
    required this.rate,
    required this.hourTraining,
    required this.lecturerName,
    required this.description,
    required this.initialRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: ManagerHeight.h300,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: ManagerColors.backgroundForm,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(ManagerRadius.r20),
            topLeft: Radius.circular(ManagerRadius.r20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w16,
            vertical: ManagerHeight.h26,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        name,
                        style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        GetBuilder<CourseDescriptionController>(
                          builder: (controller) {
                            return RatingBar.builder(
                              initialRating: initialRating,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: controller.ratingBarItemCount,
                              itemSize: ManagerIconSize.s24,
                              itemBuilder: (context, i) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              unratedColor: ManagerColors.greyLight,
                              ignoreGestures: isRated,
                              onRatingUpdate: onRatingUpdate,
                            );
                          },
                        ),
                        Text(
                          "($rate)",
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.greyLight,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h12,
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ManagerAssets.course_hours,
                          width: ManagerWidth.w20,
                          height: ManagerHeight.h20,
                        ),
                        SizedBox(
                          width: ManagerWidth.w10,
                        ),
                        Text(
                          '$hourTraining ${ManagerStrings.hourTraining}',
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ManagerAssets.lecture,
                          width: ManagerWidth.w20,
                          height: ManagerHeight.h20,
                        ),
                        SizedBox(
                          width: ManagerWidth.w6,
                        ),
                        Text(
                          '$lecturerName',
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Text(
                  ManagerStrings.description,
                  style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: ManagerColors.textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: ManagerHeight.h6,
                ),
                Text(
                  description,
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.descriptionColor,
                  ),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
