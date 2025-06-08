import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../controller/profile_controller.dart';
import '../widget/custom_photo.dart';
import '../widget/custom_profile.dart';

class ProfileView extends StatelessWidget {
  AppSettingsPrefs appSettingsPrefs = instance<AppSettingsPrefs>();


  @override
  Widget build(BuildContext context) {
    final controllerTextFiled = Get.put(ProfileController());
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
                  height: ManagerHeight.h20,
                ),
                Column(
                  children: [
                    Text(
                      appSettingsPrefs.getUserName(),
                      style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s18,
                          color: ManagerColors.black),
                    ),
                    SizedBox(
                      height: ManagerHeight.h8,
                    ),
                    Text(
                      appSettingsPrefs.getEmail(),
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.profileEmailColor),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w16,
                      vertical: ManagerHeight.h16),
                  child: Column(
                    children: [
                      CustomProfile(
                        imagePath: ManagerAssets.userProfile,
                        textName: ManagerStrings.profileInformation,
                        onTap: () => Get.toNamed(Routes.profile_information),
                      ),
                      CustomProfile(
                        imagePath: ManagerAssets.setting,
                        textName: ManagerStrings.setting,
                        onTap: () => Get.toNamed(Routes.setting),
                      ),
                      CustomProfile(
                          imagePath: ManagerAssets.send,
                          textName: ManagerStrings.share,
                          onTap: () async {
                            await Share.share(ManagerStrings.applicationUrl);
                          }),
                      CustomProfile(
                          imagePath: ManagerAssets.documentBlack,
                          textName: ManagerStrings.termOfService),
                      CustomProfile(
                        imagePath: ManagerAssets.documentBlack,
                        textName: ManagerStrings.privacyPolicy,
                      ),
                      CustomProfile(
                        imagePath: ManagerAssets.logout,
                        textName: ManagerStrings.logout,
                        onTap: () {
                          controller.logout(context);
                        },
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
