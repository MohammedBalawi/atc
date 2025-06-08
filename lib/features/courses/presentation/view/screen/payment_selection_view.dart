import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/stepper_controller.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_sizes_util.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/widgets/CustomAppBar.dart';
import '../../../../../core/widgets/main_button.dart';

class PaymentSelectionView extends StatefulWidget {
  const PaymentSelectionView({super.key});

  @override
  State<PaymentSelectionView> createState() => _PaymentSelectionViewState();
}

class _PaymentSelectionViewState extends State<PaymentSelectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: ManagerStrings.bookingCourse,
      ),
      body: GetBuilder<StepperController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: ManagerHeight.h70,
                child: EasyStepper(
                  activeStep: controller.activeStep,
                  lineLength: ManagerWidth.w80,
                  lineSpace: Constants.zero,
                  lineType: LineType.dotted,
                  defaultLineColor: ManagerColors.greyLight,
                  finishedLineColor: ManagerColors.primaryColor,
                  activeStepTextColor: ManagerColors.white,
                  finishedStepTextColor: ManagerColors.grey,
                  internalPadding: Constants.zero,
                  showLoadingAnimation: false,
                  stepRadius: ManagerRadius.r26,
                  showStepBorder: false,
                  finishedStepBackgroundColor: ManagerColors.transparent,
                  padding: EdgeInsetsDirectional.only(
                    bottom: ManagerHeight.h6,
                  ),
                  steps: controller.steps,
                  onStepReached: controller.onStepReached,
                ),
              ),
              SizedBox(height: ManagerHeight.h20),
              controller.content[controller.currentStep],
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16,
                ),
                child: mainButton(
                  minWidth: double.infinity,
                  height: ManagerHeight.h48,
                  onPressed: () => controller.performPayment(),
                  buttonName: controller.currentStep == controller.lastStepIndex
                      ? ManagerStrings.reservation
                      : ManagerStrings.next,
                ),
              ),
              SizedBox(height: ManagerHeight.h30),
            ],
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    disposeSubscriptionProcess();
    super.dispose();
  }
}
