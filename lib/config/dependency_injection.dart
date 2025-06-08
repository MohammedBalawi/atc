// Core imports
import 'package:act_hub_mobile/features/appointment/data/data_source/book_appointment_remote_data_source.dart';
import 'package:act_hub_mobile/features/appointment/data/data_source/cancel_reservation_remote_data_source.dart';
import 'package:act_hub_mobile/features/appointment/data/data_source/reservations_remote_data_source.dart';
import 'package:act_hub_mobile/features/appointment/data/repository_impl/book_appointment_repo_impl.dart';
import 'package:act_hub_mobile/features/appointment/data/repository_impl/cancel_reservation_repository_impl.dart';
import 'package:act_hub_mobile/features/appointment/data/repository_impl/reservations_repo_impl.dart';
import 'package:act_hub_mobile/features/appointment/domain/repository/book_appointment_repository.dart';
import 'package:act_hub_mobile/features/appointment/domain/usecase/book_appointment_usecase.dart';
import 'package:act_hub_mobile/features/appointment/domain/usecase/cancel_reservation_usecase.dart';
import 'package:act_hub_mobile/features/appointment/domain/usecase/reservations_usecase.dart';
import 'package:act_hub_mobile/features/appointment/presentation/controller/stepper_reservation_controller.dart';
import 'package:act_hub_mobile/features/auth/data/repository_impl/fcm_token_repository_impl.dart';
import 'package:act_hub_mobile/features/auth/domain/repository/fcm_token_repository.dart';
import 'package:act_hub_mobile/core/cache/cache.dart';
import 'package:act_hub_mobile/features/auth/presentation/controller/register_controller.dart';
import 'package:act_hub_mobile/features/category/data/data_source/category_details_remote_data_source.dart';
import 'package:act_hub_mobile/features/category/data/repository_impl/categories_respoitory_impl.dart';
import 'package:act_hub_mobile/features/category/data/repository_impl/category_details_repository_impl.dart';
import 'package:act_hub_mobile/features/category/domain/repository/categories_repository.dart';
import 'package:act_hub_mobile/features/category/domain/repository/category_details_repository.dart';
import 'package:act_hub_mobile/features/category/domain/usecase/categories_usecase.dart';
import 'package:act_hub_mobile/features/category/domain/usecase/category_details_usecase.dart';
import 'package:act_hub_mobile/features/category/presentation/controller/category_controller.dart';
import 'package:act_hub_mobile/features/category/presentation/controller/category_details_controller.dart';
import 'package:act_hub_mobile/features/courses/data/data_source/course_rating_data_source.dart';
import 'package:act_hub_mobile/features/courses/data/data_source/course_subscription_data_source.dart';
import 'package:act_hub_mobile/features/courses/data/data_source/courses_remote_data_source.dart';
import 'package:act_hub_mobile/features/courses/data/data_source/subscriptions_remote_data_source.dart';
import 'package:act_hub_mobile/features/courses/data/repository_impl/course_rating_repo_impl.dart';
import 'package:act_hub_mobile/features/courses/data/repository_impl/course_subscription_repo_impl.dart';
import 'package:act_hub_mobile/features/courses/data/repository_impl/courses_repo_impl.dart';
import 'package:act_hub_mobile/features/courses/data/repository_impl/subscriptions_repo_impl.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/course_description_repository.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/course_rating_repository.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/course_subscription_repository.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/courses_repository.dart';
import 'package:act_hub_mobile/features/courses/domain/repository/subscriptions_repository.dart';
import 'package:act_hub_mobile/features/courses/domain/usecase/course_rating_usecase.dart';
import 'package:act_hub_mobile/features/courses/domain/usecase/course_subscription_usecase.dart';
import 'package:act_hub_mobile/features/courses/domain/usecase/courses_usecase.dart';
import 'package:act_hub_mobile/features/courses/domain/usecase/subscriptions_usecase.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/course_description_controller.dart';
import 'package:act_hub_mobile/features/courses/presentation/controller/courses_controller.dart';
import 'package:act_hub_mobile/features/edit_profile/data/data_source/edit_name_remote_data_source.dart';
import 'package:act_hub_mobile/features/edit_profile/data/data_source/edit_phone_remote_data_source.dart';
import 'package:act_hub_mobile/features/edit_profile/data/data_source/profile_remote_data_source.dart';
import 'package:act_hub_mobile/features/edit_profile/data/respository_impl/edit_name_repository_impl.dart';
import 'package:act_hub_mobile/features/edit_profile/data/respository_impl/edit_phone_repository_impl.dart';
import 'package:act_hub_mobile/features/edit_profile/data/respository_impl/profile_repository_impl.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/repository/edit_name_repository.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/repository/edit_phone_repository.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/repository/profile_repository.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/usecase/edit_name_usecase.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/usecase/edit_phone_usecase.dart';
import 'package:act_hub_mobile/features/edit_profile/domain/usecase/profile_usecase.dart';
import 'package:act_hub_mobile/features/notifications/data/data_source/notifications_remote_data_source.dart';
import 'package:act_hub_mobile/features/notifications/data/repo_impl/notifications_repo_impl.dart';
import 'package:act_hub_mobile/features/notifications/domain/repository/notifications_repository.dart';
import 'package:act_hub_mobile/features/notifications/domain/usecase/notifications_usecase.dart';
import 'package:act_hub_mobile/features/notifications/presentation/controller/notifications_controller.dart';
import 'package:act_hub_mobile/features/profile/data/data_source/balance_remote_data_source.dart';
import 'package:act_hub_mobile/features/profile/data/data_source/edit_password_remote_data_source.dart';
import 'package:act_hub_mobile/features/profile/data/repository_impl/balance_repository_impl.dart';
import 'package:act_hub_mobile/features/profile/data/repository_impl/edit_password_repository_impl.dart';
import 'package:act_hub_mobile/features/profile/domain/repository/balance_repository.dart';
import 'package:act_hub_mobile/features/profile/domain/repository/edit_password_repository.dart';
import 'package:act_hub_mobile/features/profile/domain/usecase/balance_usecase.dart';
import 'package:act_hub_mobile/features/profile/domain/usecase/edit_password_usecase.dart';
import 'package:act_hub_mobile/features/profile/presentation/controller/settings_controller.dart';
import 'package:act_hub_mobile/features/reset_password/data/data_souces/reset_password_remote_data_source.dart';
import 'package:act_hub_mobile/features/reset_password/data/repoitory_impl/reset_password_repository_impl.dart';
import 'package:act_hub_mobile/features/reset_password/domain/repositroy/reset_password_repositroy.dart';
import 'package:act_hub_mobile/features/reset_password/domain/usecase/reset_password_use_case.dart';
import 'package:act_hub_mobile/features/resource_details/data/data_source/resource_details_remote_data_source.dart';
import 'package:act_hub_mobile/features/resource_details/domain/repository/resource_details_repository.dart';
import 'package:act_hub_mobile/features/resource_details/domain/usecase/resource_details_usecase.dart';
import 'package:act_hub_mobile/features/resource_details/presentation/controller/resource_details_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Networking and API imports
import 'package:dio/dio.dart';
import '../core/network/app_api.dart';
import '../core/network/dio_factory.dart';

