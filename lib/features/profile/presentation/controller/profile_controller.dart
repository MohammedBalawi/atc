import 'dart:io';

import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/features/auth/domain/usecase/logout_usecase.dart';
import 'package:act_hub_mobile/features/profile/data/request/edit_password_request.dart';
import 'package:act_hub_mobile/features/profile/domain/usecase/edit_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../core/storage/local/app_settings_prefs.dart';
import '../../../../routes/routes.dart';

class ProfileController extends GetxController {
  LogoutUseCase _logoutUseCase = instance<LogoutUseCase>();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();
  var formKey = GlobalKey<FormState>();
  EditPasswordUseCase _editPasswordUseCase = instance<EditPasswordUseCase>();

  changePassword() async {
    BuildContext context = Get.context!;
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: "",
        stateRenderType: StateRenderType.popupLoadingState,
        retryAction: () {});
    (await _editPasswordUseCase.execute(EditPasswordRequest(
            password: newPassController.text,
            confirmPassword: confirmPassController.text)))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.editPassFailed,
        stateRenderType: StateRenderType.popupErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      dialogRender(
          context: context,
          message: ManagerStrings.editPassSuccess,
          title: ManagerStrings.thanks,
          stateRenderType: StateRenderType.popupSuccess,
          retryAction: () {
            Get.back();
          });
    });
    newPassController.text = "";
    confirmPassController.text = "";
  }

  void logout(BuildContext context) async {
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: "",
        stateRenderType: StateRenderType.popupLoadingState,
        retryAction: () {});
    (await _logoutUseCase.execute()).fold(
      (l) {
        Get.back();
        dialogRender(
          context: context,
          message: l.message,
          title: ManagerStrings.logoutFailed,
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
          },
        );
      },
      (r) {
        Get.back();
        Get.defaultDialog(
          backgroundColor: Colors.white,
          title: "",
          middleText: ManagerStrings.messageLogout,
          middleTextStyle: getMediumTextStyle(
              fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (r.status!) {
                  _appSettingsPrefs.removeCachedUserData();
                  dialogRender(
                    context: context,
                    message: ManagerStrings.thanks,
                    title: ManagerStrings.logoutSuccess,
                    stateRenderType: StateRenderType.popupSuccess,
                    retryAction: () {
                      Get.offAllNamed(Routes.login);
                    },
                  );
                } else {
                  dialogRender(
                    context: context,
                    message: '',
                    title: ManagerStrings.logoutFailed,
                    stateRenderType: StateRenderType.popupErrorState,
                    retryAction: () {
                      Get.back();
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ManagerColors.primaryColor,
                padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w36, vertical: ManagerHeight.h8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ManagerRadius.r6),
                ),
              ),
              child: Text(
                ManagerStrings.yes,
                style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s16, color: ManagerColors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w36, vertical: ManagerHeight.h8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ManagerRadius.r6),
                ),
              ),
              child: Text(
                ManagerStrings.no,
                style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
