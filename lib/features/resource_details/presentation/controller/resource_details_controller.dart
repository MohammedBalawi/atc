import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/features/appointment/domain/model/event_model.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_resource_model.dart';
import 'package:act_hub_mobile/features/resource_details/data/request/resource_details_request.dart';
import 'package:act_hub_mobile/features/resource_details/domain/usecase/resource_details_usecase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../routes/routes.dart';
import '../../../category/domain/model/resource_attributes_model.dart';

class ResourceDetailsController extends GetxController {
  ResourceDetailsUseCase resourceDetailsUseCase =
      instance<ResourceDetailsUseCase>();
  String resourceAvatar = '';
  String name = '';
  String description = '';
  String priceByHour = '';
  int priceByWeek = 0;
  int priceByMonth = 0;
  int priceByDay = 0;
  int hourPrice = 0;
  String day = '';
  String week = '';
  String month = '';
  String hour = '';
  int numberSeats = 0;
  int ratingBarItemCount = 5;
  bool disabledReserveNowButton = false;

  bool isURLValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  ImageProvider<Object> image() {
    if (isURLValid(resourceAvatar)) {
      return CachedNetworkImageProvider(resourceAvatar);
    }
    return AssetImage(
      ManagerAssets.course,
    );
  }

  void navigateToPayment() {
    CacheData cacheData = CacheData();
    if (disabledReserveNowButton) {
      cacheData.setResourceDetails(
        CategoryDetailsResourceModel(
          id: cacheData.getResourceId(),
          attributes: ResourceAttributesModel(
              name: name,
              priceByDay: priceByDay,
              priceByWeak: priceByWeek,
              priceByHour: hourPrice,
              priceByMonth: priceByMonth,
              numberSeats: numberSeats,
              thumbnailImage: resourceAvatar),
        ),
      );
      Get.toNamed(Routes.reservationPayment);
    }
  }

  Future<void> resourceDetails() async {
    CacheData cache = CacheData();
    int resourceId = await cache.getResourceId();
    BuildContext context = Get.context!;
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: '',
        stateRenderType: StateRenderType.popupLoadingState,
        retryAction: () {});
    Get.back();
    (await resourceDetailsUseCase.execute(
      ResourceDetailsRequest(
        resourceId: resourceId,
      ),
    ))
        .fold(
      (l) {
        print(l);
        Get.back();
        dialogRender(
          context: context,
          message: ManagerStrings.courseDescriptionFailed,
          title: '',
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
          },
        );
      },
      (r) {
        name = r.data!.attributes!.name.toString();
        description = r.data!.attributes!.description.toString();
        numberSeats = r.data!.attributes!.numberSeats!;
        priceByHour = r.data!.attributes!.priceByHour.toString();
        resourceAvatar = r.data!.attributes!.thumbnailImage.toString();
        day = r.data!.attributes!.priceByDay.toString();
        hour = r.data!.attributes!.priceByHour.toString();
        week = r.data!.attributes!.priceByWeek.toString();
        month = r.data!.attributes!.priceByMonth.toString();
        priceByDay = r.data!.attributes!.priceByDay.onNull();
        priceByWeek = r.data!.attributes!.priceByWeek.onNull();
        priceByMonth = r.data!.attributes!.priceByMonth.onNull();
        hourPrice = r.data!.attributes!.priceByHour.onNull();
        List<EventModel> events = [];
        r.data!.reservations!.map((e) => events.addAll(e.events)).toList();
        cache.setEvents(events);
        disabledReserveNowButton = true;
        update();
      },
    );
    update();
  }

  @override
  void onInit() {
    super.onInit();
    resourceDetails();
  }
}
