import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/widgets/CustomAppBar.dart';
import 'package:act_hub_mobile/features/category/presentation/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/constants.dart';
import '../widgets/category_item.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.backgroundForm,
      appBar: CustomAppBar(
        title: ManagerStrings.categories,
        hasLeading: false,
      ),
      body: GetBuilder<CategoryController>(
        builder: (controller) {
          return RefreshIndicator(
            color: ManagerColors.primaryColor,
            backgroundColor: ManagerColors.white,
            onRefresh: () async {
              await controller.read();
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: ManagerHeight.h10,
                bottom: ManagerHeight.h30,
              ),
              child: GridView.builder(
                itemCount: controller.categories.length,
                padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Constants.gridCategory,
                  crossAxisSpacing: ManagerWidth.w20,
                  mainAxisSpacing: ManagerHeight.h20,
                ),
                itemBuilder: (context, index) {
                  return CategoryItem(
                    controller: controller,
                    index: index,
                    onTap: () => controller.performCategoryDetails(index),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
