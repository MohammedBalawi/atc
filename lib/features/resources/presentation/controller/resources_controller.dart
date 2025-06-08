import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/resources/domain/model/resource_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_sizes_util.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../routes/routes.dart';
import '../../domain/usecase/resources_usecase.dart';

class ResourcesController extends GetxController {
  List<ResourceDataModel> resources = [];
  int isLoading = 0;
  String errorMessage = ManagerStrings.somethingWentWrong;
  NetworkInfo networkInfo = instance<NetworkInfo>();

  resourceHoursFormat(int index) {
    return "${resources[index].attributes..toString()} hour";
  }

  seatsFormat(int index) {
    return "${resources[index].attributes!.numberSeats.toString()} ${ManagerStrings.seat}";
  }

  priceByFormat(String price, String title) {
    return Row(
      children: [
        Text(
          price,
          style: getMediumTextStyle(
            fontSize: ManagerFontSize.s14,
            color: ManagerColors.primaryColor,
          ),
        ),
        Text(
          '/ $title',
          style: getMediumTextStyle(
            fontSize: ManagerFontSize.s12,
            color: ManagerColors.grey,
          ),
        ),
      ],
    );
  }

  priceFormat(int price) {
    return "${price.toString()}\$";
  }

  ResourcesUseCase _useCase = instance<ResourcesUseCase>();

  performResourceDetails(int index) {
    setCurrentResourceId(
      resources[index].id.onNull(),
    );
    Get.toNamed(Routes.resourcesDetailsView);
  }

  bool isURLValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  ImageProvider<Object> imageProvider(
      {required String resourceAvatar, String? defaultImage}) {
    if (isURLValid(resourceAvatar)) {
      return CachedNetworkImageProvider(resourceAvatar);
    }

    return AssetImage(
      defaultImage ?? ManagerAssets.workspace,
    );
  }

  Widget image({required String resourceAvatar, String? defaultImage}) {
    if (isURLValid(resourceAvatar)) {
      return Image.network(
        resourceAvatar,
        fit: BoxFit.fill,
        width: ManagerWidth.w128,
        height: ManagerHeight.h110,
      );
    }

    return Image.asset(
      defaultImage ?? ManagerAssets.workspace,
      fit: BoxFit.fill,
      width: ManagerWidth.w128,
      height: ManagerHeight.h110,
    );
  }

  setCurrentResourceId(int id) {
    CacheData cacheData = CacheData();
    cacheData.setResourceId(id);
  }

  performRefresh() async {
    if (await networkInfo.isConnected) {
      await getResources();
    } else {
      BuildContext context = Get.context!;
      dialogRender(
        context: context,
        message: ManagerStrings.NO_INTERNT_CONNECTION,
        title: '',
        stateRenderType: StateRenderType.popupErrorState,
        retryAction: () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  Future<void> getResources() async {
    BuildContext context = Get.context as BuildContext;
    (await _useCase.execute()).fold(
      (l) {
        errorMessage = l.message.toString();
        isLoading = 2;
        dialogRender(
          context: context,
          message: l.message.toString(),
          title: '',
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Navigator.of(context).pop();
          },
        );
      },
      (r) {
        resources = r.data!;
        isLoading = 1;
      },
    );
    update();
  }

  @override
  void onInit() {
    getResources();
    super.onInit();
  }
}
