import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/cache/cache.dart';
import 'package:act_hub_mobile/core/extensions/extensions.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/core/state_renderer/state_renderer.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/features/courses/data/request/course_description_requset.dart';
import 'package:act_hub_mobile/features/courses/data/request/course_rating_request.dart';
import 'package:act_hub_mobile/features/courses/domain/models/course_description_model.dart';
import 'package:act_hub_mobile/features/courses/domain/usecase/course_description_usecase.dart';
import 'package:act_hub_mobile/features/courses/domain/usecase/course_rating_usecase.dart';
import 'package:act_hub_mobile/features/courses/domain/usecase/course_subscription_usecase.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/usecase/profile_usecase.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDescriptionController extends GetxController {
  CourseSubscriptionUseCase courseSubscriptionUseCase =
      instance<CourseSubscriptionUseCase>();
  CourseRatingUseCase courseRatingUseCase = instance<CourseRatingUseCase>();
  CourseDescriptionUseCase courseDescriptionUseCase =
      instance<CourseDescriptionUseCase>();
  CacheData cache = CacheData();
  late CourseDescriptionModel courseDescriptionModel;
  String courseAvatar = '';
  String courseName = '';
  String courseDescription = '';
  String courseHourTraining = '';
  String courseLecturerName = '';
  double courseRate = 0.0;
  bool courseIsRated = false;
  int index = 0;
  String coursePrice = '';
  int ratingBarItemCount = 5;
  late int courseId = -1;
  ProfileUseCase _profileUseCase = instance<ProfileUseCase>();
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();
  bool disabledSubscriptNowButton = false;

  bool isURLValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  ImageProvider<Object> image() {
    if (isURLValid(courseAvatar)) {
      return CachedNetworkImageProvider(courseAvatar);
    }

    return AssetImage(
      ManagerAssets.course,
    );
  }

  void resetData() {
    courseAvatar = '';
    courseName = '';
    courseDescription = '';
    courseHourTraining = '';
    courseLecturerName = '';
    courseRate = 0.0;
    courseIsRated = false;
    index = 0;
    coursePrice = '';
    update();
  }

  Future<void> courseDetails() async {
    courseId = await cache.getCourseId();

    BuildContext context = Get.context!;
    dialogRender(
        context: context,
        message: ManagerStrings.loading,
        title: '',
        stateRenderType: StateRenderType.popupLoadingState,
        retryAction: () {});
    Get.back();
    (await courseDescriptionUseCase.execute(
      CourseDescriptionRequest(
        courseId: courseId,
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
        courseDescriptionModel = r.data!;
        cache.setCourseDetails(courseDescriptionModel);
        courseName = r.data!.courseDescriptionAttributesModel!.name;
        courseDescription =
            r.data!.courseDescriptionAttributesModel!.description;
        courseRate = r.data!.courseDescriptionAttributesModel!.rate;
        courseHourTraining =
            r.data!.courseDescriptionAttributesModel!.hours.toString();
        courseIsRated = r.data!.isRated!;
        index = r.data!.id!;
        coursePrice =
            r.data!.courseDescriptionAttributesModel!.price.toString();
        courseAvatar =
            r.data!.courseDescriptionAttributesModel!.avatar.toString();
        disabledSubscriptNowButton = true;
      },
    );
    update();
  }

  readUserData() async {
    BuildContext context = Get.context!;
    dialogRender(
      context: context,
      message: ManagerStrings.loading,
      title: ManagerStrings.fetchingInformation,
      stateRenderType: StateRenderType.popupLoadingState,
      retryAction: () {},
    );
    if (_appSettingsPrefs.getHasProfileData()) {
      Get.back();
      Navigator.pushNamed(context, Routes.paymentSelectionView);
    } else {
      (await _profileUseCase.execute()).fold((l) {
        Get.back();
        dialogRender(
            context: context,
            message: l.message,
            title: '',
            stateRenderType: StateRenderType.popupErrorState,
            retryAction: () {
              Get.offAllNamed(Routes.home);
            });
      }, (r) {
        Get.back();
        _appSettingsPrefs.setEmail(r.data.attributes.email.onNull());
        _appSettingsPrefs.setUserName(r.data.attributes.name.onNull());
        _appSettingsPrefs.setUserPhone(r.data.attributes.phone.onNull());
        _appSettingsPrefs.setHasProfileData();
        Navigator.pushNamed(context, Routes.paymentSelectionView);
      });
    }
  }

  Future<void> paymentSelection(BuildContext context) async {
    if (disabledSubscriptNowButton) {
      await readUserData();
    }
  }

  void courseSubscription({
    required BuildContext context,
  }) async {}

  void courseRating({
    required BuildContext context,
    required double value,
  }) async {
    (await courseRatingUseCase
            .execute(CourseRatingRequest(courseId: courseId, value: value)))
        .fold(
      (l) {
        dialogRender(
          context: context,
          message: ManagerStrings.courseRatingFailed,
          title: '',
          stateRenderType: StateRenderType.popupErrorState,
          retryAction: () {
            Get.back();
          },
        );
      },
      (r) {},
    );
  }

  @override
  void onInit() {
    super.onInit();
    courseDetails();
  }
}
