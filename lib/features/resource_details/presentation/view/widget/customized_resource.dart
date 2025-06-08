import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/resource_details/presentation/controller/resource_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../core/widgets/custom_service_icon.dart';

class CustomResourceDescription extends StatelessWidget {
  final String name;
  final String description;
  final int numberSites;
  final double initialRating;
  final bool isRated;
  final void Function(double) onRatingUpdate;
  final void Function()? onPressed;
  final String rate;


  const CustomResourceDescription({
    Key? key,
    required this.name,
    required this.description,
    required this.numberSites,
    this.onPressed,
    required this.initialRating,
    required this.isRated,
    required this.onRatingUpdate,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s20,
                      color: ManagerColors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      GetBuilder<ResourceDetailsController>(
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
                height: ManagerHeight.h24,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    ManagerAssets.office_chair,
                    width: ManagerWidth.w20,
                    height: ManagerHeight.h20,
                  ),
                  SizedBox(
                    width: ManagerWidth.w10,
                  ),
                  Text(
                    "${numberSites.toString()} ${ManagerStrings.seats}",
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.textResourceColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              Text(
                ManagerStrings.facilities,
                style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.black,
                ),
              ),
              SizedBox(height: ManagerHeight.h12,),
              Container(
                width: ManagerWidth.w325,
                height: ManagerHeight.h100,
                margin: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w10,
                  vertical: ManagerHeight.h6,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16,
                  vertical: ManagerHeight.h6,
                ),
                decoration: BoxDecoration(
                  color: ManagerColors.white,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customServiceIcon(image: ManagerAssets.wifi),
                        customServiceIcon(image: ManagerAssets.air_condition),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: ManagerWidth.w6,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ManagerStrings.wifi,
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.textColorProfile,
                            ),
                          ),
                          Text(
                            ManagerStrings.airConditioning,
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.textColorProfile,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customServiceIcon(image: ManagerAssets.board),
                        customServiceIcon(image: ManagerAssets.security)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: ManagerWidth.w6,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ManagerStrings.board,
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.textColorProfile,
                            ),
                          ),
                          Text(
                            ManagerStrings.security,
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.textColorProfile,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
              ),
              SizedBox(
                height: ManagerHeight.h12,
              ),
              Text(
                description,
                style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.descriptionColor,
                ),
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