// Data sources
import '../core/storage/remote/firebase/controllers/fb_notifications.dart';
import '../features/appointment/domain/repository/cancel_reservation_repository.dart';
import '../features/appointment/domain/repository/reservations_repository.dart';
import '../features/appointment/presentation/controller/appointment_controller.dart';
import '../features/auth/data/data_source/remote_data_source.dart';
import '../features/courses/data/data_source/course_description_data_source.dart';
import '../features/courses/data/repository_impl/course_description_repo_impl.dart';
import '../features/courses/domain/usecase/course_description_usecase.dart';
import '../features/auth/domain/usecase/fcm_token_usecase.dart';
import '../features/category/data/data_source/categories_remote_data_source.dart';
import '../features/courses/presentation/controller/stepper_controller.dart';
import '../features/courses/presentation/controller/subscriptions_controller.dart';
import '../features/forget_password/data/data_souces/remote_data_source.dart';
import '../features/home/data/data_source/remote_data_source.dart';
import '../features/payment/data/data_source/payments_remote_data_source.dart';
import '../features/payment/data/repository_impl/payments_respoitory_impl.dart';
import '../features/payment/domain/repository/payments_repository.dart';
import '../features/payment/domain/usecase/payments_usecase.dart';
import '../features/profile/presentation/controller/locale_notifier_controller.dart';
import '../features/reset_password/presentation/controller/reset_password_controller.dart';
import '../features/resources/data/data_source/resources_remote_data_source.dart';
import '../features/resources/domain/repository/resources_repository.dart';
import '../features/resources/domain/usecase/resources_usecase.dart';
import '../features/resources/presentation/controller/resources_controller.dart';
import '../features/verification/data/data_source/send_otp_remote_date_source.dart';
import '../features/verification/data/data_source/verify_email_remote_date_source.dart';

// Repositories
import '../features/auth/data/repository_impl/login_repository_impl.dart';
import '../features/auth/data/repository_impl/logout_repository_impl.dart';
import '../features/auth/data/repository_impl/register_repository_impl.dart';
import '../features/forget_password/data/repoitory_impl/forget_password_repository_impl.dart';
import '../features/home/data/repository_impl/home_repository_impl.dart';
import '../features/verification/data/respository_impl/send_otp_respository_impl.dart';
import '../features/verification/data/respository_impl/verify_email_respository_impl.dart';

// Domain layer - repositories
import '../features/auth/domain/repository/login_repository.dart';
import '../features/auth/domain/repository/logout_repository.dart';
import '../features/auth/domain/repository/register_repository.dart';
import '../features/forget_password/domain/repositroy/forget_password_repositroy.dart';
import '../features/home/domain/repository/home_repository.dart';
import '../features/verification/domain/repositories/send_otp_repository.dart';
import '../features/verification/domain/repositories/verify_email_repository.dart';

