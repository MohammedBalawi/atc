import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_strings.dart';
import 'package:act_hub_mobile/features/appointment/presentation/view/screen/reservation_details.dart';
import 'package:act_hub_mobile/features/auth/presentation/view/login_view.dart';
import 'package:act_hub_mobile/features/auth/presentation/view/register_view.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/screen/all_course_view.dart';
import 'package:act_hub_mobile/features/courses/presentation/view/screen/course_details_view.dart';
import 'package:act_hub_mobile/features/edit_profile/presentation/view/screen/edit_profile_view.dart';
import 'package:act_hub_mobile/features/forget_password/presentation/view/forget_pass_view.dart';
import 'package:act_hub_mobile/features/home/presentation/view/screen/home_view.dart';
import 'package:act_hub_mobile/features/main/presentation/view/main_view.dart';
import 'package:act_hub_mobile/features/profile/presentation/view/screen/change_pass_view.dart';
import 'package:act_hub_mobile/features/profile/presentation/view/screen/locale_view.dart';
import 'package:act_hub_mobile/features/profile/presentation/view/screen/profile_information_view.dart';
import 'package:act_hub_mobile/features/profile/presentation/view/screen/setting_view.dart';
import 'package:act_hub_mobile/features/reset_password/presentation/view/reset_password_view.dart';
import 'package:act_hub_mobile/features/resource_details/presentation/view/screen/resource_details_view.dart';
import 'package:act_hub_mobile/features/resources/presentation/view/resources_view.dart';
import 'package:act_hub_mobile/features/search/presentation/view/search_view.dart';
import 'package:act_hub_mobile/features/verification/presentation/view/screen/verification_screen.dart';
import 'package:flutter/material.dart';
import '../features/appointment/presentation/view/screen/reservation_stepper_view.dart';
import '../features/category/presentation/view/resources_category_view.dart';
import '../features/courses/presentation/view/screen/payment_selection_view.dart';
import '../features/courses/presentation/view/screen/subscription_details.dart';
import '../features/notifications/presentation/view/notifications_view.dart';
import '../features/outboarding/presentation/view/screen/out_boarding_view.dart';
import '../features/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoarding = '/outBoarding_view';
  static const String login = '/login_view';
  static const String register = '/register_view';
  static const String home = '/home_view';
  static const String forget_password = '/forget_password_view';
  static const String verification = '/verification_view';
  static const String main = '/main_view';
  static const String setting = '/setting_view';
  static const String search = '/search_view';
  static const String course_description = '/course_desc_view';
  static const String edit_profile = '/edit_profile_view';
  static const String profile_information = '/profile_information_view';
  static const String change_password = '/change_password_view';
  static const String all_courses = '/all_courses_view';
  static const String reset_password = '/reset_password';
  static const String paymentSelectionView = '/payment_selection_view';
  static const String reservationPayment = '/reservation_payment';
  static const String resourcesCategoryView = '/resources_category_view';
  static const String localeView = '/locale_view';
  static const String notifications = '/notifications';
  static const String resourcesDetailsView = '/resourcesDetailsView';
  static const String reservationDetails = '/reservationDetails';
  static const String subscriptionDetails = '/subscriptionDetails';
  static const String resourcesView = '/resourcesView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.outBoarding:
        initOutBoarding();
        return MaterialPageRoute(builder: (_) => const OutBoardingView());
      case Routes.login:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.register:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forget_password:
        initForgetPassword();
        return MaterialPageRoute(builder: (_) => ForgetPassView());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.verification:
        initVerifyEmail();
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case Routes.main:
        initMainModule();
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.setting:
        initSettingModule();
        return MaterialPageRoute(builder: (_) => SettingView());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => SearchView());
      case Routes.course_description:
        initCourse();
        return MaterialPageRoute(builder: (_) => CourseDescriptionView());
      case Routes.paymentSelectionView:
        initSubscriptionProcess();
        return MaterialPageRoute(builder: (_) => PaymentSelectionView());
      case Routes.reservationPayment:
        initBookAppointmentProcess();
        return MaterialPageRoute(builder: (_) => ReservationPayment());
      case Routes.edit_profile:
        initEditName();
        initEditPhone();
        initProfile();
        return MaterialPageRoute(builder: (_) => EditProfileView());
      case Routes.profile_information:
        return MaterialPageRoute(builder: (_) => ProfileInformationView());
      case Routes.change_password:
        return MaterialPageRoute(builder: (_) => ChangePassView());
      case Routes.all_courses:
        initAllCourses();
        return MaterialPageRoute(builder: (_) => AllCoursesView());
      case Routes.reset_password:
        initResetPasswordModule();
        return MaterialPageRoute(builder: (_) => ResetPasswordView());
      case Routes.resourcesCategoryView:
        initCategoryDetailsModule();
        return MaterialPageRoute(builder: (_) => ResourcesCategoryView());
      case Routes.localeView:
        return MaterialPageRoute(builder: (_) => LocaleView());
      case Routes.notifications:
        initNotifications();
        return MaterialPageRoute(builder: (_) => NotificationsView());
      case Routes.resourcesDetailsView:
        initResourceDetails();
        return MaterialPageRoute(builder: (_) => ResourceDetailsView());
      case Routes.reservationDetails:
        return MaterialPageRoute(builder: (_) => ReservationDetails());
      case Routes.subscriptionDetails:
        return MaterialPageRoute(builder: (_) => SubscriptionDetails());
      case Routes.resourcesView:
        initResources();
        return MaterialPageRoute(builder: (_) => ResourcesView());
      default:
        return unDefinedRoute();
    }
  }

  // If PushNamed Failed Return This Page With No Actions
  // This Screen Will Tell The User This Page Is Not Exist
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.noRouteFound),
        ),
        body: Center(
          child: Text(ManagerStrings.noRouteFound),
        ),
      ),
    );
  }
}
