import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/features/profile/presentation/view/widget/custom_profile_information.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/profile_controller.dart';
import '../widget/custom_photo.dart';

class ProfileInformationView extends StatelessWidget {
  AppSettingsPrefs appSettingsPrefs = instance<AppSettingsPrefs>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ManagerColors.backgroundForm,
        appBar: AppBar(
          backgroundColor: ManagerColors.backgroundForm,
          centerTitle: true,
          title: Text(
            ManagerStrings.profile,
            style: getMediumTextStyle(
                fontSize: ManagerFontSize.s18, color: ManagerColors.black),
          ),
          actions: [
            InkWell(
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: ManagerWidth.w16),
                child: Text(
                  ManagerStrings.edit,
                  style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s18,
                      color: ManagerColors.black),
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.edit_profile);
              },
            ),
          ],
        ),
        body: GetBuilder(
          init: ProfileController(),
          builder: (controller) {
            return ListView(
              children: [
                CustomPhoto(),
                SizedBox(
                  height: ManagerHeight.h62,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w16,
                      vertical: ManagerHeight.h16),
                  child: Column(
                    children: [
                      CustomProfileInformation(
                        imagePath: ManagerAssets.userProfile,
                        textName: appSettingsPrefs.getUserName(),
                      ),
                      SizedBox(height: ManagerHeight.h20,),
                      CustomProfileInformation(
                        imagePath: ManagerAssets.message,
                        textName: appSettingsPrefs.getEmail(),
                        isLine: true,
                      ),
                      SizedBox(height: ManagerHeight.h20,),
                      CustomProfileInformation(
                        imagePath: ManagerAssets.phone,
                        textName: appSettingsPrefs.getUserPhone(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
