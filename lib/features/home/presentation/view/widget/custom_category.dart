import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomCategory extends StatelessWidget {
  final String name;
  final String imagePath;
  final int? index;

  const CustomCategory({
    Key? key,
    required this.name,
    required this.imagePath,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return GestureDetector(
                onTap: () {
                  controller.selectCategory(index!);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w6,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w6,
                  ),
                  decoration: BoxDecoration(
                    color: controller.selectedCategoryIndex == index
                        ? ManagerColors.selectedCategory
                        : ManagerColors.white,
                    borderRadius: BorderRadius.circular(
                      ManagerRadius.r10,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: ManagerHeight.h40,
                        width: ManagerWidth.w40,
                        margin: EdgeInsets.symmetric(
                          horizontal: ManagerWidth.w4,
                        ),
                        child: controller.isURLValid(imagePath)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  ManagerRadius.r6,
                                ),
                                child: Image.network(
                                  imagePath,
                                ),
                              )
                            : SvgPicture.asset(
                                ManagerAssets.office,
                              ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ManagerColors.white,
                          ),
                          borderRadius: BorderRadius.circular(
                            ManagerRadius.r6,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ManagerWidth.w4,
                      ),
                      Text(
                        name,
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: controller.selectedCategoryIndex == index
                              ? ManagerColors.white
                              : ManagerColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
