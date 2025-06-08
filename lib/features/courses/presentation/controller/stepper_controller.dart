import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/core/widgets/main_button.dart';
import 'package:act_hub_mobile/features/courses/data/request/course_subscription_request.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_description_attributes_model.dart';
import 'package:act_hub_mobile/features/courses/domain/usecase/course_subscription_usecase.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/widget/booking_course_tap3.dart';
import 'package:act_hub_mobile/features/payment/domain/model/payments_model.dart';
import 'package:act_hub_mobile/features/payment/domain/usecase/payments_usecase.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes_util.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../core/widgets/course_card.dart';
import '../../../../core/widgets/payment_dialog_success.dart';
import '../../../payment/domain/model/payment_model.dart';
import '../view/widget/personal_info_widget.dart';

class StepperController extends GetxController {
  int currentStep = 0;
  int activeStep = 0;
  int firstStepIndex = 0;
  int secondStepIndex = 1;
  int lastStepIndex = 2;
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();
  CacheData cache = CacheData();
  List<EasyStep> steps = [];
  List<Widget> content = [];
  PaymentsUseCase _paymentsUseCase = instance<PaymentsUseCase>();
  PaymentsModel paymentsModel = PaymentsModel(
    data: [],
  );
  int paymentMethodId = -1;
  late PaymentModel paymentModel = PaymentModel(id: 0, name: '');
  CourseSubscriptionUseCase _courseSubscriptionUseCase =
      instance<CourseSubscriptionUseCase>();

  @override
  void onInit() {
    super.onInit();
    fillSteps();
    activeStep = currentStep;
  }

