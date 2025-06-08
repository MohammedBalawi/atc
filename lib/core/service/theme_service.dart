import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:act_hub_mobile/core/theme/manager_dark_theme_data.dart';
import 'package:act_hub_mobile/core/theme/manager_light_theme_data.dart';
import 'package:flutter/material.dart';

class ThemeService {
  late final AppSettingsPrefs _appSettingsPrefs;

  ThemeService() : _appSettingsPrefs = instance<AppSettingsPrefs>();

  bool isDarkMode() => _appSettingsPrefs.getAppTheme() == Constants.dark;

  ThemeMode getThemeMode() => isDarkMode() ? ThemeMode.dark : ThemeMode.light;

  ThemeData getThemeData() =>
      isDarkMode() ? managerDarkThemeData() : managerLightThemeData();
}
