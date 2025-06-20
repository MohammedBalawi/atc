import 'package:act_hub_mobile/core/cache/cache.dart';
import 'package:act_hub_mobile/features/forget_password/domain/usecase/forget_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../routes/routes.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordUseCase _useCase = instance<ForgetPasswordUseCase>();
  late TextEditingController email;
  var formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  void forgetPassword(BuildContext context) async {
    CacheData cacheData = CacheData();
    cacheData.setEmail(email.text);
    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      title: '',
      stateRenderType: StateRenderType.popupLoadingState,
      retryAction: () {},
    );
    (await _useCase.execute(
      ForgetPasswordInput(
        email: email.text,
      ),
    ))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.sorryFailed,
        stateRenderType: StateRenderType.popupErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      if (r.status!)
        dialogRender(
            context: context,
            message: ManagerStrings.sendOtpSuccess,
            title: '',
            stateRenderType: StateRenderType.popupSuccess,
            retryAction: () {
              Get.back();
              Get.offNamed(
                Routes.reset_password,
              );
            });
      else
        dialogRender(
          context: context,
          message: ManagerStrings.sorryFailed,
          title: ManagerStrings.error,
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
          },
        );
    });
  }
}
