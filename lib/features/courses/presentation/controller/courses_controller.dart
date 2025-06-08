import 'package:act_hub_mobile/core/cache/cache.dart';
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_model.dart';
import 'package:act_hub_mobile/features/courses/domain/usecase/courses_usecase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_sizes_util.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/state_renderer/state_renderer.dart';
import '../../../../routes/routes.dart';

class CoursesController extends GetxController {
  List<CourseModel> courses = [];
  int isLoading = 0;
  String errorMessage = ManagerStrings.somethingWentWrong;
  NetworkInfo networkInfo = instance<NetworkInfo>();

  courseHoursFormat(int index) {
    return "${courses[index].courseAttributesModel!.hours.toString()} hour";
  }

  CoursesUseCase _useCase = instance<CoursesUseCase>();

  performCourseDetails(int index) {
    setCurrentCourseId(
      courses[index].id.onNull(),
    );
    Get.toNamed(Routes.course_description);
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
        width: ManagerWidth.w128,
        height: ManagerHeight.h110,
      );
    }

    return Image.asset(
      defaultImage ?? ManagerAssets.course,
      fit: BoxFit.fill,
      width: ManagerWidth.w128,
      height: ManagerHeight.h110,
    );
  }

  setCurrentCourseId(int id) {
    CacheData cacheData = CacheData();
    cacheData.setCourseId(id);
  }

  performRefresh() async {
    if (await networkInfo.isConnected) {
      await getCourses();
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

  Future<void> getCourses() async {
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
        courses = r.data!;
        isLoading = 1;
      },
    );
    update();
  }

  @override
  void onInit() {
    getCourses();
    super.onInit();
  }
}
