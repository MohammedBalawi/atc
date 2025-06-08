import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes_util.dart';
import '../../../../core/resources/manager_styles.dart';
import '../controller/category_controller.dart';

class CategoryItem extends StatelessWidget {
  final void Function()? onTap;
  final CategoryController controller;
  final int index;

  CategoryItem({
    Key? key,
    this.onTap,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ManagerColors.greyLight),
          borderRadius: BorderRadius.circular(
            ManagerRadius.r10,
          ),
          color: ManagerColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: ManagerHeight.h60,
              width: ManagerWidth.w60,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    ManagerRadius.r8,
                  ),
                ),
                child: controller.image(
                  image:
                      controller.categories[index].categoryAttributeModel!.icon,
                ),
              ),
            ),
            Text(
              controller.categories[index].categoryAttributeModel!.name
                  .onNull(),
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.black,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
