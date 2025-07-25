import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/features/profile/domain/usecase/balance_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../core/storage/remote/firebase/controllers/fb_notifications.dart';

class SettingsController extends GetxController {
  bool value = false;
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();

  void readBalance() async {
    BalanceUseCase _useCase = instance<BalanceUseCase>();
    BuildContext context = Get.context as BuildContext;
    (await _useCase.execute()).fold(
      (l) {
        dialogRender(
          context: context,
          message: l.message.toString(),
          title: '',
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
            Get.back();
            disposeCancelReservation();
          },
        );
      },
      (r) {
        Get.back();
      },
    );
  }

  onChange(bool val) async {
    value = val;
    _appSettingsPrefs.setEnableNotifications(val);
    if (value) {
      initFirebaseNotification();
    } else {
      await FbNotifications.deInitializeNotifications();
    }
    update();
  }

  readInitNotificationStatus() {
    value = _appSettingsPrefs.getEnableNotifications();
  }

  @override
  void onInit() {
    // readBalance();
    super.onInit();
    readInitNotificationStatus();
  }
}
