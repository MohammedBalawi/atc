import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/state_renderer/state_renderer.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/features/edit_profile/data/request/edit_name_request.dart';
import 'package:act_hub_mobile/features/edit_profile/data/request/edit_phone_request.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/usecase/edit_name_usecase.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/usecase/edit_phone_usecase.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/usecase/profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController dayOfBirth = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool editNameChange = false;
  bool editPhoneChange = false;
  EditNameUseCase editNameUseCase = instance<EditNameUseCase>();
  EditPhoneUseCase editPhoneUseCase = instance<EditPhoneUseCase>();
  ProfileUseCase profileUseCase = instance<ProfileUseCase>();

  void profile() async {
    BuildContext context = Get.context!;
    (await profileUseCase.execute()).fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerStrings.userProfileFailed,
        stateRenderType: StateRenderType.popupErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      email.text = r.data.attributes.email!;
      username.text = r.data.attributes.name!;
      phone.text = r.data.attributes.phone!;
    });
  }

  void editName(BuildContext context) async {
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: "",
        stateRenderType: StateRenderType.popupLoadingState,
        retryAction: () {});
    (await editNameUseCase.execute(EditNameRequest(name: username.text))).fold(
      (l) {
        Get.back();
        dialogRender(
          context: context,
          message: l.message,
          title: ManagerStrings.editNameFailed,
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
          },
        );
      },
      (r) {
        Get.back();
        dialogRender(
            context: context,
            message: ManagerStrings.editNameSuccess,
            title: ManagerStrings.thanks,
            stateRenderType: StateRenderType.popupSuccess,
            retryAction: () {
              Get.back();
            });
      },
    );
  }

  void editPhone(BuildContext context) async {
    Get.back();
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: "",
        stateRenderType: StateRenderType.popupLoadingState,
        retryAction: () {});
    (await editPhoneUseCase.execute(EditPhoneRequest(phone: phone.text))).fold(
      (l) {
        Get.back();
        dialogRender(
          context: context,
          message: l.message,
          title: ManagerStrings.editPhoneFailed,
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
          },
        );
      },
      (r) {

        Get.back();
        dialogRender(
            context: context,
            message: ManagerStrings.editPhoneSuccess,
            title: ManagerStrings.thanks,
            stateRenderType: StateRenderType.popupSuccess,
            retryAction: () {
              Get.back();
            });
      },
    );
  }
  @override
  void onInit() {
    profile();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    username.dispose();
    dayOfBirth.dispose();
    phone.dispose();
    formKey.currentState!.dispose();

  }
}