  Future<void> paymentMethods() async {
    BuildContext context = Get.context!;
    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      title: ManagerStrings.fetchingInformation,
      stateRenderType: StateRenderType.popupLoadingState,
      retryAction: () {},
    );
    if (!cache.getHasPaymentMethods()) {
      (await await _paymentsUseCase.execute()).fold((l) {
        Get.back();
        dialogRender(
            context: context,
            message: l.message,
            title: '',
            stateRenderType: StateRenderType.popupErrorState,
            retryAction: () {
              previousStep();
            });
      }, (r) {
        Get.back();
        paymentsModel = r;
        cache.setPaymentMethods(paymentsModel);
        cache.setHasPaymentMethods();
      });
    } else {
      Get.back();
    }
  }

  void onStepReached(index) {
    activeStep = index;
    currentStep = index;
    fillSteps();
    update();
  }

  Future<void> performPayment() async {
    BuildContext context = Get.context!;
    if (currentStep == lastStepIndex) {
      dialogRender(
          context: context,
          message: ManagerStrings.loading,
          title: '',
          stateRenderType: StateRenderType.popupLoadingState,
          retryAction: () {});
      (await _courseSubscriptionUseCase.execute(
        CourseSubscriptionRequest(
          courseId: cache.getCourseId(),
          paymentMethodId: paymentMethodId,
        ),
      ))
          .fold(
        (l) {
          Get.back();
          dialogRender(
            context: context,
            message: l.message,
            title: '',
            stateRenderType: StateRenderType.popupErrorState,
            retryAction: () {
              Get.back();
            },
          );
        },
        (r) {
          Get.back();
          paymentDialogSuccess();
        },
      );
    } else {
      await nextStep();
    }
  }

  Future<void> nextStep() async {
    BuildContext context = Get.context!;
    if (currentStep < steps.length - 1) {
      if (!(currentStep == secondStepIndex && paymentMethodId == -1)) {
        await paymentMethods();
        fillContent();
        currentStep++;
        activeStep = currentStep;
        fillSteps();
        update();
      } else {
        dialogRender(
            context: context,
            message: ManagerStrings.pleaseSelectPaymentMethod,
            title: '',
            stateRenderType: StateRenderType.popupErrorState,
            retryAction: () {
              Get.back();
            });
      }
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      activeStep = currentStep;
      fillSteps();
      update();
    }
  }

  fillSteps() {
    steps = [
      EasyStep(
        customStep: stepHeader(
          index: firstStepIndex,
          image: ManagerAssets.firstStepPayment,
        ),
        enabled: true,
      ),
      EasyStep(
        customStep: stepHeader(
          index: secondStepIndex,
          image: ManagerAssets.secondStepPayment,
        ),
        enabled: false,
      ),
      EasyStep(
        customStep: stepHeader(
          index: lastStepIndex,
          image: ManagerAssets.thirdStepPayment,
        ),
        enabled: false,
      ),
    ];
    fillContent();
    update();
  }

  void setPaymentMethod(int index) {
    this.paymentMethodId = paymentsModel.data![index].id;
    paymentModel = PaymentModel(
      id: paymentMethodId,
      name: paymentsModel.data![index].name,
    );
    fillContent();
    update();
  }

  bool isCurrentPaymentMethod(int index) {
    return paymentMethodId == paymentsModel.data![index].id;
  }

  bool isURLValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  Widget image({required String image, String? defaultImage}) {
    if (isURLValid(image)) {
      return Image.network(
        image,
        fit: BoxFit.fill,
        width: ManagerWidth.w300,
        height: ManagerHeight.h160,
      );
    }

    return Image.asset(
      defaultImage ?? ManagerAssets.course,
      fit: BoxFit.fill,
      width: ManagerWidth.w300,
      height: ManagerHeight.h160,
    );
  }

  fillContent() {
    CourseDescriptionAttributesModel attribute =
        cache.getCourseDetails().courseDescriptionAttributesModel!;
    content = [
      Container(
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
              attribute,
              image(image: attribute.avatar.toString()),
            ),
            PersonalInfoWidget(appSettingsPrefs: _appSettingsPrefs),
          ],
        ),
      ),
      Container(
        alignment: AlignmentDirectional.centerStart,
        margin: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w20,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ManagerStrings.choosePayment,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.black,
              ),
            ),
            SizedBox(height: ManagerHeight.h20),
            Container(
              height: ManagerHeight.h240,
              child: ListView.builder(
                itemCount: paymentsModel.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => setPaymentMethod(
                      index,
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Container(
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
                            paymentsModel.data![index].name,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.descriptionColor,
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
                                color: isCurrentPaymentMethod(index)
                                    ? ManagerColors.primaryColor
                                    : ManagerColors.paymentSelectorBorderSide,
                              ),
                              color: ManagerColors.transparent,
                            ),
                            child: isCurrentPaymentMethod(index)
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ManagerColors.primaryColor,
                                    ),
                                  )
                                : Container(),
                          ),
                          SizedBox(width: ManagerWidth.w8),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            courseCard(
              attribute,
              image(
                image: attribute.avatar.toString(),
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
              height: ManagerHeight.h50,
              child: Row(
                children: [
                  SvgPicture.asset(
                    ManagerAssets.cashPayment,
                    width: ManagerWidth.w36,
                    height: ManagerHeight.h36,
                  ),
                  SizedBox(width: ManagerWidth.w8),
                  Text(
                    paymentModel.name,
                    style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.descriptionColor,
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
      ),
    ];
    update();
  }

  courseHoursFormat(int hours) {
    return "${hours} hour";
  }

  Container stepHeader({
    required int index,
    required String image,
  }) {
    return Container(
      width: ManagerWidth.w40,
      height: ManagerHeight.h40,
      padding: activeStep < index
          ? EdgeInsets.symmetric(
              horizontal: ManagerWidth.w12,
              vertical: ManagerHeight.h12,
            )
          : EdgeInsets.symmetric(
              horizontal: ManagerWidth.w8,
              vertical: ManagerHeight.h8,
            ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: activeStep >= index ? ManagerColors.primaryColor : Colors.white,
        border: activeStep < index
            ? Border.all(
                width: ManagerWidth.w1_5,
                color: ManagerColors.greyLight,
              )
            : null,
      ),
      child: activeStep >= index
          ? SvgPicture.asset(
              image,
              width: ManagerWidth.w10,
              height: ManagerHeight.h10,
            )
          : Container(
              width: ManagerWidth.w2,
              height: ManagerHeight.h2,
              decoration: BoxDecoration(
                color: ManagerColors.greyLight,
                shape: BoxShape.circle,
              ),
            ),
    );
  }
}
