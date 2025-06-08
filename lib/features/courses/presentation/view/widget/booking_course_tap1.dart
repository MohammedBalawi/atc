import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/core/widgets/course_card.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/stepper_controller.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/widget/personal_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingCourseTap1 extends StatelessWidget {
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StepperController>(
      builder: (controller) {
        return Container(
          alignment: AlignmentDirectional.centerStart,
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w20,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              courseCard(
                controller.fillContent().attribute,
                controller.image(image: controller.fillContent().attribute.avatar.toString()),
              ),
              PersonalInfoWidget(appSettingsPrefs: _appSettingsPrefs),
            ],
          ),

        );
      }
    );
  }
}
