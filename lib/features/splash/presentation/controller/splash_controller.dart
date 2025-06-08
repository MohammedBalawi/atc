import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:get/get.dart';
import '../../../../config/constants.dart';

class SplashController extends GetxController {
  AppSettingsPrefs _appSettingsPrefs = instance<AppSettingsPrefs>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(
        seconds: Constants.splashTimeSecond,
      ),
      () {
        if(_appSettingsPrefs.getUserLoggedIn()){
          Get.offAllNamed(
            Routes.main,
          );
        }else{
          if(_appSettingsPrefs.getOutBoardingScreenViewed()){
            Get.offAllNamed(
              Routes.login,
            );
          }else{
            Get.offAllNamed(
              Routes.outBoarding,
            );
          }
        }

      },
    );
  }
}
