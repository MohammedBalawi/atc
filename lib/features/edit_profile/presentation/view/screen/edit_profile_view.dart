import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/validator/validator.dart';
import 'package:act_hub_mobile/core/widgets/main_button.dart';
import 'package:act_hub_mobile/features/edit_profile/presentation/controller/edit_profile_controller.dart';
import 'package:act_hub_mobile/features/edit_profile/presentation/view/widget/custom_edit.dart';
import 'package:act_hub_mobile/features/profile/presentation/view/widget/custom_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {

  final FieldValidator _validator = FieldValidator();


  EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      backgroundColor: ManagerColors.backgroundForm,
      appBar: AppBar(
        backgroundColor: ManagerColors.backgroundForm,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ManagerColors.black,
          size: ManagerIconSize.s30,
        ),
        title: Text(
          ManagerStrings.editProfile,
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s18, color: ManagerColors.black),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            CustomPhoto(),
            SizedBox(
              height: ManagerHeight.h62,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16, vertical: ManagerHeight.h16),
              child: Column(
                children: [
                  CustomEdit(
                    imagePath: ManagerAssets.userProfile,
                    controllerText: controller.username,
                    onChange: (value) {
                      if (!controller.editPhoneChange) {
                        controller.editPhoneChange = true;
                      }
                    },
                    validator: (value) => _validator.validateFullName(value),
                  ),
                  SizedBox(
                    height: ManagerHeight.h20,
                  ),
                  CustomEdit(
                    imagePath: ManagerAssets.phone,
                    controllerText: controller.phone,
                    onChange: (value) {
                      if (!controller.editPhoneChange) {
                        controller.editPhoneChange = true;
                      }
                    },
                    validator: (value) => _validator.validatePhoneNumber(value),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ManagerHeight.h100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
              child: mainButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      if (controller.editNameChange) {
                        controller.editName(context);
                      }
                      if (controller.editPhoneChange) {
                        controller.editPhone(context);
                      }
                    }
                  },
                  buttonName: ManagerStrings.saveEdit),
            )
          ],
        ),
      ),
    );
  }
}
