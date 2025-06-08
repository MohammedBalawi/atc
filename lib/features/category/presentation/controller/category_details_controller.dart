import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/cache/cache.dart';
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/features/category/data/request/category_details_request.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_model.dart';
import 'package:act_hub_mobile/features/category/domain/usecase/category_details_usecase.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/usecase/profile_usecase.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../domain/model/category_details_resource_model.dart';

class CategoryDetailsController extends GetxController {
  CategoryDetailsUseCase categoryDetailsUseCase =
      instance<CategoryDetailsUseCase>();
  CategoryDetailsModel categoryDetailsModel = CategoryDetailsModel();
  List<CategoryDetailsResourceModel> resources = [];
  CacheData cacheData = CacheData();
  bool isLoading = true;
  String name = '';
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();
  ProfileUseCase profileUseCase = instance<ProfileUseCase>();

  Future<void> read() async {
    (await categoryDetailsUseCase.execute(
      CategoryDetailsRequest(
        categoryId: cacheData.getCategoryId(),
      ),
    ))
        .fold((l) {}, (r) {
      categoryDetailsModel = r;
      resources = r.data!.attributes!.resources!.onNull();
      name = r.data!.attributes!.name.onNull();
      update();
    });
  }

  priceFormat(int price) {
    return "${price.toString()}\$";
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

  seatsFormat(int index) {
    return "${resources[index].attributes!.numberSeats.toString()} ${ManagerStrings.seat}";
  }

  void navigateToReservation(int index) {
    CacheData cacheData = CacheData();
    cacheData.setResourceId(resources[index].id!);
    Get.toNamed(Routes.resourcesDetailsView);
  }

  void profile() async {
    (await profileUseCase.execute()).fold((l) {
      isLoading = false;
      update();
    }, (r) {
      isLoading = false;
      update();
      _appSettingsPrefs.setEmail(r.data.attributes.email!.toString());
      _appSettingsPrefs.setUserName(r.data.attributes.name!.toString());
      _appSettingsPrefs.setUserPhone(r.data.attributes.phone!.toString());
    });
    update();
  }

  Widget? isEmptyResources() {
    if (!isLoading && resources.length == 0) {
      return Center(
        child: Text(
          ManagerStrings.noData,
          style: getMediumTextStyle(
            fontSize: ManagerFontSize.s16,
            color: ManagerColors.grey,
          ),
        ),
      );
    }else if(isLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return null;
  }

  @override
  void onInit() {
    profile();
    super.onInit();
    read();
  }
}
