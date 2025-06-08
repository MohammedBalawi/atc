import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/resources/manager_assets.dart';
import 'package:act_hub_mobile/core/service/theme_service.dart';
import 'package:act_hub_mobile/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'config/localization/locales.dart';

void main() async {
  await initModule();
  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: localeSettings.locales,
      path: ManagerTranslations.translationPath,
      fallbackLocale: localeSettings.defaultLocale,
      startLocale: localeSettings.defaultLocale,
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeService _themeService;

  MyApp() : _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(
        Constants.deviceWidth,
        Constants.deviceHeight,
      ),
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashView,
          themeMode: _themeService.getThemeMode(),
          theme: _themeService.getThemeData(),
        );
      },
    );
  }
}
