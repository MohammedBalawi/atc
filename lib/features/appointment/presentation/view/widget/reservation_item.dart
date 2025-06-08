import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_resource_model.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_styles.dart';

Widget reservationItem(CategoryDetailsResourceModel resource) {
  return Container(
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
          child: Image.network(
            resource.attributes!.thumbnailImage.toString(),
            width: ManagerWidth.w128,
            height: ManagerHeight.h110,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: ManagerWidth.w10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w6, vertical: ManagerHeight.h10),
              child: Text(
                resource.attributes!.name.toString(),
                style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s14, color: ManagerColors.black),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${ManagerStrings.month}/",
                  style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.black),
                ),
                Text(
                  "\$${resource.attributes!.priceByMonth.toString()}",
                  style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.primaryColor),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
