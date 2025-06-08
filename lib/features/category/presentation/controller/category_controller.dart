import 'package:act_hub_mobile/core/cache/cache.dart';
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../routes/routes.dart';
import '../../domain/model/category_model.dart';
import '../../domain/usecase/categories_usecase.dart';

class CategoryController extends GetxController {
  List<CategoryModel> categories = [];
  CategoriesUseCase _categoriesUseCase = instance<CategoriesUseCase>();
  CacheData cacheData = CacheData();

  performCategoryDetails(int index){
    setCurrentCategoryId(categories[index].id.onNull());
    Navigator.pushNamed(Get.context!, Routes.resourcesCategoryView);
  }

  Future<void> read() async {
    (await _categoriesUseCase.execute()).fold((l) {}, (r) {
      Get.back();
      categories = r.data!;
      update();
    });
  }

  bool isURLValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  ImageProvider<Object> imageProvider(
      {required String courseAvatar, String? defaultImage}) {
    if (isURLValid(courseAvatar)) {
      return CachedNetworkImageProvider(courseAvatar);
    }

    return AssetImage(
      defaultImage ?? ManagerAssets.course,
    );
  }

  Widget image({required String image, String? defaultImage}) {
    if (isURLValid(image)) {
      return Image.network(
        image,
        fit: BoxFit.fill,
      );
    }

    return Image.asset(
      defaultImage ?? ManagerAssets.category,
      fit: BoxFit.fill,
    );
  }

  @override
  void onInit() {
    super.onInit();
    read();
  }

  setCurrentCategoryId(int id) {
    cacheData.setCategoryId(id);
  }
}
