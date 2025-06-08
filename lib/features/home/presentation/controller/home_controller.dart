import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/cache/cache.dart';
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_sizes_util.dart';
import 'package:act_hub_mobile/core/state_renderer/state_renderer.dart';
import 'package:act_hub_mobile/features/home/domain/model/category_model.dart';
import 'package:act_hub_mobile/features/home/domain/model/course_model.dart';
import 'package:act_hub_mobile/features/home/domain/model/resource_model.dart';
import 'package:act_hub_mobile/features/home/domain/model/slider_model.dart';
import 'package:act_hub_mobile/features/home/domain/usecase/home_usecase.dart';
import 'package:act_hub_mobile/features/main/presentation/controller/main_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../routes/routes.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  int selectedCategoryIndex = 0;
  int current = 0;
  int isLoading = 0;
  String errorMessage = ManagerStrings.somethingWentWrong;
  NetworkInfo networkInfo = instance<NetworkInfo>();

  HomeUseCase _useCase = instance<HomeUseCase>();

  List<SliderModel> sliders = [];

  List<CourseModel> courses = [];

  List<CategoryModel> categories = [];

  List<ResourceModel> resources = [];

  CacheData cacheData = CacheData();

  void change(int index) {
    current = index;
    update();
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

  Widget image({required String courseAvatar, String? defaultImage}) {
    if (isURLValid(courseAvatar)) {
      return Image.network(
        courseAvatar,
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

  void navigateToAllCategories() {
    changeMainCurrentIndex(1);
  }

  setCurrentCourseId(int id) {
    cacheData.setCourseId(id);
  }

  setCurrentResourceId(int id) {
    cacheData.setResourceId(id);
  }

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    performCategoryDetails(index);
    update();
  }

  performCourseDetails(int index) {
    setCurrentCourseId(
      courses[index].id,
    );
    Get.toNamed(Routes.course_description);
  }

  performResourceDetails(int index) {
    setCurrentResourceId(
      resources[index].id,
    );
    Get.toNamed(Routes.resourcesDetailsView);
  }

  performRefresh() async {
    if (await networkInfo.isConnected) {
      await home();
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

  Future<void> home() async {
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
        categories = r.categories!;
        sliders = r.sliders!;
        courses = r.courses!;
        resources = r.resources!;
        isLoading = 1;
      },
    );
    update();
  }

  courseHoursFormat(int index) {
    return "${courses[index].courseAttributeModel.hours.toString()} hr";
  }

  performCategoryDetails(int index) {
    setCurrentCategoryId(categories[index].id.onNull());
    Navigator.pushNamed(Get.context!, Routes.resourcesCategoryView);
  }

  setCurrentCategoryId(int id) {
    cacheData.setCategoryId(id);
  }

  priceFormat(double price) {
    return "${price.toString()}\$";
  }

  priceByFormat(String price, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            color: ManagerColors.greyLight,
          ),
        ),
      ],
    );
  }

  resourceSeatsFormat(int index) {
    return '${resources[index].attributes.numberSeats.toString()} ${ManagerStrings.seat}';
  }

  courseRatingFormat(int index) {
    return '${courses[index].courseAttributeModel.rate.toString()}/5';
  }

  @override
  void onInit() {
    super.onInit();
    home();
    carouselController = CarouselController();
  }
}
