import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/features/main/presentation/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../../core/widgets/pop_cope_widget.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: GetBuilder<MainController>(
        builder: (controller) {
          return PersistentTabView(
            context,
            controller: controller.persistentTabController,
            backgroundColor: Colors.white,
            navBarStyle: NavBarStyle.style15,
            confineInSafeArea: true,
            navBarHeight: ManagerHeight.h60,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  ManagerRadius.r16,
                ),
                topRight: Radius.circular(
                  ManagerRadius.r16,
                ),
              ),
            ),
            screens: controller.screens,
            items: [
              PersistentBottomNavBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ManagerAssets.profile,
                  ),
                ),
                iconSize: ManagerRadius.r26,
                activeColorPrimary: ManagerColors.primaryColor,
                inactiveColorPrimary: ManagerColors.black,
              ),
              PersistentBottomNavBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ManagerAssets.category,
                  ),
                ),
                activeColorPrimary: ManagerColors.primaryColor,
                inactiveColorPrimary: ManagerColors.black,
                iconSize: ManagerRadius.r26,
              ),
              PersistentBottomNavBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ManagerAssets.home,
                  ),
                  color: Colors.white,
                ),
                activeColorPrimary: ManagerColors.primaryColor,
                inactiveColorPrimary: ManagerColors.black,
                iconSize: ManagerRadius.r30,
              ),
              PersistentBottomNavBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ManagerAssets.calender,
                  ),
                ),
                activeColorPrimary: ManagerColors.primaryColor,
                inactiveColorPrimary: ManagerColors.black,
                iconSize: ManagerRadius.r26,
              ),
              PersistentBottomNavBarItem(
                icon: ImageIcon(
                  AssetImage(
                    ManagerAssets.subscriptionIcon,
                  ),
                ),
                activeColorPrimary: ManagerColors.primaryColor,
                inactiveColorPrimary: ManagerColors.black,
                iconSize: ManagerRadius.r26,
              ),
            ],

          );
        },
      ),
    );
  }
}
