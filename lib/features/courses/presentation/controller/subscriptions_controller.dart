import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/features/courses/domain/models/subscription_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../routes/routes.dart';
import '../../domain/usecase/subscriptions_usecase.dart';
import '../view/tabs/cancelled_tab.dart';
import '../view/tabs/finished_tab.dart';
import '../view/tabs/upcoming_tab.dart';

class SubscriptionsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Widget> screens = [];

  List<SubscriptionModel> upComingSubscriptions = [];
  List<SubscriptionModel> finishedSubscriptions = [];
  List<SubscriptionModel> cancelledSubscriptions = [];

  SubscriptionsUseCase _subscriptionsUseCase = instance<SubscriptionsUseCase>();

  CacheData cacheData = CacheData();

  bool isURLValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  Widget image({required String image, String? defaultImage}) {
    if (isURLValid(image)) {
      return Image.network(
        image,
        fit: BoxFit.fill,
      );
    }

    return Image.asset(
      defaultImage ?? ManagerAssets.workspace,
      fit: BoxFit.fill,
    );
  }

  void filteringSubscriptions(List<SubscriptionModel>? subscriptions) {
    subscriptions!.forEach(
      (element) {
        String status = element.status;
        if (status == Constants.finished) {
          finishedSubscriptions.add(
            element,
          );
        } else if (status == Constants.pending) {
          upComingSubscriptions.add(
            element,
          );
        } else {
          cancelledSubscriptions.add(
            element,
          );
        }
      },
    );
    fillScreens();
    update();
  }

  readSubscriptions() async {
    upComingSubscriptions = [];
    finishedSubscriptions = [];
    cancelledSubscriptions = [];

    BuildContext context = Get.context!;
    (await _subscriptionsUseCase.execute()).fold(
      (l) {
        Get.back();
        dialogRender(
            context: context,
            message: l.message,
            title: '',
            stateRenderType: StateRenderType.popupErrorState,
            retryAction: () {
              Get.back();
            });
      },
      (r) {
        filteringSubscriptions(
          r.data,
        );
      },
    );
  }

  void fillScreens() {
    screens = [
      UpComingTab(
        upComing: upComingSubscriptions,
      ),
      FinishedTab(
        finished: finishedSubscriptions,
      ),
      CancelledTab(
        cancelled: cancelledSubscriptions,
      ),
    ];
  }

  setCurrentResourceId(int id) {
    cacheData.setResourceId(id);
  }

  setCurrentSubscriptionId(int id) {
    cacheData.setSubscriptionId(id);
  }

  performCourseDetails(int id) {
    setCurrentCourseId(
      id,
    );
    Get.toNamed(Routes.course_description);
  }

  setCurrentCourseId(int id) {
    CacheData cacheData = CacheData();
    cacheData.setCourseId(id);
  }

  performSubscriptionDetails(int subscriptionId) {
    setCurrentSubscriptionId(
      subscriptionId,
    );
    Get.toNamed(Routes.subscriptionDetails);
  }

  SubscriptionModel? findSubscriptionById(int id) {
    // Search in upComingSubscriptions list
    for (var subscription in upComingSubscriptions) {
      if (subscription.id == id) {
        return subscription;
      }
    }

    // Search in finishedSubscriptions list
    for (var subscription in finishedSubscriptions) {
      if (subscription.id == id) {
        return subscription;
      }
    }

    // Search in cancelledSubscriptions list
    for (var subscription in cancelledSubscriptions) {
      if (subscription.id == id) {
        return subscription;
      }
    }

    print('');
    // Item with ID not found in any of the lists
    return null;
  }

  SubscriptionModel? currentSubscription() {
    return findSubscriptionById(cacheData.getSubscriptionId());
  }

  refreshScreen() {
    fillScreens();
    readSubscriptions();
  }

  // void cancelSubscription(int subscriptionId) async {
  //   initCancelSubscription();
  //   CancelSubscriptionUseCase _useCase = instance<CancelSubscriptionUseCase>();
  //   BuildContext context = Get.context as BuildContext;
  //   dialogRender(
  //       context: context,
  //       message: '',
  //       title: ManagerStrings.loading,
  //       stateRenderType: StateRenderType.popupLoadingState,
  //       retryAction: () {});
  //   (await _useCase
  //           .execute(CancelSubscriptionRequest(subscriptionId: subscriptionId)))
  //       .fold(
  //     (l) {
  //       Get.back();
  //       dialogRender(
  //         context: context,
  //         message: l.message.toString(),
  //         title: '',
  //         stateRenderType: StateRenderType.popupErrorState,
  //         retryAction: () {
  //           Get.back();
  //           Get.back();
  //           disposeCancelSubscription();
  //         },
  //       );
  //     },
  //     (r) async {
  //       Get.back();
  //       await refreshScreen();
  //       dialogRender(
  //         context: context,
  //         message: '',
  //         title: ManagerStrings.subscriptionCancelledSuccess,
  //         stateRenderType: StateRenderType.popupSuccess,
  //         retryAction: () {
  //           Get.back();
  //           disposeCancelSubscription();
  //         },
  //       );
  //     },
  //   );
  // }

  String costDollarFormat(double cost) {
    return "\u0024 $cost";
  }

  @override
  void onInit() {
    super.onInit();
    refreshScreen();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}

void cancelSubscription(int index, BuildContext context) {
  dialogRender(
      context: context,
      message: ManagerStrings.youCanNotCancelSubscriptionNow,
      title: '',
      stateRenderType: StateRenderType.popupErrorState,
      retryAction: () {
        Get.back();
      });
  // try {
  //   Get.find<AppointmentController>().cancelSubscription(index);
  // } catch (e) {
  //   print(e);
  // }
}
