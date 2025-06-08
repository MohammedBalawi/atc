import 'package:act_hub_mobile/core/resources/manager_colors.dart';
import 'package:act_hub_mobile/core/resources/manager_fonts.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/resources/manager_styles.dart';
import 'package:act_hub_mobile/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../config/constants.dart';
import '../../../../core/validator/validator.dart';
import '../../../verification/presentation/view/widget/code_verification.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({Key? key}) : super(key: key);

  final FieldValidator _validator = FieldValidator();

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark
      )
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ResetPasswordController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: ManagerHeight.h110,
                horizontal: ManagerWidth.w16,
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Text(
                      ManagerStrings.enterTheCode,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s24,
                          color: ManagerColors.primaryColor),
                    ),
                    SizedBox(
                      height: ManagerHeight.h18,
                    ),
                    Text(
                      ManagerStrings.resetSubTitle,
                      textAlign: TextAlign.center,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: ManagerColors.black,
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h60,
                    ),
                    Container(
                      child: Row(
                        children: [
                          CodeVerification(
                            controller:
                                controller.firstCodeTextController,
                            focusNode: controller.firstFocusNode,
                            previousFocusNode: controller.firstFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.secondFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),

                          ),
                          SizedBox(
                            width: ManagerWidth.w6,
                          ),
                          CodeVerification(
                            controller:
                                controller.secondCodeTextController,
                            focusNode: controller.secondFocusNode,
                            previousFocusNode: controller.firstFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.thirdFocusNode.requestFocus();
                              } else {
                                controller.firstFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWidth.w6,
                          ),
                          CodeVerification(
                            controller:
                                controller.thirdCodeTextController,
                            focusNode: controller.thirdFocusNode,
                            previousFocusNode: controller.secondFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.fourthFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWidth.w6,
                          ),
                          CodeVerification(
                            controller:
                                controller.fourthCodeTextController,
                            focusNode: controller.fourthFocusNode,
                            previousFocusNode: controller.thirdFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.fifthFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                          SizedBox(
                            width: ManagerWidth.w6,
                          ),
                          CodeVerification(
                            controller:
                                controller.fifthCodeTextController,
                            focusNode: controller.fifthFocusNode,
                            previousFocusNode: controller.fourthFocusNode,
                            onChanged: (String value) {
                              if (value.isNotEmpty) {
                                controller.sixthFocusNode.requestFocus();
                              }
                            },
                            validator: (value) =>
                                controller.validator.validateCode(value),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h46,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ManagerStrings.resendCode,
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        mainButton(
                          onPressed: () {
                            controller.sendOtp(context: context);
                          },
                          child: Text(
                            ManagerStrings.resendAgain,
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.primaryColor,
                            ),
                          ),
                          height: ManagerHeight.h8,
                          padding: EdgeInsetsDirectional.only(
                            start: ManagerWidth.w2,
                          ),
                          color: ManagerColors.transparent,
                          elevation: Constants.elevation,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ManagerHeight.h44,
                    ),
                    SizedBox(
                      height: ManagerHeight.h48,
                      child: mainButton(
                        onPressed: () {
                          if (controller.formKey.currentState!
                              .validate()) {
                            controller.resetPassword(context);
                          }
                        },
                        buttonName: ManagerStrings.confirm,
                        minWidth: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
