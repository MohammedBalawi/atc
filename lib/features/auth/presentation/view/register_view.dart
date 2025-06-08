import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/validator/validator.dart';
import 'package:act_hub_mobile/core/widgets/checkbox_widget.dart';
import 'package:act_hub_mobile/core/widgets/main_button.dart';
import 'package:act_hub_mobile/core/widgets/scaffold_with_background.dart';
import 'package:act_hub_mobile/core/widgets/text_field.dart';
import 'package:act_hub_mobile/features/auth/presentation/controller/register_controller.dart';
import 'package:act_hub_mobile/features/auth/presentation/widget/social_auth.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_icons.dart';
import '../widget/footer_auth.dart';
import '../widget/top_part_auth.dart';

class RegisterView extends StatelessWidget {
  final FieldValidator _validator = FieldValidator();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return scaffoldWithImageBackground(
      child: Column(
        children: [
          partTopAuth(),
          Expanded(
            flex: Constants.authSecondPartFlex,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w20,
                vertical: ManagerHeight.h4,
              ),
              decoration: BoxDecoration(
                color: ManagerColors.backgroundForm,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    ManagerRadius.r20,
                  ),
                  topRight: Radius.circular(
                    ManagerRadius.r20,
                  ),
                ),
              ),
              child: GetBuilder<RegisterController>(
                builder: (controller) {
                  return SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: ManagerHeight.h20,
                          ),
                          Text(
                            ManagerStrings.signUp,
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s26,
                              color: ManagerColors.black,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h16,
                          ),
                          textField(
                            labelText: ManagerStrings.fullName,
                            controller: controller.fullName,
                            textInputType: TextInputType.name,
                            obSecure: false,
                            validator: (value) => _validator.validateFullName(
                              value,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h16,
                          ),
                          textField(
                            labelText: ManagerStrings.email,
                            controller: controller.email,
                            obSecure: false,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) => _validator.validateEmail(
                              value,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h16,
                          ),
                          textField(
                            labelText: ManagerStrings.phoneNum,
                            controller: controller.phoneNumber,
                            obSecure: false,
                            textInputType: TextInputType.number,
                            validator: (value) =>
                                _validator.validatePhoneNumber(
                              value,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h16,
                          ),
                          textField(
                            labelText: ManagerStrings.password,
                            controller: controller.password,
                            obSecure: controller.isObscurePassword,
                            suffixIcon: IconButton(
                              icon: controller.isObscurePassword
                                  ? Icon(
                                      ManagerIcons.visibility_off,
                                color: ManagerColors.greyLight,
                                    )
                                  : Icon(
                                      ManagerIcons.visibility,
                                color: ManagerColors.primaryColor,
                                    ),
                              onPressed: () =>
                                  controller.onChangeObscurePassword(),
                            ),
                            textInputType: TextInputType.text,
                            validator: (value) => _validator.validatePassword(
                              value,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h16,
                          ),
                          textField(
                            labelText: ManagerStrings.confirmPass,
                            obSecure: controller.isObscureConfirmPassword,
                            suffixIcon: IconButton(
                              icon: controller.isObscureConfirmPassword
                                  ? Icon(
                                ManagerIcons.visibility_off,
                                color: ManagerColors.greyLight,
                              )
                                  : Icon(
                                ManagerIcons.visibility,
                                color: ManagerColors.primaryColor,
                              ),
                              onPressed: () =>
                                  controller.onChangeObscureConfirmPassword(),
                            ),
                            textInputType: TextInputType.text,
                            controller: controller.confirmPassword,
                            validator: (value) => _validator.confirmPassword(
                              controller.password.text,
                              value,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h16,
                          ),
                          Container(
                            width: double.infinity,
                            child: checkBoxWidget(
                              status: controller.check,
                              loginView: false,
                              onChanged: (status) {
                                controller.onChange(
                                  status!,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: ManagerHeight.h48,
                            child: mainButton(
                              onPressed: () {
                                controller.performRegister(context);
                              },
                              buttonName: ManagerStrings.signUp,
                            ),
                          ),
                          SizedBox(height: ManagerHeight.h30,),
                          socialAuth(),
                          SizedBox(height: ManagerHeight.h50,),
                          SizedBox(
                            height: ManagerHeight.h20,
                          ),
                          FooterAuth(
                            text: ManagerStrings.footerSignUp,
                            buttonName: ManagerStrings.login,
                            onPressed: () {
                              Get.offAllNamed(
                                Routes.login,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      isRegisterView: true,
    );
  }
}
