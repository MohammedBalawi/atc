import 'package:act_hub_mobile/features/courses/presentation/view/widget/display_info_field.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../core/storage/local/app_settings_prefs.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({
    super.key,
    required AppSettingsPrefs appSettingsPrefs,
  }) : _appSettingsPrefs = appSettingsPrefs;

  final AppSettingsPrefs _appSettingsPrefs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: ManagerHeight.h30),
        Text(
          ManagerStrings.personalInformation,
          style: getMediumTextStyle(
            fontSize: ManagerFontSize.s16,
            color: ManagerColors.black,
          ),
        ),
        SizedBox(height: ManagerHeight.h30),
        displayInfoField(controller: TextEditingController(text: _appSettingsPrefs.getUserName())),
        SizedBox(height: ManagerHeight.h20),
        displayInfoField(controller: TextEditingController(text: _appSettingsPrefs.getEmail())),
        SizedBox(height: ManagerHeight.h20),
        displayInfoField(controller: TextEditingController(text: _appSettingsPrefs.getUserPhone())),

      ],
    );
  }
}
