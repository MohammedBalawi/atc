import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes_util.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../controller/category_details_controller.dart';

Container resourceItem(
    CategoryDetailsController controller, int index, onPressed) {
  return Container(
    margin: EdgeInsetsDirectional.only(
      top: ManagerHeight.h20,
      bottom: ManagerHeight.h20,
    ),
    height: ManagerHeight.h280,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        ManagerRadius.r14,
      ),
      color: ManagerColors.white,
    ),
    child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(ManagerRadius.r10),
              ),
              child: Image.network(
                controller.resources[index].attributes!.thumbnailImage
                    .toString(),
                height: ManagerHeight.h215,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: ManagerHeight.h80,
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w12,
                end: ManagerWidth.w12,
                top: ManagerHeight.h8,
                bottom: ManagerHeight.h20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.resources[index].attributes!.name.toString(),
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        controller.seatsFormat(index),
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: ManagerColors.textColorAppoint,
                        ),
                      ),
                    ],
                  ),
                  Center(
                      child: controller.priceByFormat(
                    controller.priceFormat(
                      controller.resources[index].attributes!.priceByMonth
                          .onNull(),
                    ),
                    ManagerStrings.month,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