// Domain layer - use cases
import '../features/auth/domain/usecase/login_usecase.dart';
import '../features/auth/domain/usecase/logout_usecase.dart';
import '../features/auth/domain/usecase/register_usecase.dart';
import '../features/forget_password/domain/usecase/forget_password_usecase.dart';
import '../features/home/domain/usecase/home_usecase.dart';
import '../features/verification/domain/usecases/send_otp_usecase.dart';
import '../features/verification/domain/usecases/verify_email_usecase.dart';

// Presentation layer - controllers
import '../features/auth/presentation/controller/login_controller.dart';
import '../features/forget_password/presentation/controller/forget_pass_controller.dart';
import '../features/home/presentation/controller/home_controller.dart';
import '../features/outboarding/presentation/controller/out_boarding_controller.dart';
import '../features/profile/presentation/controller/profile_controller.dart';
import '../features/verification/presentation/controller/verification_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';
import '../features/main/presentation/controller/main_controller.dart';

// Other dependencies
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../core/internet_checker/interent_checker.dart';
import '../core/storage/local/app_settings_prefs.dart';
import '../firebase_options_.dart';

final instance = GetIt.instance;

initFirebaseNotification() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fbNotifications = FbNotifications();
  await fbNotifications.requestNotificationPermissions();
  await fbNotifications.initializeForegroundNotificationForAndroid();
  fbNotifications.manageNotificationAction();
  await FbNotifications.initNotifications();
}

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  if (!GetIt.I.isRegistered<SharedPreferences>()) {
    instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  }

  if (!GetIt.I.isRegistered<AppSettingsPrefs>()) {
    instance.registerLazySingleton<AppSettingsPrefs>(
        () => AppSettingsPrefs(instance()));
  }
  // ToDo: remove this code
  // AppSettingsPrefs _app = instance<AppSettingsPrefs>();
  // var pref = await SharedPreferences.getInstance();
  // pref.clear();

  AppSettingsPrefs _appSettings = instance<AppSettingsPrefs>();

  if (_appSettings.getEnableNotifications()) {
    await initFirebaseNotification();
  }

  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(InternetConnectionCheckerPlus()));
  }
  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(() => DioFactory());
  }
  Dio dio = await instance<DioFactory>().getDio();
  if (!GetIt.I.isRegistered<AppService>()) {
    instance.registerLazySingleton<AppService>(() => AppService(dio));
  }
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

finishSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  finishSplash();
  Get.put<OutBoardingController>(OutBoardingController());
}

finishOutBoarding() {
  Get.delete<OutBoardingController>();
}

initLoginModule() async {
  finishSplash();
  finishOutBoarding();
  finishRegister();
  finishLogOut();
  initVerifyEmail();
  disposeResetPasswordModule();
  initFcmTokenModule();

  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
        () => RemoteLoginDateSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
        () => LoginRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<LoginRepository>()));
  }

  Get.put<LoginController>(LoginController());
}

finishLoginModule() async {
  if (GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.unregister<RemoteLoginDataSource>();
  }

  if (GetIt.I.isRegistered<LoginRepository>()) {
    instance.unregister<LoginRepository>();
  }

  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.unregister<LoginUseCase>();
  }

  Get.delete<LoginController>();
}

