import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/validator/validator.dart';
import 'package:act_hub_mobile/core/widgets/arrow_back_button.dart';
import 'package:act_hub_mobile/core/widgets/main_button.dart';
import 'package:act_hub_mobile/core/widgets/text_field.dart';
import 'package:act_hub_mobile/features/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChangePassView extends StatelessWidget {
  ChangePassView({super.key});

  final FieldValidator _validator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
        )
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: ManagerHeight.h215,
              decoration: BoxDecoration(
                color: ManagerColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(ManagerRadius.r20),
                  bottomRight: Radius.circular(ManagerRadius.r20),
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsets.symmetric(
                vertical: ManagerHeight.h28,
                horizontal: ManagerWidth.w2,
              ),
              child: arrowBackButton(),
            ),
            Padding(
              padding:  EdgeInsets.only(top: ManagerHeight.h10),
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                margin: EdgeInsets.symmetric(
                  vertical: ManagerHeight.h44,
                  horizontal: ManagerWidth.w20,
                ),
                child:  SvgPicture.asset(
                  ManagerAssets.logo,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ManagerHeight.h150),
              child: Container(
                width: double.infinity,
                height: ManagerHeight.h340,
                margin: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w30, vertical: ManagerHeight.h30),
                padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r20),
                    color: ManagerColors.backgroundForm,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ]),
                child: GetBuilder<ProfileController>(
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Text(
                            ManagerStrings.changePassword,
                            style: getMediumTextStyle(
                                fontSize: ManagerFontSize.s20,
                                color: ManagerColors.primaryColor),
                          ),
                          SizedBox(
                            height: ManagerHeight.h16,
                          ),
                          Text(
                            ManagerStrings.resetPasswordMessage,
                            textAlign: TextAlign.center,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s12,
                              color: ManagerColors.grey,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h32,
                          ),
                          textField(
                            labelText: ManagerStrings.newPassword,
                            controller: controller.newPassController,
                            obSecure: true,
                            validator: (value) => _validator.validatePassword(
                              value,
                            ),
                            textInputType: TextInputType.text,
                          ),
                          SizedBox(
                            height: ManagerHeight.h30,
                          ),
                          textField(
                            labelText: ManagerStrings.confirmPass,
                            controller: controller.confirmPassController,
                            obSecure: true,
                            validator: (value) => _validator.validatePassword(
                              value,
                            ),
                            textInputType: TextInputType.text,
                          ),
                          SizedBox(
                            height: ManagerHeight.h28,
                          ),
                          SizedBox(
                            height: ManagerHeight.h48,
                            child: mainButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.changePassword();
                                }
                              },
                              buttonName: ManagerStrings.change,
                              minWidth: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
