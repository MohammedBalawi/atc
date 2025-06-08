import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/core/widgets/course_card.dart';
import 'package:act_hub_mobile/core/widgets/main_button.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/stepper_controller.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/widget/personal_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BookingCourseTap3 extends StatelessWidget {
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder <StepperController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              courseCard(
                controller.fillContent().attribute,
                controller.image(
                  image: controller.fillContent().attribute.avatar.toString(),
                ),
              ),
              PersonalInfoWidget(appSettingsPrefs: _appSettingsPrefs),
              SizedBox(height: ManagerHeight.h30),


              Text(
                ManagerStrings.paymentMethod,
                style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.black,
                ),
              ),
              SizedBox(
                height: ManagerHeight.h20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ManagerRadius.r10,
                  ),
                  color: ManagerColors.white,
                ),
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w10,
                  vertical: ManagerHeight.h10,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: ManagerHeight.h10,
                ),
                height: ManagerHeight.h54,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ManagerAssets.cashPayment,
                      width: ManagerWidth.w36,
                      height: ManagerHeight.h36,
                    ),
                    SizedBox(width: ManagerWidth.w8),
                    Text(
                      controller.paymentModel.name,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.greyLight,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: ManagerWidth.w16,
                      height: ManagerHeight.h16,
                      padding: EdgeInsets.symmetric(
                        horizontal: ManagerWidth.w2,
                        vertical: ManagerHeight.h2,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: ManagerHeight.h1,
                            color: ManagerColors.primaryColor),
                        color: ManagerColors.transparent,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: ManagerWidth.w8),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