initRegisterModule() async {
  finishLoginModule();
  if (!GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.registerLazySingleton<RemoteRegisterDataSource>(
        () => RemoteRegisterDateSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<RegisterRepository>()) {
    instance.registerLazySingleton<RegisterRepository>(
        () => RegisterRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
        () => RegisterUseCase(instance<RegisterRepository>()));
  }

  Get.put<RegisterController>(RegisterController());
}

finishRegister() {
  if (GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.unregister<RemoteRegisterDataSource>();
  }

  if (GetIt.I.isRegistered<RegisterRepository>()) {
    instance.unregister<RegisterRepository>();
  }

  if (GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.unregister<RegisterUseCase>();
  }
}

initForgetPassword() async {
  finishLoginModule();

  if (!GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
    instance.registerLazySingleton<ForgetPasswordDataSource>(
        () => RemoteForgetPasswordDataSourceImpl(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerFactory<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(
        instance<ForgetPasswordRepository>(),
      ),
    );
  }

  Get.put(ForgetPasswordController());
}

disposeForgetPassword() async {
  if (GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
    instance.unregister<ForgetPasswordDataSource>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.unregister<ForgetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.unregister<ForgetPasswordUseCase>();
  }
}

initSendOtp() async {
  if (!GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
    instance.registerLazySingleton<RemoteSendOtpDataSource>(
        () => RemoteSendOtpDataSourceImpl(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<SendOtpRepository>()) {
    instance.registerLazySingleton<SendOtpRepository>(
      () => SendOtpRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<SendOtpUseCase>()) {
    instance.registerFactory<SendOtpUseCase>(
      () => SendOtpUseCase(
        instance<SendOtpRepository>(),
      ),
    );
  }
}

disposeSendOtp() async {
  if (GetIt.I.isRegistered<RemoteSendOtpDataSource>()) {
    instance.unregister<RemoteSendOtpDataSource>();
  }

  if (GetIt.I.isRegistered<SendOtpRepository>()) {
    instance.unregister<SendOtpRepository>();
  }

  if (GetIt.I.isRegistered<SendOtpUseCase>()) {
    instance.unregister<SendOtpUseCase>();
  }
}

initVerifyEmail() async {
  disposeForgetPassword();
  initSendOtp();
  if (!GetIt.I.isRegistered<RemoteVerifyEmailDataSource>()) {
    instance.registerLazySingleton<RemoteVerifyEmailDataSource>(
        () => RemoteVerifyEmailDataSourceImpl(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<VerifyEmailRepository>()) {
    instance.registerLazySingleton<VerifyEmailRepository>(
        () => VerifyEmailRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<VerifyEmailUseCase>()) {
    instance.registerFactory<VerifyEmailUseCase>(
        () => VerifyEmailUseCase(instance<VerifyEmailRepository>()));
  }

  Get.put<VerificationController>(VerificationController());
}

disposeVerifyEmail() async {
  disposeSendOtp();

  Get.delete<ForgetPasswordController>();

  if (GetIt.I.isRegistered<RemoteVerifyEmailDataSource>()) {
    instance.unregister<RemoteVerifyEmailDataSource>();
  }

  if (GetIt.I.isRegistered<VerifyEmailRepository>()) {
    instance.unregister<VerifyEmailRepository>();
  }

  if (GetIt.I.isRegistered<VerifyEmailUseCase>()) {
    instance.unregister<VerifyEmailUseCase>();
  }

  Get.delete<VerificationController>();
}

initMainModule() {
  Get.put<MainController>(MainController());
  initHome();
  initCategoriesModule();

  disposeSubscriptionProcess();
  disposeReservationProcess();
}

initHome() async {
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
        () => RemoteHomeDataSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(
        () => HomeUseCase(instance<HomeRepository>()));
  }

  Get.put<HomeController>(HomeController());
  initProfile();
  disposeCourse();
  initGetReservations();
  initSubscriptions();
}

finishHome() async {
  if (GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.unregister<RemoteHomeDataSource>();
  }

  if (GetIt.I.isRegistered<HomeRepository>()) {
    instance.unregister<HomeRepository>();
  }

  if (GetIt.I.isRegistered<HomeUseCase>()) {
    instance.unregister<HomeUseCase>();
  }

  Get.delete<HomeController>();
}

initCourseDescription() {
  if (!GetIt.I.isRegistered<RemoteCourseDescriptionDataSource>()) {
    instance.registerLazySingleton<RemoteCourseDescriptionDataSource>(() =>
        RemoteCourseDescriptionDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<CourseDescriptionRepository>()) {
    instance.registerLazySingleton<CourseDescriptionRepository>(
        () => CourseDescriptionRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<CourseDescriptionUseCase>()) {
    instance.registerFactory<CourseDescriptionUseCase>(() =>
        CourseDescriptionUseCase(instance<CourseDescriptionRepository>()));
  }
}

disposeCourseDescription() async {
  if (GetIt.I.isRegistered<RemoteCourseDescriptionDataSource>()) {
    instance.unregister<RemoteCourseDescriptionDataSource>();
  }

  if (GetIt.I.isRegistered<CourseDescriptionRepository>()) {
    instance.unregister<CourseDescriptionRepository>();
  }

  if (GetIt.I.isRegistered<CourseDescriptionUseCase>()) {
    instance.unregister<CourseDescriptionUseCase>();
  }

  Get.delete<CourseDescriptionController>();
}

initProfile() {
  initLogOut();
  initChangePassword();

  if (!GetIt.I.isRegistered<RemoteProfileDataSource>()) {
    instance.registerLazySingleton<RemoteProfileDataSource>(
        () => RemoteProfileDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<ProfileRepository>()) {
    instance.registerLazySingleton<ProfileRepository>(
        () => ProfileRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerFactory<ProfileUseCase>(
        () => ProfileUseCase(instance<ProfileRepository>()));
  }

  Get.put<LocaleNotifierController>(LocaleNotifierController());
  Get.put<ProfileController>(ProfileController());
}

disposeProfile() {
  Get.delete<ProfileController>();
  if (GetIt.I.isRegistered<RemoteProfileDataSource>()) {
    instance.unregister<RemoteProfileDataSource>();
  }

  if (GetIt.I.isRegistered<ProfileRepository>()) {
    instance.unregister<ProfileRepository>();
  }

  if (GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.unregister<ProfileUseCase>();
  }
}

finishProfile() {
  Get.delete<ProfileController>();
}

initSubscriptionProcess() {
  initPaymentsModule();
  initCoursesSubscription();
  Get.put<StepperController>(StepperController());
}

initBookAppointmentProcess() {
  initPaymentsModule();
  initAppointmentProcess();
  Get.put<StepperReservationController>(StepperReservationController());
}

initGetReservations() {
  if (!GetIt.I.isRegistered<RemoteReservationsDataSource>()) {
    instance.registerLazySingleton<RemoteReservationsDataSource>(
        () => RemoteReservationsDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<ReservationsRepository>()) {
    instance.registerLazySingleton<ReservationsRepository>(
        () => ReservationsRepoImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<ReservationsUseCase>()) {
    instance.registerFactory<ReservationsUseCase>(
        () => ReservationsUseCase(instance<ReservationsRepository>()));
  }
  Get.delete<AppointmentController>();
  Get.put(AppointmentController());
}

initAppointmentProcess() {
  if (!GetIt.I.isRegistered<RemoteBookAppointmentDataSource>()) {
    instance.registerLazySingleton<RemoteBookAppointmentDataSource>(
        () => RemoteBookAppointmentDateSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<BookAppointmentRepository>()) {
    instance.registerLazySingleton<BookAppointmentRepository>(
        () => BookAppointmentRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<BookAppointmentUseCase>()) {
    instance.registerFactory<BookAppointmentUseCase>(
        () => BookAppointmentUseCase(instance<BookAppointmentRepository>()));
  }
}

disposeReservationProcess() {
  disposePaymentsModule();
  // ToDo: update This Line
  CacheData().disposeHasPaymentMethods();
  Get.delete<StepperReservationController>();
  disposePaymentsModule();
}

disposeSubscriptionProcess() {
  disposePaymentsModule();
  disposeCoursesSubscription();
  CacheData().disposeHasPaymentMethods();
  Get.delete<StepperController>();
}

initCourse() {
  initCourseDescription();
  initCoursesRating();
  initCoursesSubscription();
  initProfile();
  Get.put<CourseDescriptionController>(CourseDescriptionController());
}

disposeCourse() {
  disposeCourseDescription();
  disposeCourseRating();
  disposeCoursesSubscription();
  Get.delete<CourseDescriptionController>();
}

initCoursesSubscription() {
  if (!GetIt.I.isRegistered<RemoteCourseSubscriptionDataSource>()) {
    instance.registerLazySingleton<RemoteCourseSubscriptionDataSource>(() =>
        RemoteCourseSubscriptionDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<CourseSubscriptionRepository>()) {
    instance.registerLazySingleton<CourseSubscriptionRepository>(
        () => CourseSubscriptionRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<CourseSubscriptionUseCase>()) {
    instance.registerFactory<CourseSubscriptionUseCase>(() =>
        CourseSubscriptionUseCase(instance<CourseSubscriptionRepository>()));
  }
}

disposeCoursesSubscription() {
  if (GetIt.I.isRegistered<RemoteCourseSubscriptionDataSource>()) {
    instance.unregister<RemoteCourseSubscriptionDataSource>();
  }
  if (GetIt.I.isRegistered<CourseSubscriptionRepository>()) {
    instance.unregister<CourseSubscriptionRepository>();
  }

  if (GetIt.I.isRegistered<CourseSubscriptionUseCase>()) {
    instance.unregister<CourseSubscriptionUseCase>();
  }
  Get.delete<StepperController>();
}

initCoursesRating() {
  if (!GetIt.I.isRegistered<RemoteCourseRatingDataSource>()) {
    instance.registerLazySingleton<RemoteCourseRatingDataSource>(
        () => RemoteCourseRatingDataSourceImplement(instance<AppService>()));
  }
  if (!GetIt.I.isRegistered<CourseRatingRepository>()) {
    instance.registerLazySingleton<CourseRatingRepository>(
        () => CourseRatingRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<CourseRatingUseCase>()) {
    instance.registerFactory<CourseRatingUseCase>(
        () => CourseRatingUseCase(instance<CourseRatingRepository>()));
  }
}

initLogOut() {
  if (!GetIt.I.isRegistered<RemoteLogoutDataSource>()) {
    instance.registerLazySingleton<RemoteLogoutDataSource>(
        () => RemoteLogoutDataSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<LogoutRepository>()) {
    instance.registerLazySingleton<LogoutRepository>(
        () => LogoutRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.registerFactory<LogoutUseCase>(
        () => LogoutUseCase(instance<LogoutRepository>()));
  }
}

initEditName() {
  if (!GetIt.I.isRegistered<RemoteEditNameDataSource>()) {
    instance.registerLazySingleton<RemoteEditNameDataSource>(
        () => RemoteEditNameDataSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<EditNameRepository>()) {
    instance.registerLazySingleton<EditNameRepository>(
        () => EditNameRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<EditNameUseCase>()) {
    instance.registerFactory<EditNameUseCase>(
        () => EditNameUseCase(instance<EditNameRepository>()));
  }
}

initEditPhone() {
  if (!GetIt.I.isRegistered<RemoteEditPhoneDataSource>()) {
    instance.registerLazySingleton<RemoteEditPhoneDataSource>(
        () => RemoteEditPhoneDataSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<EditPhoneRepository>()) {
    instance.registerLazySingleton<EditPhoneRepository>(
        () => EditPhoneRepoImplement(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<EditPhoneUseCase>()) {
    instance.registerFactory<EditPhoneUseCase>(
        () => EditPhoneUseCase(instance<EditPhoneRepository>()));
  }
}

initChangePassword() {
  if (!GetIt.I.isRegistered<RemoteEditPasswordDataSource>()) {
    instance.registerLazySingleton<RemoteEditPasswordDataSource>(
        () => RemoteEditPasswordDateSourceImplement(instance<AppService>()));
  }

  if (!GetIt.I.isRegistered<EditPasswordRepository>()) {
    instance.registerLazySingleton<EditPasswordRepository>(
        () => EditPasswordRepoImpl(instance(), instance()));
  }

  if (!GetIt.I.isRegistered<EditPasswordUseCase>()) {
    instance.registerFactory<EditPasswordUseCase>(
        () => EditPasswordUseCase(instance<EditPasswordRepository>()));
  }
}

disposeChangePassword() {
  if (GetIt.I.isRegistered<RemoteEditPasswordDataSource>()) {
    instance.unregister<RemoteEditPasswordDataSource>();
  }

  if (GetIt.I.isRegistered<EditPasswordRepository>()) {
    instance.unregister<EditPasswordRepository>();
  }

  if (GetIt.I.isRegistered<EditPasswordUseCase>()) {
    instance.unregister<EditPasswordUseCase>();
  }
}

finishMainModule() {
  finishHome();
  finishProfile();
  disposeCoursesSubscription();
  Get.delete<MainController>();
}

finishLogOut() {
  if (GetIt.I.isRegistered<RemoteLogoutDataSource>()) {
    instance.unregister<RemoteLogoutDataSource>();
  }

  if (GetIt.I.isRegistered<LogoutRepository>()) {
    instance.unregister<LogoutRepository>();
  }

  if (GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.unregister<LogoutUseCase>();
  }

  finishMainModule();
}

disposeCourseSubscription() {
  if (GetIt.I.isRegistered<RemoteCourseSubscriptionDataSource>()) {
    instance.unregister<RemoteCourseSubscriptionDataSource>();
  }

  if (GetIt.I.isRegistered<CourseSubscriptionRepository>()) {
    instance.unregister<CourseSubscriptionRepository>();
  }

  if (GetIt.I.isRegistered<CourseSubscriptionUseCase>()) {
    instance.unregister<CourseSubscriptionUseCase>();
  }
}

disposeCourseRating() {
  if (GetIt.I.isRegistered<RemoteCourseRatingDataSource>()) {
    instance.unregister<RemoteCourseRatingDataSource>();
  }

  if (GetIt.I.isRegistered<CourseRatingRepository>()) {
    instance.unregister<CourseRatingRepository>();
  }

  if (GetIt.I.isRegistered<CourseRatingUseCase>()) {
    instance.unregister<CourseRatingUseCase>();
  }
}

initResetPasswordModule() {
  if (!GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
    instance.registerLazySingleton<ResetPasswordRemoteDataSource>(
      () => RemoteResetPasswordRemoteDataSourceImpl(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResetPasswordRepository>()) {
    instance.registerLazySingleton<ResetPasswordRepository>(
      () => ResetPasswordRepositoryImpl(
        instance<NetworkInfo>(),
        instance<ResetPasswordRemoteDataSource>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(
        instance<ResetPasswordRepository>(),
      ),
    );
  }
  Get.put<ResetPasswordController>(ResetPasswordController());
}

disposeResetPasswordModule() {
  disposeForgetPassword();
  if (GetIt.I.isRegistered<ResetPasswordRemoteDataSource>()) {
    instance.unregister<ResetPasswordRemoteDataSource>();
  }

  if (GetIt.I.isRegistered<ResetPasswordRepository>()) {
    instance.unregister<ResetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.unregister<ResetPasswordUseCase>();
  }

  Get.delete<ResetPasswordController>();
}

initCategoriesModule() {
  if (!GetIt.I.isRegistered<RemoteCategoriesDataSource>()) {
    instance.registerLazySingleton<RemoteCategoriesDataSource>(
      () => RemoteCategoriesDataSourceImplement(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CategoriesRepository>()) {
    instance.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImplementation(
        instance<RemoteCategoriesDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CategoriesUseCase>()) {
    instance.registerLazySingleton<CategoriesUseCase>(
      () => CategoriesUseCase(
        instance<CategoriesRepository>(),
      ),
    );
  }
  Get.put<CategoryController>(CategoryController());
}

initFcmTokenModule() {
  if (!GetIt.I.isRegistered<RemoteFcmTokenDataSource>()) {
    instance.registerLazySingleton<RemoteFcmTokenDataSource>(
      () => RemoteFcmTokenDataSourceImplement(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<FcmTokenRepository>()) {
    instance.registerLazySingleton<FcmTokenRepository>(
      () => FcmTokenRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<FcmTokenUseCase>()) {
    instance.registerLazySingleton<FcmTokenUseCase>(
      () => FcmTokenUseCase(
        instance(),
      ),
    );
  }
}

initPaymentsModule() {
  if (!GetIt.I.isRegistered<RemotePaymentsDataSource>()) {
    instance.registerLazySingleton<RemotePaymentsDataSource>(
      () => RemotePaymentsDataSourceImplement(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<PaymentsRepository>()) {
    instance.registerLazySingleton<PaymentsRepository>(
      () => PaymentsRepositoryImplementation(
        instance<RemotePaymentsDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<PaymentsUseCase>()) {
    instance.registerLazySingleton<PaymentsUseCase>(
      () => PaymentsUseCase(
        instance<PaymentsRepository>(),
      ),
    );
  }
}

disposePaymentsModule() {
  if (GetIt.I.isRegistered<RemotePaymentsDataSource>()) {
    instance.unregister<RemotePaymentsDataSource>();
  }

  if (GetIt.I.isRegistered<PaymentsRepository>()) {
    instance.unregister<PaymentsRepository>();
  }

  if (GetIt.I.isRegistered<PaymentsUseCase>()) {
    instance.unregister<PaymentsUseCase>();
  }
}

initCategoryDetailsModule() {
  if (!GetIt.I.isRegistered<RemoteCategoryDetailsDataSource>()) {
    instance.registerLazySingleton<RemoteCategoryDetailsDataSource>(
      () => RemoteCategoryDetailsDateSourceImplement(
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CategoryDetailsRepository>()) {
    instance.registerLazySingleton<CategoryDetailsRepository>(
      () => CategoryDetailsRepoImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CategoryDetailsUseCase>()) {
    instance.registerLazySingleton<CategoryDetailsUseCase>(
      () => CategoryDetailsUseCase(
        instance(),
      ),
    );
  }

  Get.put<CategoryDetailsController>(CategoryDetailsController());
}

disposeCategoryDetailsModule() {
  if (GetIt.I.isRegistered<RemoteCategoryDetailsDataSource>()) {
    instance.unregister<RemoteCategoryDetailsDataSource>();
  }

  if (GetIt.I.isRegistered<CategoryDetailsRepository>()) {
    instance.unregister<CategoryDetailsRepository>();
  }

  if (GetIt.I.isRegistered<CategoryDetailsUseCase>()) {
    instance.unregister<CategoryDetailsUseCase>();
  }

  Get.delete<CategoryDetailsController>();
}

initAllCourses() {
  if (!GetIt.I.isRegistered<RemoteCoursesDataSource>()) {
    instance.registerLazySingleton<RemoteCoursesDataSource>(
      () => RemoteCoursesDataSourceImplement(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CoursesRepository>()) {
    instance.registerLazySingleton<CoursesRepository>(
      () => CoursesRepoImplementation(
        instance<NetworkInfo>(),
        instance<RemoteCoursesDataSource>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CoursesUseCase>()) {
    instance.registerLazySingleton<CoursesUseCase>(
      () => CoursesUseCase(
        instance<CoursesRepository>(),
      ),
    );
  }

  Get.put(CoursesController());
}

disposeAllCourses() {
  if (GetIt.I.isRegistered<RemoteCoursesDataSource>()) {
    instance.unregister<RemoteCoursesDataSource>();
  }

  if (GetIt.I.isRegistered<CoursesRepository>()) {
    instance.unregister<CoursesRepository>();
  }

  if (GetIt.I.isRegistered<CoursesUseCase>()) {
    instance.unregister<CoursesUseCase>();
  }
  Get.delete<CoursesController>();
}

initResources() {
  if (!GetIt.I.isRegistered<RemoteResourcesDataSource>()) {
    instance.registerLazySingleton<RemoteResourcesDataSource>(
          () => RemoteResourcesDateSourceImplement(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResourcesRepository>()) {
    instance.registerLazySingleton<ResourcesRepository>(
          () => ResourcesRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResourcesUseCase>()) {
    instance.registerLazySingleton<ResourcesUseCase>(
          () => ResourcesUseCase(
        instance(),
      ),
    );
  }

  Get.put<ResourcesController>(ResourcesController());
}


disposeResources() {
  if (GetIt.I.isRegistered<RemoteResourcesDataSource>()) {
    instance.unregister<RemoteResourcesDataSource>();
  }

  if (GetIt.I.isRegistered<ResourcesRepository>()) {
    instance.unregister<ResourcesRepository>();
  }

  if (GetIt.I.isRegistered<ResourcesUseCase>()) {
    instance.unregister<ResourcesUseCase>();
  }
  Get.delete<ResourcesController>();
}

initNotifications() {
  if (!GetIt.I.isRegistered<RemoteNotificationsDataSource>()) {
    instance.registerLazySingleton<RemoteNotificationsDataSource>(
      () => RemoteNotificationsDataSourceImplement(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<NotificationsRepository>()) {
    instance.registerLazySingleton<NotificationsRepository>(
      () => NotificationsRepoImpl(
        instance<RemoteNotificationsDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<NotificationsUseCase>()) {
    instance.registerLazySingleton<NotificationsUseCase>(
      () => NotificationsUseCase(
        instance(),
      ),
    );
  }

  Get.put<NotificationsController>(NotificationsController());
}

disposeNotifications() {
  if (GetIt.I.isRegistered<RemoteNotificationsDataSource>()) {
    instance.unregister<RemoteNotificationsDataSource>();
  }

  if (GetIt.I.isRegistered<NotificationsRepository>()) {
    instance.unregister<NotificationsRepository>();
  }

  if (GetIt.I.isRegistered<NotificationsUseCase>()) {
    instance.unregister<NotificationsUseCase>();
  }
  Get.delete<NotificationsController>();
}

initCancelReservation() {
  if (!GetIt.I.isRegistered<CancelReservationRemoteDataSource>()) {
    instance.registerLazySingleton<CancelReservationRemoteDataSource>(
      () => CancelReservationRemoteDataSourceImplement(
        instance<AppService>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CancelReservationRepository>()) {
    instance.registerLazySingleton<CancelReservationRepository>(
      () => CancelReservationRepoImpl(
        instance<NetworkInfo>(),
        instance<CancelReservationRemoteDataSource>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<CancelReservationUseCase>()) {
    instance.registerLazySingleton<CancelReservationUseCase>(
      () => CancelReservationUseCase(
        instance<CancelReservationRepository>(),
      ),
    );
  }
}

disposeCancelReservation() {
  if (GetIt.I.isRegistered<CancelReservationRemoteDataSource>()) {
    instance.unregister<CancelReservationRemoteDataSource>();
  }

  if (GetIt.I.isRegistered<CancelReservationRepository>()) {
    instance.unregister<CancelReservationRepository>();
  }

  if (GetIt.I.isRegistered<CancelReservationUseCase>()) {
    instance.unregister<CancelReservationUseCase>();
  }
}

initBalance() {
  if (!GetIt.I.isRegistered<BalanceRemoteDataSource>()) {
    instance.registerLazySingleton<BalanceRemoteDataSource>(
      () => BalanceRemoteDataSourceImplement(
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<BalanceRepository>()) {
    instance.registerLazySingleton<BalanceRepository>(
      () => BalanceRepoImplement(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<BalanceUseCase>()) {
    instance.registerLazySingleton<BalanceUseCase>(
      () => BalanceUseCase(
        instance(),
      ),
    );
  }
}

disposeBalance() {
  if (GetIt.I.isRegistered<BalanceRemoteDataSource>()) {
    instance.unregister<BalanceRemoteDataSource>();
  }

  if (GetIt.I.isRegistered<BalanceRepository>()) {
    instance.unregister<BalanceRepository>();
  }

  if (GetIt.I.isRegistered<BalanceUseCase>()) {
    instance.unregister<BalanceUseCase>();
  }
}

initResourceDetails() {
  if (!GetIt.I.isRegistered<RemoteResourceDetailsDataSource>()) {
    instance.registerLazySingleton<RemoteResourceDetailsDataSource>(
      () => RemoteResourceDetailsDateSourceImplement(
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResourceDetailsRepository>()) {
    instance.registerLazySingleton<ResourceDetailsRepository>(
      () => ResourceDetailsRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ResourceDetailsUseCase>()) {
    instance.registerLazySingleton<ResourceDetailsUseCase>(
      () => ResourceDetailsUseCase(
        instance(),
      ),
    );
  }
  Get.put(ResourceDetailsController());
}

disposeResourceDetails() {
  if (GetIt.I.isRegistered<RemoteResourceDetailsDataSource>()) {
    instance.unregister<RemoteResourceDetailsDataSource>();
  }

  if (GetIt.I.isRegistered<ResourceDetailsRepository>()) {
    instance.unregister<ResourceDetailsRepository>();
  }

  if (GetIt.I.isRegistered<ResourceDetailsUseCase>()) {
    instance.unregister<ResourceDetailsUseCase>();
  }

  Get.delete<ResourceDetailsController>();
}

initSettingModule() {
  initBalance();
  Get.put<SettingsController>(SettingsController());
}

disposeSettingModule() {
  disposeBalance();
  Get.delete<SettingsController>();
}

initSubscriptions() {
  if (!GetIt.I.isRegistered<SubscriptionsRemoteDataSource>()) {
    instance.registerLazySingleton<SubscriptionsRemoteDataSource>(
      () => SubscriptionsRemoteDataSourceImplementation(
        instance(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<SubscriptionsRepository>()) {
    instance.registerLazySingleton<SubscriptionsRepository>(
      () => SubscriptionsRepoImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<SubscriptionsUseCase>()) {
    instance.registerFactory<SubscriptionsUseCase>(
      () => SubscriptionsUseCase(
        instance(),
      ),
    );
  }

  Get.delete<SubscriptionsController>();
  Get.put<SubscriptionsController>(SubscriptionsController());
}
