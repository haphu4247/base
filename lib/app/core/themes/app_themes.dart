//https://api.flutter.dev/flutter/material/TextTheme-class.html
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/local/local_data_key.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class AppThemes {
  static final AppThemes instance = AppThemes._internal();
  AppThemes._internal() {
    // initialization logic
  }

  ThemeMode themeMode = ThemeMode.dark;
  var light = appLightTheme;
  var dark = appDarkTheme;
  Future<ThemeMode> loadTheme() async {
    var result = await LocalDataKey.themes.getString();
    if (result != null) {
      themeMode = ThemeMode.values.byName(result);
    } else {
      themeMode = ThemeMode.light;
    }
    return themeMode;
  }

  void switchTheme() async {
    // Call this function to switch ThemeMode
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    await LocalDataKey.themes.setString(themeMode.name);
    Get.changeThemeMode(themeMode);
  }
}
