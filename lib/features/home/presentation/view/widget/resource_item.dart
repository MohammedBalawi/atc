import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../core/widgets/custom_service_icon.dart';
import 'price_per_widget.dart';

Container resourceItem(HomeController controller, int index, onPressed) {
  return Container(
    alignment: AlignmentDirectional.centerStart,
    width: ManagerWidth.w300,
    margin: EdgeInsetsDirectional.only(
      end: ManagerWidth.w14,
    ),
    padding: EdgeInsetsDirectional.only(
      start: ManagerWidth.w12,
      end: ManagerWidth.w12,
      top: ManagerHeight.h10,
      bottom: ManagerHeight.h12,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        ManagerRadius.r14,
      ),
      color: ManagerColors.white,
    ),
    child: InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(ManagerRadius.r10),
            ),
            child: controller.image(
              courseAvatar: controller
                  .resources[index].attributes.thumbnailImage
                  .toString(),
              defaultImage: ManagerAssets.workspace,
            ),
          ),
          SizedBox(height: ManagerHeight.h10),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.resources[index].attributes.name.toString(),
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.black,
                  ),
                  maxLines: 1,
                  // Set the maximum number of lines before ellipsis is shown
                  overflow:
                      TextOverflow.ellipsis, // Handle overflow with ellipsis
                ),
                pricePerWidget(
                  controller,
                  controller.resources[index].attributes.priceByMonth.onNull(),
                  ManagerStrings.month,
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            controller.resourceSeatsFormat(index),
            style: getMediumTextStyle(
              fontSize: ManagerFontSize.s14,
              color: ManagerColors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Row(
            children: [
              customServiceIcon(
                image: ManagerAssets.wifi,
                width: ManagerWidth.w26,
                height: ManagerHeight.h26,
              ),
              SizedBox(width: ManagerWidth.w8),
              customServiceIcon(
                image: ManagerAssets.security,
                width: ManagerWidth.w26,
                height: ManagerHeight.h26,
              ),
              SizedBox(width: ManagerWidth.w8),
              customServiceIcon(
                image: ManagerAssets.air_condition,
                width: ManagerWidth.w26,
                height: ManagerHeight.h26,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
