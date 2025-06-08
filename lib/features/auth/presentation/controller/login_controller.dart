import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/cache/cache.dart';
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/state_renderer/state_renderer.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/features/auth/data/request/fvm_token_request.dart';
import 'package:act_hub_mobile/features/auth/domain/usecase/fcm_token_usecase.dart';
import 'package:act_hub_mobile/features/auth/domain/usecase/login_usecase.dart';
import 'package:act_hub_mobile/features/verification/presentation/controller/verification_controller.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/error_handler/error_handler.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginUseCase _loginUseCase = instance<LoginUseCase>();
  FcmTokenUseCase _fcmTokenUseCase = instance<FcmTokenUseCase>();
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();
  var formKey = GlobalKey<FormState>();
  bool check = false;
  bool isObscurePassword = true;

  onChangeObscurePassword() {
    isObscurePassword = !isObscurePassword;
    update();
  }

  onChange(bool status) {
    check = status;
    update();
  }

  void performLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      login(context);
    }
  }

  void login(BuildContext context) async {
    CacheData cacheData = CacheData();
    cacheData.setEmail(email.text);
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: "",
        stateRenderType: StateRenderType.popupLoadingState,
        retryAction: () {});

    (await _loginUseCase.execute(
            LoginUseCaseInput(email: email.text, password: password.text)))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.loginFailed,
        stateRenderType: StateRenderType.popupErrorState,
        retryAction: () async {
          Get.back();
          if (l.code == ResponseCode.UNVERIFIED_USER) {
            await VerificationController().sendOtp(
              context: context,
              route: Routes.verification,
            );
          }
        },
      );
    }, (r) async {
      var fcmToken = await FirebaseMessaging.instance.getToken();

      _fcmTokenUseCase.execute(
        FcmTokenRequest(
          fcmToken: fcmToken.onNull(),
        ),
      );
      Get.back();
      dialogRender(
          context: context,
          message: ManagerStrings.loginSuccess,
          title: ManagerStrings.thanks,
          stateRenderType: StateRenderType.popupSuccess,
          retryAction: () {
            Navigator.of(context).pop();
            Get.back();
            Get.offAllNamed(Routes.main);
            email.text = "";
            password.text = "";
          });
      if (check) {
        _appSettingsPrefs.setEmail(email.text);
        _appSettingsPrefs.setToken(r.token.onNull());
        _appSettingsPrefs.setUserLoggedIn();
      } else {
        _appSettingsPrefs.setToken(r.token.onNull());
      }
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    formKey.currentState!.dispose();
    super.dispose();
  }
}
