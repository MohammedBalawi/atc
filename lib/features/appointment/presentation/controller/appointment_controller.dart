import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/appointment/data/request/cancel_reservation_request.dart';
import 'package:act_hub_mobile/features/appointment/domain/usecase/cancel_reservation_usecase.dart';
import 'package:act_hub_mobile/features/appointment/presentation/view/tabs/cancelled_tab.dart';
import 'package:act_hub_mobile/features/appointment/presentation/view/tabs/finished_tab.dart';
import 'package:act_hub_mobile/features/appointment/presentation/view/tabs/upcoming_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../routes/routes.dart';
import '../../domain/model/reservations_user_model.dart';
import '../../domain/usecase/reservations_usecase.dart';

class AppointmentController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  List<Widget> screens = [];

  List<ReservationsUserModel> upComingReservations = [];
  List<ReservationsUserModel> finishedReservations = [];
  List<ReservationsUserModel> cancelledReservations = [];

  ReservationsUseCase _reservationsUseCase = instance<ReservationsUseCase>();

  CacheData cacheData = CacheData();

  bool isURLValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  Widget image({required String image, String? defaultImage}) {
    if (isURLValid(image)) {
      return Image.network(
        image,
        fit: BoxFit.fill,
      );
    }

    return Image.asset(
      defaultImage ?? ManagerAssets.workspace,
      fit: BoxFit.fill,
    );
  }

  void filteringReservations(List<ReservationsUserModel>? reservations) {
    reservations!.forEach(
      (element) {
        String status = element.status.onNull();
        if (status == Constants.finished) {
          finishedReservations.add(
            element,
          );
        } else if (status == Constants.pending) {
          upComingReservations.add(
            element,
          );
        } else {
          cancelledReservations.add(
            element,
          );
        }
      },
    );
    fillScreens();
    update();
  }

  readAppointments() async {
    upComingReservations = [];
    finishedReservations = [];
    cancelledReservations = [];

    BuildContext context = Get.context!;
    (await _reservationsUseCase.execute()).fold(
      (l) {
        Get.back();
        dialogRender(
            context: context,
            message: l.message,
            title: '',
            stateRenderType: StateRenderType.popupErrorState,
            retryAction: () {
              Get.back();
            });
      },
      (r) {
        filteringReservations(
          r.reservations_user_model,
        );
      },
    );
  }

  void fillScreens() {
    screens = [
      UpComingTab(
        upComing: upComingReservations,
      ),
      FinishedTab(
        finished: finishedReservations,
      ),
      CancelledTab(
        cancelled: cancelledReservations,
      ),
    ];
  }

  setCurrentResourceId(int id) {
    cacheData.setResourceId(id);
  }

  setCurrentReservationId(int id) {
    cacheData.setReservationId(id);
  }

  performResourceDetails(int resourceId) {
    setCurrentResourceId(
      resourceId,
    );
    Get.toNamed(Routes.resourcesDetailsView);
  }

  performReservationDetails(int reservationId) {
    setCurrentReservationId(
      reservationId,
    );
    Get.toNamed(Routes.reservationDetails);
  }

  ReservationsUserModel? findReservationById(int id) {
    // Search in upComingReservations list
    for (var reservation in upComingReservations) {
      if (reservation.id == id) {
        return reservation;
      }
    }

    // Search in finishedReservations list
    for (var reservation in finishedReservations) {
      if (reservation.id == id) {
        return reservation;
      }
    }

    // Search in cancelledReservations list
    for (var reservation in cancelledReservations) {
      if (reservation.id == id) {
        return reservation;
      }
    }

    // Item with ID not found in any of the lists
    return null;
  }

  ReservationsUserModel? currentReservation() {
    return findReservationById(cacheData.getReservationId());
  }

  refreshScreen() {
    fillScreens();
    readAppointments();
  }

  void cancelReservation(int reservationId) async {
    initCancelReservation();
    CancelReservationUseCase _useCase = instance<CancelReservationUseCase>();
    BuildContext context = Get.context as BuildContext;
    dialogRender(
        context: context,
        message: '',
        title: ManagerStrings.loading,
        stateRenderType: StateRenderType.popupLoadingState,
        retryAction: () {});
    (await _useCase
            .execute(CancelReservationRequest(reservationId: reservationId)))
        .fold(
      (l) {
        Get.back();
        dialogRender(
          context: context,
          message: l.message.toString(),
          title: '',
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
            Get.back();
            disposeCancelReservation();
          },
        );
      },
      (r) async {
        Get.back();
        await refreshScreen();
        dialogRender(
          context: context,
          message: '',
          title: ManagerStrings.reservationCancelledSuccess,
          stateRenderType: StateRenderType.popupSuccess,
          retryAction: () {
            Get.back();
            disposeCancelReservation();
          },
        );
      },
    );
  }

  String costDollarFormat(double cost){
    return "\u0024 $cost";
  }

  @override
  void onInit() {
    super.onInit();
    refreshScreen();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}

void cancelReservation(int index) {
  try {
    Get.find<AppointmentController>().cancelReservation(index);
  } catch (e) {
    print(e);
  }
}
