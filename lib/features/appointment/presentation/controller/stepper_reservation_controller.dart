import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/features/appointment/data/request/book_appointment_request.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/event_model.dart';
import 'package:act_hub_mobile/features/appointment/domain/usecase/book_appointment_usecase.dart';
import 'package:act_hub_mobile/features/appointment/presentation/model/unit_model.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_resource_model.dart';
import 'package:act_hub_mobile/features/payment/domain/model/payments_model.dart';
import 'package:act_hub_mobile/features/payment/domain/usecase/payments_usecase.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes_util.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../core/widgets/payment_dialog_success.dart';
import '../../../payment/domain/model/payment_model.dart';
import '../view/widget/calender_by_days.dart';
import '../view/widget/calender_by_months.dart';
import '../view/widget/payment_method.dart';
import '../view/widget/reservation_all_details.dart';
import '../view/widget/resource_with_user_info.dart';
import '../view/widget/select_reservation_with_type.dart';

class StepperReservationController extends GetxController {
  int currentStep = 0;
  int activeStep = 0;
  int firstStepIndex = 0;
  int secondStepIndex = 1;
  int lastStepIndex = 5;
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();
  CacheData cache = CacheData();
  List<EasyStep> steps = [];
  List<Widget> content = [];
  String priceUnit = Constants.priceByMonth;
  String priceTitle = ManagerStrings.enterHour;
  String startTimeType = Constants.amValue;
  int resourceId = 0;
  String resourceName = '';
  DateTime selectedDate = DateTime.now();


  changePriceUnit(String? value){
    priceUnit = value!;
    update();
  }
  void setSelectedDate(DateTime date) {
    selectedDate = date;
  }

  List<EventModel> events = [];
  CategoryDetailsResourceModel reservationDetails =
      CategoryDetailsResourceModel();

  TextEditingController timeController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();

  List<UnitModel> units = [
    UnitModel(title: ManagerStrings.enterHour, type: Constants.priceByHour),
    UnitModel(title: ManagerStrings.enterDay, type: Constants.priceByDay),
    UnitModel(title: ManagerStrings.enterWeek, type: Constants.priceByWeek),
    UnitModel(title: ManagerStrings.enterMonth, type: Constants.priceByMonth),
  ];

  PaymentsUseCase _paymentsUseCase = instance<PaymentsUseCase>();

  PaymentsModel _paymentsModel = PaymentsModel(
    data: [],
  );

  int paymentMethodId = -1;

  late PaymentModel _paymentModel = PaymentModel(id: 0, name: '');

  BookAppointmentUseCase _bookAppointmentUseCase =
      instance<BookAppointmentUseCase>();

  @override
  void onInit() {
    super.onInit();
    fillSteps();
    startTimeController.text = '00:00';
    events = cache.getEvents();
    update();
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
        _paymentsModel = r;
        cache.setPaymentMethods(_paymentsModel);
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

  String formatDate(DateTime selectedDate) {
    DateTime modifiedDateTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, selectedDate.hour, 0, 0);
    return DateFormat('yyyy-MM-dd HH:00', 'en_US').format(modifiedDateTime);
  }

  performReservation(){
    book();
  }

  Future<void> book() async {
    BuildContext context = Get.context!;

    String formattedDate = formatDate(selectedDate);


    if (currentStep == lastStepIndex) {
      dialogRender(
          context: context,
          message: ManagerStrings.loading,
          title: '',
          stateRenderType: StateRenderType.popupLoadingState,
          retryAction: () {});
      (await _bookAppointmentUseCase.execute(
        BookAppointmentRequest(
          pricingOption: priceUnit,
          pricingInput: int.tryParse(timeController.text).onNull(),
          resourceId: resourceId,
          startDate: formattedDate,
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
      if (currentStep == secondStepIndex) {
        dialogRender(
          context: context,
          message: ManagerStrings.pleaseSelectCalender,
          title: '',
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
          },
        );
      } else if (currentStep == lastStepIndex - 2) {
        if (timeController.text.isNotEmpty) {
          await nextStep();
        } else {
          dialogRender(
            context: context,
            message: ManagerStrings.PleaseFillField,
            title: '',
            stateRenderType: StateRenderType.popupErrorState,
            retryAction: () {
              Get.back();
            },
          );
        }
      } else if (currentStep == lastStepIndex - 3) {
        dialogRender(
          context: context,
          message: ManagerStrings.pleaseSelectCalender,
          title: '',
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
          },
        );
      } else {
        await nextStep();
      }
    }
  }

  Future<void> nextStep() async {
    BuildContext context = Get.context!;
    if (currentStep < steps.length - 1) {
      if (!(currentStep == 4 && paymentMethodId == -1)) {
        if(currentStep == 3){
          await paymentMethods();
        }
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
          image: ManagerAssets.calenderWhite,
        ),
        enabled: true,
      ),
      EasyStep(
        customStep: stepHeader(
          index: lastStepIndex - 3,
          image: ManagerAssets.calenderWhite,
        ),
        enabled: false,
      ),
      EasyStep(
        customStep: stepHeader(
          index: lastStepIndex - 2,
          image: ManagerAssets.price,
        ),
        enabled: false,
      ),
      EasyStep(
        customStep: stepHeader(
          index: lastStepIndex - 1,
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
    this.paymentMethodId = _paymentsModel.data![index].id;
    _paymentModel = PaymentModel(
      id: paymentMethodId,
      name: _paymentsModel.data![index].name,
    );
    fillContent();
    update();
  }

  bool isCurrentPaymentMethod(int index) {
    return paymentMethodId == _paymentsModel.data![index].id;
  }

  fillContent() {
    CacheData cacheData = CacheData();
    reservationDetails = cacheData.getResourceDetails();
    resourceId = reservationDetails.id.onNull();
    resourceName = reservationDetails.attributes!.name.onNull();
    content = [
      resourceWithUserInfo(reservationDetails, _appSettingsPrefs),
      calenderByMonths(events),
      calenderByDays(),
      selectReservationWithType(),
      paymentMethod(
        isCurrentPaymentMethod,
        _paymentsModel,
        (index) {
          setPaymentMethod(
            index,
          );
        },
      ),
      reservationAllDetails(
        _paymentModel,
        _appSettingsPrefs,
        reservationDetails,
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

  String getTitleFromType(String type) {
    for (var unit in units) {
      if (unit.type == type) {
        return unit.title;
      }
    }
    return '';
  }
}
