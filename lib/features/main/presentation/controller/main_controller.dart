import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/features/appointment/presentation/view/screen/appointment_view.dart';
import 'package:act_hub_mobile/features/category/presentation/view/category_view.dart';
import 'package:act_hub_mobile/features/home/presentation/view/screen/home_view.dart';
import 'package:act_hub_mobile/features/profile/presentation/view/screen/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../courses/presentation/view/screen/subscriptions_view.dart';

class MainController extends GetxController {
  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 2);

  Color color = ManagerColors.black;
  List<Widget> screens = [
    ProfileView(),
    CategoryView(),
    HomeView(),
    AppointmentView(),
    SubscriptionsView()
  ];

  void navigate(int index) {
    persistentTabController.jumpToTab(index);
  }
}

void changeMainCurrentIndex(int index) {
  try {
    Get.find<MainController>().navigate(index);
    debugPrint("The Main Controller Index Changed");
  } catch (e) {
    debugPrint(e.toString());
  }
}
